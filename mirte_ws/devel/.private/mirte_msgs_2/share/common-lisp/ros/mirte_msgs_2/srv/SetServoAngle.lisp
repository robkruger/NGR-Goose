; Auto-generated. Do not edit!


(cl:in-package mirte_msgs_2-srv)


;//! \htmlinclude SetServoAngle-request.msg.html

(cl:defclass <SetServoAngle-request> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetServoAngle-request (<SetServoAngle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetServoAngle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetServoAngle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mirte_msgs_2-srv:<SetServoAngle-request> is deprecated: use mirte_msgs_2-srv:SetServoAngle-request instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <SetServoAngle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mirte_msgs_2-srv:angle-val is deprecated.  Use mirte_msgs_2-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetServoAngle-request>) ostream)
  "Serializes a message object of type '<SetServoAngle-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetServoAngle-request>) istream)
  "Deserializes a message object of type '<SetServoAngle-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetServoAngle-request>)))
  "Returns string type for a service object of type '<SetServoAngle-request>"
  "mirte_msgs_2/SetServoAngleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetServoAngle-request)))
  "Returns string type for a service object of type 'SetServoAngle-request"
  "mirte_msgs_2/SetServoAngleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetServoAngle-request>)))
  "Returns md5sum for a message object of type '<SetServoAngle-request>"
  "ac590a8a24d757d23bdd7dab963c6e6f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetServoAngle-request)))
  "Returns md5sum for a message object of type 'SetServoAngle-request"
  "ac590a8a24d757d23bdd7dab963c6e6f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetServoAngle-request>)))
  "Returns full string definition for message of type '<SetServoAngle-request>"
  (cl:format cl:nil "float32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetServoAngle-request)))
  "Returns full string definition for message of type 'SetServoAngle-request"
  (cl:format cl:nil "float32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetServoAngle-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetServoAngle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetServoAngle-request
    (cl:cons ':angle (angle msg))
))
;//! \htmlinclude SetServoAngle-response.msg.html

(cl:defclass <SetServoAngle-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetServoAngle-response (<SetServoAngle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetServoAngle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetServoAngle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mirte_msgs_2-srv:<SetServoAngle-response> is deprecated: use mirte_msgs_2-srv:SetServoAngle-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <SetServoAngle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mirte_msgs_2-srv:status-val is deprecated.  Use mirte_msgs_2-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetServoAngle-response>) ostream)
  "Serializes a message object of type '<SetServoAngle-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetServoAngle-response>) istream)
  "Deserializes a message object of type '<SetServoAngle-response>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetServoAngle-response>)))
  "Returns string type for a service object of type '<SetServoAngle-response>"
  "mirte_msgs_2/SetServoAngleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetServoAngle-response)))
  "Returns string type for a service object of type 'SetServoAngle-response"
  "mirte_msgs_2/SetServoAngleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetServoAngle-response>)))
  "Returns md5sum for a message object of type '<SetServoAngle-response>"
  "ac590a8a24d757d23bdd7dab963c6e6f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetServoAngle-response)))
  "Returns md5sum for a message object of type 'SetServoAngle-response"
  "ac590a8a24d757d23bdd7dab963c6e6f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetServoAngle-response>)))
  "Returns full string definition for message of type '<SetServoAngle-response>"
  (cl:format cl:nil "bool status~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetServoAngle-response)))
  "Returns full string definition for message of type 'SetServoAngle-response"
  (cl:format cl:nil "bool status~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetServoAngle-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetServoAngle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetServoAngle-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetServoAngle)))
  'SetServoAngle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetServoAngle)))
  'SetServoAngle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetServoAngle)))
  "Returns string type for a service object of type '<SetServoAngle>"
  "mirte_msgs_2/SetServoAngle")