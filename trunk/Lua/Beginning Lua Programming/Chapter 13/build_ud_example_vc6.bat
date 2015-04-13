cl /c /Zl /Zd /I"D:/Program Files (x86)/Lua/5.1/include" /MD /W4 ud_example.c
link /dll /out:ud_example.dll /base:0x68200000 /machine:ix86 /export:luaopen_ud_example ud_example.obj msvcrt.lib "D:/Program Files (x86)/Lua/5.1/lib/lua5.1.lib"
