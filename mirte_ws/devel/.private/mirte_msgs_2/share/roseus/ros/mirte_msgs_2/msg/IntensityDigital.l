;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::IntensityDigital)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'IntensityDigital (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::INTENSITYDIGITAL")
  (make-package "MIRTE_MSGS_2::INTENSITYDIGITAL"))

(in-package "ROS")
;;//! \htmlinclude IntensityDigital.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mirte_msgs_2::IntensityDigital
  :super ros::object
  :slots (_header _value ))

(defmethod mirte_msgs_2::IntensityDigital
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:value __value) nil)
    )
   (send-super :init)
   (setq _header __header)
   (setq _value __value)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:value
   (&optional (__value :null))
   (if (not (eq __value :null)) (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _value
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _value
       (if _value (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _value
     (setq _value (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get mirte_msgs_2::IntensityDigital :md5sum-) "2a502021a9e661290bab60c5754fb8cd")
(setf (get mirte_msgs_2::IntensityDigital :datatype-) "mirte_msgs_2/IntensityDigital")
(setf (get mirte_msgs_2::IntensityDigital :definition-)
      "Header header
bool value

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

")



(provide :mirte_msgs_2/IntensityDigital "2a502021a9e661290bab60c5754fb8cd")


