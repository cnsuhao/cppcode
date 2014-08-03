坑爹的fireUIEventHandler
========================

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