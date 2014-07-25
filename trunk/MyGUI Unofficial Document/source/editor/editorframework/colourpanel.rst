===========
ColourPanel
===========

*ColourPanel*\ 对应编辑器中的调色板，layout文件是\ :file:`ColourPanel.layout`\ 。

``MyGUI::ImageBox* mColourRect;``\ 和\ ``MyGUI::ITexture* mTexture;``\ 对应颜色选择区域。

``MyGUI::ImageBox* mColourRect;``\ 和\ ``MyGUI::ImageBox* mImageColourPicker;``\ 响应鼠标拖动事件，

调色板状态的更新主要通过以下两个函数进行:

``void updateFromPoint(const MyGUI::IntPoint& _point);`` //在颜色选择区域点击、拖动；移动颜色滚动条

.. image:: /images/ButterflyGraph-updateFromPoint.png

``void updateFromColour(const MyGUI::Colour& _colour);`` //在调色板上直接更改颜色数值；打开调色板时提供颜色值

.. image:: /images/ButterflyGraph-updateFromColour.png

*ColourPanel*\ 与\ :doc:`ColourManager`\ 、\ :doc:`PropertyFieldColour`\ 有比较密切的关系。