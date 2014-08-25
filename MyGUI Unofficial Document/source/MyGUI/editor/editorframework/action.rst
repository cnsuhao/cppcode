动作
----

*Action*\ 和\ *ActionManager*\ 用于SkinEditor、ImageEditor、FontEditor，提供的接口包括::

	doAction()和undoAction() //执行和撤销Action
	Merge相关的接口 //ActionManager可以将连续两个同类型的Action合并为一个Action


*Action*\ 是 **Redo** 和 **Undo** 的最小单位，继承关系如下:


.. image:: /images/ButterflyGraph-Action.png


*ActionManager*\ 负责管理所有Action，主要包括以下两部分接口::

	void doAction(Action* _command); 
	void undoAction();
	void redoAction();

	void saveChanges();
	bool getChanges();

	eventChanges; //执行动作时，通知编辑器的其他模块，现在主要是更新标题栏的状态。