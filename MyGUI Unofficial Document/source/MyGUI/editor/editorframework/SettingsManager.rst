SettingsManager
===============

*SettingsManager*\ 负责管理编辑器的配置，每个编辑器对应两个配置文件:

:file:`Media/Tools/FontEditor/Settings.xml`
:file:`fe_user_settings.xml`

:file:`Media/Tools/ImageEditor/Settings.xml`
:file:`ie_user_settings.xml`

:file:`Media/Tools/LayoutEditor/Settings/Settings.xml`
:file:`le_user_settings.xml`

:file:`Media/Tools/SkinEditor/Settings.xml`
:file:`se_user_settings.xml`

:file:`Settings.xml`\ 存储编辑器的基本配置，\ :file:`*user_settings.xml`\ 存储通过\ **Settings**\ 
对话框自定义的配置。

配置发生变化时，\ *SettingsManager*\ 通过\ ``eventSettingsChanged``\ 通知其他模块。