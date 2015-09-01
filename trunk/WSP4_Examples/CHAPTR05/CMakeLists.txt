cmake_minimum_required(VERSION 2.6.2)

project(CHAPTR05 C)

include_directories(../Include)
add_subdirectory(../UTILITY ./UTILITY)
include(../CommonFunc.cmake)

WSP4_AddDLL(cci_fmmDll cci_fmmDll.c)
WSP4_AddDLL(cci_fDll cci_fDll.c)
WSP4_AddDLL(cci_fmm cci_fmm.c)

WSP4_AddExecute(cciEL cciEL.C)
WSP4_AddExecute(CLEAR CLEAR.C)
WSP4_AddExecute(HEAPNOSR HEAPNOSR.C)
WSP4_AddExecute(RANDFILE RANDFILE.C)
WSP4_AddExecute(RecordAccessMM RecordAccessMM.c)
WSP4_AddExecute(SORTBT SORTBT.C)
WSP4_AddExecute(SORTBTSR SORTBTSR.C)
WSP4_AddExecute(SORTFL SORTFL.C)
WSP4_AddExecute(SORTHP SORTHP.C)
WSP4_AddExecute(SORTMM SORTMM.C)
