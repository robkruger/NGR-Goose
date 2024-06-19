;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::ServoPosition)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'ServoPosition (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::SERVOPOSITION")
  (make-package "MIRTE_MSGS_2::SERVOPOSITION"))

(in-package "ROS")
;;//! \htmlinclude ServoPosition.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mirte_msgs_2::ServoPosition
  :super ros::object
  :slots (_header _angle _raw ))

(defmethod mirte_msgs_2::ServoPosition
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:angle __angle) 0.0)
    ((:raw __raw) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _angle (float __angle))
   (setq _raw (round __raw))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:raw
   (&optional __raw)
   (if __raw (setq _raw __raw)) _raw)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _angle
    4
    ;; int32 _raw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _raw
       (write-long _raw s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _raw
     (setq _raw (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mirte_msgs_2::ServoPosition :md5sum-) "02c45719e1552fa22bb3a7a6316fe73b")
(setf (get mirte_msgs_2::ServoPosition :datatype-) "mirte_msgs_2/ServoPosition")
(setf (get mirte_msgs_2::ServoPosition :definition-)
      "Header header
float32 angle
int32 raw

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



(provide :mirte_msgs_2/ServoPosition "02c45719e1552fa22bb3a7a6316fe73b")


