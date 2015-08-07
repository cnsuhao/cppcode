cmake_minimum_required(VERSION 2.6.2)

project(Ch13)

include(../../clr.cmake)
set(deb_info_temp ../../VisualStudioUserFile.vcxproj.user.in)

add_executable_clr(context_switch ${deb_info_temp} context_switch.cpp)
add_executable_clr(gc_hole ${deb_info_temp} gc_hole.cpp)
add_executable_clr(getlasterror ${deb_info_temp} getlasterror.cpp)
add_executable_clr(interop_messagebox ${deb_info_temp} interop_messagebox.cpp)
add_executable_clr(interop_messagebox_marshaling ${deb_info_temp} interop_messagebox_marshaling.cpp)
add_executable_clr(message_box ${deb_info_temp} message_box.cpp)
add_executable_clr(message_box_wrapper_marshaling ${deb_info_temp} message_box_wrapper_marshaling.cpp)
add_executable_clr(native_exception ${deb_info_temp} native_exception.cpp)
add_executable_clr(native_in_managed ${deb_info_temp} native_in_managed.cpp)
add_executable_clr(pinvoke ${deb_info_temp} pinvoke.cpp)
add_executable_clr(pinvoke_marshaling ${deb_info_temp} pinvoke_marshaling.cpp)
add_executable_clr(pinvoke_rename_entry_point ${deb_info_temp} pinvoke_rename_entry_point.cpp)
add_executable_clr(pinvoke_thiscall ${deb_info_temp} pinvoke_thiscall.cpp)
add_dependencies(pinvoke_thiscall nativeclasslib)
add_executable_clr(try_except ${deb_info_temp} try_except.cpp)

add_library_clr(auto_gcroot auto_gcroot.h auto_gcroot.cpp)
add_library(nativeclasslib SHARED nativeclasslib.cpp)
add_library_clr(global_function global_function.cpp)
add_library_clr(interface_example interface_example.cpp)
add_library_clr(interior_ptr interior_ptr.cpp)
add_library_clr(native_in_managed_bad native_in_managed_bad.cpp)

add_executable(native_message_box_class native_message_box_class.cpp native_message_box_class.h)
configure_file(
        ${deb_info_temp}
        ${CMAKE_CURRENT_BINARY_DIR}/native_message_box_class.vcxproj.user
    )
    
add_executable(nativecallmanage nativecallmanage.cpp)
target_link_libraries(nativecallmanage auto_gcroot)
configure_file(
        ${deb_info_temp}
        ${CMAKE_CURRENT_BINARY_DIR}/nativecallmanage.vcxproj.user
    )