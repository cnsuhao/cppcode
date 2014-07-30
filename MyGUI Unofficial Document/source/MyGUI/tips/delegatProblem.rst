MyGUI_DelegateImplement.h中的问题
=================================

``MYGUI_C_MULTI_DELEGATE  MYGUI_TEMPLATE_ARGS& operator-=(IDelegate* _delegate)``\ 
没有直接erase，如果当前正在执行的代理执行一个删除再执行一个添加，有可能导致死循环。