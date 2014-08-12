OgreTexture
===========

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