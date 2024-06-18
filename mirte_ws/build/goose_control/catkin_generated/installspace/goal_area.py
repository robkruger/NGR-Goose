#!/usr/bin/env python3

import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import PointStamped, PoseStamped, Point
import random
from tf.transformations import quaternion_from_euler
import numpy as np
from actionlib_msgs.msg import GoalID


def callback(msg):
    global points, point_to_change
    rospy.loginfo(msg.point)
    points[point_to_change % 4] = msg.point

    if point_to_change % 4 == 3:
        change_marker()

    point_marker = point_markers[point_to_change % 4]
    point_marker.pose.position.x = msg.point.x
    point_marker.pose.position.y = msg.point.y

    point_marker.scale.x = .2
    point_marker.scale.y = .05
    point_marker.scale.z = .05

    point_marker.color.a = 1.0

    quaternion = quaternion_from_euler(0, -np.pi/2, 0)

    point_marker.pose.orientation.x = quaternion[0]
    point_marker.pose.orientation.y = quaternion[1]
    point_marker.pose.orientation.z = quaternion[2]
    point_marker.pose.orientation.w = quaternion[3]

    marker_pub.publish(point_marker)

    point_to_change += 1


def publish_goal():
    quad = np.array([
        [points[0].x, points[0].y],
        [points[1].x, points[1].y],
        [points[2].x, points[2].y],
        [points[3].x, points[3].y],
    ])

    point = random_point_in_quadrilateral(quad)

    goal = PoseStamped()
    
    goal.header.seq = 1
    goal.header.stamp = rospy.Time.now()
    goal.header.frame_id = "map"

    goal.pose.position.x = point[0] # random.uniform(point_1[0], point_2[0])
    goal.pose.position.y = point[1] # random.uniform(point_1[1], point_2[1])
    goal.pose.position.z = 0.0

    quaternion = quaternion_from_euler(0, 0, random.uniform(-np.pi, np.pi))

    goal.pose.orientation.x = quaternion[0]
    goal.pose.orientation.y = quaternion[1]
    goal.pose.orientation.z = quaternion[2]
    goal.pose.orientation.w = quaternion[3]

    goal_pub.publish(goal)

def random_point_in_triangle(triangle):
    r1 = np.sqrt(random.random())
    r2 = random.random()
    point = (1 - r1) * triangle[0] + r1 * (1 - r2) * triangle[1] + r1 * r2 * triangle[2]
    return point

def random_point_in_quadrilateral(quad):
    triangle1 = [quad[0], quad[1], quad[2]]
    triangle2 = [quad[0], quad[2], quad[3]]
    
    if random.random() < 0.5:
        return random_point_in_triangle(triangle1)
    else:
        return random_point_in_triangle(triangle2)


rospy.init_node('rviz_marker')

marker_pub = rospy.Publisher("/visualization_marker", Marker, queue_size = 2)
rospy.point_pub = rospy.Subscriber('/clicked_point', PointStamped, callback)
goal_pub = rospy.Publisher("/move_base_simple/goal", PoseStamped, queue_size = 2)

area_marker = Marker()

area_marker.header.frame_id = "map"
area_marker.header.stamp = rospy.Time.now()

points = [None, None, None, None]
point_to_change = 0

area_marker.id = 0
area_marker.type = Marker.LINE_STRIP
area_marker.action = Marker.ADD

point_markers = [Marker(), Marker(), Marker(), Marker()]
for i, point in enumerate(point_markers):
    point.header.frame_id = "map"
    point.header.stamp = rospy.Time.now()
    point.id = i + 1
    point.type = Marker.ARROW
    point.action = Marker.ADD

def change_marker():
    rospy.loginfo("Creating marker")
    # Set the scale of the marker
    # area_marker.scale.x = point_2[0] - point_1[0]
    # area_marker.scale.y = point_2[1] - point_1[1]
    area_marker.scale.x = 0.1
    area_marker.scale.z = 0.01

    # Set the color
    area_marker.color.r = 0.0
    area_marker.color.g = 1.0
    area_marker.color.b = 0.0
    area_marker.color.a = 0.3

    # Set the pose of the marker
    area_marker.points = points + [points[0]]

    publish_goal()

while not rospy.is_shutdown():
  marker_pub.publish(area_marker)
  rospy.rostime.wallsleep(0.1)