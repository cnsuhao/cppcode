使用Sphinx的注意事项
====================

* 使用 `exceltable <https://pythonhosted.org/sphinxcontrib-exceltable/>`_  插入Excel。

.. warning:: Excel文件名目前只支持英文。

* `sphinxcontrib-images <https://pythonhosted.org/sphinxcontrib-images/#group-images>`_ 与 Sphinx 的 **Quick Search** 冲突。
  
* **Quick Search** 对中文的支持不好，主要是它会把连续的一段文字当成一个 **Word** ，所以关键字最好加上格式，使其成为一个单独的 **Word** 。