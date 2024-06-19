import rospy

from flexbe_core import EventState, Logger
from mirte_msgs.srv import SetServoAngle


class SetGripperState(EventState):
    '''
    This state can open or close the gripper to a specified angle

    -- angle 	float 	Angle for the gripper

    <= continue 			Gripper successfully set
    <= failed 				Failure

    '''

    def __init__(self, angle):
        # Declare outcomes, input_keys, and output_keys by calling the super constructor with the corresponding arguments.
        super(SetGripperState, self).__init__(outcomes = ['continue', 'failed'])

        self.angle = angle

    def execute(self, userdata):
        rospy.wait_for_service('/mirte/set_servoGripper_servo_angle')  # Wait for the service to become available
        try:
            set_servo_rot_servo_angle = rospy.ServiceProxy('/mirte/set_servoGripper_servo_angle', SetServoAngle)
            response = set_servo_rot_servo_angle(self.angle)
            Logger.loginfo("Succeeded")
            return 'continue'
        except rospy.ServiceException as e:
            Logger.loginfo("Failed")
            return 'failed'
        