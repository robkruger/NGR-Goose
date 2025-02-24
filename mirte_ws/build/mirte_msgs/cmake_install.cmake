# Install script for directory: /home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/mirte/NGR-Goose/mirte_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mirte/NGR-Goose/mirte_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/mirte/NGR-Goose/mirte_ws/install" TYPE PROGRAM FILES "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/_setup_util.py")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mirte/NGR-Goose/mirte_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/mirte/NGR-Goose/mirte_ws/install" TYPE PROGRAM FILES "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/env.sh")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mirte/NGR-Goose/mirte_ws/install/setup.bash;/home/mirte/NGR-Goose/mirte_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/mirte/NGR-Goose/mirte_ws/install" TYPE FILE FILES
    "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/setup.bash"
    "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/local_setup.bash"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mirte/NGR-Goose/mirte_ws/install/setup.sh;/home/mirte/NGR-Goose/mirte_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/mirte/NGR-Goose/mirte_ws/install" TYPE FILE FILES
    "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/setup.sh"
    "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/local_setup.sh"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mirte/NGR-Goose/mirte_ws/install/setup.zsh;/home/mirte/NGR-Goose/mirte_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/mirte/NGR-Goose/mirte_ws/install" TYPE FILE FILES
    "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/setup.zsh"
    "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/mirte/NGR-Goose/mirte_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/mirte/NGR-Goose/mirte_ws/install" TYPE FILE FILES "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/.rosinstall")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mirte_msgs/msg" TYPE FILE FILES
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/msg/Encoder.msg"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/msg/color.msg"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/msg/Intensity.msg"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/msg/IntensityDigital.msg"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/msg/Keypad.msg"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/msg/ServoPosition.msg"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/msg/Heading.msg"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mirte_msgs/srv" TYPE FILE FILES
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/GetDistance.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/GetIntensity.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/GetIntensityDigital.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/GetEncoder.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/GetKeypad.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/SetPinMode.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/GetPinValue.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/SetPinValue.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/SetLEDValue.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/SetSingleLEDValue.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/SetOLEDImage.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/SetServoAngle.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/get_virtual_color.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/get_barcode.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/SetMotorSpeed.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/Move.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/Turn.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/GetIMU.srv"
    "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/srv/GetRange.srv"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mirte_msgs/cmake" TYPE FILE FILES "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/mirte_msgs-msg-paths.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/mirte/NGR-Goose/mirte_ws/devel/.private/mirte_msgs/include/mirte_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/mirte/NGR-Goose/mirte_ws/devel/.private/mirte_msgs/share/roseus/ros/mirte_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/mirte/NGR-Goose/mirte_ws/devel/.private/mirte_msgs/share/common-lisp/ros/mirte_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/mirte/NGR-Goose/mirte_ws/devel/.private/mirte_msgs/share/gennodejs/ros/mirte_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/mirte/NGR-Goose/mirte_ws/devel/.private/mirte_msgs/lib/python3/dist-packages/mirte_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/mirte/NGR-Goose/mirte_ws/devel/.private/mirte_msgs/lib/python3/dist-packages/mirte_msgs")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/mirte_msgs.pc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mirte_msgs/cmake" TYPE FILE FILES "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/mirte_msgs-msg-extras.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mirte_msgs/cmake" TYPE FILE FILES
    "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/mirte_msgsConfig.cmake"
    "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/catkin_generated/installspace/mirte_msgsConfig-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/mirte_msgs" TYPE FILE FILES "/home/mirte/NGR-Goose/mirte_ws/src/mirte-ros-packages/mirte_msgs/package.xml")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/gtest/cmake_install.cmake")

endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
if(CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_COMPONENT MATCHES "^[a-zA-Z0-9_.+-]+$")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
  else()
    string(MD5 CMAKE_INST_COMP_HASH "${CMAKE_INSTALL_COMPONENT}")
    set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INST_COMP_HASH}.txt")
    unset(CMAKE_INST_COMP_HASH)
  endif()
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/mirte/NGR-Goose/mirte_ws/build/mirte_msgs/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
