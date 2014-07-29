===============
PropertyControl
===============

*PropertyControl*\ 对应编辑器上的各种属性控件，类继承如图:

.. image:: /images/ButterflyGraph-PropertyControl.png

*PropertyControl*\ 主要包括以下成员和接口::

	PropertyPtr mProperty;
	void setProperty(PropertyPtr _value);
	PropertyPtr getProperty();

	void executeAction(const std::string& _value, bool _merge = false); // Property变化时执行相应的Action

.. hint:: 结合\ :file:`MyGUI/Media/Tools/SkinEditor/SkinDataType.xml`\ 理解\ *PropertyBoolControl*\ 的作用。
