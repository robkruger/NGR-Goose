#!/usr/bin/env python
# -*- coding: utf-8 -*-
###########################################################
#               WARNING: Generated code!                  #
#              **************************                 #
# Manual changes may get lost if file is generated again. #
# Only code inside the [MANUAL] tags will be kept.        #
###########################################################

from flexbe_core import Behavior, Autonomy, OperatableStateMachine, ConcurrencyContainer, PriorityContainer, Logger
from flexbe_manipulation_states.moveit_to_joints_state import MoveitToJointsState
from flexbe_navigation_states.move_base_state import MoveBaseState
from flexbe_states.wait_state import WaitState
from mirte_flexbe_states.define_area import DefineAreaState
from mirte_flexbe_states.set_gripper import SetGripperState
# Additional imports can be added inside the following tags
# [MANUAL_IMPORT]
from geometry_msgs.msg import Pose2D
# [/MANUAL_IMPORT]


'''
Created on Tue Jun 18 2024
@author: Rob Krüger
'''
class pickup_wrapperSM(Behavior):
	'''
	The robot drives to an area where wrappers could be, detects one and picks it up.
	'''


	def __init__(self):
		super(pickup_wrapperSM, self).__init__()
		self.name = 'pickup_wrapper'

		# parameters of this behavior

		# references to used behaviors

		# Additional initialization code can be added inside the following tags
		# [MANUAL_INIT]
		
		# [/MANUAL_INIT]

		# Behavior comments:



	def create(self):
		moveit_group = 'arm'
		area = [(-3.7, -0.3), (-6, -0.4), (-6, 1.0), (-3.8, 1.2)]
		joint_names = ['shoulder', 'arm', 'arm2', 'gripper_joint']
		# x:1285 y:700, x:0 y:710
		_state_machine = OperatableStateMachine(outcomes=['finished', 'failed'])
		_state_machine.userdata.joint_config = [0, -1.05, -1.05, -0.52]
		_state_machine.userdata.waypoint = []
		_state_machine.userdata.idle_joints = [0, 0.39, 0.39, 0.39]
		_state_machine.userdata.home = Pose2D(0, 1, 0)

		# Additional creation code can be added inside the following tags
		# [MANUAL_CREATE]
		
		# [/MANUAL_CREATE]


		with _state_machine:
			# x:71 y:53
			OperatableStateMachine.add('IdleArm',
										MoveitToJointsState(move_group=moveit_group, joint_names=joint_names, action_topic='/move_group'),
										transitions={'reached': 'OpenGripper1', 'planning_failed': 'failed', 'control_failed': 'failed'},
										autonomy={'reached': Autonomy.Off, 'planning_failed': Autonomy.Off, 'control_failed': Autonomy.Off},
										remapping={'joint_config': 'idle_joints'})

			# x:587 y:60
			OperatableStateMachine.add('DefineArea',
										DefineAreaState(points=area),
										transitions={'continue': 'MoveToArea', 'failed': 'failed'},
										autonomy={'continue': Autonomy.Off, 'failed': Autonomy.Off},
										remapping={'goal': 'goal'})

			# x:1117 y:84
			OperatableStateMachine.add('IdleArm2',
										MoveitToJointsState(move_group=moveit_group, joint_names=joint_names, action_topic='/move_group'),
										transitions={'reached': 'MoveHome', 'planning_failed': 'failed', 'control_failed': 'failed'},
										autonomy={'reached': Autonomy.Off, 'planning_failed': Autonomy.Off, 'control_failed': Autonomy.Off},
										remapping={'joint_config': 'idle_joints'})

			# x:1163 y:560
			OperatableStateMachine.add('IdleArm3',
										MoveitToJointsState(move_group=moveit_group, joint_names=joint_names, action_topic='/move_group'),
										transitions={'reached': 'finished', 'planning_failed': 'failed', 'control_failed': 'failed'},
										autonomy={'reached': Autonomy.Off, 'planning_failed': Autonomy.Off, 'control_failed': Autonomy.Off},
										remapping={'joint_config': 'idle_joints'})

			# x:1104 y:260
			OperatableStateMachine.add('MoveHome',
										MoveBaseState(),
										transitions={'arrived': 'Place', 'failed': 'failed'},
										autonomy={'arrived': Autonomy.Off, 'failed': Autonomy.Off},
										remapping={'waypoint': 'home'})

			# x:575 y:142
			OperatableStateMachine.add('MoveToArea',
										MoveBaseState(),
										transitions={'arrived': 'PickUp', 'failed': 'failed'},
										autonomy={'arrived': Autonomy.Off, 'failed': Autonomy.Off},
										remapping={'waypoint': 'goal'})

			# x:336 y:55
			OperatableStateMachine.add('OpenGripper1',
										SetGripperState(angle=0.7),
										transitions={'continue': 'DefineArea', 'failed': 'failed'},
										autonomy={'continue': Autonomy.Off, 'failed': Autonomy.Off})

			# x:1172 y:473
			OperatableStateMachine.add('OpenGripper2',
										SetGripperState(angle=0.7),
										transitions={'continue': 'IdleArm3', 'failed': 'failed'},
										autonomy={'continue': Autonomy.Off, 'failed': Autonomy.Off})

			# x:796 y:58
			OperatableStateMachine.add('PickUp',
										MoveitToJointsState(move_group=moveit_group, joint_names=joint_names, action_topic='/move_group'),
										transitions={'reached': 'CloseGripper', 'planning_failed': 'failed', 'control_failed': 'failed'},
										autonomy={'reached': Autonomy.Off, 'planning_failed': Autonomy.Off, 'control_failed': Autonomy.Off},
										remapping={'joint_config': 'joint_config'})

			# x:1147 y:398
			OperatableStateMachine.add('Place',
										MoveitToJointsState(move_group=moveit_group, joint_names=joint_names, action_topic='/move_group'),
										transitions={'reached': 'OpenGripper2', 'planning_failed': 'failed', 'control_failed': 'failed'},
										autonomy={'reached': Autonomy.Off, 'planning_failed': Autonomy.Off, 'control_failed': Autonomy.Off},
										remapping={'joint_config': 'joint_config'})

			# x:986 y:90
			OperatableStateMachine.add('Wait',
										WaitState(wait_time=1),
										transitions={'done': 'IdleArm2'},
										autonomy={'done': Autonomy.Off})

			# x:811 y:133
			OperatableStateMachine.add('CloseGripper',
										SetGripperState(angle=-0.2),
										transitions={'continue': 'Wait', 'failed': 'failed'},
										autonomy={'continue': Autonomy.Off, 'failed': Autonomy.Off})


		return _state_machine


	# Private functions can be added inside the following tags
	# [MANUAL_FUNC]
	
	# [/MANUAL_FUNC]
