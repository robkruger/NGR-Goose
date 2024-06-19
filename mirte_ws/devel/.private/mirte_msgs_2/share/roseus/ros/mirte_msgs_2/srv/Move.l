;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::Move)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'Move (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::MOVE")
  (make-package "MIRTE_MSGS_2::MOVE"))
(unless (find-package "MIRTE_MSGS_2::MOVEREQUEST")
  (make-package "MIRTE_MSGS_2::MOVEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::MOVERESPONSE")
  (make-package "MIRTE_MSGS_2::MOVERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::MoveRequest
  :super ros::object
  :slots (_distance _speed ))

(defmethod mirte_msgs_2::MoveRequest
  (:init
   (&key
    ((:distance __distance) 0.0)
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   (setq _speed (float __speed))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; float32 _distance
    4
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _distance
     (setq _distance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass mirte_msgs_2::MoveResponse
  :super ros::object
  :slots (_finished ))

(defmethod mirte_msgs_2::MoveResponse
  (:init
   (&key
    ((:finished __finished) nil)
    )
   (send-super :init)
   (setq _finished __finished)
   self)
  (:finished
   (&optional (__finished :null))
   (if (not (eq __finished :null)) (setq _finished __finished)) _finished)
  (:serialization-length
   ()
   (+
    ;; bool _finished
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _finished
       (if _finished (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _finished
     (setq _finished (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mirte_msgs_2::Move
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::Move :md5sum-) "6b4f1d96a2bee68005f89c9b5b4fba0d")
(setf (get mirte_msgs_2::Move :datatype-) "mirte_msgs_2/Move")
(setf (get mirte_msgs_2::Move :request) mirte_msgs_2::MoveRequest)
(setf (get mirte_msgs_2::Move :response) mirte_msgs_2::MoveResponse)

(defmethod mirte_msgs_2::MoveRequest
  (:response () (instance mirte_msgs_2::MoveResponse :init)))

(setf (get mirte_msgs_2::MoveRequest :md5sum-) "6b4f1d96a2bee68005f89c9b5b4fba0d")
(setf (get mirte_msgs_2::MoveRequest :datatype-) "mirte_msgs_2/MoveRequest")
(setf (get mirte_msgs_2::MoveRequest :definition-)
      "float32 distance    # m
float32 speed       # m/s
---
bool finished

")

(setf (get mirte_msgs_2::MoveResponse :md5sum-) "6b4f1d96a2bee68005f89c9b5b4fba0d")
(setf (get mirte_msgs_2::MoveResponse :datatype-) "mirte_msgs_2/MoveResponse")
(setf (get mirte_msgs_2::MoveResponse :definition-)
      "float32 distance    # m
float32 speed       # m/s
---
bool finished

")



(provide :mirte_msgs_2/Move "6b4f1d96a2bee68005f89c9b5b4fba0d")


