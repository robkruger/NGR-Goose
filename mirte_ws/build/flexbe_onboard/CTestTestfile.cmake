# CMake generated Testfile for 
# Source directory: /home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_onboard
# Build directory: /home/mirte/NGR-Goose/mirte_ws/build/flexbe_onboard
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_flexbe_onboard_rostest_test_flexbe_onboard.test "/home/mirte/NGR-Goose/mirte_ws/build/flexbe_onboard/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/mirte/NGR-Goose/mirte_ws/build/flexbe_onboard/test_results/flexbe_onboard/rostest-test_flexbe_onboard.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_onboard --package=flexbe_onboard --results-filename test_flexbe_onboard.xml --results-base-dir \"/home/mirte/NGR-Goose/mirte_ws/build/flexbe_onboard/test_results\" /home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_onboard/test/flexbe_onboard.test ")
set_tests_properties(_ctest_flexbe_onboard_rostest_test_flexbe_onboard.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_onboard/CMakeLists.txt;32;add_rostest;/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_onboard/CMakeLists.txt;0;")
subdirs("gtest")
