cmake_minimum_required(VERSION 2.6.2)

project(CH05)

add_library(RecursiveFunctions RecursiveFunctions.cpp)
add_library(Tnode Tnode.cpp)

include_directories(../Ch04/)
add_library(Traverse Traverse.cpp)
add_library(max_node max_node.cpp)
