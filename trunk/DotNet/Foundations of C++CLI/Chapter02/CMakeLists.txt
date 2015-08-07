cmake_minimum_required(VERSION 2.6.2)

project(Ch2)

include(../../clr.cmake)
set(deb_info_temp ../../VisualStudioUserFile.vcxproj.user.in)

add_library_clr(atom atom.cpp)
add_library_clr(atom_managed atom_managed.cpp)
add_library_clr(elements_enum elements_enum.cpp)
add_library_clr(atom_with_properties atom_with_properties.cpp)
add_library_clr(atom_with_enum atom_with_enum.cpp)
add_library_clr(atom_with_valuetype atom_with_valuetype.cpp)
add_library_clr(defining_interfaces defining_interfaces.cpp)
add_library_clr(value_struct value_struct.cpp)
add_library_clr(generic_list generic_list.cpp)

add_executable_clr(atom_valuetype ${deb_info_temp} atom_valuetype.cpp)
add_executable_clr(elements_stlclr ${deb_info_temp} elements_stlclr.cpp)
add_executable_clr(longlong ${deb_info_temp} longlong.cpp)
add_executable_clr(radioactive_decay ${deb_info_temp} radioactive_decay.cpp)
