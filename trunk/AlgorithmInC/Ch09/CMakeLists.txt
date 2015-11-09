cmake_minimum_required(VERSION 2.6.2)

project(CH09)

add_library(PQindex PQindex.cpp PQindex.h)
set_target_properties(PQindex PROPERTIES INCLUDE_DIRECTORIES "${CH09_SOURCE_DIR}/Item_PQIndex")
add_library(PQ_basic_array PQ_basic_array.cpp PQ_basic.h)
set_target_properties(PQ_basic_array PROPERTIES INCLUDE_DIRECTORIES "${CH09_SOURCE_DIR}/../Ch06/Item_Int")
add_library(PQ_basic_heap PQ_basic_heap.cpp PQ_basic.h FixUpDown.h FixUpDown.cpp)
set_target_properties(PQ_basic_heap PROPERTIES INCLUDE_DIRECTORIES "${CH09_SOURCE_DIR}/../Ch06/Item_Int")
add_library(PQ_LinkList PQ_LinkList.cpp PQfull.h )
set_target_properties(PQ_LinkList PROPERTIES INCLUDE_DIRECTORIES "${CH09_SOURCE_DIR}/../Ch06/Item_Int")
add_library(PQ_binomial PQ_binomial.cpp)
set_target_properties(PQ_binomial PROPERTIES INCLUDE_DIRECTORIES "${CH09_SOURCE_DIR}/../Ch06/Item_Int")