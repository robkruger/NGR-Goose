;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::SetMotorSpeed)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'SetMotorSpeed (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::SETMOTORSPEED")
  (make-package "MIRTE_MSGS_2::SETMOTORSPEED"))
(unless (find-package "MIRTE_MSGS_2::SETMOTORSPEEDREQUEST")
  (make-package "MIRTE_MSGS_2::SETMOTORSPEEDREQUEST"))
(unless (find-package "MIRTE_MSGS_2::SETMOTORSPEEDRESPONSE")
  (make-package "MIRTE_MSGS_2::SETMOTORSPEEDRESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::SetMotorSpeedRequest
  :super ros::object
  :slots (_speed ))

(defmethod mirte_msgs_2::SetMotorSpeedRequest
  (:init
   (&key
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; int32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _speed
       (write-long _speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _speed
     (setq _speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs_2::SetMotorSpeedResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs_2::SetMotorSpeedResponse
  (:init
   (&key
    ((:status __status) nil)
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&optional (__status :null))
   (if (not (eq __status :null)) (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mirte_msgs_2::SetMotorSpeed
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::SetMotorSpeed :md5sum-) "ec6a2ec4df43df120c9889aac5800d51")
(setf (get mirte_msgs_2::SetMotorSpeed :datatype-) "mirte_msgs_2/SetMotorSpeed")
(setf (get mirte_msgs_2::SetMotorSpeed :request) mirte_msgs_2::SetMotorSpeedRequest)
(setf (get mirte_msgs_2::SetMotorSpeed :response) mirte_msgs_2::SetMotorSpeedResponse)

(defmethod mirte_msgs_2::SetMotorSpeedRequest
  (:response () (instance mirte_msgs_2::SetMotorSpeedResponse :init)))

(setf (get mirte_msgs_2::SetMotorSpeedRequest :md5sum-) "ec6a2ec4df43df120c9889aac5800d51")
(setf (get mirte_msgs_2::SetMotorSpeedRequest :datatype-) "mirte_msgs_2/SetMotorSpeedRequest")
(setf (get mirte_msgs_2::SetMotorSpeedRequest :definition-)
      "int32 speed
---
bool status

")

(setf (get mirte_msgs_2::SetMotorSpeedResponse :md5sum-) "ec6a2ec4df43df120c9889aac5800d51")
(setf (get mirte_msgs_2::SetMotorSpeedResponse :datatype-) "mirte_msgs_2/SetMotorSpeedResponse")
(setf (get mirte_msgs_2::SetMotorSpeedResponse :definition-)
      "int32 speed
---
bool status

")



(provide :mirte_msgs_2/SetMotorSpeed "ec6a2ec4df43df120c9889aac5800d51")


