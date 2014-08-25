数据
----

=========================
DataType和DataTypeManager
=========================

*SkinEditor*\ 、\ *ImageEditor*\ 、\ *FontEditor*\ 使用\ *DataType*\ 和\ *DataTypeManager*\ 管理可编辑的数据的类型。

*DataTypeManager*\ 管理一个\ *DataType*\ 类型数组，这些\ *DataType*\ 之间存在父子关系。

*DataTypeManager*\ 从\ **xml**\ 文件中加载\ *DataType*\ 数据，三个编辑器对应的\ *DataType*\ 文件分别是:

	:file:`MyGUI/Media/Tools/FontEditor/FontDataType.xml`

	:file:`MyGUI/Media/Tools/ImageEditor/ImageDataType.xml`

	:file:`MyGUI/Media/Tools/SkinEditor/SkinDataType.xml`

这些\ **xml**\ 文件中\ *DataType*\ 的父子关系对应编辑器中数据的层次关系。

.. hint:: 比较\ :file:`SkinDataType.xml`\ 和\ *SkinEditor*\ ,为什么选择不同的\ **States**\ 不会影响对\ **Separators**\ 的选择?

=================
Data和DataManager
=================

*DataManager*\ 管理一个由\ *DataPtr*\ 组成的树，这棵树代表编辑器中的所有数据。

*Data*\ 主要包括以下数据成员，用于存储\ *Property*\ 和父子关系::

	DataPtr mParent;
	VectorData mChilds;
	MapProperty mProperties;

*Property*\ 主要包括以下数据成员::

	std::string mValue;
	DataTypePropertyPtr mType; 
	DataPtr mOwner;

*DataTypeProperty*\ 主要包括以下数据成员::

	std::string mName;
	std::string mType;
	// 以下两个成员提供默认值
	std::string mDefaultValue;
	std::string mInitialisator;
	bool mReadOnly;
	bool mVisible; // 在编辑器上是否显示这个Property
	std::string mAction; //更改Property时执行这个Action

*DataTypeProperty*\ 和\ :doc:`propertycontrol`\ 有比较密切的关系。

*DataManager*\ 主要通过\ :doc:`iexportserializer`\ 读写数据。