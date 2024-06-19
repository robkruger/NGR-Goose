;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::GetEncoder)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'GetEncoder (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::GETENCODER")
  (make-package "MIRTE_MSGS_2::GETENCODER"))
(unless (find-package "MIRTE_MSGS_2::GETENCODERREQUEST")
  (make-package "MIRTE_MSGS_2::GETENCODERREQUEST"))
(unless (find-package "MIRTE_MSGS_2::GETENCODERRESPONSE")
  (make-package "MIRTE_MSGS_2::GETENCODERRESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::GetEncoderRequest
  :super ros::object
  :slots ())

(defmethod mirte_msgs_2::GetEncoderRequest
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

(defclass mirte_msgs_2::GetEncoderResponse
  :super ros::object
  :slots (_data ))

(defmethod mirte_msgs_2::GetEncoderResponse
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

(defclass mirte_msgs_2::GetEncoder
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::GetEncoder :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get mirte_msgs_2::GetEncoder :datatype-) "mirte_msgs_2/GetEncoder")
(setf (get mirte_msgs_2::GetEncoder :request) mirte_msgs_2::GetEncoderRequest)
(setf (get mirte_msgs_2::GetEncoder :response) mirte_msgs_2::GetEncoderResponse)

(defmethod mirte_msgs_2::GetEncoderRequest
  (:response () (instance mirte_msgs_2::GetEncoderResponse :init)))

(setf (get mirte_msgs_2::GetEncoderRequest :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get mirte_msgs_2::GetEncoderRequest :datatype-) "mirte_msgs_2/GetEncoderRequest")
(setf (get mirte_msgs_2::GetEncoderRequest :definition-)
      "---
int32 data

")

(setf (get mirte_msgs_2::GetEncoderResponse :md5sum-) "da5909fbe378aeaf85e547e830cc1bb7")
(setf (get mirte_msgs_2::GetEncoderResponse :datatype-) "mirte_msgs_2/GetEncoderResponse")
(setf (get mirte_msgs_2::GetEncoderResponse :definition-)
      "---
int32 data

")



(provide :mirte_msgs_2/GetEncoder "da5909fbe378aeaf85e547e830cc1bb7")


