====
Tips
====

* MyGUI_DelegateImplement.h中的问题

  ``MYGUI_C_MULTI_DELEGATE  MYGUI_TEMPLATE_ARGS& operator-=(IDelegate* _delegate)``\ 
  没有直接erase，如果当前正在执行的代理执行一个删除再执行一个添加，有可能导致死循环。

* 居中展开子控件可以制造类似开窗的感觉，方法是:

    * 把直接子控件的对齐方式设置为\ *HCenter Top*\ 、\ *HCenter Bottom*\ 或\ *HCenter VStretch*
    * 使用\ ``MyGUI::ControllerPosition``\ ，将父控件的宽度从0增大到正常宽度
    * 同时使用\ ``MyGUI::ControllerPosition``\ ，将父控件的位置右移正常宽度的一半

  如果不加限制，展开过程中容易出现子控件抖动的现象。父控件的宽度由奇变偶或由偶变奇的时候，
  重新计算出的子控件的位置就会有误差。

  为了避免抖动，最好将父控件的宽度设为偶数，同时\ ``MyGUI::ControllerPosition``\ 的\ **action**\ 设置为\ ``MyGUI::action::inertionalMoveEvenSizeFunction``\ ，保证父控件的宽度始终为偶数。

* 坑爹的fireUIEventHandler

  在\ ``void ImageBox::frameEntered(float _frame)``\ 中有一段代码::

    while (mCurrentTime >= iter->frame_rate)
    {
        mCurrentTime -= iter->frame_rate;
        mCurrentFrame ++;
        if (mCurrentFrame >= (iter->images.size())) ``
        {
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