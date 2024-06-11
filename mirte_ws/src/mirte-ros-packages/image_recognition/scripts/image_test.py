#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2

class ImageExtractor:
    def __init__(self):
        rospy.init_node('image_extractor', anonymous=True)
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber('/camera/color/image_raw', Image, self.image_callback)
        self.image_pub = rospy.Publisher('/camera/image_gray', Image, queue_size=1)

    def image_callback(self, msg):
        try:
            # Convert ROS Image message to OpenCV image
            cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except Exception as e:
            rospy.logerr(e)
            return

        # Convert the image to grayscale
        grayscale_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2GRAY)

        # Convert the grayscale OpenCV image to a ROS Image message
        grayscale_msg = self.bridge.cv2_to_imgmsg(grayscale_image, "mono8")

        # Publish the grayscale image
        self.image_pub.publish(grayscale_msg)

        rospy.loginfo("Published grayscale image to /camera/image_gray")

if __name__ == '__main__':
    try:
        image_extractor = ImageExtractor()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
