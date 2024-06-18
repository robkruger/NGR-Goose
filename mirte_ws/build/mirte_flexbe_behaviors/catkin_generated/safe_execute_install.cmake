execute_process(COMMAND "/home/rob/NGR-Goose/mirte_ws/build/mirte_flexbe_behaviors/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/rob/NGR-Goose/mirte_ws/build/mirte_flexbe_behaviors/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
