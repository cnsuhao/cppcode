WSP4_AddExecute(FreeSpace FreeSpace.c)
WSP4_AddExecute(GETN GETN.C)
WSP4_AddExecute(LsREG LsREG.c)
WSP4_AddExecute(lsW lsW.C)
WSP4_AddExecute(RecordAccess RecordAccess.c)
add_executable(RecordAccessTestDataGenerate RecordAccessTestDataGenerate.cpp)
configure_file(
    ../VisualStudioUserFile.vcxproj.user.in
    ${CMAKE_CURRENT_BINARY_DIR}/RecordAccessTestDataGenerate.vcxproj.user
)

WSP4_AddExecute(TAIL TAIL.C)
WSP4_AddExecute(TestLock TestLock.c)
WSP4_AddExecute(TOUCH TOUCH.C)
