# CMake generated Testfile for 
# Source directory: /home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_states
# Build directory: /home/mirte/NGR-Goose/mirte_ws/build/flexbe_states
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_flexbe_states_rostest_tests_run_rostest.test "/home/mirte/NGR-Goose/mirte_ws/build/flexbe_states/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/mirte/NGR-Goose/mirte_ws/build/flexbe_states/test_results/flexbe_states/rostest-tests_run_rostest.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_states --package=flexbe_states --results-filename tests_run_rostest.xml --results-base-dir \"/home/mirte/NGR-Goose/mirte_ws/build/flexbe_states/test_results\" /home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_states/tests/run_rostest.test ")
set_tests_properties(_ctest_flexbe_states_rostest_tests_run_rostest.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_states/CMakeLists.txt;31;add_rostest;/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_states/CMakeLists.txt;0;")
subdirs("gtest")
