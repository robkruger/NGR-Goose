;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::SetServoAngle)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'SetServoAngle (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::SETSERVOANGLE")
  (make-package "MIRTE_MSGS_2::SETSERVOANGLE"))
(unless (find-package "MIRTE_MSGS_2::SETSERVOANGLEREQUEST")
  (make-package "MIRTE_MSGS_2::SETSERVOANGLEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::SETSERVOANGLERESPONSE")
  (make-package "MIRTE_MSGS_2::SETSERVOANGLERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::SetServoAngleRequest
  :super ros::object
  :slots (_angle ))

(defmethod mirte_msgs_2::SetServoAngleRequest
  (:init
   (&key
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs_2::SetServoAngleResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs_2::SetServoAngleResponse
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

(defclass mirte_msgs_2::SetServoAngle
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::SetServoAngle :md5sum-) "ac590a8a24d757d23bdd7dab963c6e6f")
(setf (get mirte_msgs_2::SetServoAngle :datatype-) "mirte_msgs_2/SetServoAngle")
(setf (get mirte_msgs_2::SetServoAngle :request) mirte_msgs_2::SetServoAngleRequest)
(setf (get mirte_msgs_2::SetServoAngle :response) mirte_msgs_2::SetServoAngleResponse)

(defmethod mirte_msgs_2::SetServoAngleRequest
  (:response () (instance mirte_msgs_2::SetServoAngleResponse :init)))

(setf (get mirte_msgs_2::SetServoAngleRequest :md5sum-) "ac590a8a24d757d23bdd7dab963c6e6f")
(setf (get mirte_msgs_2::SetServoAngleRequest :datatype-) "mirte_msgs_2/SetServoAngleRequest")
(setf (get mirte_msgs_2::SetServoAngleRequest :definition-)
      "float32 angle
---
bool status


")

(setf (get mirte_msgs_2::SetServoAngleResponse :md5sum-) "ac590a8a24d757d23bdd7dab963c6e6f")
(setf (get mirte_msgs_2::SetServoAngleResponse :datatype-) "mirte_msgs_2/SetServoAngleResponse")
(setf (get mirte_msgs_2::SetServoAngleResponse :definition-)
      "float32 angle
---
bool status


")



(provide :mirte_msgs_2/SetServoAngle "ac590a8a24d757d23bdd7dab963c6e6f")


