;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::Keypad)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'Keypad (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::KEYPAD")
  (make-package "MIRTE_MSGS_2::KEYPAD"))

(in-package "ROS")
;;//! \htmlinclude Keypad.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass mirte_msgs_2::Keypad
  :super ros::object
  :slots (_header _key ))

(defmethod mirte_msgs_2::Keypad
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:key __key) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _key (string __key))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:key
   (&optional __key)
   (if __key (setq _key __key)) _key)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _key
    4 (length _key)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _key
       (write-long (length _key) s) (princ _key s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _key
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _key (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mirte_msgs_2::Keypad :md5sum-) "3af5b3f309206fb790d169ed56f35fad")
(setf (get mirte_msgs_2::Keypad :datatype-) "mirte_msgs_2/Keypad")
(setf (get mirte_msgs_2::Keypad :definition-)
      "Header header
string key

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



(provide :mirte_msgs_2/Keypad "3af5b3f309206fb790d169ed56f35fad")


