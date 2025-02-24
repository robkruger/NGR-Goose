;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs::SetSingleLEDValue)
  (if (not (find-package "MIRTE_MSGS"))
    (make-package "MIRTE_MSGS"))
  (shadow 'SetSingleLEDValue (find-package "MIRTE_MSGS")))
(unless (find-package "MIRTE_MSGS::SETSINGLELEDVALUE")
  (make-package "MIRTE_MSGS::SETSINGLELEDVALUE"))
(unless (find-package "MIRTE_MSGS::SETSINGLELEDVALUEREQUEST")
  (make-package "MIRTE_MSGS::SETSINGLELEDVALUEREQUEST"))
(unless (find-package "MIRTE_MSGS::SETSINGLELEDVALUERESPONSE")
  (make-package "MIRTE_MSGS::SETSINGLELEDVALUERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs::SetSingleLEDValueRequest
  :super ros::object
  :slots (_value _pixel ))

(defmethod mirte_msgs::SetSingleLEDValueRequest
  (:init
   (&key
    ((:value __value) 0)
    ((:pixel __pixel) 0)
    )
   (send-super :init)
   (setq _value (round __value))
   (setq _pixel (round __pixel))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:pixel
   (&optional __pixel)
   (if __pixel (setq _pixel __pixel)) _pixel)
  (:serialization-length
   ()
   (+
    ;; int32 _value
    4
    ;; int32 _pixel
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _value
       (write-long _value s)
     ;; int32 _pixel
       (write-long _pixel s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _pixel
     (setq _pixel (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs::SetSingleLEDValueResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs::SetSingleLEDValueResponse
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

(defclass mirte_msgs::SetSingleLEDValue
  :super ros::object
  :slots ())

(setf (get mirte_msgs::SetSingleLEDValue :md5sum-) "4d6f4830182c46665b9a704973ece68d")
(setf (get mirte_msgs::SetSingleLEDValue :datatype-) "mirte_msgs/SetSingleLEDValue")
(setf (get mirte_msgs::SetSingleLEDValue :request) mirte_msgs::SetSingleLEDValueRequest)
(setf (get mirte_msgs::SetSingleLEDValue :response) mirte_msgs::SetSingleLEDValueResponse)

(defmethod mirte_msgs::SetSingleLEDValueRequest
  (:response () (instance mirte_msgs::SetSingleLEDValueResponse :init)))

(setf (get mirte_msgs::SetSingleLEDValueRequest :md5sum-) "4d6f4830182c46665b9a704973ece68d")
(setf (get mirte_msgs::SetSingleLEDValueRequest :datatype-) "mirte_msgs/SetSingleLEDValueRequest")
(setf (get mirte_msgs::SetSingleLEDValueRequest :definition-)
      "int32 value
int32 pixel
---
bool status


")

(setf (get mirte_msgs::SetSingleLEDValueResponse :md5sum-) "4d6f4830182c46665b9a704973ece68d")
(setf (get mirte_msgs::SetSingleLEDValueResponse :datatype-) "mirte_msgs/SetSingleLEDValueResponse")
(setf (get mirte_msgs::SetSingleLEDValueResponse :definition-)
      "int32 value
int32 pixel
---
bool status


")



(provide :mirte_msgs/SetSingleLEDValue "4d6f4830182c46665b9a704973ece68d")


