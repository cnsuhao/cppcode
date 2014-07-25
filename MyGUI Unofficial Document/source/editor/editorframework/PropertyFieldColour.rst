===================
PropertyFieldColour
===================

*PropertyFieldColour*\ 对应编辑器中的颜色属性框，如图:

.. image:: /images/PropertyFieldColourExample.png

左边\ ``MyGUI::TextBox* mText;``\ 显示属性名，中间\ ``MyGUI::EditBox* mField;``\ 显示颜色值，
右边\ ``MyGUI::Widget* mColourPlace;``\ 显示颜色。

``std::string mName;``\ 存储属性名，颜色值改变时，作为\ ``eventAction(mName, _value, _final);``\ 的
参数。

``ColourPanel* mColourPanel;``\ 对应打开的\ :doc:`colourpanel`\ ，通过下列函数与\ ``MyGUI::Widget* mColourPlace;``\ 
交互:

* ``void notifyMouseButtonPressed(MyGUI::Widget* _sender, int _left, int _top, MyGUI::MouseButton _id);``
* ``void notifyEndDialog(Dialog* _sender, bool _result);``
* ``void notifyPreviewColour(const MyGUI::Colour& _value);``

在\ ``MyGUI::EditBox* mField;``\ 中直接编辑颜色值，会触发\ ``void notifyApplyProperties(MyGUI::Widget* _sender, bool _force);``\ 
更新\ ``MyGUI::Widget* mColourPlace;``\ 和\ ``MyGUI::EditBox* mField;``\ 的状态。

点击\ ``MyGUI::Widget* mColourPlace;``\ 会打开\ :doc:`colourpanel`\ ，并且用当前颜色初始化\ :doc:`colourpanel`\ 的颜色。

在\ :doc:`colourpanel`\ 中选择颜色会触发下列函数，更新\ ``MyGUI::Widget* mColourPlace;``\ 和\ ``MyGUI::EditBox* mField;``\ 的状态。

* ``void notifyEndDialog(Dialog* _sender, bool _result);``
* ``void notifyPreviewColour(const MyGUI::Colour& _value);``