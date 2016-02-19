include_directories(../1)
add_executable(Ch07_add_item add_item.cpp Sales_data.cpp)
add_executable(Ch07_avg_price avg_price.cpp Sales_data.cpp)
add_executable(Ch07_useAccount useAccount.cpp Account.cpp)
# add_executable(Ch07_useDebug useDebug.cpp)
add_executable(Ch07_useScreen useScreen.cpp)

Config_DebugInfo(Ch07_avg_price "&lt; data/book_sales")
Config_DebugInfo(Ch07_add_item "&lt; data/add_item")