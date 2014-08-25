.. _myguiengine-Widget:

Widget
======

*Widget*\ 的继承关系如图:

    .. image:: /images/ButterflyGraph-Widget.png

父类
----

* *ICroppedRectangle*\ 存储控件的位置信息，其中\ ``IntRect mMargin;``\ 对应被父控件遮挡的部分。
* *LayerItem*\ 存储的信息决定了控件被渲染的顺序，\ *SkinItem*\ 存储皮肤相关的信息。

  * *LayerItem*\ 的\ ``VectorSubWidget mDrawItems;``\ 与\ *SkinItem*\ 的\ ``VectorSubWidget mSubSkinChild;``\ 
    功能重复，都对应用\ **点九**\ 划分的各个区域，不过存储的都是\ *ISubWidget\**\ ，所以无所谓。

    .. note::  *SkinItem*\ 更新这些\ *ISubWidget*\ 的状态，\ *LayerItem*\ 负责渲染它们。

  * ``void SkinItem::_resortTexture()``\ 强制控件在下一轮\ :ref:`渲染 <engine-RenderStages>`\ 时刷新。

* *UserData*\ 存储\ *Any*\ 和\ *MapString*\ 类型的数据。

.. _myguiengine-WidgetInput:

* *WidgetInput*\ 响应 :ref:`MyGUI::InputManager <myguiengine-InputManager>` 通过下列函数注入的各种鼠标、键盘输入事件::

		void _riseMouseLostFocus(Widget* _new);
		void _riseMouseSetFocus(Widget* _old);
		void _riseMouseDrag(int _left, int _top, MouseButton _id);
		void _riseMouseMove(int _left, int _top);
		void _riseMouseWheel(int _rel);
		void _riseMouseButtonPressed(int _left, int _top, MouseButton _id);
		void _riseMouseButtonReleased(int _left, int _top, MouseButton _id);
		void _riseMouseButtonClick();
		void _riseMouseButtonDoubleClick();
		void _riseKeyLostFocus(Widget* _new);
		void _riseKeySetFocus(Widget* _old);
		void _riseKeyButtonPressed(KeyCode _key, Char _char);
		void _riseKeyButtonReleased(KeyCode _key);
		void _riseMouseChangeRootFocus(bool _focus);
		void _riseKeyChangeRootFocus(bool _focus);

		void _setRootMouseFocus(bool _value);
		void _setRootKeyFocus(bool _value);
  
  通过下列函数响应这些事件::

		virtual void onMouseLostFocus(Widget* _new);
		virtual void onMouseSetFocus(Widget* _old);
		virtual void onMouseDrag(int _left, int _top, MouseButton _id);
		virtual void onMouseMove(int _left, int _top);
		virtual void onMouseWheel(int _rel);
		virtual void onMouseButtonPressed(int _left, int _top, MouseButton _id);
		virtual void onMouseButtonReleased(int _left, int _top, MouseButton _id);
		virtual void onMouseButtonClick();
		virtual void onMouseButtonDoubleClick();
		virtual void onKeyLostFocus(Widget* _new);
		virtual void onKeySetFocus(Widget* _old);
		virtual void onKeyButtonPressed(KeyCode _key, Char _char);
		virtual void onKeyButtonReleased(KeyCode _key);
		virtual void onMouseChangeRootFocus(bool _focus);
		virtual void onKeyChangeRootFocus(bool _focus);

  通过下列代理通知其他模块::

		EventHandle_WidgetWidget eventMouseLostFocus;
  	EventHandle_WidgetWidget eventMouseSetFocus;
  	EventPairAddParameter<EventHandle_WidgetIntInt, EventHandle_WidgetIntIntButton> eventMouseDrag;
  	EventHandle_WidgetIntInt eventMouseMove;
  	EventHandle_WidgetInt eventMouseWheel;
  	EventHandle_WidgetIntIntButton eventMouseButtonPressed;
  	EventHandle_WidgetIntIntButton eventMouseButtonReleased;
  	EventHandle_WidgetVoid eventMouseButtonClick;
  	EventHandle_WidgetVoid eventMouseButtonDoubleClick;
  	EventHandle_WidgetWidget eventKeyLostFocus;
  	EventHandle_WidgetWidget eventKeySetFocus;
  	EventHandle_WidgetKeyCodeChar eventKeyButtonPressed;
  	EventHandle_WidgetKeyCode eventKeyButtonReleased;
  	EventHandle_WidgetBool eventRootMouseChangeFocus;
  	EventHandle_WidgetBool eventRootKeyChangeFocus;
  	EventHandle_WidgetToolTip eventToolTip;

