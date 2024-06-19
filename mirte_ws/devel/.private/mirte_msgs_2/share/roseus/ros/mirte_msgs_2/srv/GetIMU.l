;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::GetIMU)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'GetIMU (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::GETIMU")
  (make-package "MIRTE_MSGS_2::GETIMU"))
(unless (find-package "MIRTE_MSGS_2::GETIMUREQUEST")
  (make-package "MIRTE_MSGS_2::GETIMUREQUEST"))
(unless (find-package "MIRTE_MSGS_2::GETIMURESPONSE")
  (make-package "MIRTE_MSGS_2::GETIMURESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass mirte_msgs_2::GetIMURequest
  :super ros::object
  :slots ())

(defmethod mirte_msgs_2::GetIMURequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass mirte_msgs_2::GetIMUResponse
  :super ros::object
  :slots (_data ))

(defmethod mirte_msgs_2::GetIMUResponse
  (:init
   (&key
    ((:data __data) (instance sensor_msgs::Imu :init))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Imu _data
    (send _data :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Imu _data
       (send _data :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Imu _data
     (send _data :deserialize buf ptr-) (incf ptr- (send _data :serialization-length))
   ;;
   self)
  )

(defclass mirte_msgs_2::GetIMU
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::GetIMU :md5sum-) "1a90e9316c538a225459520b61aa5e33")
(setf (get mirte_msgs_2::GetIMU :datatype-) "mirte_msgs_2/GetIMU")
(setf (get mirte_msgs_2::GetIMU :request) mirte_msgs_2::GetIMURequest)
(setf (get mirte_msgs_2::GetIMU :response) mirte_msgs_2::GetIMUResponse)

(defmethod mirte_msgs_2::GetIMURequest
  (:response () (instance mirte_msgs_2::GetIMUResponse :init)))

(setf (get mirte_msgs_2::GetIMURequest :md5sum-) "1a90e9316c538a225459520b61aa5e33")
(setf (get mirte_msgs_2::GetIMURequest :datatype-) "mirte_msgs_2/GetIMURequest")
(setf (get mirte_msgs_2::GetIMURequest :definition-)
      "---
sensor_msgs/Imu data

================================================================================
MSG: sensor_msgs/Imu
# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

Header header

geometry_msgs/Quaternion orientation
float64[9] orientation_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 angular_velocity
float64[9] angular_velocity_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 linear_acceleration
float64[9] linear_acceleration_covariance # Row major x, y z 

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")

(setf (get mirte_msgs_2::GetIMUResponse :md5sum-) "1a90e9316c538a225459520b61aa5e33")
(setf (get mirte_msgs_2::GetIMUResponse :datatype-) "mirte_msgs_2/GetIMUResponse")
(setf (get mirte_msgs_2::GetIMUResponse :definition-)
      "---
sensor_msgs/Imu data

================================================================================
MSG: sensor_msgs/Imu
# This is a message to hold data from an IMU (Inertial Measurement Unit)
#
# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec
#
# If the covariance of the measurement is known, it should be filled in (if all you know is the 
# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)
# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the
# data a covariance will have to be assumed or gotten from some other source
#
# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation 
# estimate), please set element 0 of the associated covariance matrix to -1
# If you are interpreting this message, please check for a value of -1 in the first element of each 
# covariance matrix, and disregard the associated estimate.

Header header

geometry_msgs/Quaternion orientation
float64[9] orientation_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 angular_velocity
float64[9] angular_velocity_covariance # Row major about x, y, z axes

geometry_msgs/Vector3 linear_acceleration
float64[9] linear_acceleration_covariance # Row major x, y z 

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
")



(provide :mirte_msgs_2/GetIMU "1a90e9316c538a225459520b61aa5e33")


