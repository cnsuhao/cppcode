UI相关模块
==========

相关的路径
----------

Layout和Lua脚本: :file:`Build\\Win32\\Asserts\\UI\\Layout`

美术资源: :file:`Build\\Win32\\Asserts\\UI\\Common`

配置文件: :file:`Build\\Win32\\Config`

.. warning:: 以上三类资源需要导入到 RogEditor 中，图片导入到 ROGTexture ，其他文件导入 ROGAssert 。

MyGUI和相关的编辑器: :file:`NoahSDK\\Noah3rdparty\\MyGUI`

Lua接口: :file:`NoahSDK\\NoahCore`

Lua接口: :file:`Client\\Development\\Src\\ROGGameContent\\Classes`


加载Layout和Lua脚本
-------------------

Layout 文件是控件的组合，Lua脚本和这些控件交互

:file:`Build\\Win32\\Config\\Client\\WindowsCfg.tab` 中每个窗口对应一个Layout文件和一个Lua脚本。

NoahCore 中的 ``void KUIWindowManager::InitialWindows(void)`` 读取这个文件，每个窗口创建一个 **KUIWindow** ，并加载对应的Lua脚本。

**KUIWindow** 主要做三件事:

* ``void KUIWindow::Load(void)`` 加载Layout文件，创建控件
* ``void KUIWindow::UnLoad(void)`` 如果一个界面从可见变为不可见的时间超过 **UIWINDOW_UNLOAD_TIME** , 销毁控件
* ``void KUIWindow::RegisterListener(void)`` 注册这个窗口响应的游戏事件
* ``void KUIWindow::FireGameEvent(const GameEvent* pEvent)`` 调用游戏事件对应的脚本函数
* ``void KUIWindow::RegisterWidget(MyGUI::Widget* pWidget)`` 为控件注册一个 HashCode ，在Lua脚本中通过这个 HashCode 引用控件。

皮肤
----

皮肤有两种: 一种是简单皮肤，显示在控件上的图片;另一种是组合皮肤，显示在控件上 Layout

:file:`Build\\Win32\\Asserts\\UI\\Common\\MyGUI_SkinList.xml` 加载游戏中用到的皮肤。

使用 :file:`Tools\\MyTexturePacker` 增加新的材质，材质集最好是正方形，边长必须是2的幂，现在不能超过2048。

简单的皮肤用 **SkinEditor** 编辑:

* 名字
* 状态
  
.. image:: /images/SkinEditor.png

* 点九

.. image:: /images/DianJiuExample.png
  
* 文字区域

.. image:: /images/TextRegionExample.png


组合皮肤用 **LayoutEditor** 编辑

图集
----

:file:`Build\\Win32\\Asserts\\UI\\Common\\*Images.xml` 对应游戏中使用的序列帧和图集。

使用 **ImageEditor** 编辑:

.. image:: /images/ImageEditor.png

* 图集名字
* 序列帧名字、播放速度
* 每一帧的大小、位置

图集一般使用 :file:`CMakeModules\\bin\\release\\Skin2Image.exe` 生成。

编辑Layout
----------

Layout 文件是 XML 文件，主要包含 **Widget** 和 **Property** 两种结点，定义一棵控件树和每个控件的属性。

主要通过两种方式编辑:

* 直接使用文件编辑器
  
* 使用 LayoutEditor 
  
  .. image:: /images/LayoutEditor.png

  * 左侧 Hierarchy : 选择控件，隐藏、显示控件
  * 右侧属性栏: 编辑当前选中控件的属性，每个属性在 ``virtual void Widget::setPropertyOverride(const String& _key, const String& _value)`` 中有一段对应的代码。
    
    * 基本属性
      
      * 对齐方式: 现在大部分控件选择 **ScalePos ScaleSize**
      * 控件名: 在Lua脚本中通过这个名字引用控件
      * 位置、大小
      * 皮肤名，通过
      * 控件类型
        
    * 针对控件类型的属性
 
  * 中间工作区:
    
    * 选择控件，连续点击选择父控件  
    * 创建、删除控件
    * 编辑控件的大小和位置
      
      * 鼠标拖拽
      * 属性框
      * 菜单 Edit -> Align*
      * 菜单 Edit -> ScaleMode
        
    * 复制、剪切、粘贴控件

  * 菜单 File -> Test 
    
  .. image:: /images/LayoutEditorSettings.png

  * 工作区的大小
  * 资源加载路径
  * 资源名
  * 文本编辑器，配合菜单 Edit -> EditXML EditLua使用

控件的属性
----------

.. image:: /images/ButterflyGraph-Widget.png

**LayoutEditor** 中控件的属性对应 Layout 文件中的 **Property** 结点

不同类型的控件有不同的属性，以 Button 的属性 ClickEvent 为例: 

* :file:`LoginLayout.layout` 中有一个 Button 的 ClickEvent 是 ``<Property key="ClickEvent" value="Login_Regist_OnRegist();"/>``
* MyGUI 加载这个 Layout 创建这个 Button 时会调用 ``void Button::setPropertyOverride(const String& _key, const String& _value)``，赋值
  给 ``String Button::mClickEvent``
* 这个 Button 被点击时触发 ``void Button::onClickEvent(MyGUI::Widget* _sender)`` , 调用对应的 Lua 函数。

调用Lua函数
-----------

* 加载、卸载界面时， **NoahCore** 中的 **KUIWindow** 分别调用脚本中的 ``_OnLoad`` 和 ``_OnUnLoad`` 函数
* UI 事件: **MyGUI** 通过 ``virtual void ScriptInterface::fireUIEventHandler(const String& strHandle, const Widget* pWidget)`` 调用Lua函数
* 游戏事件: 

  * Lua 脚本中的 ``_OnRegisterListener()`` 通过 NoahCore 中的 ``virtual void IEventSystem::RegisterListener(INT nEventID, IEventListener* pListener)`` 注册响应的事件

  * 调用 ``virtual void IEventSystem::FireEvent(INT nEventID)`` 会触发对应 Lua 脚本中的 ``_OnFireEvent(eventID)`` 函数
  
    * NoahCore 中调用下列函数::
      
        void KEventSystem::FireEvent(INT nEventID);
        void KEventSystem::FireEvent(INT nEventID, INT nArg);
        void KEventSystem::FireEvent(INT nEventID, INT nArg1, INT nArg2);
        void KEventSystem::FireEvent(INT nEventID, GameEvent& rGameEvent);

    * UC 脚本中调用 :file:`KNoahEngineSystem.uc` 中的 ::

        native function FireEvent(int nEventID, optional const out array<int> Args);
        function FireEventX(int nEventID, int nArg0)
        function FireEventXX(int nEventID, int nArg0, int nArg1)
        function FireEventXXX(int nEventID, int nArg0, int nArg1, int nArg2)
      
Lua脚本中可调用的接口
---------------------

* NoahCore 中的接口定义在以下文件中，大部分是控件相关的::
  
    UIScriptControler_Button
    UIScriptControler_EditBox
    UIScriptControler_ImageBox
    UIScriptControler_ItemBox
    UIScriptControler_ProgressBar
    UIScriptControler_ScrollView
    UIScriptControler_TabControl
    UIScriptControler_TextBox
    UIScriptControler_TreeControl
    UIScriptControler_Widget
    UIScriptControler_Window

* UC 脚本中的接口定义在以下文件中，主要是游戏逻辑::
  
    KScriptControler_Avatar.uc
    KScriptControler_Guide.uc
    KScriptControler_Hero.uc
    KScriptControler_Player.uc
    KScriptControler_Proc.uc
    KScriptControler_Room.uc