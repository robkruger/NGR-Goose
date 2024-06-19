#!/usr/bin/env python

from flexbe_core import EventState, Logger
from flexbe_core.proxy import ProxyActionClient, ProxySubscriberCached

from actionlib_msgs.msg import GoalStatus
from move_base_msgs.msg import *
from geometry_msgs.msg import Pose, Point, Quaternion, Pose2D
from tf import transformations

class MirteMoveBaseState(EventState):
    """
    Navigates a mirte to a desired position and orientation using move_base.
    If wrapper is detected, the goal is discarded.

    ># waypoint     Pose2D      Target waypoint for navigation.

    <= arrived                  Navigation to target pose succeeded.
    <= wrapper_interupted       Navigation found a wrapper.
    <= failed                   Navigation to target pose failed.
    """

    def __init__(self):
        """Constructor"""

        super(MirteMoveBaseState, self).__init__(outcomes = ['arrived', 'wrapper_interupted', 'failed'],
                                                 input_keys = ['waypoint'])

        self._action_topic = "/move_base"
        self._wrapper_detection_topic = "/wrapper_detect"

        self._client = ProxyActionClient({self._action_topic: MoveBaseAction})

        self._sub = ProxySubscriberCached({self._wrapper_detection_topic: Pose}) # !!!! It's ofcourse not a pose, but a custom message type defined later !!!! 

        self._arrived = False
        self._interupted = False
        self._failed = False


    def execute(self, userdata):
        """Wait for action result and return outcome accordingly"""

        if self._arrived:
            return 'arrived'
        if self._interupted:
            self.cancel_active_goals()
            return 'wrapper_interupted'
        if self._failed:
            return 'failed'

        if self._client.has_result(self._action_topic):
            status = self._client.get_state(self._action_topic)
            if status == GoalStatus.SUCCEEDED:
                self._arrived = True
                return 'arrived'
            elif status in [GoalStatus.PREEMPTED, GoalStatus.REJECTED,
                            GoalStatus.RECALLED, GoalStatus.ABORTED]:
                Logger.logwarn('Navigation failed: %s' % str(status))
                self._failed = True
                return 'failed'
            
        if self._sub.has_msg(self._wrapper_detection_topic):
            msg = self._sub.get_last_msg(self._wrapper_detection_topic)
            self._sub.remove_last_msg(self._wrapper_detection_topic)
            if msg.found_wrapper:
                self._interupted = True
                return 'wrapper_interupted'


    def on_enter(self, userdata):
        """Create and send action goal"""

        self._arrived = False
        self._failed = False

        # Create and populate action goal
        goal = MoveBaseGoal()

        pt = Point(x = userdata.waypoint.x, y = userdata.waypoint.y)
        qt = transformations.quaternion_from_euler(0, 0, userdata.waypoint.theta)

        goal.target_pose.pose = Pose(position = pt,
                                     orientation = Quaternion(*qt))

        goal.target_pose.header.frame_id = "map"
        # goal.target_pose.header.stamp.secs = 5.0

        # Send the action goal for execution
        try:
            self._client.send_goal(self._action_topic, goal)
        except Exception as e:
            Logger.logwarn("Unable to send navigation action goal:\n%s" % str(e))
            self._failed = True
            
    def cancel_active_goals(self):
        if self._client.is_available(self._action_topic):
            if self._client.is_active(self._action_topic):
                if not self._client.has_result(self._action_topic):
                    self._client.cancel(self._action_topic)
                    Logger.loginfo('Cancelled move_base active action goal.')

    def on_exit(self, userdata):
        self.cancel_active_goals()

    def on_stop(self):
        self.cancel_active_goals()
