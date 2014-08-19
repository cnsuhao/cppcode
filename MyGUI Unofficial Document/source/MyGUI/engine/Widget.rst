Widget
======

.. image:: /images/ButterflyGraph-Widget.png

* *ICroppedRectangle*\ 存储控件的位置信息，其中\ ``IntRect mMargin;``\ 对应被父控件遮挡的部分。
* *LayerItem*\ 存储的信息决定了控件被渲染的顺序，\ *SkinItem*\ 存储皮肤相关的信息。
    * *LayerItem*\ 的\ ``VectorSubWidget mDrawItems;``\ 与\ *SkinItem*\ 的\ ``VectorSubWidget mSubSkinChild;``\ 
      功能重复，都对应用\ **点九**\ 划分的各个区域，不过存储的都是\ *ISubWidget\**\ ，所以无所谓。

      .. note::  *SkinItem*\ 更新这些\ *ISubWidget*\ 的状态，\ *LayerItem*\ 负责渲染它们。

    * ``void SkinItem::_resortTexture()``\ 强制控件在下一轮\ :ref:`渲染 <engine-RenderStages>`\ 时刷新。

* *UserData*\ 存储\ *Any*\ 和\ *MapString*\ 类型的数据。
* *WidgetInput*\ 响应\ *InputManager*\ 通过下列函数注入的各种鼠标、键盘输入事件::

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
