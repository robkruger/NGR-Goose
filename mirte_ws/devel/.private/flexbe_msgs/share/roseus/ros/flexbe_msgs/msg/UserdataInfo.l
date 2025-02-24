;; Auto-generated. Do not edit!


(when (boundp 'flexbe_msgs::UserdataInfo)
  (if (not (find-package "FLEXBE_MSGS"))
    (make-package "FLEXBE_MSGS"))
  (shadow 'UserdataInfo (find-package "FLEXBE_MSGS")))
(unless (find-package "FLEXBE_MSGS::USERDATAINFO")
  (make-package "FLEXBE_MSGS::USERDATAINFO"))

(in-package "ROS")
;;//! \htmlinclude UserdataInfo.msg.html


(defclass flexbe_msgs::UserdataInfo
  :super ros::object
  :slots (_state _key _type _data ))

(defmethod flexbe_msgs::UserdataInfo
  (:init
   (&key
    ((:state __state) "")
    ((:key __key) "")
    ((:type __type) "")
    ((:data __data) "")
    )
   (send-super :init)
   (setq _state (string __state))
   (setq _key (string __key))
   (setq _type (string __type))
   (setq _data (string __data))
   self)
  (:state
   (&optional __state)
   (if __state (setq _state __state)) _state)
  (:key
   (&optional __key)
   (if __key (setq _key __key)) _key)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _state
    4 (length _state)
    ;; string _key
    4 (length _key)
    ;; string _type
    4 (length _type)
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _state
       (write-long (length _state) s) (princ _state s)
     ;; string _key
       (write-long (length _key) s) (princ _key s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _state
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _state (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _key
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _key (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get flexbe_msgs::UserdataInfo :md5sum-) "1772a03af66e5ec2ab7e8c44750f6721")
(setf (get flexbe_msgs::UserdataInfo :datatype-) "flexbe_msgs/UserdataInfo")
(setf (get flexbe_msgs::UserdataInfo :definition-)
      "string state
string key
string type
string data

")



(provide :flexbe_msgs/UserdataInfo "1772a03af66e5ec2ab7e8c44750f6721")


