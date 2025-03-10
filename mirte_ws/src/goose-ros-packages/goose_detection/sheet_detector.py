#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image

class SheetDetector:
    def __init__(self):
        # initialise ros node
        rospy.init_node('sheet_detector')

        self.rgb_image = rospy.Subscriber("/camera/color/image_raw", Image, self.image_callback)

        rospy.loginfo("sheet_detector node started")

    def image_callback(self, msg):
        rospy.loginfo("image received")

    def run(self):
        rospy.spin()

if __name__ == '__main__':
    try:
        node = SheetDetector()
        node.run()
    except rospy.ROSInterruptException:
        pass
