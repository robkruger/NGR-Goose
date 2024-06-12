#!/usr/bin/env python3

import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import PointStamped, PoseStamped
import random
from tf.transformations import quaternion_from_euler
import numpy as np


def callback(msg):
    global point_1, point_2, point_to_change
    rospy.loginfo(msg.point)
    if point_to_change % 2 == 0:
        point_1 = (msg.point.x, msg.point.y)
    else:
        point_2 = (msg.point.x, msg.point.y)
        change_marker()

    point_to_change += 1


def publish_goal():
    goal = PoseStamped()
    
    goal.header.seq = 1
    goal.header.stamp = rospy.Time.now()
    goal.header.frame_id = "map"

    goal.pose.position.x = random.uniform(point_1[0], point_2[0])
    goal.pose.position.y = random.uniform(point_1[1], point_2[1])
    goal.pose.position.z = 0.0

    quaternion = quaternion_from_euler(0, 0, random.uniform(-np.pi, np.pi))

    goal.pose.orientation.x = quaternion[0]
    goal.pose.orientation.y = quaternion[1]
    goal.pose.orientation.z = quaternion[2]
    goal.pose.orientation.w = quaternion[3]

    goal_pub.publish(goal)


rospy.init_node('rviz_marker')

marker_pub = rospy.Publisher("/visualization_marker", Marker, queue_size = 2)
rospy.point_pub = rospy.Subscriber('/clicked_point', PointStamped, callback)
goal_pub = rospy.Publisher("/move_base_simple/goal", PoseStamped, queue_size = 2)

area_marker = Marker()

area_marker.header.frame_id = "map"
area_marker.header.stamp = rospy.Time.now()

point_1 = None
point_2 = None
point_to_change = 0

# set shape, Arrow: 0; Cube: 1 ; Sphere: 2 ; Cylinder: 3
area_marker.type = 1
area_marker.id = 0

def change_marker():
    # Set the scale of the marker
    area_marker.scale.x = point_2[0] - point_1[0]
    area_marker.scale.y = point_2[1] - point_1[1]
    area_marker.scale.z = 0.01

    # Set the color
    area_marker.color.r = 0.0
    area_marker.color.g = 1.0
    area_marker.color.b = 0.0
    area_marker.color.a = 0.3

    # Set the pose of the marker
    area_marker.pose.position.x = point_1[0] + area_marker.scale.x / 2
    area_marker.pose.position.y = point_1[1] + area_marker.scale.y / 2
    area_marker.pose.position.z = 0
    area_marker.pose.orientation.x = 0.0
    area_marker.pose.orientation.y = 0.0
    area_marker.pose.orientation.z = 0.0
    area_marker.pose.orientation.w = 1.0

    publish_goal()

while not rospy.is_shutdown():
  marker_pub.publish(area_marker)
  rospy.rostime.wallsleep(0.1)