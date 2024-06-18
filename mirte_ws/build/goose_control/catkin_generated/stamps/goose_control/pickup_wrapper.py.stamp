import sys
import rospy
import moveit_commander
import moveit_msgs.msg
from geometry_msgs.msg import PoseStamped
import numpy as np
from mirte_msgs.srv import SetServoAngle
from actionlib_msgs.msg import GoalStatusArray
from tf.transformations import quaternion_from_euler
import random
from actionlib_msgs.msg import GoalID


move_group = None

def init():
    global move_group
    # Initialize the moveit_commander
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('pickup_arm', anonymous=True)

    # Instantiate a `RobotCommander` object. This object is the outer-level interface to the robot:
    robot = moveit_commander.RobotCommander(ns="/arm")

    group_names = robot.get_group_names()
    rospy.loginfo("Available Planning Groups:")
    for name in group_names:
        rospy.loginfo(name)

    # Instantiate a `PlanningSceneInterface` object. This object is an interface to the world surrounding the robot:
    scene = moveit_commander.PlanningSceneInterface()

    # Instantiate a `MoveGroupCommander` object. This object is an interface to one group of joints:
    group_name = "arm"  # Replace with your actual planning group name
    move_group = moveit_commander.MoveGroupCommander(group_name)

def move_to_joint_state(joint_angles):
    # Set the desired joint values:
    joint_goal = move_group.get_current_joint_values()
    
    # Specify the joint angles (replace these values with your desired angles):
    joint_goal[0] = joint_angles[0]
    joint_goal[1] = joint_angles[1]
    joint_goal[2] = joint_angles[2]
    joint_goal[3] = joint_angles[3]

    move_group.set_max_velocity_scaling_factor(1)  # Adjust as needed
    
    # Plan and execute the motion:
    move_group.go(joint_goal, wait=True)
    
    # Ensure that there is no residual movement:
    move_group.stop()

    # Clear the pose targets:
    move_group.clear_pose_targets()


def set_gripper_angle(angle):
    rospy.wait_for_service('/mirte/set_servoGripper_servo_angle')  # Wait for the service to become available
    try:
        set_servo_rot_servo_angle = rospy.ServiceProxy('/mirte/set_servoGripper_servo_angle', SetServoAngle)
        response = set_servo_rot_servo_angle(angle)
        rospy.loginfo("Service call successful! Response: %s", response)
    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s", e)

def pickup(start_state):
    if start_state != "Idle":
        move_to_joint_state(idle_angles)

    set_gripper_angle(0.7)

    move_to_joint_state(pick_up_angles)

    set_gripper_angle(-0.2)

    move_to_joint_state(idle_angles)

def place(start_state):
    if start_state != "Idle":
        move_to_joint_state(idle_angles)

    set_gripper_angle(-0.2)

    move_to_joint_state(pick_up_angles)

    set_gripper_angle(0.7)

    move_to_joint_state(idle_angles)

def idle():
    move_to_joint_state(idle_angles)

def callback(msg):
    # rospy.loginfo(msg)
    # rospy.loginfo(msg.status_list[0].status)
    rospy.loginfo("{}, {}".format(msg.status_list[0].status, msg.status_list[0].goal_id.id))
    if msg.status_list[0].status == 3:
        pickup(idle)

        goal = PoseStamped()
    
        goal.header.seq = 1
        goal.header.stamp = rospy.Time.now()
        goal.header.frame_id = "map"

        goal.pose.position.x = 6.6 # random.uniform(point_1[0], point_2[0])
        goal.pose.position.y = 9.0 # random.uniform(point_1[1], point_2[1])
        goal.pose.position.z = 0.0

        quaternion = quaternion_from_euler(0, 0, random.uniform(-np.pi, np.pi))

        goal.pose.orientation.x = quaternion[0]
        goal.pose.orientation.y = quaternion[1]
        goal.pose.orientation.z = quaternion[2]
        goal.pose.orientation.w = quaternion[3]

        goal_pub.publish(goal)

pick_up_angles = [0, -np.pi/3, -np.pi/3, -np.pi/6] # [0, -np.pi/3, -np.pi/3, -np.pi/6] #
idle_angles = [0, np.pi/8, np.pi/8, np.pi/8] # [0, np.pi/6, np.pi/6, np.pi/6]

goal_pub = rospy.Publisher("/move_base_simple/goal", PoseStamped, queue_size = 2)

if __name__ == '__main__':
    try:        
        init()
        idle()
        pickup_listener = rospy.Subscriber('/move_base/status', GoalStatusArray, callback)
    except rospy.ROSInterruptException:
        pass

    while not rospy.is_shutdown():
        rospy.rostime.wallsleep(0.1)

    # Shut down MoveIt cleanly:
    moveit_commander.roscpp_shutdown()
