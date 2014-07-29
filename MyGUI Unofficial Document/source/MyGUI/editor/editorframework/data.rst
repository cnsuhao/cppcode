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