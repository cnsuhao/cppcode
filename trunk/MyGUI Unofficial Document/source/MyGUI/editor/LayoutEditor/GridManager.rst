===========
GridManager
===========

*GridManager*\ 根据\ :file:`Settings.xml`\ 中的\ **GridStep**\ 定义一个网格。

*GridLine*\ 定义了三种在这个网格上取值的模式::

	Previous : 向下取值
	Closest : 取最近的值
	Next : 向上取值

指定任意值\ ``_value``\ 和取值模式\ ``_line``\ ,\ ``int GridManager::toGrid(int _value, GridLine _line) const``\
返回符合要求的网格的值。

.. hint:: 在\ :doc:`layouteditor`\ 中使用方向键移动控件，结合\ :file:`Media/Tools/LayoutEditor/Settings/Settings.xml`\ 理解
	*GridManager*\ 的作用。