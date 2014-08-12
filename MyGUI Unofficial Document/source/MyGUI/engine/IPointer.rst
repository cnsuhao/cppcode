MyGUI::IPointer
===============

MyGUI::IPointer对应光标，定义了两个接口:

* ``virtual void setImage(ImageBox* _image) = 0;`` //设置\ ``_image``\ 显示的图片
* ``virtual void setPosition(ImageBox* _image, const IntPoint& _point) = 0;`` //根据鼠标位置\ ``_point``\ 设置\ ``_image``\ 的位置

类关系图如下:

.. image:: /images/ButterflyGraph-IPointer.png

*ResourceManualPointer*\ 将光标设置为一张静态的\ *Texture*\ ，\ *ResourceImageSetPointer*\ 将光标设置为一个\ *Imageset*\ ，
理论上了可以播放序列帧。