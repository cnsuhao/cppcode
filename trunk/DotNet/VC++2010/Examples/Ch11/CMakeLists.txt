cmake_minimum_required(VERSION 2.6.2)

project(Ch11)

include(../../../clr.cmake)

add_executable_clr(Ex11_01 Ex11_01/DebugStuff.h Ex11_01/Ex11_01.cpp Ex11_01/Name.cpp Ex11_01/Name.h)
add_executable_clr(Ex11_02 Ex11_02/DebugStuff.h Ex11_02/Ex11_02.cpp Ex11_02/Name.cpp Ex11_02/Name.h)
add_executable_clr(Ex11_02A Ex11_02A/DebugStuff.h Ex11_02A/Ex11_02.cpp Ex11_02A/Name.cpp Ex11_02A/Name.h)
add_executable_clr(Ex11_03 Ex11_03/Ex11_03.cpp Ex11_03/resource.h Ex11_03/stdafx.cpp Ex11_03/stdafx.h)