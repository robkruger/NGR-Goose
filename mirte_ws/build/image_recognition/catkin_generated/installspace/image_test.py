#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge
import cv2
import numpy as np


class SheetDetector:
    HSV_LOWER = np.array([100, 100, 135])
    HSV_UPPER = np.array([145, 210, 255])

    def __init__(self, hsv_lower=HSV_LOWER, hsv_upper=HSV_UPPER):
        self._hsv_lower = hsv_lower
        self._hsv_upper = hsv_upper
        self._detector = self._init_detector()

    def _init_detector(self):
        # set parameters for detector
        params = cv2.SimpleBlobDetector_Params()
        
        params.filterByColor = False
        params.filterByCircularity = False
        params.filterByConvexity = False

        params.filterByArea = True
        params.minArea = 150
        params.maxArea = 5000

        params.filterByInertia = True
        params.minInertiaRatio = 0.01

        detector = cv2.SimpleBlobDetector_create(params)
        return detector
    
    @staticmethod
    def _preprocess(image):
        # Convert BGR to HSV
        hsv_image = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

        # Apply Gaussian Blur
        blurred_image = cv2.GaussianBlur(hsv_image, (9, 9), 0)

        return blurred_image
    
    def detect_sheets(self, image):
        # TODO: check if image is opencv type

        # preprocess the image
        image_p = self._preprocess(image)

        # generate the mask
        mask = cv2.inRange(image_p, self._hsv_lower, self._hsv_upper)

        # morphological transformations to clean up mask
        kernel = np.ones((5, 5), np.uint8)
        mask = cv2.morphologyEx(mask, cv2.MORPH_CLOSE, kernel)
        
        # detect
        key_points = self._detector.detect(mask)

        # Draw keypoints on mask to visualise
        # cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS ensures the size of the circle corresponds to the size of blob
        im_with_keypoints = cv2.drawKeypoints(mask, key_points, np.array([]), (0,0,255), 
                                              cv2.DRAW_MATCHES_FLAGS_DRAW_RICH_KEYPOINTS)
        return im_with_keypoints
    

class ImageExtractor:
    def __init__(self):
        rospy.init_node('image_extractor', anonymous=True)
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber('/camera/color/image_raw', Image, self.image_callback)
        self.image_pub = rospy.Publisher('/camera/detected_image', Image, queue_size=1)
        self.detector = SheetDetector()


    def image_callback(self, msg):
        try:
            # Convert ROS Image message to OpenCV image
            cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
        except Exception as e:
            rospy.logerr(e)
            return

        detected_image = self.detector.detect_sheets(cv_image)

        # Publish the grayscale image
        self.image_pub.publish(self.bridge.cv2_to_imgmsg(detected_image))

        rospy.loginfo("Published detect image to /camera/detected_image")

if __name__ == '__main__':
    try:
        image_extractor = ImageExtractor()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
