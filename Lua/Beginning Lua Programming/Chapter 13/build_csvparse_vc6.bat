cl /c /Zl /I"D:/Program Files (x86)/Lua/5.1/include" /Yd /MD /W4 /DWIN32 csvparse.c
link /dll /out:csvparse.dll /base:0x67C00000 /machine:ix86 /export:luaopen_csvparse csvparse.obj msvcrt.lib "D:/Program Files (x86)/Lua/5.1/lib/lua5.1.lib"
