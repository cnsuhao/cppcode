==============
居中展开子控件
==============

居中展开子控件可以制造类似开窗的感觉，方法是::

	把直接子控件的对齐方式设置为HCenter Top、HCenter Bottom或HCenter VStretch
	使用MyGUI::ControllerPosition，将控件的宽度从0变大同时位置右移

如果不加限制，展开过程中容易出现子控件抖动的现象。控件的宽度由奇变偶或由偶变奇的时候，
重新计算出的子控件的位置就会有误差。

为了避免抖动，最好将控件的宽度设为偶数，同时\ ``MyGUI::ControllerPosition``\ 使用\ ``MyGUI::action::inertionalMoveEvenSizeFunction``\ 。