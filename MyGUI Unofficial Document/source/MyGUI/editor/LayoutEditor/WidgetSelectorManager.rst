WidgetSelectorManager
=====================

在\ :doc:`../layouteditor`\ 中可以用鼠标选择控件，默认情况下选择鼠标下方的控件,这个控件和它的所有父控件组成一个循环队列,
在同一个位置继续点击可以选择这个循环队列上的下一个控件。

这些功能通过\ *WidgetSelectorManager*\ 实现:

* ``MyGUI::Widget* mCurrentWidget;`` //指向当前选择的控件。
* ``size_t mSelectDepth;`` //代表当前选择的控件在队列中的深度。
* ``void selectWidget(const MyGUI::IntPoint& _mousePosition);`` //选择鼠标位置下的控件
  
.. note:: 在\ :doc:`../layouteditor`\ 中只能选择出现在\ *EditorWidgets*\ 中的\ *Widget*\ ,如果一个\ *Widget*\ 的皮肤中包含
    子控件，这些\ *Widget*\ 不会出现在\ *EditorWidgets*\ 中，因此不能通过\ *WidgetSelectorManager*\ 选择这些子控件。