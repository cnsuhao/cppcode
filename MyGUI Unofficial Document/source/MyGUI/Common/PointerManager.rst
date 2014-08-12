input::PointerManager
=====================

Win32
~~~~~

*input::PointerManager*\ 覆盖了\ :doc:`/MyGUI/engine/PointerManager`\ 的一部分功能:

* 用\ *Windows*\ 自带的光标替代\ :doc:`/MyGUI/engine/PointerManager`\ 的\ ``ImageBox* mMousePointer;``
* ``void notifyChangeMousePointer(const std::string& _name);``\ 响应\ :doc:`/MyGUI/engine/PointerManager`\ 中的
  ``eventChangeMousePointer``\ ，更新光标属性。
* :file:`Media/Common/Base/PointersW32.xml`\ 将MyGUI中光标的名字对应到Windows的光标名