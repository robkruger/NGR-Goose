;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::GetDistance)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'GetDistance (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::GETDISTANCE")
  (make-package "MIRTE_MSGS_2::GETDISTANCE"))
(unless (find-package "MIRTE_MSGS_2::GETDISTANCEREQUEST")
  (make-package "MIRTE_MSGS_2::GETDISTANCEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::GETDISTANCERESPONSE")
  (make-package "MIRTE_MSGS_2::GETDISTANCERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::GetDistanceRequest
  :super ros::object
  :slots ())

(defmethod mirte_msgs_2::GetDistanceRequest
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

(defclass mirte_msgs_2::GetDistanceResponse
  :super ros::object
  :slots (_data ))

(defmethod mirte_msgs_2::GetDistanceResponse
  (:init
   (&key
    ((:data __data) 0.0)
    )
   (send-super :init)
   (setq _data (float __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; float32 _data
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _data
       (sys::poke _data (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _data
     (setq _data (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs_2::GetDistance
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::GetDistance :md5sum-) "73fcbf46b49191e672908e50842a83d4")
(setf (get mirte_msgs_2::GetDistance :datatype-) "mirte_msgs_2/GetDistance")
(setf (get mirte_msgs_2::GetDistance :request) mirte_msgs_2::GetDistanceRequest)
(setf (get mirte_msgs_2::GetDistance :response) mirte_msgs_2::GetDistanceResponse)

(defmethod mirte_msgs_2::GetDistanceRequest
  (:response () (instance mirte_msgs_2::GetDistanceResponse :init)))

(setf (get mirte_msgs_2::GetDistanceRequest :md5sum-) "73fcbf46b49191e672908e50842a83d4")
(setf (get mirte_msgs_2::GetDistanceRequest :datatype-) "mirte_msgs_2/GetDistanceRequest")
(setf (get mirte_msgs_2::GetDistanceRequest :definition-)
      "---
float32 data

")

(setf (get mirte_msgs_2::GetDistanceResponse :md5sum-) "73fcbf46b49191e672908e50842a83d4")
(setf (get mirte_msgs_2::GetDistanceResponse :datatype-) "mirte_msgs_2/GetDistanceResponse")
(setf (get mirte_msgs_2::GetDistanceResponse :definition-)
      "---
float32 data

")



(provide :mirte_msgs_2/GetDistance "73fcbf46b49191e672908e50842a83d4")


