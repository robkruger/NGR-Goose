;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::GetIntensity)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'GetIntensity (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::GETINTENSITY")
  (make-package "MIRTE_MSGS_2::GETINTENSITY"))
(unless (find-package "MIRTE_MSGS_2::GETINTENSITYREQUEST")
  (make-package "MIRTE_MSGS_2::GETINTENSITYREQUEST"))
(unless (find-package "MIRTE_MSGS_2::GETINTENSITYRESPONSE")
  (make-package "MIRTE_MSGS_2::GETINTENSITYRESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::GetIntensityRequest
  :super ros::object
  :slots ())

(defmethod mirte_msgs_2::GetIntensityRequest
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

(defclass mirte_msgs_2::GetIntensityResponse
  :super ros::object
  :slots (_data ))

(defmethod mirte_msgs_2::GetIntensityResponse
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

(defclass mirte_msgs_2::GetIntensity
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::GetIntensity :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get mirte_msgs_2::GetIntensity :datatype-) "mirte_msgs_2/GetIntensity")
(setf (get mirte_msgs_2::GetIntensity :request) mirte_msgs_2::GetIntensityRequest)
(setf (get mirte_msgs_2::GetIntensity :response) mirte_msgs_2::GetIntensityResponse)

(defmethod mirte_msgs_2::GetIntensityRequest
  (:response () (instance mirte_msgs_2::GetIntensityResponse :init)))

(setf (get mirte_msgs_2::GetIntensityRequest :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get mirte_msgs_2::GetIntensityRequest :datatype-) "mirte_msgs_2/GetIntensityRequest")
(setf (get mirte_msgs_2::GetIntensityRequest :definition-)
      "---
int32 data

")

(setf (get mirte_msgs_2::GetIntensityResponse :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get mirte_msgs_2::GetIntensityResponse :datatype-) "mirte_msgs_2/GetIntensityResponse")
(setf (get mirte_msgs_2::GetIntensityResponse :definition-)
      "---
int32 data

")



(provide :mirte_msgs_2/GetIntensity "da5909fbe378aeaf85e547e830cc1bb7")


