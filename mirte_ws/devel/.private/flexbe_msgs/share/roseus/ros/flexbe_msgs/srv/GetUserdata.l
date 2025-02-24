;; Auto-generated. Do not edit!


(when (boundp 'flexbe_msgs::GetUserdata)
  (if (not (find-package "FLEXBE_MSGS"))
    (make-package "FLEXBE_MSGS"))
  (shadow 'GetUserdata (find-package "FLEXBE_MSGS")))
(unless (find-package "FLEXBE_MSGS::GETUSERDATA")
  (make-package "FLEXBE_MSGS::GETUSERDATA"))
(unless (find-package "FLEXBE_MSGS::GETUSERDATAREQUEST")
  (make-package "FLEXBE_MSGS::GETUSERDATAREQUEST"))
(unless (find-package "FLEXBE_MSGS::GETUSERDATARESPONSE")
  (make-package "FLEXBE_MSGS::GETUSERDATARESPONSE"))

(in-package "ROS")





(defclass flexbe_msgs::GetUserdataRequest
  :super ros::object
  :slots (_userdata_key ))

(defmethod flexbe_msgs::GetUserdataRequest
  (:init
   (&key
    ((:userdata_key __userdata_key) "")
    )
   (send-super :init)
   (setq _userdata_key (string __userdata_key))
   self)
  (:userdata_key
   (&optional __userdata_key)
   (if __userdata_key (setq _userdata_key __userdata_key)) _userdata_key)
  (:serialization-length
   ()
   (+
    ;; string _userdata_key
    4 (length _userdata_key)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _userdata_key
       (write-long (length _userdata_key) s) (princ _userdata_key s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _userdata_key
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _userdata_key (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass flexbe_msgs::GetUserdataResponse
  :super ros::object
  :slots (_success _message _userdata ))

(defmethod flexbe_msgs::GetUserdataResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    ((:userdata __userdata) ())
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   (setq _userdata __userdata)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:userdata
   (&rest __userdata)
   (if (keywordp (car __userdata))
       (send* _userdata __userdata)
     (progn
       (if __userdata (setq _userdata (car __userdata)))
       _userdata)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ;; flexbe_msgs/UserdataInfo[] _userdata
    (apply #'+ (send-all _userdata :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;; flexbe_msgs/UserdataInfo[] _userdata
     (write-long (length _userdata) s)
     (dolist (elem _userdata)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; flexbe_msgs/UserdataInfo[] _userdata
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _userdata (let (r) (dotimes (i n) (push (instance flexbe_msgs::UserdataInfo :init) r)) r))
     (dolist (elem- _userdata)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass flexbe_msgs::GetUserdata
  :super ros::object
  :slots ())

(setf (get flexbe_msgs::GetUserdata :md5sum-) "cf480fa533a0ed079b4f74ca618d3d84")
(setf (get flexbe_msgs::GetUserdata :datatype-) "flexbe_msgs/GetUserdata")
(setf (get flexbe_msgs::GetUserdata :request) flexbe_msgs::GetUserdataRequest)
(setf (get flexbe_msgs::GetUserdata :response) flexbe_msgs::GetUserdataResponse)

(defmethod flexbe_msgs::GetUserdataRequest
  (:response () (instance flexbe_msgs::GetUserdataResponse :init)))

(setf (get flexbe_msgs::GetUserdataRequest :md5sum-) "cf480fa533a0ed079b4f74ca618d3d84")
(setf (get flexbe_msgs::GetUserdataRequest :datatype-) "flexbe_msgs/GetUserdataRequest")
(setf (get flexbe_msgs::GetUserdataRequest :definition-)
      "# specify key to filter userdata, leave empty to get all userdata
string userdata_key
---
bool success
string message
flexbe_msgs/UserdataInfo[] userdata


================================================================================
MSG: flexbe_msgs/UserdataInfo
string state
string key
string type
string data
")

(setf (get flexbe_msgs::GetUserdataResponse :md5sum-) "cf480fa533a0ed079b4f74ca618d3d84")
(setf (get flexbe_msgs::GetUserdataResponse :datatype-) "flexbe_msgs/GetUserdataResponse")
(setf (get flexbe_msgs::GetUserdataResponse :definition-)
      "# specify key to filter userdata, leave empty to get all userdata
string userdata_key
---
bool success
string message
flexbe_msgs/UserdataInfo[] userdata


================================================================================
MSG: flexbe_msgs/UserdataInfo
string state
string key
string type
string data
")



(provide :flexbe_msgs/GetUserdata "cf480fa533a0ed079b4f74ca618d3d84")


