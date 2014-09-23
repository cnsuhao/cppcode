wraps::BaseLayout
=================

*BaseLayout* 对应编辑器中各种组合控件，例如:

*PropertyFieldSkin* : 
    .. figure:: /images/PropertyFieldSkin.png

*PropertyFieldColour* : 
    .. image:: /images/PropertyFieldColourExample.png

*ColourPanel* : 
    .. image:: /images/ColourPanel.png

继承关系
--------

.. image:: /images/ButterflyGraph-BaseLayout.png

加载
----

每个 *BaseLayout* 对应一个 **layout** 文件。

函数 ``void BaseLayout::initialise(const std::string& _layout, MyGUI::Widget* _parent = nullptr, bool _throw = true, bool _createFakeWidgets = true)`` 
加载  **layout** 文件生成一个 ``MyGUI::Widget*`` 赋给 ``mMainWidget`` ，然后通过函数 ``void BaseLayout::snapToParent(MyGUI::Widget* _child)`` 缩放 ``mMainWidget`` 以适应父控件 ``_parent`` 。

绑定子控件
----------

以下两个函数用于查找、绑定子控件::

    template <typename T>
    void BaseLayout::assignWidget(T * & _widget, const std::string& _name, bool _throw = true, bool _createFakeWidgets = true)

    template <typename T>
    void BaseLayout::assignBase(T * & _widget, const std::string& _name, bool _throw = true, bool _createFakeWidgets = true)

用 ``_name`` 查找到 ``MyGUI::Widget* find`` 后， ``assignWidget`` 将 ``find`` 直接赋给 ``_widget`` , ``assignBase`` 用 ``find`` 作为参数构造一个新的 ``T`` 赋给 ``_widget`` 。

两种模式
--------

模式一:
    * 在构造函数中直接指定 **layout** 文件的名字。
    * 直接调用 ``assignWidget`` 或 ``assignBase`` 绑定子控件。

模式二:
    * 使用 ``ATTRIBUTE_CLASS_LAYOUT`` 注册 **layout** 文件的名字。
    * 使用 ``ATTRIBUTE_FIELD_WIDGET_NAME`` 绑定子控件的名字。
    * 使用以下两个函数之一加载 **layout** 文件、绑定子控件::
      
        template <typename Type>
        void BaseLayout::initialiseByAttributes(Type* _owner, MyGUI::Widget* _parent = nullptr, bool _throw = true, bool _createFakeWidgets = true)
        template <typename Type>
        void Control::InitialiseByAttributes(Type* _owner, MyGUI::Widget* _parent = nullptr, bool _throw = true, bool _createFakeWidgets = true)

.. seealso::
    在 :file:`Media` 下查找 **layout** 文件，结合这些文件理解 *BaseLayout* 加载 **layout** 、绑定子控件的机制。