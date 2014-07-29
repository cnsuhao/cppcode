=============
ColourManager
=============

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