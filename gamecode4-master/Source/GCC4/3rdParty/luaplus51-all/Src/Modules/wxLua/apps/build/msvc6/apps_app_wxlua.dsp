# Microsoft Developer Studio Project File - Name="apps_app_wxlua" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=app_wxlua - Win32 Debug Multilib
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "apps_app_wxlua.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "apps_app_wxlua.mak" CFG="app_wxlua - Win32 Debug Multilib"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "app_wxlua - Win32 Release Unicode DLL Monolithic" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Release Unicode DLL Multilib" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Release Unicode Monolithic" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Release Unicode Multilib" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Release DLL Monolithic" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Release DLL Multilib" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Release Monolithic" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Release Multilib" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Debug Unicode DLL Monolithic" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Debug Unicode DLL Multilib" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Debug Unicode Monolithic" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Debug Unicode Multilib" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Debug DLL Monolithic" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Debug DLL Multilib" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Debug Monolithic" (based on "Win32 (x86) Application")
!MESSAGE "app_wxlua - Win32 Debug Multilib" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "app_wxlua - Win32 Release Unicode DLL Monolithic"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "..\..\..\bin\vc_dll"
# PROP BASE Intermediate_Dir "vcmswu_dll\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\bin\vc_dll"
# PROP Intermediate_Dir "vcmswu_dll\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswu" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswu" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD BASE MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "WXUSINGDLL" /d "_UNICODE" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswu" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
# ADD RSC /l 0x409 /d "WXUSINGDLL" /d "_UNICODE" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswu" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28u_wxluasocket.lib wxlua_msw28u_wxluadebug.lib wxlua_msw28u_wxbindadv.lib wxlua_msw28u_wxbindaui.lib wxlua_msw28u_wxbindbase.lib wxlua_msw28u_wxbindcore.lib wxlua_msw28u_wxbindgl.lib wxlua_msw28u_wxbindhtml.lib wxlua_msw28u_wxbindmedia.lib wxlua_msw28u_wxbindnet.lib wxlua_msw28u_wxbindstc.lib wxlua_msw28u_wxbindxml.lib wxlua_msw28u_wxbindxrc.lib wxlua_msw28u_wxlua.lib lua5.1.lib wxmsw28u_stc.lib wxmsw28u_gl.lib wxmsw28u.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregexu.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"
# ADD LINK32 wxlua_msw28u_wxluasocket.lib wxlua_msw28u_wxluadebug.lib wxlua_msw28u_wxbindadv.lib wxlua_msw28u_wxbindaui.lib wxlua_msw28u_wxbindbase.lib wxlua_msw28u_wxbindcore.lib wxlua_msw28u_wxbindgl.lib wxlua_msw28u_wxbindhtml.lib wxlua_msw28u_wxbindmedia.lib wxlua_msw28u_wxbindnet.lib wxlua_msw28u_wxbindstc.lib wxlua_msw28u_wxbindxml.lib wxlua_msw28u_wxbindxrc.lib wxlua_msw28u_wxlua.lib lua5.1.lib wxmsw28u_stc.lib wxmsw28u_gl.lib wxmsw28u.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregexu.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Release Unicode DLL Multilib"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "..\..\..\bin\vc_dll"
# PROP BASE Intermediate_Dir "vcmswu_dll\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\bin\vc_dll"
# PROP Intermediate_Dir "vcmswu_dll\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswu" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswu" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD BASE MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "WXUSINGDLL" /d "_UNICODE" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswu" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
# ADD RSC /l 0x409 /d "WXUSINGDLL" /d "_UNICODE" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswu" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28u_wxluasocket.lib wxlua_msw28u_wxluadebug.lib wxlua_msw28u_wxbindadv.lib wxlua_msw28u_wxbindaui.lib wxlua_msw28u_wxbindbase.lib wxlua_msw28u_wxbindcore.lib wxlua_msw28u_wxbindgl.lib wxlua_msw28u_wxbindhtml.lib wxlua_msw28u_wxbindmedia.lib wxlua_msw28u_wxbindnet.lib wxlua_msw28u_wxbindstc.lib wxlua_msw28u_wxbindxml.lib wxlua_msw28u_wxbindxrc.lib wxlua_msw28u_wxlua.lib lua5.1.lib wxmsw28u_stc.lib wxmsw28u_xrc.lib wxmsw28u_html.lib wxmsw28u_gl.lib wxmsw28u_aui.lib wxmsw28u_media.lib wxmsw28u_adv.lib wxbase28u_net.lib wxbase28u_xml.lib wxmsw28u_core.lib wxbase28u.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregexu.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"
# ADD LINK32 wxlua_msw28u_wxluasocket.lib wxlua_msw28u_wxluadebug.lib wxlua_msw28u_wxbindadv.lib wxlua_msw28u_wxbindaui.lib wxlua_msw28u_wxbindbase.lib wxlua_msw28u_wxbindcore.lib wxlua_msw28u_wxbindgl.lib wxlua_msw28u_wxbindhtml.lib wxlua_msw28u_wxbindmedia.lib wxlua_msw28u_wxbindnet.lib wxlua_msw28u_wxbindstc.lib wxlua_msw28u_wxbindxml.lib wxlua_msw28u_wxbindxrc.lib wxlua_msw28u_wxlua.lib lua5.1.lib wxmsw28u_stc.lib wxmsw28u_xrc.lib wxmsw28u_html.lib wxmsw28u_gl.lib wxmsw28u_aui.lib wxmsw28u_media.lib wxmsw28u_adv.lib wxbase28u_net.lib wxbase28u_xml.lib wxmsw28u_core.lib wxbase28u.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregexu.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Release Unicode Monolithic"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "..\..\..\bin\vc_lib"
# PROP BASE Intermediate_Dir "vcmswu\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\bin\vc_lib"
# PROP Intermediate_Dir "vcmswu\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswu" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswu" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD BASE MTL /nologo /D "WIN32" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_UNICODE" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswu" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
# ADD RSC /l 0x409 /d "_UNICODE" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswu" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28u_wxluasocket.lib wxlua_msw28u_wxluadebug.lib wxlua_msw28u_wxbindadv.lib wxlua_msw28u_wxbindaui.lib wxlua_msw28u_wxbindbase.lib wxlua_msw28u_wxbindcore.lib wxlua_msw28u_wxbindgl.lib wxlua_msw28u_wxbindhtml.lib wxlua_msw28u_wxbindmedia.lib wxlua_msw28u_wxbindnet.lib wxlua_msw28u_wxbindstc.lib wxlua_msw28u_wxbindxml.lib wxlua_msw28u_wxbindxrc.lib wxlua_msw28u_wxlua.lib lua5.1.lib wxmsw28u_stc.lib wxmsw28u_gl.lib wxmsw28u.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregexu.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"
# ADD LINK32 wxlua_msw28u_wxluasocket.lib wxlua_msw28u_wxluadebug.lib wxlua_msw28u_wxbindadv.lib wxlua_msw28u_wxbindaui.lib wxlua_msw28u_wxbindbase.lib wxlua_msw28u_wxbindcore.lib wxlua_msw28u_wxbindgl.lib wxlua_msw28u_wxbindhtml.lib wxlua_msw28u_wxbindmedia.lib wxlua_msw28u_wxbindnet.lib wxlua_msw28u_wxbindstc.lib wxlua_msw28u_wxbindxml.lib wxlua_msw28u_wxbindxrc.lib wxlua_msw28u_wxlua.lib lua5.1.lib wxmsw28u_stc.lib wxmsw28u_gl.lib wxmsw28u.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregexu.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Release Unicode Multilib"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "..\..\..\bin\vc_lib"
# PROP BASE Intermediate_Dir "vcmswu\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\bin\vc_lib"
# PROP Intermediate_Dir "vcmswu\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswu" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswu" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD BASE MTL /nologo /D "WIN32" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "_UNICODE" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_UNICODE" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswu" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
# ADD RSC /l 0x409 /d "_UNICODE" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswu" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28u_wxluasocket.lib wxlua_msw28u_wxluadebug.lib wxlua_msw28u_wxbindadv.lib wxlua_msw28u_wxbindaui.lib wxlua_msw28u_wxbindbase.lib wxlua_msw28u_wxbindcore.lib wxlua_msw28u_wxbindgl.lib wxlua_msw28u_wxbindhtml.lib wxlua_msw28u_wxbindmedia.lib wxlua_msw28u_wxbindnet.lib wxlua_msw28u_wxbindstc.lib wxlua_msw28u_wxbindxml.lib wxlua_msw28u_wxbindxrc.lib wxlua_msw28u_wxlua.lib lua5.1.lib wxmsw28u_stc.lib wxmsw28u_xrc.lib wxmsw28u_html.lib wxmsw28u_gl.lib wxmsw28u_aui.lib wxmsw28u_media.lib wxmsw28u_adv.lib wxbase28u_net.lib wxbase28u_xml.lib wxmsw28u_core.lib wxbase28u.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregexu.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"
# ADD LINK32 wxlua_msw28u_wxluasocket.lib wxlua_msw28u_wxluadebug.lib wxlua_msw28u_wxbindadv.lib wxlua_msw28u_wxbindaui.lib wxlua_msw28u_wxbindbase.lib wxlua_msw28u_wxbindcore.lib wxlua_msw28u_wxbindgl.lib wxlua_msw28u_wxbindhtml.lib wxlua_msw28u_wxbindmedia.lib wxlua_msw28u_wxbindnet.lib wxlua_msw28u_wxbindstc.lib wxlua_msw28u_wxbindxml.lib wxlua_msw28u_wxbindxrc.lib wxlua_msw28u_wxlua.lib lua5.1.lib wxmsw28u_stc.lib wxmsw28u_xrc.lib wxmsw28u_html.lib wxmsw28u_gl.lib wxmsw28u_aui.lib wxmsw28u_media.lib wxmsw28u_adv.lib wxbase28u_net.lib wxbase28u_xml.lib wxmsw28u_core.lib wxbase28u.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregexu.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Release DLL Monolithic"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "..\..\..\bin\vc_dll"
# PROP BASE Intermediate_Dir "vcmsw_dll\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\bin\vc_dll"
# PROP Intermediate_Dir "vcmsw_dll\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\msw" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\msw" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD BASE MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "WXUSINGDLL" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\msw" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
# ADD RSC /l 0x409 /d "WXUSINGDLL" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\msw" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28_wxluasocket.lib wxlua_msw28_wxluadebug.lib wxlua_msw28_wxbindadv.lib wxlua_msw28_wxbindaui.lib wxlua_msw28_wxbindbase.lib wxlua_msw28_wxbindcore.lib wxlua_msw28_wxbindgl.lib wxlua_msw28_wxbindhtml.lib wxlua_msw28_wxbindmedia.lib wxlua_msw28_wxbindnet.lib wxlua_msw28_wxbindstc.lib wxlua_msw28_wxbindxml.lib wxlua_msw28_wxbindxrc.lib wxlua_msw28_wxlua.lib lua5.1.lib wxmsw28_stc.lib wxmsw28_gl.lib wxmsw28.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"
# ADD LINK32 wxlua_msw28_wxluasocket.lib wxlua_msw28_wxluadebug.lib wxlua_msw28_wxbindadv.lib wxlua_msw28_wxbindaui.lib wxlua_msw28_wxbindbase.lib wxlua_msw28_wxbindcore.lib wxlua_msw28_wxbindgl.lib wxlua_msw28_wxbindhtml.lib wxlua_msw28_wxbindmedia.lib wxlua_msw28_wxbindnet.lib wxlua_msw28_wxbindstc.lib wxlua_msw28_wxbindxml.lib wxlua_msw28_wxbindxrc.lib wxlua_msw28_wxlua.lib lua5.1.lib wxmsw28_stc.lib wxmsw28_gl.lib wxmsw28.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Release DLL Multilib"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "..\..\..\bin\vc_dll"
# PROP BASE Intermediate_Dir "vcmsw_dll\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\bin\vc_dll"
# PROP Intermediate_Dir "vcmsw_dll\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\msw" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\msw" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD BASE MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "WXUSINGDLL" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\msw" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
# ADD RSC /l 0x409 /d "WXUSINGDLL" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\msw" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28_wxluasocket.lib wxlua_msw28_wxluadebug.lib wxlua_msw28_wxbindadv.lib wxlua_msw28_wxbindaui.lib wxlua_msw28_wxbindbase.lib wxlua_msw28_wxbindcore.lib wxlua_msw28_wxbindgl.lib wxlua_msw28_wxbindhtml.lib wxlua_msw28_wxbindmedia.lib wxlua_msw28_wxbindnet.lib wxlua_msw28_wxbindstc.lib wxlua_msw28_wxbindxml.lib wxlua_msw28_wxbindxrc.lib wxlua_msw28_wxlua.lib lua5.1.lib wxmsw28_stc.lib wxmsw28_xrc.lib wxmsw28_html.lib wxmsw28_gl.lib wxmsw28_aui.lib wxmsw28_media.lib wxmsw28_adv.lib wxbase28_net.lib wxbase28_xml.lib wxmsw28_core.lib wxbase28.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"
# ADD LINK32 wxlua_msw28_wxluasocket.lib wxlua_msw28_wxluadebug.lib wxlua_msw28_wxbindadv.lib wxlua_msw28_wxbindaui.lib wxlua_msw28_wxbindbase.lib wxlua_msw28_wxbindcore.lib wxlua_msw28_wxbindgl.lib wxlua_msw28_wxbindhtml.lib wxlua_msw28_wxbindmedia.lib wxlua_msw28_wxbindnet.lib wxlua_msw28_wxbindstc.lib wxlua_msw28_wxbindxml.lib wxlua_msw28_wxbindxrc.lib wxlua_msw28_wxlua.lib lua5.1.lib wxmsw28_stc.lib wxmsw28_xrc.lib wxmsw28_html.lib wxmsw28_gl.lib wxmsw28_aui.lib wxmsw28_media.lib wxmsw28_adv.lib wxbase28_net.lib wxbase28_xml.lib wxmsw28_core.lib wxbase28.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Release Monolithic"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "..\..\..\bin\vc_lib"
# PROP BASE Intermediate_Dir "vcmsw\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\bin\vc_lib"
# PROP Intermediate_Dir "vcmsw\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\msw" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\msw" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD BASE MTL /nologo /D "WIN32" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\msw" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
# ADD RSC /l 0x409 /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\msw" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28_wxluasocket.lib wxlua_msw28_wxluadebug.lib wxlua_msw28_wxbindadv.lib wxlua_msw28_wxbindaui.lib wxlua_msw28_wxbindbase.lib wxlua_msw28_wxbindcore.lib wxlua_msw28_wxbindgl.lib wxlua_msw28_wxbindhtml.lib wxlua_msw28_wxbindmedia.lib wxlua_msw28_wxbindnet.lib wxlua_msw28_wxbindstc.lib wxlua_msw28_wxbindxml.lib wxlua_msw28_wxbindxrc.lib wxlua_msw28_wxlua.lib lua5.1.lib wxmsw28_stc.lib wxmsw28_gl.lib wxmsw28.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"
# ADD LINK32 wxlua_msw28_wxluasocket.lib wxlua_msw28_wxluadebug.lib wxlua_msw28_wxbindadv.lib wxlua_msw28_wxbindaui.lib wxlua_msw28_wxbindbase.lib wxlua_msw28_wxbindcore.lib wxlua_msw28_wxbindgl.lib wxlua_msw28_wxbindhtml.lib wxlua_msw28_wxbindmedia.lib wxlua_msw28_wxbindnet.lib wxlua_msw28_wxbindstc.lib wxlua_msw28_wxbindxml.lib wxlua_msw28_wxbindxrc.lib wxlua_msw28_wxlua.lib lua5.1.lib wxmsw28_stc.lib wxmsw28_gl.lib wxmsw28.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Release Multilib"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "..\..\..\bin\vc_lib"
# PROP BASE Intermediate_Dir "vcmsw\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\..\..\bin\vc_lib"
# PROP Intermediate_Dir "vcmsw\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\msw" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD CPP /nologo /FD /MD /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\msw" /I "$(WXWIN)\include" /O2 /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /c
# ADD BASE MTL /nologo /D "WIN32" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\msw" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
# ADD RSC /l 0x409 /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\msw" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d _WINDOWS
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28_wxluasocket.lib wxlua_msw28_wxluadebug.lib wxlua_msw28_wxbindadv.lib wxlua_msw28_wxbindaui.lib wxlua_msw28_wxbindbase.lib wxlua_msw28_wxbindcore.lib wxlua_msw28_wxbindgl.lib wxlua_msw28_wxbindhtml.lib wxlua_msw28_wxbindmedia.lib wxlua_msw28_wxbindnet.lib wxlua_msw28_wxbindstc.lib wxlua_msw28_wxbindxml.lib wxlua_msw28_wxbindxrc.lib wxlua_msw28_wxlua.lib lua5.1.lib wxmsw28_stc.lib wxmsw28_xrc.lib wxmsw28_html.lib wxmsw28_gl.lib wxmsw28_aui.lib wxmsw28_media.lib wxmsw28_adv.lib wxbase28_net.lib wxbase28_xml.lib wxmsw28_core.lib wxbase28.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"
# ADD LINK32 wxlua_msw28_wxluasocket.lib wxlua_msw28_wxluadebug.lib wxlua_msw28_wxbindadv.lib wxlua_msw28_wxbindaui.lib wxlua_msw28_wxbindbase.lib wxlua_msw28_wxbindcore.lib wxlua_msw28_wxbindgl.lib wxlua_msw28_wxbindhtml.lib wxlua_msw28_wxbindmedia.lib wxlua_msw28_wxbindnet.lib wxlua_msw28_wxbindstc.lib wxlua_msw28_wxbindxml.lib wxlua_msw28_wxbindxrc.lib wxlua_msw28_wxlua.lib lua5.1.lib wxmsw28_stc.lib wxmsw28_xrc.lib wxmsw28_html.lib wxmsw28_gl.lib wxmsw28_aui.lib wxmsw28_media.lib wxmsw28_adv.lib wxbase28_net.lib wxbase28_xml.lib wxmsw28_core.lib wxbase28.lib wxtiff.lib wxjpeg.lib wxpng.lib wxzlib.lib wxregex.lib wxexpat.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Debug Unicode DLL Monolithic"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "..\..\..\bin\vc_dll"
# PROP BASE Intermediate_Dir "vcmswud_dll\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\bin\vc_dll"
# PROP Intermediate_Dir "vcmswud_dll\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswud" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswud" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD BASE MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "WXUSINGDLL" /d "_UNICODE" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswud" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
# ADD RSC /l 0x409 /d "WXUSINGDLL" /d "_UNICODE" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswud" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28ud_wxluasocket.lib wxlua_msw28ud_wxluadebug.lib wxlua_msw28ud_wxbindadv.lib wxlua_msw28ud_wxbindaui.lib wxlua_msw28ud_wxbindbase.lib wxlua_msw28ud_wxbindcore.lib wxlua_msw28ud_wxbindgl.lib wxlua_msw28ud_wxbindhtml.lib wxlua_msw28ud_wxbindmedia.lib wxlua_msw28ud_wxbindnet.lib wxlua_msw28ud_wxbindstc.lib wxlua_msw28ud_wxbindxml.lib wxlua_msw28ud_wxbindxrc.lib wxlua_msw28ud_wxlua.lib lua5.1.lib wxmsw28ud_stc.lib wxmsw28ud_gl.lib wxmsw28ud.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexud.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"
# ADD LINK32 wxlua_msw28ud_wxluasocket.lib wxlua_msw28ud_wxluadebug.lib wxlua_msw28ud_wxbindadv.lib wxlua_msw28ud_wxbindaui.lib wxlua_msw28ud_wxbindbase.lib wxlua_msw28ud_wxbindcore.lib wxlua_msw28ud_wxbindgl.lib wxlua_msw28ud_wxbindhtml.lib wxlua_msw28ud_wxbindmedia.lib wxlua_msw28ud_wxbindnet.lib wxlua_msw28ud_wxbindstc.lib wxlua_msw28ud_wxbindxml.lib wxlua_msw28ud_wxbindxrc.lib wxlua_msw28ud_wxlua.lib lua5.1.lib wxmsw28ud_stc.lib wxmsw28ud_gl.lib wxmsw28ud.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexud.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Debug Unicode DLL Multilib"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "..\..\..\bin\vc_dll"
# PROP BASE Intermediate_Dir "vcmswud_dll\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\bin\vc_dll"
# PROP Intermediate_Dir "vcmswud_dll\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswud" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswud" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD BASE MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "WXUSINGDLL" /d "_UNICODE" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswud" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
# ADD RSC /l 0x409 /d "WXUSINGDLL" /d "_UNICODE" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswud" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28ud_wxluasocket.lib wxlua_msw28ud_wxluadebug.lib wxlua_msw28ud_wxbindadv.lib wxlua_msw28ud_wxbindaui.lib wxlua_msw28ud_wxbindbase.lib wxlua_msw28ud_wxbindcore.lib wxlua_msw28ud_wxbindgl.lib wxlua_msw28ud_wxbindhtml.lib wxlua_msw28ud_wxbindmedia.lib wxlua_msw28ud_wxbindnet.lib wxlua_msw28ud_wxbindstc.lib wxlua_msw28ud_wxbindxml.lib wxlua_msw28ud_wxbindxrc.lib wxlua_msw28ud_wxlua.lib lua5.1.lib wxmsw28ud_stc.lib wxmsw28ud_xrc.lib wxmsw28ud_html.lib wxmsw28ud_gl.lib wxmsw28ud_aui.lib wxmsw28ud_media.lib wxmsw28ud_adv.lib wxbase28ud_net.lib wxbase28ud_xml.lib wxmsw28ud_core.lib wxbase28ud.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexud.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"
# ADD LINK32 wxlua_msw28ud_wxluasocket.lib wxlua_msw28ud_wxluadebug.lib wxlua_msw28ud_wxbindadv.lib wxlua_msw28ud_wxbindaui.lib wxlua_msw28ud_wxbindbase.lib wxlua_msw28ud_wxbindcore.lib wxlua_msw28ud_wxbindgl.lib wxlua_msw28ud_wxbindhtml.lib wxlua_msw28ud_wxbindmedia.lib wxlua_msw28ud_wxbindnet.lib wxlua_msw28ud_wxbindstc.lib wxlua_msw28ud_wxbindxml.lib wxlua_msw28ud_wxbindxrc.lib wxlua_msw28ud_wxlua.lib lua5.1.lib wxmsw28ud_stc.lib wxmsw28ud_xrc.lib wxmsw28ud_html.lib wxmsw28ud_gl.lib wxmsw28ud_aui.lib wxmsw28ud_media.lib wxmsw28ud_adv.lib wxbase28ud_net.lib wxbase28ud_xml.lib wxmsw28ud_core.lib wxbase28ud.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexud.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Debug Unicode Monolithic"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "..\..\..\bin\vc_lib"
# PROP BASE Intermediate_Dir "vcmswud\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\bin\vc_lib"
# PROP Intermediate_Dir "vcmswud\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswud" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswud" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD BASE MTL /nologo /D "WIN32" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_UNICODE" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswud" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
# ADD RSC /l 0x409 /d "_UNICODE" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswud" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28ud_wxluasocket.lib wxlua_msw28ud_wxluadebug.lib wxlua_msw28ud_wxbindadv.lib wxlua_msw28ud_wxbindaui.lib wxlua_msw28ud_wxbindbase.lib wxlua_msw28ud_wxbindcore.lib wxlua_msw28ud_wxbindgl.lib wxlua_msw28ud_wxbindhtml.lib wxlua_msw28ud_wxbindmedia.lib wxlua_msw28ud_wxbindnet.lib wxlua_msw28ud_wxbindstc.lib wxlua_msw28ud_wxbindxml.lib wxlua_msw28ud_wxbindxrc.lib wxlua_msw28ud_wxlua.lib lua5.1.lib wxmsw28ud_stc.lib wxmsw28ud_gl.lib wxmsw28ud.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexud.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"
# ADD LINK32 wxlua_msw28ud_wxluasocket.lib wxlua_msw28ud_wxluadebug.lib wxlua_msw28ud_wxbindadv.lib wxlua_msw28ud_wxbindaui.lib wxlua_msw28ud_wxbindbase.lib wxlua_msw28ud_wxbindcore.lib wxlua_msw28ud_wxbindgl.lib wxlua_msw28ud_wxbindhtml.lib wxlua_msw28ud_wxbindmedia.lib wxlua_msw28ud_wxbindnet.lib wxlua_msw28ud_wxbindstc.lib wxlua_msw28ud_wxbindxml.lib wxlua_msw28ud_wxbindxrc.lib wxlua_msw28ud_wxlua.lib lua5.1.lib wxmsw28ud_stc.lib wxmsw28ud_gl.lib wxmsw28ud.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexud.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Debug Unicode Multilib"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "..\..\..\bin\vc_lib"
# PROP BASE Intermediate_Dir "vcmswud\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\bin\vc_lib"
# PROP Intermediate_Dir "vcmswud\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswud" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswud" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD BASE MTL /nologo /D "WIN32" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "_UNICODE" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_UNICODE" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswud" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
# ADD RSC /l 0x409 /d "_UNICODE" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswud" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28ud_wxluasocket.lib wxlua_msw28ud_wxluadebug.lib wxlua_msw28ud_wxbindadv.lib wxlua_msw28ud_wxbindaui.lib wxlua_msw28ud_wxbindbase.lib wxlua_msw28ud_wxbindcore.lib wxlua_msw28ud_wxbindgl.lib wxlua_msw28ud_wxbindhtml.lib wxlua_msw28ud_wxbindmedia.lib wxlua_msw28ud_wxbindnet.lib wxlua_msw28ud_wxbindstc.lib wxlua_msw28ud_wxbindxml.lib wxlua_msw28ud_wxbindxrc.lib wxlua_msw28ud_wxlua.lib lua5.1.lib wxmsw28ud_stc.lib wxmsw28ud_xrc.lib wxmsw28ud_html.lib wxmsw28ud_gl.lib wxmsw28ud_aui.lib wxmsw28ud_media.lib wxmsw28ud_adv.lib wxbase28ud_net.lib wxbase28ud_xml.lib wxmsw28ud_core.lib wxbase28ud.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexud.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"
# ADD LINK32 wxlua_msw28ud_wxluasocket.lib wxlua_msw28ud_wxluadebug.lib wxlua_msw28ud_wxbindadv.lib wxlua_msw28ud_wxbindaui.lib wxlua_msw28ud_wxbindbase.lib wxlua_msw28ud_wxbindcore.lib wxlua_msw28ud_wxbindgl.lib wxlua_msw28ud_wxbindhtml.lib wxlua_msw28ud_wxbindmedia.lib wxlua_msw28ud_wxbindnet.lib wxlua_msw28ud_wxbindstc.lib wxlua_msw28ud_wxbindxml.lib wxlua_msw28ud_wxbindxrc.lib wxlua_msw28ud_wxlua.lib lua5.1.lib wxmsw28ud_stc.lib wxmsw28ud_xrc.lib wxmsw28ud_html.lib wxmsw28ud_gl.lib wxmsw28ud_aui.lib wxmsw28ud_media.lib wxmsw28ud_adv.lib wxbase28ud_net.lib wxbase28ud_xml.lib wxmsw28ud_core.lib wxbase28ud.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexud.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Debug DLL Monolithic"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "..\..\..\bin\vc_dll"
# PROP BASE Intermediate_Dir "vcmswd_dll\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\bin\vc_dll"
# PROP Intermediate_Dir "vcmswd_dll\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswd" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswd" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD BASE MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "WXUSINGDLL" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswd" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
# ADD RSC /l 0x409 /d "WXUSINGDLL" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswd" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28d_wxluasocket.lib wxlua_msw28d_wxluadebug.lib wxlua_msw28d_wxbindadv.lib wxlua_msw28d_wxbindaui.lib wxlua_msw28d_wxbindbase.lib wxlua_msw28d_wxbindcore.lib wxlua_msw28d_wxbindgl.lib wxlua_msw28d_wxbindhtml.lib wxlua_msw28d_wxbindmedia.lib wxlua_msw28d_wxbindnet.lib wxlua_msw28d_wxbindstc.lib wxlua_msw28d_wxbindxml.lib wxlua_msw28d_wxbindxrc.lib wxlua_msw28d_wxlua.lib lua5.1.lib wxmsw28d_stc.lib wxmsw28d_gl.lib wxmsw28d.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexd.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"
# ADD LINK32 wxlua_msw28d_wxluasocket.lib wxlua_msw28d_wxluadebug.lib wxlua_msw28d_wxbindadv.lib wxlua_msw28d_wxbindaui.lib wxlua_msw28d_wxbindbase.lib wxlua_msw28d_wxbindcore.lib wxlua_msw28d_wxbindgl.lib wxlua_msw28d_wxbindhtml.lib wxlua_msw28d_wxbindmedia.lib wxlua_msw28d_wxbindnet.lib wxlua_msw28d_wxbindstc.lib wxlua_msw28d_wxbindxml.lib wxlua_msw28d_wxbindxrc.lib wxlua_msw28d_wxlua.lib lua5.1.lib wxmsw28d_stc.lib wxmsw28d_gl.lib wxmsw28d.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexd.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Debug DLL Multilib"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "..\..\..\bin\vc_dll"
# PROP BASE Intermediate_Dir "vcmswd_dll\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\bin\vc_dll"
# PROP Intermediate_Dir "vcmswd_dll\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswd" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_dll\mswd" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_dll\wxlua.pdb /D "WIN32" /D "WXUSINGDLL" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD BASE MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "WXUSINGDLL" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "WXUSINGDLL" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswd" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
# ADD RSC /l 0x409 /d "WXUSINGDLL" /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_dll\mswd" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28d_wxluasocket.lib wxlua_msw28d_wxluadebug.lib wxlua_msw28d_wxbindadv.lib wxlua_msw28d_wxbindaui.lib wxlua_msw28d_wxbindbase.lib wxlua_msw28d_wxbindcore.lib wxlua_msw28d_wxbindgl.lib wxlua_msw28d_wxbindhtml.lib wxlua_msw28d_wxbindmedia.lib wxlua_msw28d_wxbindnet.lib wxlua_msw28d_wxbindstc.lib wxlua_msw28d_wxbindxml.lib wxlua_msw28d_wxbindxrc.lib wxlua_msw28d_wxlua.lib lua5.1.lib wxmsw28d_stc.lib wxmsw28d_xrc.lib wxmsw28d_html.lib wxmsw28d_gl.lib wxmsw28d_aui.lib wxmsw28d_media.lib wxmsw28d_adv.lib wxbase28d_net.lib wxbase28d_xml.lib wxmsw28d_core.lib wxbase28d.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexd.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"
# ADD LINK32 wxlua_msw28d_wxluasocket.lib wxlua_msw28d_wxluadebug.lib wxlua_msw28d_wxbindadv.lib wxlua_msw28d_wxbindaui.lib wxlua_msw28d_wxbindbase.lib wxlua_msw28d_wxbindcore.lib wxlua_msw28d_wxbindgl.lib wxlua_msw28d_wxbindhtml.lib wxlua_msw28d_wxbindmedia.lib wxlua_msw28d_wxbindnet.lib wxlua_msw28d_wxbindstc.lib wxlua_msw28d_wxbindxml.lib wxlua_msw28d_wxbindxrc.lib wxlua_msw28d_wxlua.lib lua5.1.lib wxmsw28d_stc.lib wxmsw28d_xrc.lib wxmsw28d_html.lib wxmsw28d_gl.lib wxmsw28d_aui.lib wxmsw28d_media.lib wxmsw28d_adv.lib wxbase28d_net.lib wxbase28d_xml.lib wxmsw28d_core.lib wxbase28d.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexd.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_dll\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_dll" /libpath:"..\..\..\lib\vc_dll" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_dll\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Debug Monolithic"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "..\..\..\bin\vc_lib"
# PROP BASE Intermediate_Dir "vcmswd\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\bin\vc_lib"
# PROP Intermediate_Dir "vcmswd\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswd" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswd" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD BASE MTL /nologo /D "WIN32" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswd" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
# ADD RSC /l 0x409 /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswd" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28d_wxluasocket.lib wxlua_msw28d_wxluadebug.lib wxlua_msw28d_wxbindadv.lib wxlua_msw28d_wxbindaui.lib wxlua_msw28d_wxbindbase.lib wxlua_msw28d_wxbindcore.lib wxlua_msw28d_wxbindgl.lib wxlua_msw28d_wxbindhtml.lib wxlua_msw28d_wxbindmedia.lib wxlua_msw28d_wxbindnet.lib wxlua_msw28d_wxbindstc.lib wxlua_msw28d_wxbindxml.lib wxlua_msw28d_wxbindxrc.lib wxlua_msw28d_wxlua.lib lua5.1.lib wxmsw28d_stc.lib wxmsw28d_gl.lib wxmsw28d.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexd.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"
# ADD LINK32 wxlua_msw28d_wxluasocket.lib wxlua_msw28d_wxluadebug.lib wxlua_msw28d_wxbindadv.lib wxlua_msw28d_wxbindaui.lib wxlua_msw28d_wxbindbase.lib wxlua_msw28d_wxbindcore.lib wxlua_msw28d_wxbindgl.lib wxlua_msw28d_wxbindhtml.lib wxlua_msw28d_wxbindmedia.lib wxlua_msw28d_wxbindnet.lib wxlua_msw28d_wxbindstc.lib wxlua_msw28d_wxbindxml.lib wxlua_msw28d_wxbindxrc.lib wxlua_msw28d_wxlua.lib lua5.1.lib wxmsw28d_stc.lib wxmsw28d_gl.lib wxmsw28d.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexd.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"

