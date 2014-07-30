=============================
StateManager和StateController
=============================

StateManager
============

\ ``VectorStateController mStates;``\ 存储\ `StateController`_\ ，通过下列函数操作这个栈::

	void pushState(StateController* _state);
	void pushState(const std::string& _stateName);
	void popState();
	bool getStateActivate(StateController* _state);
	StateController* getCurentState();
	void rollbackToState(StateController* _state);
 
``MapStateController mStateName;``\ 存储\ `StateController`_\ 与其名字的对应关系。 

``VectorPairPairString mLinks;``\ 存储\ `StateController`_\ 之间切换所需的事件。

这些数据来源于编辑器的配置文件\ :file:`Settings.xml`\ 。

`StateController`_\ 间的切换通过调用下列函数进行::

	void stateEvent(StateController* _state, const std::string& _event);
	void stateEvent(const std::string& _stateName, const std::string& _event);

StateController
===============

定义了以下函数，这些函数与\ *StateManager*\ 中的栈操作有密切关系::

	virtual void initState() { }
	virtual void cleanupState() { }

	virtual void pauseState() { }
	virtual void resumeState() { }

从下面的类继承图上看，每个编辑器都有一个\ *EditorState*\ 和\ *ApplicationState*\ ,只有\ *LayoutEditor*\ 和\ *SkinEditor*\ 有\ *TestState*\ 。

.. image:: /images/ButterflyGraph-StateController.png

结合\ :file:`Media/Tools/LayoutEditor/Settings/Settings.xml`\ 中的结点\ **Settings/Editor/States**\ 理解\ *LayoutEditor*\ 如何在三个\ `StateController`_\ 间切换。
