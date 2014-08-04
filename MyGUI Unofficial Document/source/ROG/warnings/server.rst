Server
======

* ``BOOL BasicConfigManager::ParseGameType( TiXmlElement* pElem )``\ 中的\ ``Assert(nTypeID > GTI_INVALID && nTypeID < GTI_NUM, FALSE);``
	有时候会莫名其妙触发，把Server重编一下会变好。