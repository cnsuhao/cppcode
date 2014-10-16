========
Warnings
========

客户端
~~~~~~

* 游戏客户端第一次启动时，会编译 shader 并保存，但是如果游戏编辑器已经启动，则游戏客户端不会保存 shader 。
    .. image:: /images/RogAutoSaveShader.png

服务端
~~~~~~

* ``BOOL BasicConfigManager::ParseGameType( TiXmlElement* pElem )``\ 中的\ ``Assert(nTypeID > GTI_INVALID && nTypeID < GTI_NUM, FALSE);``
    有时候会莫名其妙触发，把 Server 重编一下会变好。