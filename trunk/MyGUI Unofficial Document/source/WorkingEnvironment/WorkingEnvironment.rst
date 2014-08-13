WorkingEnvironment
==================

Vim
---

* Check代码\ **http://code.taobao.org/svn/vimsettings/trunk**\ 到\ :file:`Vim/vimfiles`
* 注释中带\ **mswin**\ 的行，增加一行\ ``source $VIM/vimfiles/vimrc.vim``
* 执行\ :file:`Vim/vimfiles/TabEditWithVim.reg`

SublimeText
-----------

* Check代码\ **http://code.taobao.org/svn/mystplugins/trunk**\ 到\ :file:`Sublime Text 2\Packages`

Visual Studio
-------------

* 字体设成\ **Consolas 13**\ 号
* 自定义快捷键: **Window.CloseDocumentWindow -> Ctrl+W(Text Editor)**
* **Text Editor->C++**\ : 选中\ **Word Wrap**
* **Tools->External Tools**\ :增加\ **Title:GVim Command:xxx/gvim.exe Arguments:-p --remote-tab-silent +$(CurLine) "$(ItemPath)"**\
  ，移动到第一位并添加到工具栏。
* 安装\ :file:`Tvl.VisualStudio.FindInSolutionExplorer.vsix`\ 和\ :file:`ProPowerTools.vsix`\ ,\ **Environment->Extension Manager**\ 中取消更新检查。


