输入输出
--------

MyGUI::IPointer
===============

*IPointer*\ 对应光标，定义了两个接口:

* ``virtual void setImage(ImageBox* _image) = 0;`` //设置\ ``_image``\ 显示的图片
* ``virtual void setPosition(ImageBox* _image, const IntPoint& _point) = 0;`` //根据鼠标位置\ ``_point``\ 设置\ ``_image``\ 的位置

类关系图如下:

.. image:: /images/ButterflyGraph-IPointer.png

*ResourceManualPointer*\ 将光标设置为一张静态的\ *Texture*\ ，现在只有\ **Demo_Pointers**\ 有用到。

.. hint:: :file:`Media/Demos/Demo_Pointers/DemoPointers.xml`

*ResourceImageSetPointer*\ 将光标设置为一个\ *Imageset*\ ，理论上了可以播放序列帧，是默认的光标类型。

.. hint:: :file:`Media/MyGUI_Media/MyGUI_Pointers.xml`

.. _myguiengine-PointerManager:

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

    :ref:`input::PointerManager <input-PointerManager>`
        \ 

.. _myguiengine-InputManager:

MyGUI::InputManager
===================

*MyGUI::InputManager* 根据外部输入的鼠标、键盘事件，结合UI中的控件的信息，产生各种事件，通知相关的控件。

* 鼠标、键盘事件主要包括::
  
    bool injectMouseMove(int _absx, int _absy, int _absz);
    bool injectMousePress(int _absx, int _absy, MouseButton _id);
    bool injectMouseRelease(int _absx, int _absy, MouseButton _id);
    bool injectKeyPress(KeyCode _key, Char _text = 0);
    bool injectKeyRelease(KeyCode _key);

* 关联的控件主要通过 ``LayerManager::getInstance().getWidgetFromPoint(_absx, _absy);`` 获得。

* 通过 :ref:`MyGUI:WidgetInput <myguiengine-WidgetInput>` 通知控件。