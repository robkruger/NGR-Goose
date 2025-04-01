#!/usr/bin/env python3

import rospy
import actionlib
from goose_arm.msg import MoveArmAction, MoveArmActionFeedback, MoveArmActionResult, MoveArmGoal

def feedback_cb(feedback):
    rospy.loginfo(f"Feedback: {feedback.feedback}")

if __name__ == "__main__":
    rospy.init_node("my_action_client")
    
    client = actionlib.SimpleActionClient("/arm/move_arm_action", MoveArmAction)
    client.wait_for_server()

    goal = MoveArmGoal()
    goal.joint_positions = [0, 0, 0, 0]  # Set goal value

    client.send_goal(goal, feedback_cb=feedback_cb)
    rospy.loginfo("Waiting for result...")
    client.wait_for_result()

    rospy.loginfo(f"Result: {client.get_result().final_state}")
