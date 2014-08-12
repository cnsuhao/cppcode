MyGUI::PointerManager
=====================

*PointerManager*\ 负责管理光标的状态:

* 使用\ ``Widget* baseCreateWidget(WidgetStyle _style, const std::string& _type, const std::string& _skin, 
  const IntCoord& _coord, Align _align, const std::string& _layer, const std::string& _name);``\ 创建一个
  ImageBox表示光标。
* ``void notifyFrameStart(float _time);``\ 每一帧开始时更新光标位置
* ``void notifyChangeMouseFocus(Widget* _widget);``\ 移动鼠标到新的控件上方时显示对应的光标
* ``delegates::CMultiDelegate1<const std::string&> eventChangeMousePointer;``\ 光标改变时通知其他模块

.. seealso::

	:doc:`IPointer`
		\ 

	:doc:`/MyGUI/Common/PointerManager`
		\ 