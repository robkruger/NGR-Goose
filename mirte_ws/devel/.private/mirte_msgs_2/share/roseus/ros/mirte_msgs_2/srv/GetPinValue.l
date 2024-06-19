;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::GetPinValue)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'GetPinValue (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::GETPINVALUE")
  (make-package "MIRTE_MSGS_2::GETPINVALUE"))
(unless (find-package "MIRTE_MSGS_2::GETPINVALUEREQUEST")
  (make-package "MIRTE_MSGS_2::GETPINVALUEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::GETPINVALUERESPONSE")
  (make-package "MIRTE_MSGS_2::GETPINVALUERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::GetPinValueRequest
  :super ros::object
  :slots (_pin _type ))

(defmethod mirte_msgs_2::GetPinValueRequest
  (:init
   (&key
    ((:pin __pin) "")
    ((:type __type) "")
    )
   (send-super :init)
   (setq _pin (string __pin))
   (setq _type (string __type))
   self)
  (:pin
   (&optional __pin)
   (if __pin (setq _pin __pin)) _pin)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; string _pin
    4 (length _pin)
    ;; string _type
    4 (length _type)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _pin
       (write-long (length _pin) s) (princ _pin s)
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _pin
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _pin (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass mirte_msgs_2::GetPinValueResponse
  :super ros::object
  :slots (_data ))

(defmethod mirte_msgs_2::GetPinValueResponse
  (:init
   (&key
    ((:data __data) 0)
    )
   (send-super :init)
   (setq _data (round __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; int32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _data
       (write-long _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _data
     (setq _data (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs_2::GetPinValue
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::GetPinValue :md5sum-) "277ba96458b48c83913177a820e47af8")
(setf (get mirte_msgs_2::GetPinValue :datatype-) "mirte_msgs_2/GetPinValue")
(setf (get mirte_msgs_2::GetPinValue :request) mirte_msgs_2::GetPinValueRequest)
(setf (get mirte_msgs_2::GetPinValue :response) mirte_msgs_2::GetPinValueResponse)

(defmethod mirte_msgs_2::GetPinValueRequest
  (:response () (instance mirte_msgs_2::GetPinValueResponse :init)))

(setf (get mirte_msgs_2::GetPinValueRequest :md5sum-) "277ba96458b48c83913177a820e47af8")
(setf (get mirte_msgs_2::GetPinValueRequest :datatype-) "mirte_msgs_2/GetPinValueRequest")
(setf (get mirte_msgs_2::GetPinValueRequest :definition-)
      "string pin
string type
---
int32 data

")

(setf (get mirte_msgs_2::GetPinValueResponse :md5sum-) "277ba96458b48c83913177a820e47af8")
(setf (get mirte_msgs_2::GetPinValueResponse :datatype-) "mirte_msgs_2/GetPinValueResponse")
(setf (get mirte_msgs_2::GetPinValueResponse :definition-)
      "string pin
string type
---
int32 data

")



(provide :mirte_msgs_2/GetPinValue "277ba96458b48c83913177a820e47af8")


