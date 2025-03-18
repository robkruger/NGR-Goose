#!/usr/bin/env python3

import sys
import rospy
import moveit_commander
from math import pi
import random
from goose_arm.srv import MoveArm


class MoveArmService:
    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node('move_arm_service', anonymous=True)

        self.arm = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        self.move_group = moveit_commander.MoveGroupCommander("manipulator")
        
        self.move_group.set_max_velocity_scaling_factor(1)

        self.service = rospy.Service('go_to_joint_state', MoveArm, self.handle_go_to_joint_state)

    def handle_go_to_joint_state(self, req):
        try:
            self.go_to_joint_state(req.joint_positions)
            return True
        except Exception as e:
            return False
    
    def go_to_joint_state(self, joint_positions):
        self.move_group.go(joint_positions, wait=True)

        self.move_group.stop()




if __name__ == '__main__':
    try:
        move_arm_service = MoveArmService()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass


