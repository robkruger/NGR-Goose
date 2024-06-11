import rospy
from mirte_msgs.srv import SetServoAngle

if __name__ == "__main__":
    rospy.wait_for_service('/mirte/set_servoGripper_servo_angle')  # Wait for the service to become available
    try:
        set_servo_rot_servo_angle = rospy.ServiceProxy('/mirte/set_servoGripper_servo_angle', SetServoAngle)
        response = set_servo_rot_servo_angle(0.7)
        rospy.loginfo("Service call successful! Response: %s", response)
    except rospy.ServiceException as e:
        rospy.logerr("Service call failed: %s", e)