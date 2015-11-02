cmake_minimum_required(VERSION 2.6.2)

project(CH07)

INCLUDE_DIRECTORIES("../Ch06")
INCLUDE_DIRECTORIES("../Ch06/Item_Int")
INCLUDE_DIRECTORIES("../Ch04")
add_library(quicksort_basic SHARED quicksort_basic.cpp Partition.h Partition.cpp)
add_library(quicksort_stack SHARED quicksort_stack.cpp Partition.h Partition.cpp ../Ch04/stack.h ../Ch04/stack_array.cpp)
add_library(quicksort_insert SHARED quicksort_insert.cpp Partition.h Partition.cpp ../Ch06/insertion.h ../Ch06/insertion_basic.cpp)
add_library(quicksort_gatherequal SHARED quicksort_gatherequal.cpp)
add_library(select_k SHARED select_k.cpp Partition.h Partition.cpp)
