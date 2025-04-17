#!/usr/bin/env python3
import rospy
import numpy as np
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Float32

SHOW_RVIZ = False

class FrontDistancePublisher(object):
    def __init__(self):
        self.scan_topic     = "/scan"
        self.distance_topic = "/lidar_front_distance"
        angle_width_deg     = 10.0
        front_angle = np.pi/2

        # precompute half‐width in radians
        half_angle = np.deg2rad(angle_width_deg) / 2.0
        self.start_angle = front_angle - half_angle
        self.end_angle = front_angle + half_angle

        # publisher and subscriber
        self.pub = rospy.Publisher(self.distance_topic, Float32, queue_size=1)
        rospy.Subscriber(self.scan_topic, LaserScan, self.scan_callback)

        # if we want to show the scanned part in rviz, setup publisher
        if SHOW_RVIZ:
            self.pub_rviz = rospy.Publisher("/scan_front", LaserScan, queue_size=1)

        rospy.loginfo("FrontDistancePublisher: listening on '%s', publishing on '%s' (±%.1f°)",
                      self.scan_topic, self.distance_topic, angle_width_deg)

    def remove_outliers(self, data, k=1.5):
        # remove outliers from distance data using IQR method
        data = np.array(data)
        q1, q3 = np.percentile(data, [25, 75])
        iqr    = q3 - q1
        lower  = q1 - k * iqr
        upper  = q3 + k * iqr
        return data[(data >= lower) & (data <= upper)]

    def scan_callback(self, scan):
        if scan is None:
            mean_dist = np.inf

        start_i = int(self.start_angle / scan.angle_increment)
        end_i = int(self.end_angle / scan.angle_increment)

        #clamp the scan to only the front of the robot: useful for plotting in rviz, but not always needed
        if SHOW_RVIZ:
            out = LaserScan()
            out.header        = scan.header
            out.header.stamp  = rospy.Time.now()
            out.angle_min     = self.start_angle + np.pi    # doesnt matter too much, is just for rviz plotting
            out.angle_max     = self.end_angle + np.pi      # doesnt matter too much, is just for rviz plotting
            out.angle_increment = scan.angle_increment
            out.time_increment  = scan.time_increment
            out.scan_time       = scan.scan_time
            out.range_min       = scan.range_min
            out.range_max       = scan.range_max
            out.ranges          = scan.ranges[start_i:end_i]
            out.intensities     = scan.intensities[start_i:end_i]
            self.pub_rviz.publish(out)

        # remove infinities
        lidar_distances = [x for x in scan.ranges[start_i:end_i] if x < scan.range_max]
        # remove outliers
        # len_inital = len(lidar_distances)
        lidar_distances = self.remove_outliers(lidar_distances)
        # num_outliers = len_inital - len(lidar_distances)
        lidar_distance = np.mean(lidar_distances)
        # rospy.loginfo(num_outliers)
        self.pub.publish(lidar_distance)
        # rospy.loginfo("Front mean distance: %.3f m", np.mean(out.ranges))

if __name__ == '__main__':
    rospy.init_node('front_distance_publisher')
    FrontDistancePublisher()
    rospy.spin()
