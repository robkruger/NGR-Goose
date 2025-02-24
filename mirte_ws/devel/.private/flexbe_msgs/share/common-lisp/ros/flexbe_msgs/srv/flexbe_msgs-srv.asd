
(cl:in-package :asdf)

(defsystem "flexbe_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :flexbe_msgs-msg
)
  :components ((:file "_package")
    (:file "GetUserdata" :depends-on ("_package_GetUserdata"))
    (:file "_package_GetUserdata" :depends-on ("_package"))
  ))