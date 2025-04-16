#!/usr/bin/env python3

import sys
import rospy
import moveit_commander
import actionlib
from goose_arm.msg import MoveArmAction, MoveArmFeedback, MoveArmResult
from moveit_msgs.msg import MoveGroupActionFeedback
from actionlib_msgs.msg import GoalStatusArray
import time


class MoveArmActionServer:
    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node('move_arm_service', anonymous=True)

        self.arm = moveit_commander.RobotCommander()
        self.scene = moveit_commander.PlanningSceneInterface()
        self.move_group = moveit_commander.MoveGroupCommander("manipulator")
        
        self.vel_scale = 0.75
        self.move_group.set_max_velocity_scaling_factor(self.vel_scale)

        self.action_server = actionlib.SimpleActionServer('move_arm_action', MoveArmAction, self.execute, False)
        self.action_server.start()

        self.latest_feedback = None
        self.latest_result = None
    
    def execute(self, goal):
        feedback = MoveArmFeedback()
        result = MoveArmResult()
        
        rospy.loginfo("Received goal: %s", goal.joint_positions)

        plan = self.move_group.plan(goal.joint_positions)
        if isinstance(plan, tuple):
            plan_success = plan[0]
            plan = plan[1]

        if plan_success:
            duration = plan.joint_trajectory.points[-1].time_from_start.secs + plan.joint_trajectory.points[-1].time_from_start.nsecs / 1e9

            feedback.duration = duration
            feedback.plan_success = True
            feedback.stage = "Planning"
            self.action_server.publish_feedback(feedback)

            success = self.move_group.execute(plan, wait=False)
            execution_start = time.time()
            positions = []

            while (time.time() - execution_start) < duration:
                positions.append(self.move_group.get_current_state().joint_state.position)
                if len(positions) > 1:
                    difference = [abs(p1 - p2) for p1, p2 in zip(positions[-1], positions[-2])]
                    magnitude = sum(d ** 2 for d in difference) ** 0.5
                    if magnitude > 0.01 * self.vel_scale:
                        feedback.stage = "Executing"
                        feedback.execution_progress = (time.time() - execution_start) / duration
                    else:
                        feedback.stage = "Stalled"
                        feedback.execution_progress = -1.0

                    self.action_server.publish_feedback(feedback)

                rospy.sleep(0.1)

            rospy.sleep(0.5)
            self.move_group.stop()
   
            positions.append(self.move_group.get_current_state().joint_state.position)
            final_difference = [abs(gp - pp) for gp, pp in zip(goal.joint_positions, positions[-1])]
            final_magnitude = sum(d ** 2 for d in final_difference) ** 0.5

            if final_magnitude < 0.02:
                result.success = True
            else:
                result.success = False

            result.difference = final_magnitude

            self.action_server.set_succeeded(result)


if __name__ == '__main__':
    try:
        move_arm_action_server = MoveArmActionServer()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass


