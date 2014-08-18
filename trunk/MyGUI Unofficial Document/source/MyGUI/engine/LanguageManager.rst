多语言
======

*LanguageManager*\ 负责处理形如\ **#{hehe}**\ 的字符串，将其翻译成当前语言(汉语、英语...)。

这些对应关系\ *Tag*\ 主要存储在\ ``MapLanguageString mMapLanguage;``\ 中，\ ``std::string mCurrentLanguageName;``\ 定义当前的语言。

不同的语言对应不同的\ *Tag*\ ，这些数据主要来源于存储类似\ ``<Tag name="Account">账号:</Tag>``\ 结点的xml文件。

.. hint:: 在文件夹\ :file:`Media`\ 下搜索包含\ ``<Language``\ 结点的\ **xml**\ 文件。

字符串的翻译主要通过\ ``UString replaceTags(const UString& _line);``\ 进行，这个函数重复地遍历\ ``_line``\ ,查找、
替换形如\ **#{hehe}**\ 的字符串,直到某次遍历没有替换任何字符串。