MyGUI::IDataStream
==================

*IDataStream*\ 定义了以下接口,用于加载资源时读字节流::

	virtual bool eof() = 0;
	virtual size_t size() = 0;
    virtual void seek(size_t offset) = 0;
	virtual void readline(std::string& _source, Char _delim = '\n') = 0;
	virtual size_t read(void* _buf, size_t _count) = 0;

*IDataStream*\ 的类继承关系如图:

.. image:: /images/ButterflyGraph-IDataStream.png

* *OgreDataStream*\ 通过\ *Ogre::DataStream*\ 读数据，主要用于加载资源。
* *DataStream*\ 和\ *DataFileStream*\ 通过\ *std::istream*\ 和\ *std::ifstream*\ 读数据，主要用于读xml文件。
* *DataMemoryStream*\ 直接从内存中读数据，不知道在哪里用到。