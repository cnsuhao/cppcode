===========
UndoManager
===========

*UndoManager*\ 用于\ *LayoutEditor*\ ，提供的接口包括::

	//UndoManager使用PR_*代表动作的类型，如果两个连续动作的类型相同，第一个动作的效果会被覆盖
	void undo();
	void redo();
	void addValue(int _property = PR_DEFAULT);//增加一个动作

	Event_Changes eventChanges;//通知其他模块

	//以下两个函数用于绑定LayoutEditor的菜单选项
	void commandUndo(const MyGUI::UString& _commandName, bool& _result);
	void commandRedo(const MyGUI::UString& _commandName, bool& _result);

*UndoManager*\ 使用以下数据成员存储所有动作::

	EditorWidgets* mEditorWidgets; //指向LayoutEditor中当前编辑的控件树， 可以存储为一个xml，也可以从xml中加载
	CyclicBuffer<MyGUI::xml::Document*> mOperations; // 存储每个动作对应的控件树。