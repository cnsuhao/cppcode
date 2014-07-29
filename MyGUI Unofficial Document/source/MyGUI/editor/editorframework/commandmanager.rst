==============
CommandManager
==============

*CommandManager*\ 执行的\ *Command*\ 和\ *CommandData*\ 都是字符串，
每个\ *Command*\ 对应一个参数为\ ``const MyGUI::UString&, bool&``\ 的函数，
执行\ *Command*\ 就会触发对应的函数。

命令与函数的对应关系存储在成员\ ``MapEvent mEvents;``\ 中。

添加命令、注册函数、执行命令都与\ ``EventType* getEvent(const MyGUI::UString& _command);``\ 有关。