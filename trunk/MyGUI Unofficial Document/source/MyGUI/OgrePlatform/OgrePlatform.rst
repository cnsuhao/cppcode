OgrePlatform
============

:file:`OgrePlatform`\ 文件夹下的源文件实现了\ :doc:`../engine/engine`\ 中的几个抽象类:

* *OgreDataStream*\ 实现了\ :doc:`../engine/IDataStream`\ ,用于加载资源时读字节流
* *OgreDataManager*\ 实现了\ :doc:`../engine/DataManager`\ ，用于查找和加载资源
* :doc:`OgreVertexBuffer`\ 实现了\ :doc:`../engine/IVertexBuffer`\ ，用于查找和加载资源
* :doc:`OgreTexture`\ 实现了\ :doc:`../engine/ITexture`\ ，用于查找和加载资源
* *OgreRTTexture*\ 实现了\ :doc:`../engine/IRenderTarget`\ ，将一个\ *Ogre::Texture*\ 作为渲染的目标，为它添加一个\ 
  *ViewPort*\ ,并注册到\ *Ogre::RenderSystem*\ 。
* :doc:`OgreRenderManager`\ 实现了\ :doc:`../engine/IRenderTarget`\ ，


类\ *OgrePlatform*\ 主要用于\ :doc:`../editor/editor`\ :

*OgrePlatform*\ 中分配了三个\ *Manager*\ ，其他模块(主要是\ :doc:`../engine/engine`\ )通过各个\ *Manager*\ 的\ ``getInstance()``\ 使用它们::

	mLogManager = new LogManager();
	mRenderManager = new OgreRenderManager();
	mDataManager = new OgreDataManager();

.. seealso::
	
	LogManager
		\ 