Self
----

* *Widget*\ 中主要包括两类信息:
  
  * 基本属性(\ ``bool mEnabled; bool mInheritsEnabled; bool mInheritsVisible; float mAlpha;``\ 等等)
  * 父子关系:
    
    * ``Widget* mParent;`` //父控件
    * ``VectorWidgetPtr mWidgetChild;`` //子控件
    * ``VectorWidgetPtr mWidgetChildSkin;`` //皮肤中的子控件
    * ``Widget* mWidgetClient;`` //皮肤中名为\ **Client**\ 的子控件

* *Widget*\ 的皮肤参数有两种:
  
  * *ResourceSkin*\ :真正的皮肤,作为\ ``void SkinItem::_createSkinItem(ResourceSkin* _info)``\ 的参数

    .. note:: *ResourceSkin* 通过 ``ResourceSkin* SkinManager::getByName(const std::string& _name) const`` 查找。
  
  * *ResourceLayout*\ :一棵控件树，根结点的控件名必须为\ **Root**\ 。将\ *ResourceLayout*\ 作为控件的皮肤参数时:
 
    * 根据\ **Root**\ 的\ **skin**\ 属性，获得对应的\ *ResourceSkin*\ 作为当前控件的皮肤。
    * 生成\ **Root**\ 的子控件，加入到\ ``VectorWidgetPtr mWidgetChildSkin;``\ 中。

* *Widget*\ 主要通过\ ``Widget* Widget::baseCreateWidget(WidgetStyle _style, const std::string& _type, const std::string& _skin, const IntCoord& _coord, Align _align, const std::string& _layer, const std::string& _name, bool _template)``\ 生成子控件:

  * 如果是皮肤中的子控件，塞到\ ``VectorWidgetPtr mWidgetChildSkin;``\ 中
  * 如果是普通的子控件，而且\ ``Widget* mWidgetClient;``\ 不空，则通过\ ``mWidgetClient->baseCreateWidget(_style, _type, _skin, _coord, _align, _layer, _name, _template);``\ 递归生成子控件。
  * 其他情况，生成子控件后，塞到\ ``VectorWidgetPtr mWidgetChild;``\ 中
    
WidgetManager
-------------

* 创建、删除 *Widget*
* 删除 *Widget* 时，通知所有 *IUnlinkWidget* ,因为它们可能存储指向这个 *Widget* 的指针。 *IUnlinkWidget* 的子类包括:
  
  .. image:: /images/ButterflyGraph-IUnlinkWidget.png

子类
----

ScrollView
~~~~~~~~~~

*ScrollView*\ 封装了滚动区域的基本功能，继承关系如下:

.. image:: /images/ButterflyGraph-ScrollView.png

*ScrollView*\ 的皮肤中至少需要三个控件，类型和名字如下::

  type="Widget" name="Client" // 显示区域
  type="ScrollBar" name="VScroll" // 垂直滚动条
  type="ScrollBar" name="HScroll" // 水平滚动条

*ScrollView*\ 中的\ **mRealClient**\ 就是所谓的\ **Canvas**\ ，在LayoutEditor中为ScrollView添加的子控件会成为\ **mRealClient**\ 的子控件。

*ScrollView*\ 响应以下事件::

    //用滚轮移动mRealClient
    mRealClient->eventMouseWheel

    //拖拽mRealClient
    mRealClient->eventMouseDrag
    mRealClient->eventMouseButtonPressed
    mRealClient->eventMouseButtonReleased

    //响应滚动条的位置变化
    mHScroll->eventScrollChangePosition
    mVScroll->eventScrollChangePosition

ScrollViewBase
~~~~~~~~~~~~~~

*ScrollViewBase*\ 代表滚动区域，继承关系如下:

.. image:: /images/ButterflyGraph-ScrollViewBase.png

*ScrollViewBase*\ 包含三个子控件，构成滚动区域::

  ScrollBar* mVScroll; // 垂直滚动条
  ScrollBar* mHScroll; // 水平滚动条
  Widget* mClient; // 显示区域

*ScrollViewBase*\ 主要通过以下两个函数更新滚动区域的状态::

  void updateScrollSize(); // 更新滚动条是否可见，调整三个子控件的大小；这个函数中的代码比较冗余。
  void updateScrollPosition(); // 更新Content的显示位置和滚动条的位置，当Content的宽度或高度小于显示区域时，显示位置会受到对齐方式的影响。