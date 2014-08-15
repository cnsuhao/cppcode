抽象类
======

.. _myguiengine-IDataStream:

MyGUI::IDataStream
------------------

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

.. _myguiengine-DataManager:

MyGUI::DataManager
------------------

*DataManager*\ 定义了以下接口，用于查找和加载资源::

    virtual IDataStream* getData(const std::string& _name) = 0;
    virtual void freeData(IDataStream* _data) = 0;
    virtual bool isDataExist(const std::string& _name) = 0;
    virtual const VectorString& getDataListNames(const std::string& _pattern) = 0;
    virtual const std::string& getDataPath(const std::string& _name) = 0;

.. _myguiengine-IVertexBuffer:

MyGUI::IVertexBuffer
--------------------

定义了如下接口，用于写顶点数据::

    virtual void setVertexCount(size_t _value) = 0;
    virtual size_t getVertexCount() = 0;

    virtual Vertex* lock() = 0; // 返回一个指针，用于写顶点数据
    virtual void unlock() = 0;

.. seealso:: 

    :ref:`OgreVertexBuffer <OgrePlatform-OgreVertexBuffer>`
        \ 
  
.. _myguiengine-IRenderTarget:

MyGUI::IRenderTarget
--------------------

执行渲染操作::

    virtual void begin() = 0;
    virtual void end() = 0;

    virtual void doRender(IVertexBuffer* _buffer, ITexture* _texture, size_t _count) = 0;

    //好像没用
    virtual void doRotatedRender(IVertexBuffer* _buffer, ITexture* _texture, size_t _count, float _angle, float _centerX, float _centerY) = 0;

    virtual const RenderTargetInfo& getInfo() = 0;

*RenderTargetInfo*\ 中的\ ``float hOffset;``\ 和\ ``float vOffset;``\ 是指一个象素中网格点的位置，通常是中心(0.5)或左上角(0)。

.. _myguiengine-ITexture:

MyGUI::ITexture
---------------

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

    :ref:`OgreTexture <OgrePlatform-OgreTexture>`
        \ 
