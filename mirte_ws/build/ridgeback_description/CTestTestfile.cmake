# CMake generated Testfile for 
# Source directory: /home/rob/mirte_ws/src/mirte-ros-packages/ridgeback/ridgeback_description
# Build directory: /home/rob/mirte_ws/build/ridgeback_description
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_ridgeback_description_roslaunch-check_launch_description.launch "/home/rob/mirte_ws/build/ridgeback_description/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/rob/mirte_ws/build/ridgeback_description/test_results/ridgeback_description/roslaunch-check_launch_description.launch.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/rob/mirte_ws/build/ridgeback_description/test_results/ridgeback_description" "/opt/ros/noetic/share/roslaunch/cmake/../scripts/roslaunch-check -o \"/home/rob/mirte_ws/build/ridgeback_description/test_results/ridgeback_description/roslaunch-check_launch_description.launch.xml\" \"/home/rob/mirte_ws/src/mirte-ros-packages/ridgeback/ridgeback_description/launch/description.launch\" ")
set_tests_properties(_ctest_ridgeback_description_roslaunch-check_launch_description.launch PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/roslaunch/cmake/roslaunch-extras.cmake;66;catkin_run_tests_target;/home/rob/mirte_ws/src/mirte-ros-packages/ridgeback/ridgeback_description/CMakeLists.txt;18;roslaunch_add_file_check;/home/rob/mirte_ws/src/mirte-ros-packages/ridgeback/ridgeback_description/CMakeLists.txt;0;")
subdirs("gtest")
