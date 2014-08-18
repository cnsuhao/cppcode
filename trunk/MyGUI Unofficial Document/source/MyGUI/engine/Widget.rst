Widget
======

.. image:: /images/ButterflyGraph-Widget.png

* *ICroppedRectangle*\ 存储控件的位置信息，其中\ ``IntRect mMargin;``\ 对应被父控件遮挡的部分。
* *LayerItem*\ 存储的信息决定了控件被渲染的顺序，\ *SkinItem*\ 存储皮肤相关的信息。
    * *LayerItem*\ 的\ ``VectorSubWidget mDrawItems;``\ 与\ *SkinItem*\ 的\ ``VectorSubWidget mSubSkinChild;``\ 
      功能重复，都对应用\ **点九**\ 划分的各个区域，不过存储的都是\ *ISubWidget\**\ ，所以无所谓。

      .. note::  *SkinItem*\ 更新这些\ *ISubWidget*\ 的状态，\ *LayerItem*\ 负责渲染它们。

    * ``void SkinItem::_resortTexture()``\ 强制控件在下一轮\ :ref:`渲染 <engine-RenderStages>`\ 时刷新。

* *UserData*\ 存储\ *Any*\ 和\ *MapString*\ 类型的数据。