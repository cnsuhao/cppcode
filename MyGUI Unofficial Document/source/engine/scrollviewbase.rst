ScrollViewBase
==============

*ScrollViewBase*\ 代表滚动区域，继承关系如下:

.. image:: /images/ButterflyGraph-ScrollViewBase.png

*ScrollViewBase*\ 包含三个子控件，构成滚动区域::

	ScrollBar* mVScroll; // 垂直滚动条
	ScrollBar* mHScroll; // 水平滚动条
	Widget* mClient; // 显示区域

*ScrollViewBase*\ 主要通过以下两个函数更新滚动区域的状态::

	void updateScrollSize(); // 更新滚动条是否可见，调整三个子控件的大小；这个函数中的代码比较冗余。
	void updateScrollPosition(); // 更新Content的显示位置和滚动条的位置，当Content的宽度或高度小于显示区域时，显示位置会受到对齐方式的影响。

:doc:`scrollview`
