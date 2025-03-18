#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_interface/planning_interface.h>
#include <moveit/robot_state/robot_state.h>
#include <geometry_msgs/PoseStamped.h>
#include <moveit/robot_trajectory/robot_trajectory.h>
#include <goose_arm/MoveArm.h>

bool goToJointValues(moveit::planning_interface::MoveGroupInterface& move_group, std::vector<double> joint_target_positions)
{
    // Set the joint target positions
    move_group.setJointValueTarget(joint_target_positions);

    // Move the robot to the joint target positions
    move_group.move();

    return true;
}

bool moveToJointPositionCallback(goose_arm::MoveArm::Request &req, 
    goose_arm::MoveArm::Response &res, 
    moveit::planning_interface::MoveGroupInterface& move_group)
{
    ROS_INFO("Received joint positions request");

    // Call goToJointValues function
    bool success = goToJointValues(move_group, req.joint_positions);

    ROS_INFO("Move arm request completed");
    ROS_INFO("Success: %d", success);

    // Return success or failure
    res.success = success;
    return true;
}

int main(int argc, char** argv)
{
    // Initialize ROS
    ros::init(argc, argv, "moveit_service");
    ros::NodeHandle node_handle;

    moveit::planning_interface::MoveGroupInterface move_group("manipulator");

    ROS_INFO("setup move_group");

    std::string reference_frame = "base_link";
    move_group.setPoseReferenceFrame(reference_frame);

    move_group.setPlannerId("RRTConnectkConfigDefault");
    move_group.setPlanningTime(10.0);
    move_group.setMaxVelocityScalingFactor(1); 

    ros::ServiceServer service = node_handle.advertiseService<goose_arm::MoveArm::Request, goose_arm::MoveArm::Response>(
        "move_arm", 
        boost::bind(&moveToJointPositionCallback, _1, _2, boost::ref(move_group))
    );

    ROS_INFO("Service is ready to move arm");

    // Keep the node running
    ros::spin();

    return 0;
}
