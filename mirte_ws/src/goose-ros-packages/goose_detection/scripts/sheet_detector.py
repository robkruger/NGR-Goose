#!/usr/bin/env python3

import os
import rospy
import cv2
import numpy as np
import actionlib
from cv_bridge import CvBridge
from ultralytics import YOLO
# messages
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import PoseStamped
from sensor_msgs.msg import CompressedImage
# services
from std_srvs.srv import SetBool, SetBoolResponse
import tf2_ros
import tf2_geometry_msgs
import math


MIN_CONFIDENCE = 0.6
MAX_STD_DISTANCE = 100
FPS = 30
WIDTH = 640
HORIZONTAL_FOV = 58.4


class SheetDetector:
    def __init__(self):
        # initialise ros node
        rospy.init_node('sheet_detector')

        # flag variable to pause the detection when not needed
        self.paused = False

        # initialise cv bridge
        self.cv_bridge = CvBridge()

        # initialise YOLO computer vision model
        model_path = os.path.join(os.path.dirname(__file__), '..', 'models', 'best.pt')
        self.sheet_detect_model = YOLO(model_path)

        # create subscribers
        self.rgb_image = rospy.Subscriber("/camera/color/image_raw/compressed", CompressedImage, self.image_callback)
        self.image_queue = FPS

        # create publishers
        self.det_image_pub = rospy.Publisher("/ultralytics/detection/image/compressed", CompressedImage, queue_size=5)

        # create service to pause/resume the detection
        self.pause_service = rospy.Service("~set_pause", SetBool, self.handle_pause)

        # create action client for movement
        # self.client = actionlib.SimpleActionClient('move_base', MoveBaseAction)
        # rospy.loginfo("Waiting for move_base action server...")
        # self.client.wait_for_server()
        # rospy.loginfo("Connected to move_base.")

        rospy.loginfo("Pausable sheet_detector node started")

    def handle_pause(self, req):
        self.paused = req.data
        state = "paused" if self.paused else "resumed"
        rospy.loginfo(f"Sheet Detection has been {state}.")
        return SetBoolResponse(success=True, message=f"sheet_detector {state}.")


    def get_sample_points(self, n_points, x, w, h):
        # get some sample points: 
                #   options:
                #       1. centre point only
                #       2. points around center
                #       3. random points in the bounding box
                #       4. points arranged smartly
        # here we take a flat line on the centre's y: the cloth with be lying flat on the floor
        return [x+(i * w//n_points) for i in range (-n_points//2 +1, n_points//2)]

    def convert_compressedDepth_to_cv2(self, compressed_depth):
        """
        Code Modified from github user awesomebytes from file image_tools.py:
        https://gist.github.com/awesomebytes/958a5ef9e63821a28dc05775840c34d9 

        Convert a compressedDepth topic image into a cv2 image.
        compressed_depth must be from a topic /bla/compressedDepth
        as it's encoded in PNG
        Code from: https://answers.ros.org/question/249775/display-compresseddepth-image-python-cv2/
        """
        depth_fmt, compr_type = compressed_depth.format.split(';')
        # remove white space
        depth_fmt = depth_fmt.strip()
        compr_type = compr_type.strip()
        if compr_type != "compressedDepth png":
            raise Exception("Compression type is not 'compressedDepth png'."
                            "You probably subscribed to the wrong topic.")

        # remove header from raw data
        # astra camera has header size 12
        raw_data = compressed_depth.data[12:]

        depth_img_raw = cv2.imdecode(np.frombuffer(raw_data, np.uint8), -1)  
        if depth_img_raw is None:
            # probably wrong header size
            raise Exception("Could not decode compressed depth image")
        return depth_img_raw

    def image_callback(self, colour_msg):
        if self.paused:
            # rospy.loginfo("paused...")
            return
        
        # dropping images to prevent a backlog and very delayed outputs
        self.image_queue -= 1
        if self.image_queue > 0:
            # rospy.loginfo("dropped image")
            return
        
        # rospy.loginfo("colour image received")

        # wait for a corresponding depth image:
        depth_msg = rospy.wait_for_message("/camera/depth/image_raw/compressedDepth", CompressedImage)
        # rospy.loginfo("depth image received") 

        # convert to numpy format
        depth_image = self.convert_compressedDepth_to_cv2(depth_msg)
        colour_image = self.cv_bridge.compressed_imgmsg_to_cv2(colour_msg)

        # apply the model to colour image
        det_result = self.sheet_detect_model(colour_image, conf=MIN_CONFIDENCE, verbose=False)
        det_annotated = det_result[0].plot(show=False)

        # find distance of all detected sheets:
        sheet_distances = []
        for box in det_result[0].boxes:
            box = box.xywh.cpu().numpy()
            # get the center x and y coordinates
            x = int(box[0][0])
            y = int(box[0][1])
            w = int(box[0][2])
            h = int(box[0][3]) 
            
            sample_points = self.get_sample_points(10, x, w, h)

            # index the depth image with all the sample points
            pixel_distances = depth_image[y][sample_points]

            # remove all zeros which could skew mean
            pixel_distances  = pixel_distances[pixel_distances != 0]
            print(pixel_distances)
            if pixel_distances.size > 0:
                mean_dist = np.mean(pixel_distances)
                std_dist = np.std(pixel_distances)
                sheet_distances.append((mean_dist, std_dist, x))
            for point_x in sample_points:
                cv2.circle(det_annotated, (point_x,y), 3, (0,0,255), -1)
        

        # publish to topic
        output_image = self.cv_bridge.cv2_to_compressed_imgmsg(det_annotated)
        self.det_image_pub.publish(output_image)
        rospy.loginfo("image published")
        self.image_queue = FPS

        print(sheet_distances)
        if len(sheet_distances) > 0:
            rospy.loginfo("Found sheets\n"+"\n".join([f"  sheet {i}: d={x[0]:.2f} std={x[1]:.2f}" for i, x in enumerate(sheet_distances)]))
            min_d = np.inf
            used_x = 0
            for d, s, x in sheet_distances:
                if d < min_d:
                    min_d = d
                    used_x = x
            
            rospy.loginfo(min_d)
            # self.move_to_sheet(min_d, used_x)
            # self.paused = True
        else:
            rospy.loginfo("Nothing found")


    # def move_to_sheet(self, distance, x_center):
    #     self.paused = True
    #     self.move_to_goal(distance / 2, x_center)
    #     old_distance = distance
    #     self.new_distance = distance
    #     self.new_x_center = x_center
    #     while old_distance > 300:
    #         self.paused = False
    #         # wait for the robot to get a new image
    #         rospy.loginfo("Waiting for new image...")
    #         while old_distance == self.new_distance:
    #             rospy.sleep(0.1)

    #         self.paused = True

    #         # go to new goal
    #         self.move_to_goal(self.new_distance / 2, self.new_x_center)

    #         old_distance = self.new_distance

    #     rospy.loginfo("Sheet is close enough, stopping movement.")
        
    # def move_to_sheet(self, distance, x_center):
    #     goal = PoseStamped()
    #     goal.header.frame_id = "base_link"  
    #     goal.header.stamp = rospy.Time.now()

    #     angle = (x_center - WIDTH / 2) * HORIZONTAL_FOV / WIDTH
    #     rospy.loginfo(f"Angle: {angle} degrees")
    #     goal.pose.position.x = math.cos(angle * math.pi / 180) * (distance / 1000)
    #     goal.pose.position.y = -math.sin(angle * math.pi / 180) * (distance / 1000)
    #     rospy.loginfo(f"Goal position: {goal.pose.position.x}m, {goal.pose.position.y}m")
    #     goal.pose.orientation.w = 1.0  

    #     # Transform goal from base_link to map
    #     try:
    #         tf_buffer = tf2_ros.Buffer()
    #         listener = tf2_ros.TransformListener(tf_buffer)
            
    #         # Wait for the transform (timeout 1s)
    #         rospy.sleep(1.0)  
    #         transform = tf_buffer.lookup_transform("map", "base_link", rospy.Time(0), rospy.Duration(1.0))
            
    #         transformed_goal = tf2_geometry_msgs.do_transform_pose(goal, transform)
    #         transformed_goal.header.stamp = rospy.Time.now()

    #         # Send transformed goal to move_base
    #         goal = MoveBaseGoal()
    #         goal.target_pose = transformed_goal

    #         rospy.loginfo(f"Sending navigation goal: {distance/10}cm ahead in map frame...")
    #         self.client.send_goal(goal)
    #         self.client.wait_for_result()
    #         result = self.client.get_result()
    #         rospy.loginfo(f"Navigation result: {result}")
    #         rospy.loginfo(f"move_to_goal finished")

    #     except tf2_ros.LookupException as e:
    #         rospy.logerr(f"Transform lookup failed: {e}")
    #     except tf2_ros.ConnectivityException as e:
    #         rospy.logerr(f"Transform connectivity issue: {e}")
    #     except tf2_ros.ExtrapolationException as e:
    #         rospy.logerr(f"Transform extrapolation error: {e}")

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        node = SheetDetector()
        node.run()
    except rospy.ROSInterruptException:
        pass