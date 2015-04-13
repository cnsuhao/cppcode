cl /c /Zl /I"D:/Program Files (x86)/Lua/5.1/include" /Yd /MD /W4 /DWIN32 stacklook.c
link /dll /out:stacklook.dll /base:0x68100000 /machine:ix86 /export:luaopen_stacklook stacklook.obj msvcrt.lib "D:/Program Files (x86)/Lua/5.1/lib/lua5.1.lib"
