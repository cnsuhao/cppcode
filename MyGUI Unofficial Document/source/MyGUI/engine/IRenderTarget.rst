MyGUI::IRenderTarget
====================

执行渲染操作::

	virtual void begin() = 0;
	virtual void end() = 0;

	virtual void doRender(IVertexBuffer* _buffer, ITexture* _texture, size_t _count) = 0;

	//好像没用
	virtual void doRotatedRender(IVertexBuffer* _buffer, ITexture* _texture, size_t _count, float _angle, float _centerX, float _centerY) = 0;

	virtual const RenderTargetInfo& getInfo() = 0;

*RenderTargetInfo*\ 中的\ ``float hOffset;``\ 和\ ``float vOffset;``\ 是指一个象素中网格点的位置，通常是中心(0.5)或左上角(0)。