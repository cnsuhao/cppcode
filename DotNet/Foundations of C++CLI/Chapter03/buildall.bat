cl /clr:pure message_box.cpp user32.lib
cl /clr:safe reftype.cpp
cl /clr using_directive.cpp
cl /clr using_directive2.cpp
cl /clr /LD file1.cpp
cl /clr file2.cpp

cl /clr:safe /LN reftype.cpp
al.exe /keyfile:mykey.snk /target:library /out:reftype.dll reftype.netmodule