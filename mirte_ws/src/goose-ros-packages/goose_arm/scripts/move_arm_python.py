#!/usr/bin/env python3

import sys
import rospy
import moveit_commander
import actionlib
from goose_arm.msg import MoveArmAction, MoveArmActionFeedback, MoveArmActionResult
from moveit_msgs.msg import MoveGroupActionFeedback
from actionlib_msgs.msg import GoalStatusArray


class MoveArmActionServer:
    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node('move_arm_service', anonymous=True)

        self.arm = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        self.move_group = moveit_commander.MoveGroupCommander("manipulator")
        
        self.move_group.set_max_velocity_scaling_factor(.1)

        self.action_server = actionlib.SimpleActionServer('move_arm_action', MoveArmAction, self.execute, False)
        self.action_server.start()

        self.feedback_subscriber = rospy.Subscriber('/arm/move_group/feedback', MoveGroupActionFeedback, self.feedback_callback)
        self.result_subscriber = rospy.Subscriber('/arm/move_group/status', GoalStatusArray, self.result_callback)

        self.latest_feedback = None
        self.latest_result = None

    def feedback_callback(self, feedback):
        self.latest_feedback = feedback
        rospy.loginfo("Feedback received: %s", feedback.feedback.state)

    def result_callback(self, result):
        self.latest_result = result
        rospy.loginfo("Result received: %s", result)
    
    def execute(self, goal):
        feedback = MoveArmActionFeedback()
        result = MoveArmActionResult()
        
        rospy.loginfo("Received goal: %s", goal.joint_positions)

        self.move_group.go(goal.joint_positions, wait=False)

        # rospy.loginfo(self.move_group.get_state())

        # while self.arm.get_current_state() not in [moveit_commander.MoveItErrorCodes.SUCCESS,
        #                                           moveit_commander.MoveItErrorCodes.MOTION_PLAN_INVALIDATED]:
        #     if self.action_server.is_preempt_requested():
        #         rospy.loginfo("Goal Preempted")
        #         self.action_server.set_preempted()
        #         self.move_group.stop()
        #         return
            
        #     feedback.feedback = str(self.move_group.get_current_state())
        #     self.action_server.publish_feedback(feedback)
        #     rospy.sleep(0.2)
        
        # result.result = self.move_group.get_current_state()
        # self.server.set_succeeded(result.result == moveit_commander.MoveItErrorCodes.SUCCESS)
        # self.move_group.stop()


if __name__ == '__main__':
    try:
        move_arm_action_server = MoveArmActionServer()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass


