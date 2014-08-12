OgreRenderManager
=================

*OgreRenderManager*\ 不仅是\ :doc:`../engine/IRenderTarget`\ 的子类:

.. image:: /images/ButterflyGraph-OgreRenderManager.png


*OgreRenderManager*\ 主要包括以下接口:

.. cpp:function:: void OgreRenderManager::renderQueueStarted(Ogre::uint8 queueGroupId, const Ogre::String& invocation, bool& skipThisInvocation)
	
	继承自\ ``Ogre::RenderQueueListener``\ ，如果已经到了渲染\ ``Ogre::RENDER_QUEUE_OVERLAY``\ 的阶段，开始绘制UI

.. cpp:function:: void OgreRenderManager::windowResized(Ogre::RenderWindow* _window)

	继承自\ ``Ogre::WindowEventListener``\ ,在窗口改变大小时，根据对齐方式调整所有控件的大小和位置。