======================================
IFactory、IFactoryItem和FactoryManager
======================================

IFactory
========

    模板类\ *FactoryTemplate*\ 是\ *IFactory*\ 的子类，实现了接口\ ``virtual IFactoryItem* CreateItem()``，通过以下两种方式使用:

    * 宏\ ``FACTORY_ITEM(type)``\ : 分配一个\ **type**\ 类型的\ *IFactory*\ ，注册到\ *FactoryManager*\ 中。

    * 宏\ ``FACTORY_ITEM_ATTRIBUTE(type)``\ : 实现模块类\ ``FactoryItemRegistrator<type>``\ 的一个静态对象，
      在这个类的构造函数中分配一个\ **type**\ 类型的\ *IFactory*\ ，注册到\ *FactoryManager*\ 中。

    .. note::
        相比\ *FACTORY_ITEM*\ ，\ *FACTORY_ITEM_ATTRIBUTE*\ 会检查\ **type**\ 是否已经被注册过。\ *FACTORY_ITEM*\ 只在
        ``void ComponentFactory::Initialise()``\ 中使用，不必担心重复。



IFactoryItem
============

    *IFactoryItem*\ 攘括了各个Editor中所有需要动态生成的元素，继承关系如下:
        
.. image:: /images/ButterflyGraph-IFactoryItem.png

FactoryManager
==============
    *FactoryManager*\ 负责管理所有\ *IFactory*\ ，通过\ ``template <typename Type>Type* CreateItem(const std::string& _factoryName)``
    创建新的\ *IFactoryItem*\ 。
    
    通常情况下，\ **_factoryName**\ 是子类的名字(例如\ *ColourPanel*\ )，\ **Type**\ 是基类(例如\ *Control*\ )，
    用子类的名字生成具体的\ *IFactoryItem*\ ，然后通过基类的接口进行操作。