OgreVertexBuffer
================

实现了\ :doc:`../engine/IVertexBuffer`\ ，存储顶点数据及其格式，用于后续的渲染:

* ``Ogre::RenderOperation mRenderOperation;``\ :定义渲染的方式
	* ``mRenderOperation.vertexData->vertexDeclaration``\ : 顶点数据的格式
	* ``mRenderOperation.vertexData->vertexBufferBinding``\ : 绑定到\ ``mVertexBuffer``
	* ``mRenderOperation.operationType``\ : 绘制顶点的方式
* ``Ogre::HardwareVertexBufferSharedPtr mVertexBuffer;``\ :存储顶点数据，其他模块通过\ ``Vertex* OgreVertexBuffer::lock()``\ 
  向这个缓冲区中写顶点数据。
* ``size_t mVertexCount;``\ :缓冲区的大小，根据\ ``size_t mNeedVertexCount;``\ 分配