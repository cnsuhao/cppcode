WorkingEnvironment
==================

FTP
---

:地址: ftp://ftp.xsjme.com

:帐号: king1

:密码: kingsoft

下载并安装下列工具::

	ftp://king1@ftp.xsjme.com/tools/share/devTools/Visual Studio/Visual Studio 2010 Ultimate ENU/
	ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/Visual+Assist+X+10.7.1949.0+汉化破解补丁.rar
	ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/Incredibuild5.0 crack.zip
	ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/TortoiseSVN-1.8.7.25475-x64-svn-1.8.9.msi
	ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/cmake-2.8.12.1-win32-x86.exe
	//下面三个默认安装即可
	ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/qt-win-opensource-4.8.0-vs2010.exe
	ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/LuaForWindows_v5.1.4-45.exe
	ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/DXSDK_Jun10.exe

VS2010
------

* 安装\ :file:`X16-42552VS2010UltimTrial1.iso`，选择\ **Visual C++**\ 和\ **Visual C#**
* 安装\ :file:`VS2010SP1dvd1.iso`
* 输入cdkey: **YCFHQ 9DWCY DKV88 T2TMH G7BHP**

	.. image:: /images/vs2010register.png

Visual Assist
-------------

* 安装\ :file:`VA_X_Setup1949.exe`
* 复制\ :file:`Visual+Assist+X+10.7.1949.0汉化破解补丁/*.dll`\ 到
  :file:`C:\Users\(系统用户名)\AppData\Local\Microsoft\VisualStudio\10.0\Extensions\Whole Tomato Software\Visual Assist X\10.7.1949.0`

* **Tools->Options->Text Editor->File Extension**\ 中添加\ **.uc**

    .. image:: /images/uc_extension.jpg

* 下载运行\ :download:`UCForVa.reg`\ 。
  
Incredibuild
------------

* 安装\ :file:`incredibuild5_0_crack.exe`
* 设置ip: **10.235.2.50**
  
	.. image:: /images/IncredibuildSettings.png

SVN
---

* 安装\ :file:`TortoiseSVN-1.8.7.25475-x64-svn-1.8.9.msi`\ ,\ **commandline tool**\ 最好也装上。
  
	.. image:: /images/svnsettings.png

CMake
-----

* 安装\ :file:`cmake-2.8.12.1-win32-x86.exe`\ ,\ 按照下图设置:

	.. image:: /images/cmakesettings.png

.. note:: 使用CMake过程中遇到任何问题请\ **RTX**\ 找\ *陈亮(chenliang3)*\ 。

项目代码
--------

* Check代码: svn://svn.xsjme.com/xsjme-code/trunk/kukuhero ,账号密码是\ **DSP**\ 的账号密码
* 运行\ :file:`CMakeModules/AutoBuild/AutoBuild.exe`\ 编译游戏服务端和客户端
	* 客户端工程路径：:file:`Client/Development/Src/UE3.sln`\ ,客户端使用ROGGame Win32工程右键Build进行编译
	* 服务器工程路径：:file:`Server/VS2010/Server.sln`\ , 服务器使用IB的BuildSolution进行编译，然后右键Build 
	  INSTALL工程进行配置文件和Exe执行程序更新（每次修改代码或者修改配置文件都需要Build INSTALL工程）,
 	  开发模式（_DEV_MODE宏）服务器只需要启动BattleServer和Server进程, 
 	  正常模式服务器需要启动DBAgent，Login，BattleServer，Server

* 运行\ :file:`CMakeModules/BuildToolsOnOgre/AutoBuild.exe`\ 编译工具

.. warning:: 运行\ **AutoBuild.exe**\ 期间最好关闭各种管家或杀软

.. note:: **AutoBuild**\ 运行期间报错请\ **RTX**\ 找\ *陈亮(chenliang3)*\ 。


Redmine
-------

我们项目现在用\ **Redmine**\ 指派工作任务:

* http://redmine.xsjme.com/
* 新员工需要注册，注册后在\ **RTX**\ 上找\ *范永泉(FanYongquan)*\ 审核通过
* 登陆后，打开窗口左上角\ **我的工作台**\ ,查看自己的任务

	.. image:: /images/Redmine.png

* 选择被指派的问题，如果已经完成，将\ **状态**\ 改为\ **Resolved**\ ，完成改为\ **100%**\ ，添加适当的说明，然后提交。

	.. image:: /images/RedmineCommit.png

ReviewBoard
-----------

* http://reviewboard.xsjme.com 注册
* 点击\ **New Review Request**\ ，进入\ **post-review**\ 编辑页面
	* Repository：选项选择我们的酷酷英雄项目kukuhero。
	* Base Directory：用SVN生成patch包的相对路径,例如\ :file:`Client/Engine`
	* Diff：选择我们生成的patch包。

	.. image:: /images/reviewboardnew.png

