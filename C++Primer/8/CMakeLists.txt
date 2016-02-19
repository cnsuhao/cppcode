include_directories(../7)
add_executable(Ch08_add_item add_item.cpp ../7/Sales_data.cpp)
add_executable(Ch08_add_itemV2 add_itemV2.cpp ../7/Sales_data.cpp)
add_executable(Ch08_buf buf.cpp)
add_executable(Ch08_clearIO clearIO.cpp)
add_executable(Ch08_fileIO fileIO.cpp)
add_executable(Ch08_sstream sstream.cpp)

Config_DebugInfo(Ch08_cond "&lt; data/vecSubs")