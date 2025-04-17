#!/usr/bin/env python3
import rospy
 
import dynamic_reconfigure.client

if __name__ == "__main__":
    rospy.init_node("dynamic_client")
 
    client = dynamic_reconfigure.client.Client("move_base/local_costmap/obstacles_layer", timeout=30)
    toggle = False
 
    while not rospy.is_shutdown():
        client.update_configuration({"enabled": toggle})
        toggle = not toggle
        rospy.loginfo("Enabled obstacle_layer: %s", toggle)
        rospy.sleep(2)