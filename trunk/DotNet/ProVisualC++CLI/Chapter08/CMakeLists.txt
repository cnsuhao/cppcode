cmake_minimum_required(VERSION 2.6.2)

project(Ch08)

include(../../clr.cmake)
set(deb_info_temp ../../VisualStudioUserFile.vcxproj.user.in)

add_executable_clr(BinaryRW ${deb_info_temp} BinaryRW.cpp)
add_executable_clr(BinFormSerial ${deb_info_temp} BinFormSerial.cpp)
add_executable_clr(DirInfo ${deb_info_temp} DirInfo.cpp)
add_executable_clr(FileInfo ${deb_info_temp} FileInfo.cpp)
add_executable_clr(FileStream ${deb_info_temp} FileStream.cpp)
add_executable_clr(MemoryStream ${deb_info_temp} MemoryStream.cpp)
add_executable_clr(SoapFormSerial ${deb_info_temp} SoapFormSerial.cpp)
add_executable_clr(StreamRW ${deb_info_temp} StreamRW.cpp)