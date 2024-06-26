;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::SetPinMode)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'SetPinMode (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::SETPINMODE")
  (make-package "MIRTE_MSGS_2::SETPINMODE"))
(unless (find-package "MIRTE_MSGS_2::SETPINMODEREQUEST")
  (make-package "MIRTE_MSGS_2::SETPINMODEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::SETPINMODERESPONSE")
  (make-package "MIRTE_MSGS_2::SETPINMODERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::SetPinModeRequest
  :super ros::object
  :slots (_pin _mode _type ))

(defmethod mirte_msgs_2::SetPinModeRequest
  (:init
   (&key
    ((:pin __pin) 0)
    ((:mode __mode) 0)
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _pin (round __pin))
   (setq _mode (round __mode))
   (setq _type (round __type))
   self)
  (:pin
   (&optional __pin)
   (if __pin (setq _pin __pin)) _pin)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; int32 _pin
    4
    ;; int32 _mode
    4
    ;; int32 _type
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _pin
       (write-long _pin s)
     ;; int32 _mode
       (write-long _mode s)
     ;; int32 _type
       (write-long _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _pin
     (setq _pin (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _mode
     (setq _mode (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _type
     (setq _type (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs_2::SetPinModeResponse
  :super ros::object
  :slots (_status ))

(defmethod mirte_msgs_2::SetPinModeResponse
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

(defclass mirte_msgs_2::SetPinMode
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::SetPinMode :md5sum-) "f8d9d67f15a539c1c17373473c0a782d")
(setf (get mirte_msgs_2::SetPinMode :datatype-) "mirte_msgs_2/SetPinMode")
(setf (get mirte_msgs_2::SetPinMode :request) mirte_msgs_2::SetPinModeRequest)
(setf (get mirte_msgs_2::SetPinMode :response) mirte_msgs_2::SetPinModeResponse)

(defmethod mirte_msgs_2::SetPinModeRequest
  (:response () (instance mirte_msgs_2::SetPinModeResponse :init)))

(setf (get mirte_msgs_2::SetPinModeRequest :md5sum-) "f8d9d67f15a539c1c17373473c0a782d")
(setf (get mirte_msgs_2::SetPinModeRequest :datatype-) "mirte_msgs_2/SetPinModeRequest")
(setf (get mirte_msgs_2::SetPinModeRequest :definition-)
      "int32 pin
int32 mode
int32 type
---
bool status

")

(setf (get mirte_msgs_2::SetPinModeResponse :md5sum-) "f8d9d67f15a539c1c17373473c0a782d")
(setf (get mirte_msgs_2::SetPinModeResponse :datatype-) "mirte_msgs_2/SetPinModeResponse")
(setf (get mirte_msgs_2::SetPinModeResponse :definition-)
      "int32 pin
int32 mode
int32 type
---
bool status

")



(provide :mirte_msgs_2/SetPinMode "f8d9d67f15a539c1c17373473c0a782d")


