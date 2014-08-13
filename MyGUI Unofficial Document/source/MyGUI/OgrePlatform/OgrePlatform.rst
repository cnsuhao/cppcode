OgrePlatform
============

:file:`OgrePlatform`\ 文件夹下的源文件实现了\ :doc:`../engine/engine`\ 中的几个抽象类:

* *OgreDataManager*\ 实现了\ :doc:`../engine/DataManager`\ ，用于查找和加载资源
* *OgreDataStream*\ 实现了\ :doc:`../engine/IDataStream`\ ,用于加载资源时读字节流
* :ref:`OgreVertexBuffer <OgrePlatform-OgreVertexBuffer>`\ 实现了\ :doc:`../engine/IVertexBuffer`\ ，用于写顶点数据
* :ref:`OgreTexture <OgrePlatform-OgreTexture>`\ 实现了\ :doc:`../engine/ITexture`
* *OgreRTTexture*\ 实现了\ :doc:`../engine/IRenderTarget`\ ，将一个\ *Ogre::Texture*\ 作为渲染的目标，为它添加一个\ 
  *ViewPort*\ ,并注册到\ *Ogre::RenderSystem*\ 。
* :ref:`OgreRenderManager <OgrePlatform-OgreRenderManager>`\ 实现了\ :doc:`../engine/IRenderTarget`\ ，


类\ *OgrePlatform*\ 主要用于\ :doc:`../editor/editor`\ :

*OgrePlatform*\ 中分配了三个\ *Manager*\ ，其他模块(主要是\ :doc:`../engine/engine`\ )通过各个\ *Manager*\ 的\ ``getInstance()``\ 使用它们::

	mLogManager = new LogManager();
	mRenderManager = new OgreRenderManager();
	mDataManager = new OgreDataManager();

.. seealso::
	
	LogManager
		\ 


.. _OgrePlatform-OgreRenderManager:

OgreRenderManager
~~~~~~~~~~~~~~~~~

*OgreRenderManager*\ 不仅是\ :doc:`../engine/IRenderTarget`\ 的子类:

.. image:: /images/ButterflyGraph-OgreRenderManager.png


*OgreRenderManager*\ 主要包括以下接口:

.. cpp:function:: void OgreRenderManager::renderQueueStarted(Ogre::uint8 queueGroupId, const Ogre::String& invocation, bool& skipThisInvocation)
	
	继承自\ ``Ogre::RenderQueueListener``\ ，如果已经到了渲染\ ``Ogre::RENDER_QUEUE_OVERLAY``\ 的阶段，开始绘制UI

.. cpp:function:: void OgreRenderManager::windowResized(Ogre::RenderWindow* _window)

	继承自\ ``Ogre::WindowEventListener``\ ,在窗口改变大小时，根据对齐方式调整所有控件的大小和位置。

.. _OgrePlatform-OgreTexture:

OgreTexture
~~~~~~~~~~~

实现了\ :doc:`../engine/ITexture`\ ,同时还是\ *Ogre::ManualResourceLoader*\ 的子类::

	//将MyGUI中的PixelFormat和TextureUsage转换为Ogre中的对应类型
	static Ogre::TextureUsage convertUsage(TextureUsage _usage);
	static Ogre::PixelFormat convertFormat(PixelFormat _format);

	//继承自ITexture，如果写数据，目标是缓冲区，如果读数据，目标是缓冲区的拷贝
	virtual void* lock(TextureUsage _access);

	//继承自ManualResourceLoader，在这个函数里刷新Texture
	virtual void loadResource(Ogre::Resource* resource);

.. seealso:: 

	:doc:`../engine/ITexture`
		\ 

.. _OgrePlatform-OgreVertexBuffer:

OgreVertexBuffer
~~~~~~~~~~~~~~~~

实现了\ :doc:`../engine/IVertexBuffer`\ ，存储顶点数据及其格式，用于后续的渲染:

* ``Ogre::RenderOperation mRenderOperation;``\ :定义渲染的方式
	* ``mRenderOperation.vertexData->vertexDeclaration``\ : 顶点数据的格式
	* ``mRenderOperation.vertexData->vertexBufferBinding``\ : 绑定到\ ``mVertexBuffer``
	* ``mRenderOperation.operationType``\ : 绘制顶点的方式
* ``Ogre::HardwareVertexBufferSharedPtr mVertexBuffer;``\ :存储顶点数据，其他模块通过\ ``Vertex* OgreVertexBuffer::lock()``\ 
  向这个缓冲区中写顶点数据。
* ``size_t mVertexCount;``\ :缓冲区的大小，根据\ ``size_t mNeedVertexCount;``\ 分配