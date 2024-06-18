# CMake generated Testfile for 
# Source directory: /home/rob/NGR-Goose/mirte_ws/src/flexbe_app
# Build directory: /home/rob/NGR-Goose/mirte_ws/build/flexbe_app
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_flexbe_app_rostest_launch_test_report.test "/home/rob/NGR-Goose/mirte_ws/build/flexbe_app/catkin_generated/env_cached.sh" "/usr/bin/python3" "/opt/ros/noetic/share/catkin/cmake/test/run_tests.py" "/home/rob/NGR-Goose/mirte_ws/build/flexbe_app/test_results/flexbe_app/rostest-launch_test_report.xml" "--return-code" "/usr/bin/python3 /opt/ros/noetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/rob/NGR-Goose/mirte_ws/src/flexbe_app --package=flexbe_app --results-filename launch_test_report.xml --results-base-dir \"/home/rob/NGR-Goose/mirte_ws/build/flexbe_app/test_results\" /home/rob/NGR-Goose/mirte_ws/src/flexbe_app/launch/test_report.test ")
set_tests_properties(_ctest_flexbe_app_rostest_launch_test_report.test PROPERTIES  _BACKTRACE_TRIPLES "/opt/ros/noetic/share/catkin/cmake/test/tests.cmake;160;add_test;/opt/ros/noetic/share/rostest/cmake/rostest-extras.cmake;52;catkin_run_tests_target;/home/rob/NGR-Goose/mirte_ws/src/flexbe_app/CMakeLists.txt;55;add_rostest;/home/rob/NGR-Goose/mirte_ws/src/flexbe_app/CMakeLists.txt;0;")
subdirs("gtest")
