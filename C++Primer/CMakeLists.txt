cmake_minimum_required(VERSION 2.6.2)

project(CppPrimer)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CppPrimer_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CppPrimer_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CppPrimer_BINARY_DIR}/bin)

function(Config_DebugInfo target debug_param)
	set(debug_dir ${CMAKE_CURRENT_SOURCE_DIR})
	set(debug_param ${debug_param})
    configure_file(
        ../VisualStudioUserFile.vcxproj.user.in
        ${CMAKE_CURRENT_BINARY_DIR}/${target}.vcxproj.user
    )
endfunction()

add_subdirectory(1)
add_subdirectory(2)
add_subdirectory(3)
add_subdirectory(4)
add_subdirectory(5)
add_subdirectory(6)
add_subdirectory(7)
add_subdirectory(8)
add_subdirectory(9)
add_subdirectory(10)
add_subdirectory(11)
add_subdirectory(12)
add_subdirectory(13)
add_subdirectory(14)
add_subdirectory(15)
add_subdirectory(16)
add_subdirectory(17)
add_subdirectory(18)
add_subdirectory(19)

