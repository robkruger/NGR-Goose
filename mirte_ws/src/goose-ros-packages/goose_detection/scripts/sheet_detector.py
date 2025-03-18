#!/usr/bin/env python3

import os
import rospy
import cv2
import numpy as np
from cv_bridge import CvBridge
# import ros_numpy
from sensor_msgs.msg import Image
from ultralytics import YOLO


MIN_CONFIDENCE = 0.7


class SheetDetector:
    def __init__(self):
        # initialise ros node
        rospy.init_node('sheet_detector')

        # initialise cv bridge
        self.cv_bridge = CvBridge()

        # initialise YOLO computer vision model
        model_path = os.path.join(os.path.dirname(__file__), '..', 'models', 'best.pt')
        self.sheet_detect_model = YOLO(model_path)

        # create subscribers
        self.rgb_image = rospy.Subscriber("/camera/color/image_raw", Image, self.image_callback)

        # create publishers
        self.det_image_pub = rospy.Publisher("/ultralytics/detection/image", Image, queue_size=5)
        # self.det_depth_pub = rospy.Publisher("/ultralytics/detection/depth", Image, queue_size=5)

        rospy.loginfo("sheet_detector node started")

    def get_average_distance(self, image, x, y, N=3):
        # find the average distance around the point of interest
        h, w  = image.shape[:2]

        x_start = max(x - N, 0)
        x_end = min(x + N + 1, w)
        y_start = max(y - N, 0)
        y_end = min(y + N + 1, h) 

        roi = image[y_start:y_end, x_start:x_end]
        return np.mean(roi, axis=(0,1)) 


    def get_sample_points(self, n_points, x, w, h):
        # get some sample points: 
                #   options:
                #       1. centre point only
                #       2. points around center
                #       3. random points in the bounding box
                #       4. points arranged smartly
        # here we take a flat line on the centre's y: the cloth with be lying flat on the floor
        return [x+(i * w//n_points) for i in range (-n_points//2 +1, n_points//2)]

    def image_callback(self, msg):
        rospy.loginfo("image received")

        # wait for a corresponding depth image:
        image = rospy.wait_for_message("/camera/depth/image_raw", Image)

        # convert to numpy format
        depth_image = self.cv_bridge.imgmsg_to_cv2(image, desired_encoding="passthrough")
        colour_image = self.cv_bridge.imgmsg_to_cv2(msg, desired_encoding="bgr8")

        # apply the model to colour image
        det_result = self.sheet_detect_model(colour_image, conf=MIN_CONFIDENCE, verbose=False)
        det_annotated = det_result[0].plot(show=False)

        # find distance of all detected sheets:
        for result in det_result:
            bounding_box = result.boxes.xywh.cpu().numpy()
            if bounding_box.size:
                # get the center x and y coordinates
                x = int(bounding_box[0][0])
                y = int(bounding_box[0][1])
                w = int(bounding_box[0][2])
                h = int(bounding_box[0][3]) 
                
                sample_points = self.get_sample_points(10, x, w, h)
                rospy.loginfo(depth_image[y][sample_points])
                for point_x in sample_points:

                    cv2.circle(det_annotated, (point_x,y), 3, (0,0,255), -1)
            

        # publish to topic
        output_image = self.cv_bridge.cv2_to_imgmsg(det_annotated, encoding="bgr8")
        # output_depth = self.cv_bridge.cv2_to_imgmsg(depth_image, encoding="passthrough")
        self.det_image_pub.publish(output_image)
        # self.det_depth_pub.publish(output_depth)
        rospy.loginfo("image published")

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        node = SheetDetector()
        node.run()
    except rospy.ROSInterruptException:
        pass