!ELSEIF  "$(CFG)" == "app_wxlua - Win32 Debug Multilib"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "..\..\..\bin\vc_lib"
# PROP BASE Intermediate_Dir "vcmswd\app_wxlua"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\..\..\bin\vc_lib"
# PROP Intermediate_Dir "vcmswd\app_wxlua"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswd" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD CPP /nologo /FD /MDd /W1 /GR /EHsc /I "$(WXWIN)\lib\vc_lib\mswd" /I "$(WXWIN)\include" /Od /Gm /I "..\..\..\modules" /I ".\..\..\.." /I "..\..\..\modules\lua\include" /Zi /Fd..\..\..\bin\vc_lib\wxlua.pdb /D "WIN32" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /c
# ADD BASE MTL /nologo /D "WIN32" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "WIN32" /D "__WXDEBUG__" /D "__WXMSW__" /D wxLUA_USEBINDING_WXADV=1 /D wxLUA_USEBINDING_WXAUI=1 /D wxLUA_USEBINDING_WXBASE=1 /D wxLUA_USEBINDING_WXCORE=1 /D wxLUA_USEBINDING_WXGL=1 /D wxLUA_USEBINDING_WXHTML=1 /D wxLUA_USEBINDING_WXMEDIA=1 /D wxLUA_USEBINDING_WXNET=1 /D wxLUA_USEBINDING_WXRICHTEXT=1 /D wxLUA_USEBINDING_WXSTC=1 /D wxLUA_USEBINDING_WXXML=1 /D wxLUA_USEBINDING_WXXRC=1 /D "_WINDOWS" /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswd" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
# ADD RSC /l 0x409 /d "__WXDEBUG__" /d "__WXMSW__" /i "$(WXWIN)\lib\vc_lib\mswd" /i "$(WXWIN)\include" /i "..\..\..\modules" /i ".\..\..\.." /i "..\..\..\modules\lua\include" /d wxLUA_USEBINDING_WXADV=1 /d wxLUA_USEBINDING_WXAUI=1 /d wxLUA_USEBINDING_WXBASE=1 /d wxLUA_USEBINDING_WXCORE=1 /d wxLUA_USEBINDING_WXGL=1 /d wxLUA_USEBINDING_WXHTML=1 /d wxLUA_USEBINDING_WXMEDIA=1 /d wxLUA_USEBINDING_WXNET=1 /d wxLUA_USEBINDING_WXRICHTEXT=1 /d wxLUA_USEBINDING_WXSTC=1 /d wxLUA_USEBINDING_WXXML=1 /d wxLUA_USEBINDING_WXXRC=1 /d "_WINDOWS" /d _DEBUG
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 wxlua_msw28d_wxluasocket.lib wxlua_msw28d_wxluadebug.lib wxlua_msw28d_wxbindadv.lib wxlua_msw28d_wxbindaui.lib wxlua_msw28d_wxbindbase.lib wxlua_msw28d_wxbindcore.lib wxlua_msw28d_wxbindgl.lib wxlua_msw28d_wxbindhtml.lib wxlua_msw28d_wxbindmedia.lib wxlua_msw28d_wxbindnet.lib wxlua_msw28d_wxbindstc.lib wxlua_msw28d_wxbindxml.lib wxlua_msw28d_wxbindxrc.lib wxlua_msw28d_wxlua.lib lua5.1.lib wxmsw28d_stc.lib wxmsw28d_xrc.lib wxmsw28d_html.lib wxmsw28d_gl.lib wxmsw28d_aui.lib wxmsw28d_media.lib wxmsw28d_adv.lib wxbase28d_net.lib wxbase28d_xml.lib wxmsw28d_core.lib wxbase28d.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexd.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"
# ADD LINK32 wxlua_msw28d_wxluasocket.lib wxlua_msw28d_wxluadebug.lib wxlua_msw28d_wxbindadv.lib wxlua_msw28d_wxbindaui.lib wxlua_msw28d_wxbindbase.lib wxlua_msw28d_wxbindcore.lib wxlua_msw28d_wxbindgl.lib wxlua_msw28d_wxbindhtml.lib wxlua_msw28d_wxbindmedia.lib wxlua_msw28d_wxbindnet.lib wxlua_msw28d_wxbindstc.lib wxlua_msw28d_wxbindxml.lib wxlua_msw28d_wxbindxrc.lib wxlua_msw28d_wxlua.lib lua5.1.lib wxmsw28d_stc.lib wxmsw28d_xrc.lib wxmsw28d_html.lib wxmsw28d_gl.lib wxmsw28d_aui.lib wxmsw28d_media.lib wxmsw28d_adv.lib wxbase28d_net.lib wxbase28d_xml.lib wxmsw28d_core.lib wxbase28d.lib wxtiffd.lib wxjpegd.lib wxpngd.lib wxzlibd.lib wxregexd.lib wxexpatd.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib winspool.lib winmm.lib shell32.lib comctl32.lib ole32.lib oleaut32.lib uuid.lib rpcrt4.lib advapi32.lib wsock32.lib odbc32.lib oleacc.lib /nologo /machine:i386 /out:"..\..\..\bin\vc_lib\wxlua.exe" /libpath:"$(WXWIN)\lib\vc_lib" /libpath:"..\..\..\lib\vc_lib" /libpath:"..\..\..\modules\lua\lib" /subsystem:windows /debug /pdb:"..\..\..\bin\vc_lib\wxlua.pdb"

