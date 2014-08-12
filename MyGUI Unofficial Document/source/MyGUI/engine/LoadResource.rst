========
资源加载
========

ResourceManager
===============

*ResourceManager*\ 使用\ ``MapResource mResources;``\ 存储\ `IResource`_\ ，另有一组函数用于添加、删除、查找\ *IResource*\ 。

*ResourceManager*\ 使用以下数据成员和函数从各种\ **xml**\ 文件中加载\ *IResource*\ :

使用以下两个函数根据文件名加载资源::

    bool load(const std::string& _file);
    bool _loadImplement(const std::string& _file, bool _match, const std::string& _type, const std::string& _instance);

读取\ **xml**\ 文件时，根据结点\ **MyGUI**\ 的属性\ **type**\ 的值查找\ ``MapLoadXmlDelegate mMapLoadXmlDelegate;``\ ，
执行相应的加载函数，例如这两个函数::

    void loadFromXmlNode(xml::ElementPtr _node, const std::string& _file, Version _version); //
    void _loadList(xml::ElementPtr _node, const std::string& _file, Version _version);

这些函数大多通过调用\ *ISerializable*\ 中的函数\ ``virtual void deserialization(xml::ElementPtr _node, Version _version) { }``\ 加载资源。
在\ ``loadFromXmlNode``\ 执行过程中，根据\ *Resource*\ 结点的属性\ **type**\ 调用相应的函数解析\ **xml**\ 。

.. hint:: 查找\ ``LoadXmlDelegate& registerLoadXmlDelegate(const std::string& _key);``\ 的引用，结合\ :file:`Media/MyGUI_Media/MyGUI_Core.xml`\ 理解\ *ResourceManager*\ 的资源加载机制。

IResource
=========

*IResource*\ 的继承关系如图所示:

.. image:: /images/ButterflyGraph-IResource.png

.. hint:: 以\ *ResourceLayout*\ 、\ *LayoutManager*\ 、\ :file:`Media/Tools/LayoutEditor/MainMenuControl.layout`\ 为例，理解资源加载过程。

