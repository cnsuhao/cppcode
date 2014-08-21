BaseManager
~~~~~~~~~~~

*BaseManager* 定义了所有编辑器和Demo的框架。

.. image:: /images/ButterflyGraph-BaseManager.png

.. note:: 四个Application分别对应四个编辑器，每个Demo有一个DemoKeeper。

*BaseManager* 的作用包括:

* 初始化 **Ogre** 、 **UI** ，从配置文件中读取资源加载的路径。
* 通过 :ref:`input::InputManager <input-InputManager>` 响应鼠标键盘事件
* 通过 :ref:`input::PointerManager <input-PointerManager>` 更新光标的状态
* 子类通过下列虚函数加载资源、创建具体的场景::
  
    virtual void createScene() { }
    virtual void destroyScene() { }
    virtual void setupResources();

.. _input-PointerManager:

input::PointerManager
=====================

*input::PointerManager*\ 覆盖了\ :ref:`MyGUI::PointerManager <myguiengine-PointerManager>`\ 的一部分功能:

* 用\ *Windows*\ 自带的光标替代\ :ref:`MyGUI::PointerManager <myguiengine-PointerManager>`\ 的\ ``ImageBox* mMousePointer;``
* ``void notifyChangeMousePointer(const std::string& _name);``\ 响应\ :ref:`MyGUI::PointerManager <myguiengine-PointerManager>`\ 中的
  ``eventChangeMousePointer``\ ，更新光标属性。
* :file:`Media/Common/Base/PointersW32.xml`\ 将MyGUI中光标的名字对应到Windows的光标名
  
.. _input-InputManager:

input::InputManager
===================

*input::InputManager* 响应Windows的各种窗口事件。

* ``static LRESULT CALLBACK windowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);`` 响应Windows的各种窗口事件。
* 通过下列虚函数通知子类，由子类进行处理::
  
    virtual void injectMouseMove(int _absx, int _absy, int _absz) { }
    virtual void injectMousePress(int _absx, int _absy, MyGUI::MouseButton _id) { }
    virtual void injectMouseRelease(int _absx, int _absy, MyGUI::MouseButton _id) { }
    virtual void injectKeyPress(MyGUI::KeyCode _key, MyGUI::Char _text) { }
    virtual void injectKeyRelease(MyGUI::KeyCode _key) { }

    virtual void onFileDrop(const std::wstring& _filename) { }
    virtual bool onWinodwClose(size_t _handle) { return true; }

  鼠标键盘事件由子类注入 :ref:`MyGUI::InputManager <myguiengine-InputManager>` 。

