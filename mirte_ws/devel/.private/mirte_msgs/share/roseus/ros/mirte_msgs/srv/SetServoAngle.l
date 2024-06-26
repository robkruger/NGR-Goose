;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs::SetServoAngle)
  (if (not (find-package "MIRTE_MSGS"))
    (make-package "MIRTE_MSGS"))
  (shadow 'SetServoAngle (find-package "MIRTE_MSGS")))
(unless (find-package "MIRTE_MSGS::SETSERVOANGLE")
  (make-package "MIRTE_MSGS::SETSERVOANGLE"))
(unless (find-package "MIRTE_MSGS::SETSERVOANGLEREQUEST")
  (make-package "MIRTE_MSGS::SETSERVOANGLEREQUEST"))
(unless (find-package "MIRTE_MSGS::SETSERVOANGLERESPONSE")
  (make-package "MIRTE_MSGS::SETSERVOANGLERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs::SetServoAngleRequest
  :super ros::object
  :slots (_angle ))

(defmethod mirte_msgs::SetServoAngleRequest
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

(defclass mirte_msgs::SetServoAngleResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs::SetServoAngleResponse
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

(defclass mirte_msgs::SetServoAngle
  :super ros::object
  :slots ())

(setf (get mirte_msgs::SetServoAngle :md5sum-) "ac590a8a24d757d23bdd7dab963c6e6f")
(setf (get mirte_msgs::SetServoAngle :datatype-) "mirte_msgs/SetServoAngle")
(setf (get mirte_msgs::SetServoAngle :request) mirte_msgs::SetServoAngleRequest)
(setf (get mirte_msgs::SetServoAngle :response) mirte_msgs::SetServoAngleResponse)

(defmethod mirte_msgs::SetServoAngleRequest
  (:response () (instance mirte_msgs::SetServoAngleResponse :init)))

(setf (get mirte_msgs::SetServoAngleRequest :md5sum-) "ac590a8a24d757d23bdd7dab963c6e6f")
(setf (get mirte_msgs::SetServoAngleRequest :datatype-) "mirte_msgs/SetServoAngleRequest")
(setf (get mirte_msgs::SetServoAngleRequest :definition-)
      "float32 angle
---
bool status


")

(setf (get mirte_msgs::SetServoAngleResponse :md5sum-) "ac590a8a24d757d23bdd7dab963c6e6f")
(setf (get mirte_msgs::SetServoAngleResponse :datatype-) "mirte_msgs/SetServoAngleResponse")
(setf (get mirte_msgs::SetServoAngleResponse :definition-)
      "float32 angle
---
bool status


")



(provide :mirte_msgs/SetServoAngle "ac590a8a24d757d23bdd7dab963c6e6f")


