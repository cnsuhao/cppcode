=====
HowTo
=====

* 居中展开子控件可以制造类似开窗的感觉，方法是:

  * 把直接子控件的对齐方式设置为\ *HCenter Top*\ 、\ *HCenter Bottom*\ 或\ *HCenter VStretch*
  * 使用\ ``MyGUI::ControllerPosition``\ ，将父控件的宽度从0增大到正常宽度
  * 同时使用\ ``MyGUI::ControllerPosition``\ ，将父控件的位置右移正常宽度的一半

  如果不加限制，展开过程中容易出现子控件抖动的现象。父控件的宽度由奇变偶或由偶变奇的时候，
  重新计算出的子控件的位置就会有误差。

  为了避免抖动，最好将父控件的宽度设为偶数，同时\ ``MyGUI::ControllerPosition``\ 的\ **action**\ 设置为\ ``MyGUI::action::inertionalMoveEvenSizeFunction``\ ，保证父控件的宽度在动画过程中始终为偶数。

* 危险的fireUIEventHandler

  在\ ``void ImageBox::frameEntered(float _frame)``\ 中有一段代码::

    while (mCurrentTime >= iter->frame_rate)
    {
        mCurrentTime -= iter->frame_rate;
        mCurrentFrame ++;
        if (mCurrentFrame >= (iter->images.size())) ``
        {``
            mCurrentFrame = 0;
            if (Gui::getInstance().getScripteInterface())
            {
                Gui::getInstance().getScripteInterface()->fireUIEventHandler(mPostAction, this);
                mIndexSelect = ITEM_NONE;
            }
        }
    }

  执行\ ``fireUIEventHandler``\ 有时候会导致程序崩溃，而且没有\ **call stack**\ 。
  原因是\ ``mPostAction``\ 调用的脚本改变了\ ``mItems``\ ，导致\ 
  ``while (mCurrentTime >= iter->frame_rate)``\ 中的\ ``iter``\ 失效。

* MyTexturePacker

  * 原始材质的名字不能带 :kbd:`_` ，否则 :kbd:`_` 后面的字符都会被弃掉。

* 修改MyGUI后最好彻底重编NoahCore,不然\ ``Lua_LayoutWindow``\ 容易崩，为什么？不知道。

* 在\ *SkinEditor*\ 中配置皮肤的状态时，最好把能配的都配上。
  如果用到了某个状态而没有相应的配置，皮肤的状态就会停留在上一个状态，而且没有任何提示。

* 字体的设置
  
  * 字体的大小(单位为像素)由以下两个属性决定::

      <Property key="Size" value="24"/> 
      <Property key="Resolution" value="50"/> 

    等于 **Size \* Resolution / 72**

* 使用带text区域的皮肤时，必须设置字体才能让文字显示出来。
  
* 编辑器打包

  * 复制以下三个文件夹到同一个文件夹下:

    * :file:`Build/Win32/Asserts/UI/Common`
    * :file:`NoahSDK/Noah3rdparty/MyGUI/Media`
    * :file:`NoahSDK/Noah3rdparty/MyGUI/VS2010OnOgre/bin/release`
      
  * 编辑 :file:`release` 下的以下配置文件，相关的参数改成相对路径
    
    * :file:`le_user_settings.xml` :file:`se_user_settings.xml` :file:`ie_user_settings.xml` 中的 **AdditionalPath.List**
    * :file:`resources.xml` 中的各个 **Path**
      
* xml 文件中特殊符号应该用 `htmlcodes <http://www.ascii.cl/htmlcodes.htm>`_ 的表示方法，``MyGUI::xml::utility::convert_from_xml`` 和 ``MyGUI::xml::utility::convert_to_xml`` 处理这些特殊字符。