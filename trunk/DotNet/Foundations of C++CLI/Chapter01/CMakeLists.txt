cmake_minimum_required(VERSION 2.6.2)

project(Ch1)

include(../../clr.cmake)
set(deb_info_temp ../../VisualStudioUserFile.vcxproj.user.in)

add_executable_clr(greeting ${deb_info_temp} greeting.cpp)
add_executable_clr(hello_interop ${deb_info_temp} hello_interop.cpp)
add_executable_clr(hello_world1 ${deb_info_temp} hello_world1.cpp)
add_executable_clr(hello_world2 ${deb_info_temp} hello_world2.cpp)
add_executable_clr(hello_world3 ${deb_info_temp} hello_world3.cpp)
add_executable_clr(hello_world4 ${deb_info_temp} hello_world4.cpp)