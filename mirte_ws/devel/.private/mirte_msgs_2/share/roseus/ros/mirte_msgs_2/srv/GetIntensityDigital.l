;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::GetIntensityDigital)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'GetIntensityDigital (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::GETINTENSITYDIGITAL")
  (make-package "MIRTE_MSGS_2::GETINTENSITYDIGITAL"))
(unless (find-package "MIRTE_MSGS_2::GETINTENSITYDIGITALREQUEST")
  (make-package "MIRTE_MSGS_2::GETINTENSITYDIGITALREQUEST"))
(unless (find-package "MIRTE_MSGS_2::GETINTENSITYDIGITALRESPONSE")
  (make-package "MIRTE_MSGS_2::GETINTENSITYDIGITALRESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::GetIntensityDigitalRequest
  :super ros::object
  :slots ())

(defmethod mirte_msgs_2::GetIntensityDigitalRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass mirte_msgs_2::GetIntensityDigitalResponse
  :super ros::object
  :slots (_data ))

(defmethod mirte_msgs_2::GetIntensityDigitalResponse
  (:init
   (&key
    ((:data __data) nil)
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional (__data :null))
   (if (not (eq __data :null)) (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; bool _data
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _data
       (if _data (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _data
     (setq _data (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mirte_msgs_2::GetIntensityDigital
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::GetIntensityDigital :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get mirte_msgs_2::GetIntensityDigital :datatype-) "mirte_msgs_2/GetIntensityDigital")
(setf (get mirte_msgs_2::GetIntensityDigital :request) mirte_msgs_2::GetIntensityDigitalRequest)
(setf (get mirte_msgs_2::GetIntensityDigital :response) mirte_msgs_2::GetIntensityDigitalResponse)

(defmethod mirte_msgs_2::GetIntensityDigitalRequest
  (:response () (instance mirte_msgs_2::GetIntensityDigitalResponse :init)))

(setf (get mirte_msgs_2::GetIntensityDigitalRequest :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get mirte_msgs_2::GetIntensityDigitalRequest :datatype-) "mirte_msgs_2/GetIntensityDigitalRequest")
(setf (get mirte_msgs_2::GetIntensityDigitalRequest :definition-)
      "---
bool data

")

(setf (get mirte_msgs_2::GetIntensityDigitalResponse :md5sum-) "8b94c1b53db61fb6aed406028ad6332a")
(setf (get mirte_msgs_2::GetIntensityDigitalResponse :datatype-) "mirte_msgs_2/GetIntensityDigitalResponse")
(setf (get mirte_msgs_2::GetIntensityDigitalResponse :definition-)
      "---
bool data

")



(provide :mirte_msgs_2/GetIntensityDigital "8b94c1b53db61fb6aed406028ad6332a")


