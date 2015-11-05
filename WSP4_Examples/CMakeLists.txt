cmake_minimum_required(VERSION 2.6.2)

project(WSP4)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${WSP4_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${WSP4_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${WSP4_BINARY_DIR}/bin)
function(WSP4_AddExecute target)
    add_executable(${target} ${ARGN})
    set_target_properties(${target} PROPERTIES COMPILE_FLAGS "/TC")
    target_link_libraries(${target} UTILITY WS2_32.lib)
    configure_file(
        ../VisualStudioUserFile.vcxproj.user.in
        ${CMAKE_CURRENT_BINARY_DIR}/${target}.vcxproj.user
    )
endfunction()

function(WSP4_AddDLL target)
    add_library(${target} SHARED ${ARGN})
    target_link_libraries(${target} UTILITY  WS2_32.lib)
endfunction()

include_directories(Include)

add_subdirectory(UTILITY)
add_subdirectory(CHAPTR01)
add_subdirectory(CHAPTR02)
add_subdirectory(CHAPTR03)
add_subdirectory(CHAPTR04)
add_subdirectory(CHAPTR05)
add_subdirectory(CHAPTR06)
add_subdirectory(CHAPTR07)
add_subdirectory(CHAPTR08)
add_subdirectory(CHAPTR09)
add_subdirectory(CHAPTR10)
add_subdirectory(CHAPTR11)
add_subdirectory(CHAPTR12)
add_subdirectory(CHAPTR13)
