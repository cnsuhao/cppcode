代理机制
========

:file:`MyGUI_Delegate.h`\ 和\ :file:`MyGUI_DelegateImplement.h`\ 定义MyGUI的代理机制:

* *MYGUI_I_DELEGATE*\ : 通过 ``virtual void invoke( MYGUI_PARAMS ) = 0;``\ 调用代理的函数。
   
    * *MYGUI_C_STATIC_DELEGATE*\ : 代理静态函数,主要使用\ ``newDelegate( void (*_func)( MYGUI_PARAMS ) )``\ 生成。
    * *MYGUI_C_METHOD_DELEGATE*\ : 代理普通的成员函数,主要使用\ ``newDelegate( T* _object, void (T::*_method)( MYGUI_PARAMS ) )``\ 生成。

        * 在实际地使用中，\ ``IDelegateUnlink* mUnlink;``\ 和\ ``T* mObject;``\ 的值好像始终相同。
          
* *MYGUI_C_DELEGATE*\ : 存储一个\ *MYGUI_I_DELEGATE*
* *MYGUI_C_MULTI_DELEGATE*\ : 存储多个\ *MYGUI_I_DELEGATE*
  
.. note::  *MYGUI_C_MULTI_DELEGATE*\ 的\ ``MYGUI_C_MULTI_DELEGATE  MYGUI_TEMPLATE_ARGS& operator-=(IDelegate* _delegate)``\ 
  没有直接erase，如果当前正在执行的代理执行一个删除再执行一个添加，有可能导致死循环。

.. hint:: 查找\ *CDelegate[0-6]*\ 和\ *MYGUI_C_MULTI_DELEGATE[0-6]*\ 的引用，看看代理如何运作(添加函数、调用函数)。