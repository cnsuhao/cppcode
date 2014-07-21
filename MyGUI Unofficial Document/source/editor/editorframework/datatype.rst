=========================
DataType和DataTypeManager
=========================

*SkinEditor*\ 、\ *ImageEditor*\ 、\ *FontEditor*\ 使用\ *DataType*\ 和\ *DataTypeManager*\ 管理可编辑的数据的类型。

*DataTypeManager*\ 管理一个\ *DataType*\ 类型数组，这些\ *DataType*\ 之间存在父子关系。

*DataTypeManager*\ 从\ **xml**\ 文件中加载\ *DataType*\ 数据，三个编辑器对应的\ *DataType*\ 文件分别是:

	:file:`MyGUI/Media/Tools/FontEditor/FontDataType.xml`

	:file:`MyGUI/Media/Tools/ImageEditor/ImageDataType.xml`

	:file:`MyGUI/Media/Tools/SkinEditor/SkinDataType.xml`

这些\ **xml**\ 文件中\ *DataType*\ 的父子关系对应编辑器中数据的层次关系。

.. hint:: 比较\ :file:`SkinDataType.xml`\ 和\ *SkinEditor*\ ,为什么选择不同的\ **States**\ 不会影响对\ **Separators**\ 的选择?