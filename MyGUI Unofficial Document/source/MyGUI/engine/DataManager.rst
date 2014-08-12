MyGUI::DataManager
==================

*DataManager*\ 定义了以下接口，用于查找和加载资源::

	virtual IDataStream* getData(const std::string& _name) = 0;
	virtual void freeData(IDataStream* _data) = 0;
	virtual bool isDataExist(const std::string& _name) = 0;
	virtual const VectorString& getDataListNames(const std::string& _pattern) = 0;
	virtual const std::string& getDataPath(const std::string& _name) = 0;