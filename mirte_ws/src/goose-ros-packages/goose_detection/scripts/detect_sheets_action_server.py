#!/usr/bin/env python3


import os
import cv2
import rospy
import actionlib
import numpy as np
from cv_bridge import CvBridge
from ultralytics import YOLO
# messages
from sensor_msgs.msg import CompressedImage
# services
from std_srvs.srv import SetBool, SetBoolResponse
# actions
from goose_detection.msg import DetectSheetsAction, DetectSheetsResult
from std_msgs.msg import Float32


MIN_CONFIDENCE = 0.6
MAX_STD_DISTANCE = 100
FPS = 30
SHOW_RVIZ = True


class DetectSheetsActionServer(object):
    def __init__(self):
        # initialise ros node
        rospy.init_node('sheet_detector')


        # initialise cv bridge
        self.cv_bridge = CvBridge()

        # initialise YOLO computer vision model
        model_path = os.path.join(os.path.dirname(__file__), '..', 'models', 'best.pt')
        self.sheet_detect_model = YOLO(model_path)

        # create subscribers
        self.rgb_image = rospy.Subscriber("/camera/color/image_raw/compressed", CompressedImage, self.image_callback)

        # create publishers
        if SHOW_RVIZ:
            self.det_image_pub = rospy.Publisher("/ultralytics/detection/image/compressed", CompressedImage, queue_size=5)

        # create service to pause/resume the detection
        self.pause_service = rospy.Service("~set_pause", SetBool, self.handle_pause)

        # create action server for state machine
        self.server = actionlib.SimpleActionServer('~detect_sheets', DetectSheetsAction, self.execute, auto_start=False)
        self.server.start()

        # initialise variables
        self._latest_colour_img = None
        self._latest_depth_img = None
        self.image_queue = FPS
        self.paused = False

        rospy.loginfo("pausable sheet detection action server started")

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
        
        self.image_queue -= 1
        if self.image_queue > 0:
            # rospy.loginfo("dropped image")
            return
        
        # rospy.loginfo("colour image received")
        self._latest_colour_img = colour_msg
        # wait for a corresponding depth image:
        self._latest_depth_img = rospy.wait_for_message("/camera/depth/image_raw/compressedDepth", CompressedImage)
        # rospy.loginfo("Most recent images updated") 

        self.image_queue = FPS

        if SHOW_RVIZ:
            self.det_image_pub.publish(self._latest_colour_img)

    def execute(self, goal):
        # Ensure an image has been received.
        if self._latest_colour_img is None:
            rospy.logwarn("No image received yet; aborting action.")
            self.server.set_aborted()
            return

        # try convert images
        try:
            colour_image = self.cv_bridge.compressed_imgmsg_to_cv2(self._latest_colour_img)
            depth_image = self.convert_compressedDepth_to_cv2(self._latest_depth_img)
        except Exception as e:
            rospy.logerr("Failed to convert images: %s", str(e))
            self.server.set_aborted()
            return
        
        # apply the model to colour image
        det_result = self.sheet_detect_model(colour_image, conf=MIN_CONFIDENCE, verbose=False)

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
            if pixel_distances.size > 0:
                mean_dist = np.mean(pixel_distances)
                std_dist = np.std(pixel_distances)
                sheet_distances.append((mean_dist, std_dist, x))
            
        # Create and populate the default result message.
        result = DetectSheetsResult()
        result.distance = 0.0
        result.bbox_x_center = 0.0

        # populate result message with outputs if they are valid
        if len(sheet_distances) > 0:
            rospy.loginfo("Found sheets\n"+"\n".join([f"  sheet {i}: d={x[0]:.2f} std={x[1]:.2f}" for i, x in enumerate(sheet_distances)]))
            min_d = np.inf
            used_x = 0
            for d, s, x in sheet_distances:
                if d < min_d:
                    min_d = d
                    used_x = x
            
            result.distance = min_d
            result.bbox_x_center = used_x
            self.server.set_succeeded(result)
            return
        rospy.loginfo("No Sheets detected in image")
        self.server.set_aborted()
        return


    def run(self):
            rospy.spin()

if __name__ == '__main__':
    try:
        node = DetectSheetsActionServer()
        node.run()
    except rospy.ROSInterruptException:
        pass