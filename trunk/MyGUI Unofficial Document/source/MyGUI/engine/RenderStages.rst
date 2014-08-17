渲染的流程
==========

* ``void OgreRenderManager::renderQueueStarted(Ogre::uint8 queueGroupId, const Ogre::String& invocation, bool& skipThisInvocation)``

  响应引擎的通知，开始渲染\ **UI**

* ``void RenderManager::onRenderToTarget(IRenderTarget* _target, bool _update)``
* ``void LayerManager::renderToTarget(IRenderTarget* _target, bool _update)``
* ``virtual void ILayer::renderToTarget(IRenderTarget* _target, bool _update)``
  
  依次渲染每个\ *ILayer*

* ``virtual void ILayerNode::renderToTarget(IRenderTarget* _target, bool _update)``
* ``void RenderItem::renderToTarget(IRenderTarget* _target, bool _update)``

  递归地渲染每个\ *ILayerNode*\ 。

  每个\ *ILayer*\ 包括若干\ *ILayerNode*\ ，\ *ILayerNode*\ 之间可能存在父子关系。

  在以下两种情况下,\ *ILayerNode*\ 通过\ *RenderItem*\ 执行实际的渲染。
    * 需要刷新整个\ **UI**\ 时(例如窗口大小改变)
    * 控件属性发生变化需要重新渲染时(\ *RenderItem*\ 的\ ``mOutOfDate``\ 为真)
  
.. note:: 如果位置重叠的控件之间没有父子关系，那么它们的层次由渲染的顺序决定。
   如果只有一个控件的\ ``mOutOfDate``\ 变为真，下一轮只有它会被重新渲染，出现在其他控件的上方。

      查找\ ``void RenderItem::outOfDate()``\ 的引用，看看哪些属性的改变会使控件重新被渲染。
      
* ``virtual void ISubWidget::doRender(RenderItem* _render)``
* ``virtual void IRenderTarget::doRender(IVertexBuffer* _buffer, ITexture* _texture, size_t _count)``

  ISubWidget根据\ :ref:`ITexture <myguiengine-ITexture>`\ 将顶点数据写入\ :ref:`IVertexBuffer <myguiengine-IVertexBuffer>`\ ，\ :ref:`IRenderTarget <myguiengine-IRenderTarget>`\ 调用引擎的接口渲染这些数据。  