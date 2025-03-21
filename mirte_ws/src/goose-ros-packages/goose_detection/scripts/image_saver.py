#!/usr/bin/env python3

import rospy
from sensor_msgs.msg import Image, CompressedImage
from cv_bridge import CvBridge
import cv2
import numpy as np

class ImageSaver:
    def __init__(self):
        rospy.init_node("image_saver", anonymous=True)
        self.bridge = CvBridge()
        self.image_sub = rospy.Subscriber("/camera/depth/image_raw/compressedDepth", CompressedImage, self.image_callback)
        self.image_count = 3
        rospy.loginfo("Image saver node started")
        self.image_queue = 10

    # def image_callback(self, msg):
    #     self.image_queue -= 1
    #     if self.image_queue > 0:
    #         rospy.loginfo(f"Dropped image, image queue: {self.image_queue}")
    #         return
        
    #     try:
    #         cv_image = self.bridge.imgmsg_to_cv2(msg, "bgr8")
    #         filename = f"saved_image_{self.image_count}.jpg"
    #         cv2.imwrite(filename, cv_image)
    #         rospy.loginfo(f"Saved image: {filename}")
    #         self.image_count += 1
    #     except Exception as e:
    #         rospy.logerr(f"Error saving image: {e}")

    #     self.image_queue = 20

    def image_callback(self, msg):
        # try:
        cv_image = self.convert_to_cv2(self.convert_compressedDepth_to_cv2(msg))
        filename = f"saved_image_{self.image_count}.jpg"
        cv2.imwrite(filename, cv_image)
        self.image_count += 1
        # except Exception as e:
        #     rospy.logerr(f"Error saving image: {e}")

    def convert_compressedDepth_to_cv2(self, compressed_depth):
        """
        Convert a compressedDepth topic image into a cv2 image.
        compressed_depth must be from a topic /bla/compressedDepth
        as it's encoded in PNG
        Code from: https://answers.ros.org/question/249775/display-compresseddepth-image-python-cv2/
        """
        depth_fmt, compr_type = compressed_depth.format.split(';')
        # remove white space
        depth_fmt = depth_fmt.strip()
        compr_type = compr_type.strip()
        if compr_type != "compressedDepth png":
            raise Exception("Compression type is not 'compressedDepth'."
                            "You probably subscribed to the wrong topic.")

        # remove header from raw data, if necessary
        # print(compressed_depth.data[:12])
        # if 'PNG' in compressed_depth.data[:12]:
        #     # If we compressed it with opencv, there is nothing to strip
        #     depth_header_size = 0
        # else:
        #     # If it comes from a robot/sensor, it has 12 useless bytes apparently
        #     depth_header_size = 12
        raw_data = compressed_depth.data[12:]

        depth_img_raw = cv2.imdecode(np.frombuffer(raw_data, np.uint8),
                                     # the cv2.CV_LOAD_IMAGE_UNCHANGED has been removed
                                     -1)  # cv2.CV_LOAD_IMAGE_UNCHANGED)
        if depth_img_raw is None:
            # probably wrong header size
            raise Exception("Could not decode compressed depth image."
                            "You may need to change 'depth_header_size'!")
        return depth_img_raw
    
    def convert_to_cv2(self, image):
        """
        Convert any kind of image to cv2.
        """
        cv2_img = None
        if type(image) == np.ndarray:
            cv2_img = image
        elif image._type == 'sensor_msgs/Image':
            cv2_img = self.convert_ros_msg_to_cv2(image)
        elif image._type == 'sensor_msgs/CompressedImage':
            cv2_img = self.convert_ros_compressed_to_cv2(image)
        else:
            raise TypeError("Cannot convert type: " + str(type(image)))
        return cv2_img

if __name__ == "__main__":
    ImageSaver()
    rospy.spin()
