MyGUI::ITexture
===============

定义了如下接口，用于读、写、创建材质，设置材质的各种属性::

	virtual const std::string& getName() const = 0;

	//创建、加载、保存材质
	virtual void createManual(int _width, int _height, TextureUsage _usage, PixelFormat _format) = 0;
	virtual void loadFromFile(const std::string& _filename) = 0;
	virtual void saveToFile(const std::string& _filename) = 0;
    virtual void loadFromMemory(const void* _memory) = 0;
    virtual void loadFromCodecMemory(const void* _memory, int _len, const std::string& _type) = 0;

    //ITexture无效时，通知_listener
	virtual void setInvalidateListener(ITextureInvalidateListener* _listener) { }

	virtual void destroy() = 0;

	//锁定缓冲区
	virtual void* lock(TextureUsage _access) = 0;
	virtual void unlock() = 0;
	virtual bool isLocked() = 0;

	//宽、高、颜色属性
	virtual int getWidth() = 0;
	virtual int getHeight() = 0;
	virtual PixelFormat getFormat() = 0;
	virtual TextureUsage getUsage() = 0;
	virtual size_t getNumElemBytes() = 0;

	//作为渲染的对象
	virtual IRenderTarget* getRenderTarget()
	{
		return nullptr;
	}

*ITextureInvalidateListener*\ 是\ *MyGUI::Canvas*\ 的父类，定义了一个接口\ ``virtual void textureInvalidate(ITexture* _texture) = 0;``\ ,
用于刷新\ *ITexture*\ 。

.. seealso:: 

	:doc:`../OgrePlatform/OgreTexture`
		\ 


