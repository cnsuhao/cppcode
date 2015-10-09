cmake_minimum_required(VERSION 2.6.2)

project(CH04)

add_executable(Complex_adt_client Complex_adt_client.cpp complex_adt.cpp)
add_executable(Complex_client Complex_client.cpp complex.cpp)
add_executable(poly_adt_client poly_adt_client.cpp poly_adt.cpp )
add_executable(UF_Client UF_Client.cpp UF.cpp)
add_executable(queue_adt_client queue_adt_client.cpp queue_adt.cpp)

add_library(queue_array QUEUE_array.cpp)
add_library(queue_linklist QUEUE_linklist.cpp)

add_executable(parse_exp_in_array parse_exp_in.cpp stack_array.cpp)
add_executable(parse_exp_in_linklist parse_exp_in.cpp stack_linklist.cpp)
add_executable(parse_exp_in_uniq parse_exp_in.cpp stack_uniq.cpp)
add_executable(parse_exp_post_array parse_exp_post.cpp stack_array.cpp)
add_executable(parse_exp_post_linklist parse_exp_post.cpp stack_linklist.cpp)
add_executable(parse_exp_post_uniq parse_exp_post.cpp stack_uniq.cpp)