* **post-review Publish**\ 编辑页面
	* Summary:：填写\ **post-review**\ 的标题，比如卡牌导出重构。 
	* Description：填写\ **post-review**\ 的详细内容，比如卡牌导出重构。
	* Reviewers：栏目下有两个选项\ **Groups**\ (输入\ **kukuhero**\ )和\ **People**\ (输入\ **Reviewer**\ 名字)，编辑完毕后点击\ **publish**\ 。

	.. image:: /images/reviewboardpublish.png 

RTX
---

	.. image:: /images/rtxsetting.png

FoxMail
-------

	.. image:: /images/foxmailsettings.png

Wifi
----

	.. image:: /images/Wifi.png

Vim
---

* Check代码\ **http://code.taobao.org/svn/vimsettings/trunk**\ 到\ :file:`Vim/vimfiles`
* 注释中带\ **mswin**\ 的行，增加一行\ ``source $VIM/vimfiles/vimrc.vim``
* 执行\ :file:`Vim/vimfiles/TabEditWithVim.reg`

SublimeText
-----------

* Check代码\ **http://code.taobao.org/svn/mystplugins/trunk**\ 到\ :file:`Sublime Text 2\Packages`
* 注册\ **grepwin**\ : ``C:/Program Files/Sublime Text 2/sublime_text.exe "%path%:%line%"``
* 检查\ **Vim**\ 和\ **LayoutEditor**\ 的路径
* 注册\ **LayoutEditor**\ : 

  * Exe: ``C:/Program Files/Sublime Text 2/sublime_text.exe``
  * Params: ``"${File}:${Line}"``

* 使用 :kbd:`Ctrl+P` 查找文件有时候会出现异常，把 :file:`.sublime-workspace` 文件删掉就好了。


UnderStand
----------

* Package Control ::
  
	import urllib2,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404' + 'e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) ); by = urllib2.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None; print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) if dh != h else 'Please restart Sublime Text to finish installation')

* **General**\ 和\ **Editor**\ 中字体设成\ **Consolas 13**\ 号
* **General**\ 中关掉\ **splash-screen**
* **User Interface**\ 中开启\ **Visit result in editor ...**
* **User Interface->Windows**\ 中打开\ **Use Most Recently Used ...**
* **Key Bindings**\ 中查找\ **Close**\ 改为\ **Ctrl+W, Ctrl+W**
* **Editor**\ 中选中\ **Automactcally Reload ...**\ 和\ **Show Indent Guide**\ 取消\ **Expand/Collapse code snippet ...**
* 在编辑器窗口中右键，选择\ **Soft Wrap**

Visual Studio
-------------

* 字体设成\ **Consolas 13**\ 号
* 自定义快捷键: 

  * **Window.CloseDocumentWindow -> Ctrl+W(Text Editor)**
  * **Edit.IncreaseLineIndent -> Ctrl+](Text Editor)**
  * **Edit.DecreaseLineIndent -> Ctrl+[(Text Editor)**

* **Text Editor->C++**\ : 选中\ **Word Wrap**
* **Text Editor->C++->Tabs**\ : 选中\ **Insert Spaces**
* **Tools->External Tools**\ :增加 ``Title:SublimeText Command: C:/Program Files/Sublime Text 2/sublime_text.exe "$(ItemPath):$(CurLine)"`` 
  ，移动到第一位并添加到工具栏。
* 安装\ :file:`Tvl.VisualStudio.FindInSolutionExplorer.vsix`\ 和\ :file:`ProPowerTools.vsix`\ ,\ **Environment->Extension Manager**\ 中取消更新检查。

* 增加环境变量TRACKFILEACCESS= "false"可能有助于解决这个问题

    .. image:: /images/VS2010-trackerror.png

* 同时安装VS2008和VS2010，可能会出现下面的问题

  * A电脑上装有VS2008和VS2010
  * B电脑上仅装有VS2010
  * A电脑上用VS2010在Debug模式下编译静态库xxx.lib
  * B电脑上用VS2010编译可执行程序，链接xxx.lib，生成的exe无法执行，对应的manifest中会含有关联VS2008的异常信息。
    

Windows
-------

* 任务栏属性:\ **从不合并**
  
* 关掉最大化、最小化窗口的动画效果
* 关掉Aero Peek
  
	.. image:: /images/WindowsSetting-MinMax.png


配置翻墙工具
------------

#. 安装chrome
#. 控制面板-->internet选项-->连接-->局域网设置-->代理服务器
#. 勾选"为LAN使用代理服务器", 填入地址: ``10.235.2.212``  端口: ``8763``
#. 打开chrome, 进入网上应用商店, 搜索 **switchysharp** , 安装蓝色图标的 **proxy switchysharp**
#. 打开 **switchysharp** 选项-->导入导出-->从文件恢复, 选择 :download:`SwitchyOptions.bak`
#. 选择规则切换-->立即更新列表(如不成功 多试几次)
#. 控制面板-->internet选项-->连接-->局域网设置-->代理服务器
#. 取消选中"为LAN使用代理服务器"

配置PickPick
------------

#. 去掉开机启动和更新检查
#. 输出png图片并复制到系统剪贴板
#. 快捷方式右键->属性->高级，勾选 **用管理员身份运行**
#. 启动界面勾选 **启动程序时不再显示本窗口**