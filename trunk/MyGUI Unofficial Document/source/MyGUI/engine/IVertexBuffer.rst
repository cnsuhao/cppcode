MyGUI::IVertexBuffer
====================

定义了如下接口，用于写顶点数据::

	virtual void setVertexCount(size_t _value) = 0;
	virtual size_t getVertexCount() = 0;

	virtual Vertex* lock() = 0; // 返回一个指针，用于写顶点数据
	virtual void unlock() = 0;

.. seealso:: 

	:doc:`../OgrePlatform/OgreVertexBuffer`
		\ 