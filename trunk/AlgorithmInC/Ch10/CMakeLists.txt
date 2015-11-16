cmake_minimum_required(VERSION 2.6.2)

project(CH10)

add_library(RadixLSD SHARED RadixLSD.cpp)
set_target_properties(RadixLSD PROPERTIES INCLUDE_DIRECTORIES "${CH10_SOURCE_DIR}/../Ch06/Item_Int")
add_library(RadixMSD SHARED RadixMSD.cpp  ../Ch06/insertion_basic.cpp)
set_target_properties(RadixMSD PROPERTIES INCLUDE_DIRECTORIES "${CH10_SOURCE_DIR}/../Ch06;${CH10_SOURCE_DIR}/../Ch06/Item_Int")
add_library(RadixQuickSort SHARED RadixQuickSort.cpp)
set_target_properties(RadixQuickSort PROPERTIES INCLUDE_DIRECTORIES "${CH10_SOURCE_DIR}/../Ch06/Item_Int")
add_library(RadixQuickSort_Partition SHARED RadixQuickSort_Partition.cpp ../Ch06/insertion_basic.cpp)
set_target_properties(RadixQuickSort_Partition PROPERTIES INCLUDE_DIRECTORIES "${CH10_SOURCE_DIR}/../Ch06;${CH10_SOURCE_DIR}/../Ch06/Item_Int")