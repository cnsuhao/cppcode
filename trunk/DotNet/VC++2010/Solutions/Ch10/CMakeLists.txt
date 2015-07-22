cmake_minimum_required(VERSION 2.6.2)

project(Ch10)

include(../../../clr.cmake)

add_executable_clr(Soln10_01 Soln10_01.cpp)
add_executable_clr(Soln10_02 Soln10_02.cpp)
add_executable_clr(Soln10_03 Soln10_03.cpp)
add_executable_clr(Soln10_04 Soln10_04/Person.h Soln10_04/Soln10_04.cpp)
add_executable_clr(Soln10_05 Soln10_05/Person.h Soln10_05/Soln10_05.cpp Soln10_05/stdafx.cpp Soln10_05/stdafx.h)
add_executable_clr(Soln10_06 Soln10_06/Person.h Soln10_06/PhoneBook.cpp Soln10_06/PhoneBook.h Soln10_06/Soln10_06.cpp)
add_executable_clr(Soln10_07 Soln10_07/Person.h Soln10_07/Soln10_07.cpp)
add_executable_clr(Soln10_08 Soln10_08.cpp)