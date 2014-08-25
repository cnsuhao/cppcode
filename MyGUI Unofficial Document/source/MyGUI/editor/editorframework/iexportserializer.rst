========
输入输出
========

*SkinEditor*\ 、\ *ImageEditor*\ 、\ *FontEditor*\ 用\ *IExportSerializer*\ 读写数据，类继承关系如图:

.. image:: /images/ButterflyGraph-IExportSerializer.png

*IExportSerializer*\ 定义了两个接口::

	virtual void serialization(pugi::xml_document& _doc) = 0;
	virtual bool deserialization(pugi::xml_document& _doc) = 0;

.. hint:: 结合\ :file:`MyGUI/Media/Common/Themes/MyGUI_BlackOrangeSkins.xml`\ 理解\ *SkinExportSerializer*\ 
	如何读写文件、如何与\ *DataManager*\ 交互。