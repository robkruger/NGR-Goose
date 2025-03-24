#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import numpy as np

class ImageSaver:
    def __init__(self):
        rospy.init_node("image_saver", anonymous=True)
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/camera/color/image_raw", Image, self.image_callback)
        self.image_count = 6
        rospy.loginfo("Image saver node started")
        self.image_queue = 10

    def image_callback(self, msg):
        self.image_queue -= 1
        if self.image_queue > 0:
            rospy.loginfo(f"Dropped image, image queue: {self.image_queue}")
            return
        
        try:
            cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
            filename = f"saved_image_{self.image_count}.jpg"
            cv2.imwrite(filename, cv_image)
            rospy.loginfo(f"Saved image: {filename}")
            self.image_count += 1
        except Exception as e:
            rospy.logerr(f"Error saving image: {e}")

        self.image_queue = 20

if __name__ == "__main__":
    ImageSaver()
    rospy.spin()
