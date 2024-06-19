; Auto-generated. Do not edit!


(cl:in-package mirte_msgs_2-srv)


;//! \htmlinclude SetSingleLEDValue-request.msg.html

(cl:defclass <SetSingleLEDValue-request> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0)
   (pixel
    :reader pixel
    :initarg :pixel
    :type cl:integer
    :initform 0))
)

(cl:defclass SetSingleLEDValue-request (<SetSingleLEDValue-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSingleLEDValue-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSingleLEDValue-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mirte_msgs_2-srv:<SetSingleLEDValue-request> is deprecated: use mirte_msgs_2-srv:SetSingleLEDValue-request instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <SetSingleLEDValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mirte_msgs_2-srv:value-val is deprecated.  Use mirte_msgs_2-srv:value instead.")
  (value m))

(cl:ensure-generic-function 'pixel-val :lambda-list '(m))
(cl:defmethod pixel-val ((m <SetSingleLEDValue-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mirte_msgs_2-srv:pixel-val is deprecated.  Use mirte_msgs_2-srv:pixel instead.")
  (pixel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSingleLEDValue-request>) ostream)
  "Serializes a message object of type '<SetSingleLEDValue-request>"
  (cl:let* ((signed (cl:slot-value msg 'value)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pixel)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSingleLEDValue-request>) istream)
  "Deserializes a message object of type '<SetSingleLEDValue-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'value) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pixel) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSingleLEDValue-request>)))
  "Returns string type for a service object of type '<SetSingleLEDValue-request>"
  "mirte_msgs_2/SetSingleLEDValueRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSingleLEDValue-request)))
  "Returns string type for a service object of type 'SetSingleLEDValue-request"
  "mirte_msgs_2/SetSingleLEDValueRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSingleLEDValue-request>)))
  "Returns md5sum for a message object of type '<SetSingleLEDValue-request>"
  "4d6f4830182c46665b9a704973ece68d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSingleLEDValue-request)))
  "Returns md5sum for a message object of type 'SetSingleLEDValue-request"
  "4d6f4830182c46665b9a704973ece68d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSingleLEDValue-request>)))
  "Returns full string definition for message of type '<SetSingleLEDValue-request>"
  (cl:format cl:nil "int32 value~%int32 pixel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSingleLEDValue-request)))
  "Returns full string definition for message of type 'SetSingleLEDValue-request"
  (cl:format cl:nil "int32 value~%int32 pixel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSingleLEDValue-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSingleLEDValue-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSingleLEDValue-request
    (cl:cons ':value (value msg))
    (cl:cons ':pixel (pixel msg))
))
;//! \htmlinclude SetSingleLEDValue-response.msg.html

(cl:defclass <SetSingleLEDValue-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetSingleLEDValue-response (<SetSingleLEDValue-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetSingleLEDValue-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetSingleLEDValue-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mirte_msgs_2-srv:<SetSingleLEDValue-response> is deprecated: use mirte_msgs_2-srv:SetSingleLEDValue-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <SetSingleLEDValue-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mirte_msgs_2-srv:status-val is deprecated.  Use mirte_msgs_2-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetSingleLEDValue-response>) ostream)
  "Serializes a message object of type '<SetSingleLEDValue-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetSingleLEDValue-response>) istream)
  "Deserializes a message object of type '<SetSingleLEDValue-response>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetSingleLEDValue-response>)))
  "Returns string type for a service object of type '<SetSingleLEDValue-response>"
  "mirte_msgs_2/SetSingleLEDValueResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSingleLEDValue-response)))
  "Returns string type for a service object of type 'SetSingleLEDValue-response"
  "mirte_msgs_2/SetSingleLEDValueResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetSingleLEDValue-response>)))
  "Returns md5sum for a message object of type '<SetSingleLEDValue-response>"
  "4d6f4830182c46665b9a704973ece68d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetSingleLEDValue-response)))
  "Returns md5sum for a message object of type 'SetSingleLEDValue-response"
  "4d6f4830182c46665b9a704973ece68d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetSingleLEDValue-response>)))
  "Returns full string definition for message of type '<SetSingleLEDValue-response>"
  (cl:format cl:nil "bool status~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetSingleLEDValue-response)))
  "Returns full string definition for message of type 'SetSingleLEDValue-response"
  (cl:format cl:nil "bool status~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetSingleLEDValue-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetSingleLEDValue-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetSingleLEDValue-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetSingleLEDValue)))
  'SetSingleLEDValue-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetSingleLEDValue)))
  'SetSingleLEDValue-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetSingleLEDValue)))
  "Returns string type for a service object of type '<SetSingleLEDValue>"
  "mirte_msgs_2/SetSingleLEDValue")