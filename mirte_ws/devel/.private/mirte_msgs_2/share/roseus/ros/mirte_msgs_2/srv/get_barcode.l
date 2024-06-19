;; Auto-generated. Do not edit!


(when (boundp 'mirte_msgs_2::get_barcode)
  (if (not (find-package "MIRTE_MSGS_2"))
    (make-package "MIRTE_MSGS_2"))
  (shadow 'get_barcode (find-package "MIRTE_MSGS_2")))
(unless (find-package "MIRTE_MSGS_2::GET_BARCODE")
  (make-package "MIRTE_MSGS_2::GET_BARCODE"))
(unless (find-package "MIRTE_MSGS_2::GET_BARCODEREQUEST")
  (make-package "MIRTE_MSGS_2::GET_BARCODEREQUEST"))
(unless (find-package "MIRTE_MSGS_2::GET_BARCODERESPONSE")
  (make-package "MIRTE_MSGS_2::GET_BARCODERESPONSE"))

(in-package "ROS")





(defclass mirte_msgs_2::get_barcodeRequest
  :super ros::object
  :slots ())

(defmethod mirte_msgs_2::get_barcodeRequest
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

(defclass mirte_msgs_2::get_barcodeResponse
  :super ros::object
  :slots (_data ))

(defmethod mirte_msgs_2::get_barcodeResponse
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

(defclass mirte_msgs_2::get_barcode
  :super ros::object
  :slots ())

(setf (get mirte_msgs_2::get_barcode :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get mirte_msgs_2::get_barcode :datatype-) "mirte_msgs_2/get_barcode")
(setf (get mirte_msgs_2::get_barcode :request) mirte_msgs_2::get_barcodeRequest)
(setf (get mirte_msgs_2::get_barcode :response) mirte_msgs_2::get_barcodeResponse)

(defmethod mirte_msgs_2::get_barcodeRequest
  (:response () (instance mirte_msgs_2::get_barcodeResponse :init)))

(setf (get mirte_msgs_2::get_barcodeRequest :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get mirte_msgs_2::get_barcodeRequest :datatype-) "mirte_msgs_2/get_barcodeRequest")
(setf (get mirte_msgs_2::get_barcodeRequest :definition-)
      "---
string data

")

(setf (get mirte_msgs_2::get_barcodeResponse :md5sum-) "992ce8a1687cec8c8bd883ec73ca41d1")
(setf (get mirte_msgs_2::get_barcodeResponse :datatype-) "mirte_msgs_2/get_barcodeResponse")
(setf (get mirte_msgs_2::get_barcodeResponse :definition-)
      "---
string data

")



(provide :mirte_msgs_2/get_barcode "992ce8a1687cec8c8bd883ec73ca41d1")


