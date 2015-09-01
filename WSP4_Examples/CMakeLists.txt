cmake_minimum_required(VERSION 2.6.2)

project(WSP4)

function(WSP4_AddExecute target)
    add_executable(${target} ${ARGN})
    set_target_properties(${target} PROPERTIES COMPILE_FLAGS "/TC")
    target_link_libraries(${target} UTILITY)
endfunction()

function(WSP4_AddDLL target)
    add_library(${target} SHARED ${ARGN})
    target_link_libraries(${target} UTILITY)
endfunction()

include_directories(Include)

add_subdirectory(UTILITY)
add_subdirectory(CHAPTR01)
add_subdirectory(CHAPTR02)
add_subdirectory(CHAPTR03)
add_subdirectory(CHAPTR04)
add_subdirectory(CHAPTR05)
