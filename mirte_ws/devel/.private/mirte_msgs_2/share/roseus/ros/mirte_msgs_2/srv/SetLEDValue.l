;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::SetLEDValue)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'SetLEDValue (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::SETLEDVALUE")
  (make-package "MIRTE_MSGS_2::SETLEDVALUE"))
(unless (find-package "MIRTE_MSGS_2::SETLEDVALUEREQUEST")
  (make-package "MIRTE_MSGS_2::SETLEDVALUEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::SETLEDVALUERESPONSE")
  (make-package "MIRTE_MSGS_2::SETLEDVALUERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::SetLEDValueRequest
  :super ros::object
  :slots (_value ))

(defmethod mirte_msgs_2::SetLEDValueRequest
  (:init
   (&key
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _value (round __value))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs_2::SetLEDValueResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs_2::SetLEDValueResponse
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

(defclass mirte_msgs_2::SetLEDValue
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::SetLEDValue :md5sum-) "42048ea920ba4286ecdfb4bc68063c32")
(setf (get mirte_msgs_2::SetLEDValue :datatype-) "mirte_msgs_2/SetLEDValue")
(setf (get mirte_msgs_2::SetLEDValue :request) mirte_msgs_2::SetLEDValueRequest)
(setf (get mirte_msgs_2::SetLEDValue :response) mirte_msgs_2::SetLEDValueResponse)

(defmethod mirte_msgs_2::SetLEDValueRequest
  (:response () (instance mirte_msgs_2::SetLEDValueResponse :init)))

(setf (get mirte_msgs_2::SetLEDValueRequest :md5sum-) "42048ea920ba4286ecdfb4bc68063c32")
(setf (get mirte_msgs_2::SetLEDValueRequest :datatype-) "mirte_msgs_2/SetLEDValueRequest")
(setf (get mirte_msgs_2::SetLEDValueRequest :definition-)
      "int32 value
---
bool status


")

(setf (get mirte_msgs_2::SetLEDValueResponse :md5sum-) "42048ea920ba4286ecdfb4bc68063c32")
(setf (get mirte_msgs_2::SetLEDValueResponse :datatype-) "mirte_msgs_2/SetLEDValueResponse")
(setf (get mirte_msgs_2::SetLEDValueResponse :definition-)
      "int32 value
---
bool status


")



(provide :mirte_msgs_2/SetLEDValue "42048ea920ba4286ecdfb4bc68063c32")


