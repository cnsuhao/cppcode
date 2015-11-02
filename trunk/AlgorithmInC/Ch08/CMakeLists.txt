cmake_minimum_required(VERSION 2.6.2)

project(CH08)

add_library(mergesortAB SHARED mergesortAB.cpp ../Ch06/insertion.h ../Ch06/insertion_basic.cpp)
set_target_properties(mergesortAB PROPERTIES INCLUDE_DIRECTORIES "${CH08_SOURCE_DIR}/../Ch06;${CH08_SOURCE_DIR}/../Ch06/Item_Int")
add_library(mergesort_inplace SHARED mergesort_inplace.cpp)
set_target_properties(mergesort_inplace PROPERTIES INCLUDE_DIRECTORIES "${CH08_SOURCE_DIR}/../Ch06/Item_Int")
add_library(mergesort_link SHARED mergesort_link.cpp ../Ch03/list.h ../Ch03/list.cpp QUEUE.h ../Ch04/QUEUE_array.cpp)
set_target_properties(mergesort_link PROPERTIES INCLUDE_DIRECTORIES "${CH08_SOURCE_DIR};${CH08_SOURCE_DIR}/../Ch06/Item_Int;${CH08_SOURCE_DIR}/../Ch03")
# add_library(mergesort_link_queue SHARED mergesort_link_queue.cpp QUEUE.h ../Ch04/QUEUE_array.cpp)
# set_target_properties(mergesort_link_queue PROPERTIES INCLUDE_DIRECTORIES "${CH08_SOURCE_DIR}/../Ch03;${CH08_SOURCE_DIR}/")
