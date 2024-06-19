;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::GetKeypad)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'GetKeypad (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::GETKEYPAD")
  (make-package "MIRTE_MSGS_2::GETKEYPAD"))
(unless (find-package "MIRTE_MSGS_2::GETKEYPADREQUEST")
  (make-package "MIRTE_MSGS_2::GETKEYPADREQUEST"))
(unless (find-package "MIRTE_MSGS_2::GETKEYPADRESPONSE")
  (make-package "MIRTE_MSGS_2::GETKEYPADRESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::GetKeypadRequest
  :super ros::object
  :slots ())

(defmethod mirte_msgs_2::GetKeypadRequest
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

(defclass mirte_msgs_2::GetKeypadResponse
  :super ros::object
  :slots (_data ))

(defmethod mirte_msgs_2::GetKeypadResponse
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass mirte_msgs_2::GetKeypad
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::GetKeypad :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get mirte_msgs_2::GetKeypad :datatype-) "mirte_msgs_2/GetKeypad")
(setf (get mirte_msgs_2::GetKeypad :request) mirte_msgs_2::GetKeypadRequest)
(setf (get mirte_msgs_2::GetKeypad :response) mirte_msgs_2::GetKeypadResponse)

(defmethod mirte_msgs_2::GetKeypadRequest
  (:response () (instance mirte_msgs_2::GetKeypadResponse :init)))

(setf (get mirte_msgs_2::GetKeypadRequest :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get mirte_msgs_2::GetKeypadRequest :datatype-) "mirte_msgs_2/GetKeypadRequest")
(setf (get mirte_msgs_2::GetKeypadRequest :definition-)
      "---
string data

")

(setf (get mirte_msgs_2::GetKeypadResponse :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get mirte_msgs_2::GetKeypadResponse :datatype-) "mirte_msgs_2/GetKeypadResponse")
(setf (get mirte_msgs_2::GetKeypadResponse :definition-)
      "---
string data

")



(provide :mirte_msgs_2/GetKeypad "992ce8a1687cec8c8bd883ec73ca41d1")


