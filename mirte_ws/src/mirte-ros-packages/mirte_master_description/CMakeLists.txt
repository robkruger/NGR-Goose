cmake_minimum_required(VERSION 3.0.2)

project(mirte_master_description)

find_package(catkin REQUIRED COMPONENTS roslaunch)

catkin_package()

foreach(dir config launch meshes urdf)
	install(DIRECTORY ${dir}/
		DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/${dir})
endforeach(dir)
