==============
居中展开子控件
==============

居中展开子控件可以制造类似开窗的感觉，方法是:

* 把直接子控件的对齐方式设置为\ *HCenter Top*\ 、\ *HCenter Bottom*\ 或\ *HCenter VStretch*
* 使用\ ``MyGUI::ControllerPosition``\ ，将父控件的宽度从0增大到正常宽度
* 同时使用\ ``MyGUI::ControllerPosition``\ ，将父控件的位置右移正常宽度的一半

如果不加限制，展开过程中容易出现子控件抖动的现象。父控件的宽度由奇变偶或由偶变奇的时候，
重新计算出的子控件的位置就会有误差。

为了避免抖动，最好将父控件的宽度设为偶数，同时\ ``MyGUI::ControllerPosition``\ 的\ **action**\ 设置为\ ``MyGUI::action::inertionalMoveEvenSizeFunction``\ ，保证父控件的宽度始终为偶数。