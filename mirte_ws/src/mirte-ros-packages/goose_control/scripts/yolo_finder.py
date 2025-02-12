#!/usr/bin/env python3

import rospy
from ultralytics_ros.msg import YoloResult
from sensor_msgs.msg import Image
from geometry_msgs.msg import Twist

class Result:
    def __init__(self, width, height, size, center, direction, f_size, f_width, f_height):
        self.width = width
        self.height = height
        self.size = size
        self.center = center
        self.direction = direction
        self.fraction_size = f_size
        self.fraction_width = f_width
        self.fraction_height = f_height

class YoloFinder:
    def __init__(self):
        rospy.init_node('yolo_finder', anonymous=True)

        self.result_subscriber = rospy.Subscriber("/yolo_result", YoloResult, self.callback)
        self.im_subscriber = rospy.Subscriber("/yolo_image", Image, self.im_callback)

        self.direction_publisher = rospy.Publisher("/mobile_base_controller/cmd_vel", Twist, queue_size=2)
        self.rate = rospy.Rate(10)

        self.im_size = -1

        self.processed_results = []

        rospy.loginfo("Node yolo_finder is running.")

    def im_callback(self, msg):
        self.im_width = msg.width
        self.im_height = msg.height
        self.im_size = msg.width * msg.height
        self.im_subscriber.unregister()
        rospy.loginfo("Unsubscriber from image topic")

    def callback(self, msg):
        if self.im_size == -1 or len(msg.detections.detections) == 0:
            return

        result_width = msg.detections.detections[0].bbox.size_x
        result_height = msg.detections.detections[0].bbox.size_y
        size = result_width * result_height
        center_x = msg.detections.detections[0].bbox.center.x
        result_direction = (center_x - self.im_width / 2) / (self.im_width / 2)

        fraction_size = round(size/self.im_size, 2)
        fraction_width = round(result_width/self.im_width, 2)
        fraction_height = round(result_height/self.im_height, 2)

        self.processed_results.append(Result(result_width, result_height, result_size, center_x, result_direction, fraction_size, fraction_width, fraction_height))

        # if fraction_width > 0.9 or fraction_height > 0.95:
        #     rospy.loginfo("It's right in front of the mirte!")
        # else:
        #     rospy.loginfo(result_direction)

        #     if abs(result_direction) < 0.1:
        #         return
            
        #     cmd_vel_msg = Twist()
        #     cmd_vel_msg.angular.z = 2*(-result_direction)

        #     for _ in range(5):
        #         self.direction_publisher.publish(cmd_vel_msg)
        #         self.rate.sleep()

if __name__ == '__main__':
    try:
        finder = YoloFinder()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass
