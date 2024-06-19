;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::SetOLEDImage)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'SetOLEDImage (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::SETOLEDIMAGE")
  (make-package "MIRTE_MSGS_2::SETOLEDIMAGE"))
(unless (find-package "MIRTE_MSGS_2::SETOLEDIMAGEREQUEST")
  (make-package "MIRTE_MSGS_2::SETOLEDIMAGEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::SETOLEDIMAGERESPONSE")
  (make-package "MIRTE_MSGS_2::SETOLEDIMAGERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::SetOLEDImageRequest
  :super ros::object
  :slots (_type _value ))

(defmethod mirte_msgs_2::SetOLEDImageRequest
  (:init
   (&key
    ((:type __type) "")
    ((:value __value) "")
    )
   (send-super :init)
   (setq _type (string __type))
   (setq _value (string __value))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; string _type
    4 (length _type)
    ;; string _value
    4 (length _value)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _type
       (write-long (length _type) s) (princ _type s)
     ;; string _value
       (write-long (length _value) s) (princ _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _value
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _value (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass mirte_msgs_2::SetOLEDImageResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs_2::SetOLEDImageResponse
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

(defclass mirte_msgs_2::SetOLEDImage
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::SetOLEDImage :md5sum-) "52215026eb827c220b801bf2b2c8f4d1")
(setf (get mirte_msgs_2::SetOLEDImage :datatype-) "mirte_msgs_2/SetOLEDImage")
(setf (get mirte_msgs_2::SetOLEDImage :request) mirte_msgs_2::SetOLEDImageRequest)
(setf (get mirte_msgs_2::SetOLEDImage :response) mirte_msgs_2::SetOLEDImageResponse)

(defmethod mirte_msgs_2::SetOLEDImageRequest
  (:response () (instance mirte_msgs_2::SetOLEDImageResponse :init)))

(setf (get mirte_msgs_2::SetOLEDImageRequest :md5sum-) "52215026eb827c220b801bf2b2c8f4d1")
(setf (get mirte_msgs_2::SetOLEDImageRequest :datatype-) "mirte_msgs_2/SetOLEDImageRequest")
(setf (get mirte_msgs_2::SetOLEDImageRequest :definition-)
      "string type
string value
---
bool status


")

(setf (get mirte_msgs_2::SetOLEDImageResponse :md5sum-) "52215026eb827c220b801bf2b2c8f4d1")
(setf (get mirte_msgs_2::SetOLEDImageResponse :datatype-) "mirte_msgs_2/SetOLEDImageResponse")
(setf (get mirte_msgs_2::SetOLEDImageResponse :definition-)
      "string type
string value
---
bool status


")



(provide :mirte_msgs_2/SetOLEDImage "52215026eb827c220b801bf2b2c8f4d1")


