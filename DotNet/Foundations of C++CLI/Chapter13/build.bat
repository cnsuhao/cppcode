cl /clr auto_gcroot.cpp
cl /clr context_switch.cpp
cl /clr gc_hole.cpp
cl /clr getlasterror.cpp
cl /clr interop_messagebox.cpp user32.lib
cl /clr interop_messagebox_marshaling.cpp user32.lib
cl /clr message_box.cpp user32.lib
cl /clr message_box_wrapper.cpp user32.lib
cl /clr message_box_wrapper_marshaling.cpp user32.lib
cl /clr native_exception.cpp
cl /clr native_in_managed.cpp
cl /clr native_message_box_class.cpp  user32.lib
cl /clr pinvoke.cpp
cl /clr pinvoke_marshaling.cpp
cl /clr pinvoke_rename_entry_point.cpp
cl /LD nativeclasslib.cpp
cl /clr:safe pinvoke_thiscall.cpp
cl /clr try_except.cpp