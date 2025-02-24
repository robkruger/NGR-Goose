; Auto-generated. Do not edit!


(cl:in-package flexbe_msgs-srv)


;//! \htmlinclude GetUserdata-request.msg.html

(cl:defclass <GetUserdata-request> (roslisp-msg-protocol:ros-message)
  ((userdata_key
    :reader userdata_key
    :initarg :userdata_key
    :type cl:string
    :initform ""))
)

(cl:defclass GetUserdata-request (<GetUserdata-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetUserdata-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetUserdata-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name flexbe_msgs-srv:<GetUserdata-request> is deprecated: use flexbe_msgs-srv:GetUserdata-request instead.")))

(cl:ensure-generic-function 'userdata_key-val :lambda-list '(m))
(cl:defmethod userdata_key-val ((m <GetUserdata-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader flexbe_msgs-srv:userdata_key-val is deprecated.  Use flexbe_msgs-srv:userdata_key instead.")
  (userdata_key m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetUserdata-request>) ostream)
  "Serializes a message object of type '<GetUserdata-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'userdata_key))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'userdata_key))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetUserdata-request>) istream)
  "Deserializes a message object of type '<GetUserdata-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'userdata_key) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'userdata_key) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetUserdata-request>)))
  "Returns string type for a service object of type '<GetUserdata-request>"
  "flexbe_msgs/GetUserdataRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetUserdata-request)))
  "Returns string type for a service object of type 'GetUserdata-request"
  "flexbe_msgs/GetUserdataRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetUserdata-request>)))
  "Returns md5sum for a message object of type '<GetUserdata-request>"
  "cf480fa533a0ed079b4f74ca618d3d84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetUserdata-request)))
  "Returns md5sum for a message object of type 'GetUserdata-request"
  "cf480fa533a0ed079b4f74ca618d3d84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetUserdata-request>)))
  "Returns full string definition for message of type '<GetUserdata-request>"
  (cl:format cl:nil "# specify key to filter userdata, leave empty to get all userdata~%string userdata_key~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetUserdata-request)))
  "Returns full string definition for message of type 'GetUserdata-request"
  (cl:format cl:nil "# specify key to filter userdata, leave empty to get all userdata~%string userdata_key~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetUserdata-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'userdata_key))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetUserdata-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetUserdata-request
    (cl:cons ':userdata_key (userdata_key msg))
))
;//! \htmlinclude GetUserdata-response.msg.html

(cl:defclass <GetUserdata-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform "")
   (userdata
    :reader userdata
    :initarg :userdata
    :type (cl:vector flexbe_msgs-msg:UserdataInfo)
   :initform (cl:make-array 0 :element-type 'flexbe_msgs-msg:UserdataInfo :initial-element (cl:make-instance 'flexbe_msgs-msg:UserdataInfo))))
)

(cl:defclass GetUserdata-response (<GetUserdata-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetUserdata-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetUserdata-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name flexbe_msgs-srv:<GetUserdata-response> is deprecated: use flexbe_msgs-srv:GetUserdata-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetUserdata-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader flexbe_msgs-srv:success-val is deprecated.  Use flexbe_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <GetUserdata-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader flexbe_msgs-srv:message-val is deprecated.  Use flexbe_msgs-srv:message instead.")
  (message m))

(cl:ensure-generic-function 'userdata-val :lambda-list '(m))
(cl:defmethod userdata-val ((m <GetUserdata-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader flexbe_msgs-srv:userdata-val is deprecated.  Use flexbe_msgs-srv:userdata instead.")
  (userdata m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetUserdata-response>) ostream)
  "Serializes a message object of type '<GetUserdata-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'userdata))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'userdata))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetUserdata-response>) istream)
  "Deserializes a message object of type '<GetUserdata-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'userdata) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'userdata)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'flexbe_msgs-msg:UserdataInfo))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetUserdata-response>)))
  "Returns string type for a service object of type '<GetUserdata-response>"
  "flexbe_msgs/GetUserdataResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetUserdata-response)))
  "Returns string type for a service object of type 'GetUserdata-response"
  "flexbe_msgs/GetUserdataResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetUserdata-response>)))
  "Returns md5sum for a message object of type '<GetUserdata-response>"
  "cf480fa533a0ed079b4f74ca618d3d84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetUserdata-response)))
  "Returns md5sum for a message object of type 'GetUserdata-response"
  "cf480fa533a0ed079b4f74ca618d3d84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetUserdata-response>)))
  "Returns full string definition for message of type '<GetUserdata-response>"
  (cl:format cl:nil "bool success~%string message~%flexbe_msgs/UserdataInfo[] userdata~%~%~%================================================================================~%MSG: flexbe_msgs/UserdataInfo~%string state~%string key~%string type~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetUserdata-response)))
  "Returns full string definition for message of type 'GetUserdata-response"
  (cl:format cl:nil "bool success~%string message~%flexbe_msgs/UserdataInfo[] userdata~%~%~%================================================================================~%MSG: flexbe_msgs/UserdataInfo~%string state~%string key~%string type~%string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetUserdata-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'userdata) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetUserdata-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetUserdata-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
    (cl:cons ':userdata (userdata msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetUserdata)))
  'GetUserdata-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetUserdata)))
  'GetUserdata-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetUserdata)))
  "Returns string type for a service object of type '<GetUserdata>"
  "flexbe_msgs/GetUserdata")