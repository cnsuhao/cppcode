NSIS
====

NSIS的脚本语言类似汇编，根据执行时间的不同，可以将NSIS脚本中的指令分为三种：

编译时执行的指令
----------------

* 设置安装包的属性，参考用户手册中"4.8 Installer Attributes"和"4.5 Pages"。例如::
  
	Name "NoahSDK"	;安装包的名字
	Page license
	Page components
	Page directory
	Page instfiles	; 安装时出现哪些页面
	UninstPage uninstConfirm
	UninstPage instfiles ; 卸载时出现哪些页面
		
* 执行编译指令，类似C++中的preprocess,参考用户手册中"Chapter 5: Compile Time Commands"。例如::
  
	!include WinMessages.nsh ;加载头文件
	${__FILE__}	;预定义的宏, 当前脚本文件的名字
	$%envVarName%	;读取编译时所处环境中的环境变量
	!define !undef  ;添加、删除定义
	!ifdef	!ifndef	;选择性编译
	!macro !macroend ; 定义宏
	insertmacro	;插入宏

* 收集安装包应该包含的文件。NSIS在编译脚本时收集出现在File命令中的文件，按照在脚本中出现的顺序将这些文件添加到安装包中。例如::

	File /r "$%Kismet_HOME%\*.*"
	NSIS编译这一行时，首先把"$%Kismet_HOME%"替换成环境变量"Kismet_HOME"替换成对应的路径"xxxxxxxx\SDK",
	然后将该路径下的所有文件夹和文件添加到安装包中。

安装
----

* Section(参考”4.6 Sections”)一般对应安装包中的component，可以选择是否安装。如果选择安装一个component，安装包在安装过程中会执行对应Section中的指令，否则不执行。Section也可以设为不允许选择或不可见，不可见的Section默认是选中状态。

	.. image:: /images/nsis.png

* Function(参考”4.7 Functions”)用于定义Section中重复出现的指令组合，一个Function可以被多个Section重复调用。Function指令不接受参数，参数的传递通过NSIS的Stack进行，调用Function前将参数Push到Stack中，在Function中Pop出Stack中的参数。

  NSIS中的变量(参考”4.2 Variables”)分为三种：
	* 20个预定义的变量($0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $R0, $R1, $R2, $R3, $R4, $R5, $R6, $R7, $R8, $R9)，这些变量可以读，可以写，可以作为函数中的临时变量使用。$INSTDIR是安装路径，也是可以读写的。
	* 安装包所处系统信息，这些变量只能读，不能写::

		$DESKTOP	;桌面路径
		$STARTMENU	;开始菜单路径
		$PROGRAMFILES  ;  “C:\Program Files”

	* 用户自定义变量，只能是全局变量，各个Section都可以读写的变量。

卸载
----

* 在NSIS脚本中定义一个名为”Uninstall”的Section,才会生成一个Uninstall.exe。在这个Section中只能调用以”un.”开头的函数，在其他Section中只能调用名称不以”un.”开头的函数。
  
* 除了自定义的函数，NSIS中的函数还包括CallBack Function，这些函数的名字一般以”.”开头，例如::

	.onInit	;安装包启动时首先执行这个函数
	un.onInit;Uninstall.exe启动时首先执行这个函数
	自定义这些函数可以在安装或卸载的特定阶段执行指定的操作，删除环境变量等等;
	 
* 在NoahSDK中添加一个新的库，需要更改NoahSDK.nsi中的以下内容:
	 
	* 在脚本中搜索”NoahInstall”，在下图所示区域添加一行。注意，对应的环境变量(例如“NoahCore_HOME”)、路径和文件应当存在。
	  ::

	  	!insertmacro NoahInstall Kismet
	  	!insertmacro NoahInstall LuaPlus
	  	!insertmacro NoahInstall NoahCore
	  	!insertmacro NoahInstall NoahDependencies
	  	!insertmacro NoahInstall NoahFoundation
	  	!insertmacro NoahInstall NoahNetwork
	  	!insertmacro NoahInstall OGRE
	  	!insertmacro NoahInstall MyGUI
	  	!insertmacro NoahInstall Curl
	  	!insertmacro NoahInstall Json
	  	!insertmacro NoahInstall OpenAL
	  	!insertmacro NoahInstall MPG123
	  	!insertmacro NoahInstall TinyXML
	  	!insertmacro NoahInstall Plugin_ParticleUniverse
	  	!insertmacro NoahInstall libconfig

	* 在脚本中搜索”DeleteRegValue”，在下图所示区域添加一行。
	  ::

		DeleteRegValue HKCU "Environment" "Kismet_HOME"
		DeleteRegValue HKCU "Environment" "LuaPlus_HOME"
		DeleteRegValue HKCU "Environment" "NoahCore_HOME"
		DeleteRegValue HKCU "Environment" "NoahDependencies_HOME"
		DeleteRegValue HKCU "Environment" "NoahFoundation_HOME"
		DeleteRegValue HKCU "Environment" "NoahNetwork_HOME"
		DeleteRegValue HKCU "Environment" "OGRE_HOME"
		DeleteRegValue HKCU "Environment" "MyGUI_HOME"
		DeleteRegValue HKCU "Environment" "Curl_HOME"
		DeleteRegValue HKCU "Environment" "Json_HOME"
		DeleteRegValue HKCU "Environment" "OpenAL_HOME"
		DeleteRegValue HKCU "Environment" "MPG123_HOME"
		DeleteRegValue HKCU "Environment" "TinyXML_HOME"
		DeleteRegValue HKCU "Environment" "Plugin_ParticleUniverse_HOME"
		DeleteRegValue HKCU "Environment" "libconfig_HOME"
		
	* 如果在本机上测试安装包，原来设置的环境变量会被覆盖。完成安装包测试后，及时恢复原来的环境变量。