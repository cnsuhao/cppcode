cmake_minimum_required(VERSION 2.6.2)

project(Ch3)

include(../../clr.cmake)

add_library_clr(file1 file1.cpp)
add_executable_clr(file2 file2.cpp)
add_reference(file2 "file1")
add_executable_clr(message_box message_box.cpp)
add_executable_clr(reftype reftype.cpp)
add_executable_clr(using_directive using_directive.cpp)
add_executable_clr(using_directive2 using_directive2.cpp)