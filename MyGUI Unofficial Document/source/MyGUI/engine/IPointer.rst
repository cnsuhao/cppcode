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