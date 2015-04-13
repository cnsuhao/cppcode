cl /c /Zl /I"D:/Program Files (x86)/Lua/5.1/include" /Yd /MD /W4 /DWIN32 iomode.c
link /dll /out:iomode.dll /base:0x67900000 /machine:ix86 /export:luaopen_iomode iomode.obj msvcrt.lib "D:/Program Files (x86)/Lua/5.1/lib/lua5.1.lib"
