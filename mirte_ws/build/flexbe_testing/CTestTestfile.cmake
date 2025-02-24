# CMake generated Testfile for 
# Source directory: /home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_testing
# Build directory: /home/mirte/NGR-Goose/mirte_ws/build/flexbe_testing
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_flexbe_testing_rostest_test_selftest.test "/home/mirte/NGR-Goose/mirte_ws/build/flexbe_testing/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/mirte/NGR-Goose/mirte_ws/build/flexbe_testing/test_results/flexbe_testing/rostest-test_selftest.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_testing --package=flexbe_testing --results-filename test_selftest.xml --results-base-dir \"/home/mirte/NGR-Goose/mirte_ws/build/flexbe_testing/test_results\" /home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_testing/test/selftest.test ")
set_tests_properties(_ctest_flexbe_testing_rostest_test_selftest.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_testing/CMakeLists.txt;34;add_rostest;/home/mirte/NGR-Goose/mirte_ws/src/flexbe_behavior_engine/flexbe_testing/CMakeLists.txt;0;")
subdirs("gtest")
