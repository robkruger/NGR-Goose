;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::SetSingleLEDValue)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'SetSingleLEDValue (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::SETSINGLELEDVALUE")
  (make-package "MIRTE_MSGS_2::SETSINGLELEDVALUE"))
(unless (find-package "MIRTE_MSGS_2::SETSINGLELEDVALUEREQUEST")
  (make-package "MIRTE_MSGS_2::SETSINGLELEDVALUEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::SETSINGLELEDVALUERESPONSE")
  (make-package "MIRTE_MSGS_2::SETSINGLELEDVALUERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::SetSingleLEDValueRequest
  :super ros::object
  :slots (_value _pixel ))

(defmethod mirte_msgs_2::SetSingleLEDValueRequest
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

(defclass mirte_msgs_2::SetSingleLEDValueResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs_2::SetSingleLEDValueResponse
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

(defclass mirte_msgs_2::SetSingleLEDValue
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::SetSingleLEDValue :md5sum-) "4d6f4830182c46665b9a704973ece68d")
(setf (get mirte_msgs_2::SetSingleLEDValue :datatype-) "mirte_msgs_2/SetSingleLEDValue")
(setf (get mirte_msgs_2::SetSingleLEDValue :request) mirte_msgs_2::SetSingleLEDValueRequest)
(setf (get mirte_msgs_2::SetSingleLEDValue :response) mirte_msgs_2::SetSingleLEDValueResponse)

(defmethod mirte_msgs_2::SetSingleLEDValueRequest
  (:response () (instance mirte_msgs_2::SetSingleLEDValueResponse :init)))

(setf (get mirte_msgs_2::SetSingleLEDValueRequest :md5sum-) "4d6f4830182c46665b9a704973ece68d")
(setf (get mirte_msgs_2::SetSingleLEDValueRequest :datatype-) "mirte_msgs_2/SetSingleLEDValueRequest")
(setf (get mirte_msgs_2::SetSingleLEDValueRequest :definition-)
      "int32 value
int32 pixel
---
bool status


")

(setf (get mirte_msgs_2::SetSingleLEDValueResponse :md5sum-) "4d6f4830182c46665b9a704973ece68d")
(setf (get mirte_msgs_2::SetSingleLEDValueResponse :datatype-) "mirte_msgs_2/SetSingleLEDValueResponse")
(setf (get mirte_msgs_2::SetSingleLEDValueResponse :definition-)
      "int32 value
int32 pixel
---
bool status


")



(provide :mirte_msgs_2/SetSingleLEDValue "4d6f4830182c46665b9a704973ece68d")


