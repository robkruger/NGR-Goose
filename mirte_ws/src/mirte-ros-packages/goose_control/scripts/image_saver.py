#!/usr/bin/env python3
# Import the required libraries
import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import time
import os

# Initialize the CvBridge class
bridge = CvBridge()

# Variable to store the time when the last image was saved
last_saved_time = 0

# Get the directory where the script is located
script_dir = os.path.dirname(os.path.realpath(__file__))

# Create a subfolder named "images" inside the script directory
image_folder = os.path.join(script_dir, 'images')

# Make sure the subfolder exists, if not, create it
if not os.path.exists(image_folder):
    os.makedirs(image_folder)

def image_callback(msg):
    global last_saved_time

    # Get the current time in seconds
    current_time = time.time()

    # Check if at least one second has passed since the last image was saved
    if current_time - last_saved_time >= 10.0:
        try:
            # Convert the ROS Image message to a CV2 image
            cv_image = bridge.imgmsg_to_cv2(msg, desired_encoding='bgr8')
        except CvBridgeError as e:
            print(e)
            return

        # Save the image to the local directory
        image_path = os.path.join(image_folder, 'image_{}.jpg'.format(int(current_time)))
        cv2.imwrite(image_path, cv_image)
        rospy.loginfo(f"Image saved to {image_path}")

        # Update the last saved time
        last_saved_time = current_time

def main():
    # Initialize the ROS node
    rospy.init_node('image_saver', anonymous=True)

    # Subscribe to the image topic
    image_topic = "/camera/color/image_raw"  # Replace with your image topic
    rospy.Subscriber(image_topic, Image, image_callback)

    # Spin to keep the script running
    rospy.spin()

if __name__ == '__main__':
    main()
