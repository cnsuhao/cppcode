创建对象
========

*FactoryManager* 负责创建对象：

* 创建对象通过 ``IObject* FactoryManager::createObject(const std::string& _category, const std::string& _type)`` 进行,
  根据类型名查找、调用对应的 *Delegate* 创建一个新的对象。

* | 类型名与 *Delegate* 的对应关系存储在 ``MapRegisterFactoryItem mRegisterFactoryItems;`` 中。
  | ``void registerFactory(const std::string& _category, const std::string& _type, Delegate::IDelegate* _delegate);``
  | 用于注册这些信息。