!ENDIF

# Begin Target

# Name "app_wxlua - Win32 Release Unicode DLL Monolithic"
# Name "app_wxlua - Win32 Release Unicode DLL Multilib"
# Name "app_wxlua - Win32 Release Unicode Monolithic"
# Name "app_wxlua - Win32 Release Unicode Multilib"
# Name "app_wxlua - Win32 Release DLL Monolithic"
# Name "app_wxlua - Win32 Release DLL Multilib"
# Name "app_wxlua - Win32 Release Monolithic"
# Name "app_wxlua - Win32 Release Multilib"
# Name "app_wxlua - Win32 Debug Unicode DLL Monolithic"
# Name "app_wxlua - Win32 Debug Unicode DLL Multilib"
# Name "app_wxlua - Win32 Debug Unicode Monolithic"
# Name "app_wxlua - Win32 Debug Unicode Multilib"
# Name "app_wxlua - Win32 Debug DLL Monolithic"
# Name "app_wxlua - Win32 Debug DLL Multilib"
# Name "app_wxlua - Win32 Debug Monolithic"
# Name "app_wxlua - Win32 Debug Multilib"
# Begin Group "Source Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\wxlua\src\lconsole.cpp
# End Source File
# Begin Source File

SOURCE=..\..\wxlua\src\wxlua.cpp
# End Source File
# Begin Source File

SOURCE=..\..\wxlua\src\wxlua.rc
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\wxlua\src\editor.h
# End Source File
# Begin Source File

SOURCE=..\..\wxlua\src\lconsole.h
# End Source File
# Begin Source File

SOURCE=..\..\wxlua\src\wxlua.h
# End Source File
# End Group
# End Target
# End Project

