;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::SetPinValue)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'SetPinValue (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::SETPINVALUE")
  (make-package "MIRTE_MSGS_2::SETPINVALUE"))
(unless (find-package "MIRTE_MSGS_2::SETPINVALUEREQUEST")
  (make-package "MIRTE_MSGS_2::SETPINVALUEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::SETPINVALUERESPONSE")
  (make-package "MIRTE_MSGS_2::SETPINVALUERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::SetPinValueRequest
  :super ros::object
  :slots (_pin _type _value ))

(defmethod mirte_msgs_2::SetPinValueRequest
  (:init
   (&key
    ((:pin __pin) "")
    ((:type __type) "")
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _pin (string __pin))
   (setq _type (string __type))
   (setq _value (round __value))
   self)
  (:pin
   (&optional __pin)
   (if __pin (setq _pin __pin)) _pin)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _pin
    4 (length _pin)
    ;; string _type
    4 (length _type)
    ;; int32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _pin
       (write-long (length _pin) s) (princ _pin s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; int32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _pin
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _pin (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs_2::SetPinValueResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs_2::SetPinValueResponse
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

(defclass mirte_msgs_2::SetPinValue
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::SetPinValue :md5sum-) "ca22cfaaa89cb1d56388f4014610ebb5")
(setf (get mirte_msgs_2::SetPinValue :datatype-) "mirte_msgs_2/SetPinValue")
(setf (get mirte_msgs_2::SetPinValue :request) mirte_msgs_2::SetPinValueRequest)
(setf (get mirte_msgs_2::SetPinValue :response) mirte_msgs_2::SetPinValueResponse)

(defmethod mirte_msgs_2::SetPinValueRequest
  (:response () (instance mirte_msgs_2::SetPinValueResponse :init)))

(setf (get mirte_msgs_2::SetPinValueRequest :md5sum-) "ca22cfaaa89cb1d56388f4014610ebb5")
(setf (get mirte_msgs_2::SetPinValueRequest :datatype-) "mirte_msgs_2/SetPinValueRequest")
(setf (get mirte_msgs_2::SetPinValueRequest :definition-)
      "string pin
string type
int32 value
---
bool status


")

(setf (get mirte_msgs_2::SetPinValueResponse :md5sum-) "ca22cfaaa89cb1d56388f4014610ebb5")
(setf (get mirte_msgs_2::SetPinValueResponse :datatype-) "mirte_msgs_2/SetPinValueResponse")
(setf (get mirte_msgs_2::SetPinValueResponse :definition-)
      "string pin
string type
int32 value
---
bool status


")



(provide :mirte_msgs_2/SetPinValue "ca22cfaaa89cb1d56388f4014610ebb5")


