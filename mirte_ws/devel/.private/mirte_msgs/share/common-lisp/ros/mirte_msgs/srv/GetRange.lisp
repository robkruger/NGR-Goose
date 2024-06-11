; Auto-generated. Do not edit!


(cl:in-package mirte_msgs-srv)


;//! \htmlinclude GetRange-request.msg.html

(cl:defclass <GetRange-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetRange-request (<GetRange-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRange-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRange-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mirte_msgs-srv:<GetRange-request> is deprecated: use mirte_msgs-srv:GetRange-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRange-request>) ostream)
  "Serializes a message object of type '<GetRange-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRange-request>) istream)
  "Deserializes a message object of type '<GetRange-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRange-request>)))
  "Returns string type for a service object of type '<GetRange-request>"
  "mirte_msgs/GetRangeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRange-request)))
  "Returns string type for a service object of type 'GetRange-request"
  "mirte_msgs/GetRangeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRange-request>)))
  "Returns md5sum for a message object of type '<GetRange-request>"
  "b3ee9ed25575b46bb47c7673ad202faa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRange-request)))
  "Returns md5sum for a message object of type 'GetRange-request"
  "b3ee9ed25575b46bb47c7673ad202faa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRange-request>)))
  "Returns full string definition for message of type '<GetRange-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRange-request)))
  "Returns full string definition for message of type 'GetRange-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRange-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRange-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRange-request
))
;//! \htmlinclude GetRange-response.msg.html

(cl:defclass <GetRange-response> (roslisp-msg-protocol:ros-message)
  ((min
    :reader min
    :initarg :min
    :type cl:float
    :initform 0.0)
   (max
    :reader max
    :initarg :max
    :type cl:float
    :initform 0.0))
)

(cl:defclass GetRange-response (<GetRange-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRange-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRange-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mirte_msgs-srv:<GetRange-response> is deprecated: use mirte_msgs-srv:GetRange-response instead.")))

(cl:ensure-generic-function 'min-val :lambda-list '(m))
(cl:defmethod min-val ((m <GetRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mirte_msgs-srv:min-val is deprecated.  Use mirte_msgs-srv:min instead.")
  (min m))

(cl:ensure-generic-function 'max-val :lambda-list '(m))
(cl:defmethod max-val ((m <GetRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mirte_msgs-srv:max-val is deprecated.  Use mirte_msgs-srv:max instead.")
  (max m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRange-response>) ostream)
  "Serializes a message object of type '<GetRange-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRange-response>) istream)
  "Deserializes a message object of type '<GetRange-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRange-response>)))
  "Returns string type for a service object of type '<GetRange-response>"
  "mirte_msgs/GetRangeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRange-response)))
  "Returns string type for a service object of type 'GetRange-response"
  "mirte_msgs/GetRangeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRange-response>)))
  "Returns md5sum for a message object of type '<GetRange-response>"
  "b3ee9ed25575b46bb47c7673ad202faa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRange-response)))
  "Returns md5sum for a message object of type 'GetRange-response"
  "b3ee9ed25575b46bb47c7673ad202faa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRange-response>)))
  "Returns full string definition for message of type '<GetRange-response>"
  (cl:format cl:nil "float32 min~%float32 max~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRange-response)))
  "Returns full string definition for message of type 'GetRange-response"
  (cl:format cl:nil "float32 min~%float32 max~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRange-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRange-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRange-response
    (cl:cons ':min (min msg))
    (cl:cons ':max (max msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetRange)))
  'GetRange-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetRange)))
  'GetRange-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRange)))
  "Returns string type for a service object of type '<GetRange>"
  "mirte_msgs/GetRange")