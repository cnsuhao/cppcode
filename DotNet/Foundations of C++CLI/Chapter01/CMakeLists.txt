cmake_minimum_required(VERSION 2.6.2)

project(Ch1)

include(../../clr.cmake)

add_executable_clr(greeting greeting.cpp)
add_executable_clr(hello_interop hello_interop.cpp)
add_executable_clr(hello_world1 hello_world1.cpp)
add_executable_clr(hello_world2 hello_world2.cpp)
add_executable_clr(hello_world3 hello_world3.cpp)
add_executable_clr(hello_world4 hello_world4.cpp)