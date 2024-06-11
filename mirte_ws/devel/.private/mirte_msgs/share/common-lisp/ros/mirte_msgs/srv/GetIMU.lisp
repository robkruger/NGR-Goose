; Auto-generated. Do not edit!


(cl:in-package mirte_msgs-srv)


;//! \htmlinclude GetIMU-request.msg.html

(cl:defclass <GetIMU-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetIMU-request (<GetIMU-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetIMU-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetIMU-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mirte_msgs-srv:<GetIMU-request> is deprecated: use mirte_msgs-srv:GetIMU-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetIMU-request>) ostream)
  "Serializes a message object of type '<GetIMU-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetIMU-request>) istream)
  "Deserializes a message object of type '<GetIMU-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetIMU-request>)))
  "Returns string type for a service object of type '<GetIMU-request>"
  "mirte_msgs/GetIMURequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetIMU-request)))
  "Returns string type for a service object of type 'GetIMU-request"
  "mirte_msgs/GetIMURequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetIMU-request>)))
  "Returns md5sum for a message object of type '<GetIMU-request>"
  "1a90e9316c538a225459520b61aa5e33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetIMU-request)))
  "Returns md5sum for a message object of type 'GetIMU-request"
  "1a90e9316c538a225459520b61aa5e33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetIMU-request>)))
  "Returns full string definition for message of type '<GetIMU-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetIMU-request)))
  "Returns full string definition for message of type 'GetIMU-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetIMU-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetIMU-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetIMU-request
))
;//! \htmlinclude GetIMU-response.msg.html

(cl:defclass <GetIMU-response> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type sensor_msgs-msg:Imu
    :initform (cl:make-instance 'sensor_msgs-msg:Imu)))
)

(cl:defclass GetIMU-response (<GetIMU-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetIMU-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetIMU-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mirte_msgs-srv:<GetIMU-response> is deprecated: use mirte_msgs-srv:GetIMU-response instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <GetIMU-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mirte_msgs-srv:data-val is deprecated.  Use mirte_msgs-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetIMU-response>) ostream)
  "Serializes a message object of type '<GetIMU-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'data) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetIMU-response>) istream)
  "Deserializes a message object of type '<GetIMU-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'data) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetIMU-response>)))
  "Returns string type for a service object of type '<GetIMU-response>"
  "mirte_msgs/GetIMUResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetIMU-response)))
  "Returns string type for a service object of type 'GetIMU-response"
  "mirte_msgs/GetIMUResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetIMU-response>)))
  "Returns md5sum for a message object of type '<GetIMU-response>"
  "1a90e9316c538a225459520b61aa5e33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetIMU-response)))
  "Returns md5sum for a message object of type 'GetIMU-response"
  "1a90e9316c538a225459520b61aa5e33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetIMU-response>)))
  "Returns full string definition for message of type '<GetIMU-response>"
  (cl:format cl:nil "sensor_msgs/Imu data~%~%================================================================================~%MSG: sensor_msgs/Imu~%# This is a message to hold data from an IMU (Inertial Measurement Unit)~%#~%# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec~%#~%# If the covariance of the measurement is known, it should be filled in (if all you know is the ~%# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)~%# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the~%# data a covariance will have to be assumed or gotten from some other source~%#~%# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation ~%# estimate), please set element 0 of the associated covariance matrix to -1~%# If you are interpreting this message, please check for a value of -1 in the first element of each ~%# covariance matrix, and disregard the associated estimate.~%~%Header header~%~%geometry_msgs/Quaternion orientation~%float64[9] orientation_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 angular_velocity~%float64[9] angular_velocity_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 linear_acceleration~%float64[9] linear_acceleration_covariance # Row major x, y z ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetIMU-response)))
  "Returns full string definition for message of type 'GetIMU-response"
  (cl:format cl:nil "sensor_msgs/Imu data~%~%================================================================================~%MSG: sensor_msgs/Imu~%# This is a message to hold data from an IMU (Inertial Measurement Unit)~%#~%# Accelerations should be in m/s^2 (not in g's), and rotational velocity should be in rad/sec~%#~%# If the covariance of the measurement is known, it should be filled in (if all you know is the ~%# variance of each measurement, e.g. from the datasheet, just put those along the diagonal)~%# A covariance matrix of all zeros will be interpreted as \"covariance unknown\", and to use the~%# data a covariance will have to be assumed or gotten from some other source~%#~%# If you have no estimate for one of the data elements (e.g. your IMU doesn't produce an orientation ~%# estimate), please set element 0 of the associated covariance matrix to -1~%# If you are interpreting this message, please check for a value of -1 in the first element of each ~%# covariance matrix, and disregard the associated estimate.~%~%Header header~%~%geometry_msgs/Quaternion orientation~%float64[9] orientation_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 angular_velocity~%float64[9] angular_velocity_covariance # Row major about x, y, z axes~%~%geometry_msgs/Vector3 linear_acceleration~%float64[9] linear_acceleration_covariance # Row major x, y z ~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetIMU-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetIMU-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetIMU-response
    (cl:cons ':data (data msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetIMU)))
  'GetIMU-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetIMU)))
  'GetIMU-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetIMU)))
  "Returns string type for a service object of type '<GetIMU>"
  "mirte_msgs/GetIMU")