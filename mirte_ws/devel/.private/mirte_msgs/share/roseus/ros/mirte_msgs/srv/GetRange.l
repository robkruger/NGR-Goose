;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs::GetRange)
  (if (not (find-package "MIRTE_MSGS"))
    (make-package "MIRTE_MSGS"))
  (shadow 'GetRange (find-package "MIRTE_MSGS")))
(unless (find-package "MIRTE_MSGS::GETRANGE")
  (make-package "MIRTE_MSGS::GETRANGE"))
(unless (find-package "MIRTE_MSGS::GETRANGEREQUEST")
  (make-package "MIRTE_MSGS::GETRANGEREQUEST"))
(unless (find-package "MIRTE_MSGS::GETRANGERESPONSE")
  (make-package "MIRTE_MSGS::GETRANGERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs::GetRangeRequest
  :super ros::object
  :slots ())

(defmethod mirte_msgs::GetRangeRequest
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

(defclass mirte_msgs::GetRangeResponse
  :super ros::object
  :slots (_min _max ))

(defmethod mirte_msgs::GetRangeResponse
  (:init
   (&key
    ((:min __min) 0.0)
    ((:max __max) 0.0)
    )
   (send-super :init)
   (setq _min (float __min))
   (setq _max (float __max))
   self)
  (:min
   (&optional __min)
   (if __min (setq _min __min)) _min)
  (:max
   (&optional __max)
   (if __max (setq _max __max)) _max)
  (:serialization-length
   ()
   (+
    ;; float32 _min
    4
    ;; float32 _max
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _min
       (sys::poke _min (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max
       (sys::poke _max (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _min
     (setq _min (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max
     (setq _max (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs::GetRange
  :super ros::object
  :slots ())

(setf (get mirte_msgs::GetRange :md5sum-) "b3ee9ed25575b46bb47c7673ad202faa")
(setf (get mirte_msgs::GetRange :datatype-) "mirte_msgs/GetRange")
(setf (get mirte_msgs::GetRange :request) mirte_msgs::GetRangeRequest)
(setf (get mirte_msgs::GetRange :response) mirte_msgs::GetRangeResponse)

(defmethod mirte_msgs::GetRangeRequest
  (:response () (instance mirte_msgs::GetRangeResponse :init)))

(setf (get mirte_msgs::GetRangeRequest :md5sum-) "b3ee9ed25575b46bb47c7673ad202faa")
(setf (get mirte_msgs::GetRangeRequest :datatype-) "mirte_msgs/GetRangeRequest")
(setf (get mirte_msgs::GetRangeRequest :definition-)
      "---
float32 min
float32 max
")

(setf (get mirte_msgs::GetRangeResponse :md5sum-) "b3ee9ed25575b46bb47c7673ad202faa")
(setf (get mirte_msgs::GetRangeResponse :datatype-) "mirte_msgs/GetRangeResponse")
(setf (get mirte_msgs::GetRangeResponse :definition-)
      "---
float32 min
float32 max
")



(provide :mirte_msgs/GetRange "b3ee9ed25575b46bb47c7673ad202faa")


