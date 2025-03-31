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
from goose_detection.srv import DetectSheets



MIN_CONFIDENCE = 0.6
MAX_STD_DISTANCE = 100
FPS = 30
WIDTH = 640
HORIZONTAL_FOV = 58.4


class SheetDetector:
    def __init__(self):
        # initialise ros node
        rospy.init_node('sheet_detector_srv')


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
        self.detect_service = rospy.Service("/detect_sheets", DetectSheets, self.execute_action)

        self._latest_colour_img = None
        self._latest_depth_img = None
        self.paused = False

        rospy.loginfo("pausable sheet detection service started")

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
        
        # rospy.loginfo("colour image received")
        self._latest_colour_img = colour_msg
        # wait for a corresponding depth image:
        self._latest_depth_img = rospy.wait_for_message("/camera/depth/image_raw/compressedDepth", CompressedImage)
        # rospy.loginfo("depth image received") 

    def execute_action(self, req):
        # Check if an image has been received yet
        if self._latest_colour_img is None:
            rospy.logwarn("No image received yet.")
            # Optionally, you could wait for an image, but here we return zeros.
            return DetectSheets(distance=0.0, bbox_x_center=0.0)


        # convert to numpy format
        colour_image = self.cv_bridge.compressed_imgmsg_to_cv2(self._latest_colour_img)
        depth_image = self.convert_compressedDepth_to_cv2(self._latest_depth_img)

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
            

        if len(sheet_distances) > 0:
            rospy.loginfo("Found sheets\n"+"\n".join([f"  sheet {i}: d={x[0]:.2f} std={x[1]:.2f}" for i, x in enumerate(sheet_distances)]))
            min_d = np.inf
            used_x = 0
            for d, s, x in sheet_distances:
                if d < min_d:
                    min_d = d
                    used_x = x
            
            return DetectSheets(distance=min_d, bbox_x_center=used_x)
            # self.paused = True
        return DetectSheets(distance=0.0, bbox_x_center=0.0)


        

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        node = SheetDetector()
        node.run()
    except rospy.ROSInterruptException:
        pass