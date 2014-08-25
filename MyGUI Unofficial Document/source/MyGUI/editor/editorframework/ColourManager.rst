颜色
----

====================
tools::ColourManager
====================

*ColourManager*\ 用于设置背景颜色、矩形选择框颜色，对应\ *LayoutEditor*\ 、\ *FontEditor*\ 、
\ *ImageEditor*\ 、\ *SkinEditor*\ 中的\ **Colours**\ 菜单。

以下三个函数对应\ **Colours**\ 菜单中的选项:

* ``void commandChangeColourBackground(const MyGUI::UString& _commandName, bool& _result);``
* ``void commandChangeColourSelector(const MyGUI::UString& _commandName, bool& _result);``
* ``void commandChangeColourSelectorInactive(const MyGUI::UString& _commandName, bool& _result);``

*ColourManager*\ 与\ ``ColourPanel* mColourPanel;``\ 指向的调色板通过下列函数交互:

* ``void notifyEndDialog(Dialog* _sender, bool _result);``
* ``void notifyPreviewColour(const MyGUI::Colour& _value);``
* ``void showColourDialog();``

背景颜色、矩形选择框颜色等信息存储在如下配置文件中:

* LayoutEditor: :file:`le_user_settings.xml`
* ImageEditor: :file:`ie_user_settings.xml`
* SkinEditor: :file:`se_user_settings.xml`
* FontEditor: :file:`fe_user_settings.xml`

.. _tools_ColourPanel:

==================
tools::ColourPanel
==================

*ColourPanel*\ 对应编辑器中的调色板，layout文件是\ :file:`ColourPanel.layout`\ 。

``MyGUI::ImageBox* mColourRect;``\ 和\ ``MyGUI::ITexture* mTexture;``\ 对应颜色选择区域。

``MyGUI::ImageBox* mColourRect;``\ 和\ ``MyGUI::ImageBox* mImageColourPicker;``\ 响应鼠标拖动事件，

调色板状态的更新主要通过以下两个函数进行:

``void updateFromPoint(const MyGUI::IntPoint& _point);`` //在颜色选择区域点击、拖动；移动颜色滚动条

.. image:: /images/ButterflyGraph-updateFromPoint.png

``void updateFromColour(const MyGUI::Colour& _colour);`` //在调色板上直接更改颜色数值；打开调色板时提供颜色值

.. image:: /images/ButterflyGraph-updateFromColour.png

*ColourPanel*\ 与\ *ColourManager*\ 、\ :ref:`PropertyFieldColour <tools_PropertyFieldColour>`\ 有比较密切的关系。