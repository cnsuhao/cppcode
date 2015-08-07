cmake_minimum_required(VERSION 2.6.2)

project(Ch3)

include(../../clr.cmake)
set(deb_info_temp ../../VisualStudioUserFile.vcxproj.user.in)

add_library_clr(file1 file1.cpp)
add_executable_clr(file2 ${deb_info_temp} file2.cpp)
add_reference(file2 "file1")
add_executable_clr(message_box ${deb_info_temp} message_box.cpp)
add_executable_clr(reftype ${deb_info_temp} reftype.cpp)
add_executable_clr(using_directive ${deb_info_temp} using_directive.cpp)
add_executable_clr(using_directive2 ${deb_info_temp} using_directive2.cpp)