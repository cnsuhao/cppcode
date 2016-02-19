INCLUDE_DIRECTORIES(../14)

add_executable(Ch16_array-parms4 array-parms4.cpp)
add_executable(Ch16_Array Array.cpp)
add_executable(Ch16_compare compare.cpp)
add_executable(Ch16_compareDef compareDef.cpp ../14/Sales_data.cpp)
add_executable(Ch16_compareSpec compareSpec.cpp)
add_executable(Ch16_debug debug.cpp)
add_executable(Ch16_overloaded debug.cpp)
set_target_properties(Ch16_overloaded PROPERTIES 
                      COMPILE_DEFINITIONS="OVERCHAR"
                      COMPILE_FLAGS="/Feoverloaded")
add_executable(Ch16_specialized debug.cpp)
set_target_properties(Ch16_specialized PROPERTIES 
                      COMPILE_DEFINITIONS="SPECIALIZED"
                      COMPILE_FLAGS="/Fespecialized")
add_executable(Ch16_multiset multiset.cpp Sales_data.cpp)
add_executable(Ch16_overSpec overSpec.cpp)
add_executable(Ch16_qm qm.cpp build.cpp )
add_executable(Ch16_SP SP.cpp)
add_executable(Ch16_special special.cpp)
add_executable(Ch16_useBlob useBlob.cpp)
add_executable(Ch16_useChcking useChcking.cpp)
add_executable(Ch16_Vecmain Vecmain.cpp)

Config_DebugInfo(Ch16_Vecmain "&lt; data/Vecmain")
Config_DebugInfo(Ch16_compareDef "&lt; data/book_sales")