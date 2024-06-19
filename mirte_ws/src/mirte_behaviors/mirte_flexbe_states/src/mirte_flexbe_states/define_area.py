#!/usr/bin/env python
import rospy

from flexbe_core import EventState, Logger

from visualization_msgs.msg import Marker
from geometry_msgs.msg import Pose2D, PoseStamped, Point
import random
from tf.transformations import quaternion_from_euler
import numpy as np


class DefineAreaState(EventState):
    '''
    Defines the goal area where wrappers could be present

    -- points 	Point[] 	4-points to define the area
    
    #> goal     Pose2D    random point in this area where the mirte has to drive to

    <= continue 			Area is defined
    <= failed 				Error!

    '''

    def __init__(self, points):
        # Declare outcomes, input_keys, and output_keys by calling the super constructor with the corresponding arguments.
        super(DefineAreaState, self).__init__(outcomes = ['continue', 'failed'],
                                              output_keys = ['goal'])

        # Store state parameter for later use.
        self.points = [Point(points[0][0], points[0][1], 0),
                       Point(points[1][0], points[1][1], 0),
                       Point(points[2][0], points[2][1], 0),
                       Point(points[3][0], points[3][1], 0),
                       Point(points[0][0], points[0][1], 0)]
        
        self.marker_pub = rospy.Publisher("/visualization_marker", Marker, queue_size = 2)

        try:
            self.area_marker = Marker()

            self.area_marker.header.frame_id = "map"
            self.area_marker.header.stamp = rospy.Time.now()


            self.area_marker.id = 0
            self.area_marker.type = Marker.LINE_STRIP
            self.area_marker.action = Marker.ADD

            self.area_marker.scale.x = 0.1
            self.area_marker.scale.z = 0.01

            # Set the color
            self.area_marker.color.r = 0.0
            self.area_marker.color.g = 1.0
            self.area_marker.color.b = 0.0
            self.area_marker.color.a = 0.3

            # Set the pose of the marker
            self.area_marker.points = self.points

            self.marker_pub.publish(self.area_marker)
        except Exception as e:
            rospy.logerr('failed')

    def execute(self, userdata):
        self.marker_pub.publish(self.area_marker)
        g = self.get_goal()
        userdata.goal = self.get_goal()
        return 'continue'
    
    def get_goal(self):
        quad = np.array([
            [self.points[0].x, self.points[0].y],
            [self.points[1].x, self.points[1].y],
            [self.points[2].x, self.points[2].y],
            [self.points[3].x, self.points[3].y],
        ])

        point = self.random_point_in_quadrilateral(quad)

        # Logger.logdebug(point[0], point[1])

        goal = Pose2D()
        
        goal.x = point[0]
        goal.y = point[1]
        goal.theta = np.random.uniform(-np.pi, np.pi)

        return goal

    def random_point_in_triangle(self, triangle):
        r1 = np.sqrt(random.random())
        r2 = random.random()
        point = (1 - r1) * triangle[0] + r1 * (1 - r2) * triangle[1] + r1 * r2 * triangle[2]
        return point

    def random_point_in_quadrilateral(self, quad):
        triangle1 = [quad[0], quad[1], quad[2]]
        triangle2 = [quad[0], quad[2], quad[3]]
        
        if random.random() < 0.5:
            return self.random_point_in_triangle(triangle1)
        else:
            return self.random_point_in_triangle(triangle2)
		
