CMake
=====


CMake常用设置和命令
-------------------

常用设置
~~~~~~~~

CMakeLists.txt中比较常用的设置包括：

* 对CMake版本的要求::

	cmake_minimum_required(VERSION 2.6.2)

* 设置工程默认的配置类型::

	set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Choose the type of build, options are: None (CMAKE_CXX_FLAGS or CMAKE_C_FLAGS used) Debug Release RelWithDebInfo MinSizeRel." FORCE)

* 添加新的配置类型。CMake自带四种配置类型(Debug Release RelWithDebInfo MinSizeRel)，存储在变量CMAKE_CONFIGURATION_TYPES中::

	list(APPEND CMAKE_CONFIGURATION_TYPES Debug-iphonesimulator Release-iphonesimulator)

* 如果是Windows平台，使用相对路径(between the source and binary tree)；CMakeLists.txt被修改时，不自动重新生成工程文件::

	if(WIN32)
		set(CMAKE_USE_RELATIVE_PATHS true)
		set(CMAKE_SUPPRESS_REGENERATION true)
	endif(WIN32)


* 在Mac上生成Xcode工程时，默认的目标平台是MacOS，更改为iOS需要设置如下变量::

	set(CMAKE_OSX_SYSROOT "iphoneos")
	list(APPEND CMAKE_CONFIGURATION_TYPES Debug-iphonesimulator Release-iphonesimulator)
	set(CMAKE_OSX_DEPLOYMENT_TARGET "")
	set(CMAKE_OSX_ARCHITECTURES "\${ARCHS_STANDARD_32_BIT}" CACHE STRING "")

* 设置工程安装路径，CMake中的install命令指定的是相对于CMAKE_INSTALL_PREFIX的路径::

	set(CMAKE_INSTALL_PREFIX "./Build" CACHE PATH "Install prefix" FORCE)

查找依赖库
~~~~~~~~~~

* CMake一般通过环境变量查找依赖的库，引用外部环境变量的语法是\ ``$ENV{环境变量的名字}``
* 查找文件\ **find_file**\ ::

	find_file(${DLLName}_DLL_Release NAMES "${DLLFileName}.dll" PATHS ${ENV_OGRE_HOME} /bin/  PATH_SUFFIXES  ""  release)

	这个语句在路径${ENV_OGRE_HOME}/bin/和${ENV_OGRE_HOME}/bin/release下查找一个名为"${DLLFileName}.dll"的文件，如果找到，文件的绝对路径存储在变量${DLLName}_DLL_Release中。

* 查找库\ **find_library**\ ::

	find_library(${LibName}_Library_Release NAMES ${LibName} HINTS ${ENV_${LibName}_HOME}/lib PATH_SUFFIXES "" release)
	这个语句在两个路径下查找名为${LibName}的库，两个路径分别是${ENV_${LibName}_HOME}/lib和${ENV_${LibName}_HOME}/lib/release。如果找到，库文件的绝对路径存储在变量${LibName}_Library_Release中。

* 查找包find_package::

	假设我们定义一个名为FindXYZ.cmake的CMake脚本，该脚本用于查找并定义XYZ相关的若干变量，其他CMake脚本可以通过命令find_package(XYZ)执行FindXYZ.cmake，以便引用XYZ相关的变量。
	某些库比较简单，只包括一个库文件，使用find_file或find_library即可，我们自定义的通用函数MyFindDll(调用find_file)和MyFindLib(调用find_library)用于查找这些简单的库； find_package比较适合用于查找复杂的库(Ogre、MyGUI等)，每个库有一个对应的CMake脚本(FindOgre.cmake、FindMyGUI.cmake)。

工程组织
~~~~~~~~

* project命令用于建立一个新的工程，工程相关的各种源文件、资源文件等一般通过相对路径引用(相对于当前CMakeLists)，分类存储在自定义的变量中，以便后续的引用。

* source_group命令用于生成VS或Xcode中的文件目录结构，可以不同于磁盘上的文件目录结构。

* include命令用于读取指定文件中的内容，作为cmake脚本执行。常用的自定义函数可以写在一个单独的文件中，其他模块可以使用include加载使用这些函数。工程中的源文件的数量通常比较大，可以将这些源文件的路径放在一个单独的文件中，CMakeLists.txt只需要include这个列表文件。

* add_subdirecotry命令在指定的子文件夹中寻找并执行CMakeLists.txt。一个工程可以划分为若干模块，每个模块在一个单独的文件夹中，对应一个CMakeLists.txt，使用add_subdirecotry命令组织各个模块。

编译、链接
~~~~~~~~~~

* 编译
	* 添加编译目标：
		可执行程序：add_executable(工程名 代表所有源文件的变量)
		静态库：add_library(工程名 STATIC 代表所有源文件的变量)
		动态库：add_library(工程名 SHARED 代表所有源文件的变量)
	* 编译选项和宏：
		add_defintions：定义全局的编译选项或宏，作用于当前CMakeLists.txt中所有目标。
		set_target_properties：定义某个目标的属性。属性COMPILE_DEFINITIONS定义宏；COMPILE_FLAGS定义编译选项。
		set_source_file_properties：定义某个源文件的属性。默认情况下，CMake根据源文件的后缀名选择编译器，更改源文件的属性LANG，可以强制将该源文件作为某种语言进行编译，通常用于将.c源文件作为C++编译。
* 链接
	target_link_libraries命令用于链接目标(仅限可执行程序和DLL)依赖的库。如果依赖库是当前工程中的其他目标，直接链接该目标即可，如图1第一行所示；
	如果依赖的是外部的库，可以在Debug和optimized(debug之外的各种配置)两种配置下链接不同的库，如图2第二、三行所示。
	 
	.. image:: /images/cmaketargetlink.png

* add_custom_command
	在某个Target编译前(PRE_BUILD)、链接前(PRE_LINK)或链接(POST_BUILD)后，执行定义的命令(通常是shell命令)。在Mac上编译app时，可以使用该命令在编译完成时将配置文件复制到app包中。
* add_custom_target
	添加一个虚拟的Target，不是真正的函数库或可执行程序，这种Target主要用于执行指定的命令，设置环境变量、复制文件等等，在VS或Xcode中Build这个Target即可。

安装、打包
~~~~~~~~~~

* Install命令用于将文件安装到指定的位置::
  
	install(TARGETS ${TargetName}
		  RUNTIME DESTINATION "bin/release" COMPONENT ${ComponentName} CONFIGURATIONS Release
		  ARCHIVE DESTINATION "lib/release" COMPONENT ${ComponentName} CONFIGURATIONS Release
		  LIBRARY DESTINATION "lib/release" COMPONENT ${ComponentName} CONFIGURATIONS Release
		)

  这个语句用于在Release模式下安装${TargetName}，如果${TargetName}是一个可执行程序，只有RUNTIME行会执行，文件复制到bin/release下；如果${TargetName}是一个静态库，只有ARCHIVE行会执行，文件复制到lib/release下；如果${TargetName}是一个Windows上的动态库，DLL的部分复制到bin/release下，lib复制到lib/release下。

* 游戏中大部分模块使用我们自定义的函数MyInstall，如图所示，如果是Windows平台，库文件和可执行程序按配置类型复制到对应的文件夹下。
  :: 
	
	function(MyInstall TargetName )
		if(${ARGC} GREATER 1 )
			set(${TargetName}_INSTALL_PREFIX ${ARGV1})
		else()
			set(${TargetName}_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX})
		endif()
		if(WIN32 OR APPLE)
			install(TARGETS ${TargetName}
			  RUNTIME DESTINATION "${${TargetName}_INSTALL_PREFIX}/bin/release" CONFIGURATIONS Release Release-iphoneos Release-iphonesimulator
			  BUNDLE DESTINATION "${${TargetName}_INSTALL_PREFIX}/bin/release" CONFIGURATIONS Release Release-iphoneos Release-iphonesimulator
			  ARCHIVE DESTINATION "${${TargetName}_INSTALL_PREFIX}/lib/release" CONFIGURATIONS Release Release-iphoneos Release-iphonesimulator
			  LIBRARY DESTINATION "${${TargetName}_INSTALL_PREFIX}/lib/release" CONFIGURATIONS Release Release-iphoneos Release-iphonesimulator
			)
			install(TARGETS ${TargetName}
			  RUNTIME DESTINATION "${${TargetName}_INSTALL_PREFIX}/bin/debug" CONFIGURATIONS Debug Debug-iphoneos Debug-iphonesimulator
			  BUNDLE DESTINATION "${${TargetName}_INSTALL_PREFIX}/bin/debug" CONFIGURATIONS Debug Debug-iphoneos Debug-iphonesimulator
			  ARCHIVE DESTINATION "${${TargetName}_INSTALL_PREFIX}/lib/debug" CONFIGURATIONS Debug Debug-iphoneos Debug-iphonesimulator
			  LIBRARY DESTINATION "${${TargetName}_INSTALL_PREFIX}/lib/debug" CONFIGURATIONS Debug Debug-iphoneos Debug-iphonesimulator
			)
			install(TARGETS ${TargetName}
			  RUNTIME DESTINATION "${${TargetName}_INSTALL_PREFIX}/bin/relwithdebinfo" CONFIGURATIONS RelWithDebInfo RelWithDebInfo-iphonesimulator
			  BUNDLE DESTINATION "${${TargetName}_INSTALL_PREFIX}/bin/relwithdebinfo" CONFIGURATIONS RelWithDebInfo RelWithDebInfo-iphonesimulator
			  ARCHIVE DESTINATION "${${TargetName}_INSTALL_PREFIX}/lib/relwithdebinfo" CONFIGURATIONS RelWithDebInfo RelWithDebInfo-iphonesimulator
			  LIBRARY DESTINATION "${${TargetName}_INSTALL_PREFIX}/lib/relwithdebinfo" CONFIGURATIONS RelWithDebInfo RelWithDebInfo-iphonesimulator
			)
		else()
			install(TARGETS ${TargetName}
			  RUNTIME DESTINATION "${${TargetName}_INSTALL_PREFIX}/bin/bin" 
			  ARCHIVE DESTINATION "${${TargetName}_INSTALL_PREFIX}/lib/" 
			  LIBRARY DESTINATION "${${TargetName}_INSTALL_PREFIX}/lib/" 
			)
		endif()
		install(FILES 
		${${TargetName}_Header_Files}
			DESTINATION ${${TargetName}_INSTALL_PREFIX}/include/
		)
	endfunction()

  在函数MyInstall的定义中，TargetName是待安装的模块的名字；如果是Windows平台，CMake会将WIN32设为True; install命令可以按照文件的类型和配置的类型进行安装，可执行程序属于RUNTIME类，静态库属于ARCHIVE类，动态库属于LIBRARY类; 变量${${TargetName}_Headers}代表待安装的头文件。

* CMake中的模块CPack用于将所有需要安装的文件打成一个安装包。首先定义与版本、安装位置、环境变量等信息相关的若干变量，然后加载CPack，如图所示，其中定义的函数MyPackLib用于游戏中的大部分模块。CPack会根据当前已经执行过的Install命令决定打包哪些文件。
  ::

	function(MyPackLib LibName)
		if(WIN32)
	    	set(CPACK_PACKAGE_VERSION_MAJOR "1")
	    	set(CPACK_PACKAGE_VERSION_MINOR "0")
	    	set(CPACK_PACKAGE_VERSION_PATCH "0")
	    	set(CPACK_PACKAGE_VENDOR "The KuKuHero Team")
			set(CPACK_RESOURCE_FILE_LICENSE "${ENV_kukuhero_HOME}/CMakeModules/COPYING")
	    	string(REGEX MATCH "^Noah" Result ${LibName})
	    	if(NOT Result)
	    	        set(InstDir "Noah${LibName}")
	    	else()
	    	        set(InstDir "${LibName}")
	    	endif()
	    	set(CPACK_PACKAGE_INSTALL_DIRECTORY "${InstDir}")
	
	    	set(CPACK_NSIS_EXTRA_INSTALL_COMMANDS "
	    	WriteRegStr HKCU \\\"Environment\\\" \\\"${LibName}_HOME\\\" $INSTDIR
	    	")
	    	set(CPACK_NSIS_EXTRA_UNINSTALL_COMMANDS "
	    	DeleteRegValue HKCU \\\"Environment\\\" \\\"${LibName}_HOME\\\"
	    	")
	
	    	include(CPack)
		endif(WIN32)
	endfunction(MyPackLib LibName)
	
  游戏大部分模块使用函数MyPackLib生成安装包，这些安装包在执行时将安装路径设为环境变量${TargetName}_HOME的值，其他模块可以通过这个变量查找该模块。

我们做的东西
------------

* 每个模块(库或可执行程序)，有一个独立的CMakeLists.txt文件;通过环境变量查找依赖的库。
* 分离源文件列表

  	.. image:: /images/vs2cmake.png

  在CMakeLists.txt中，绝大部分内容是源文件列表，其他内容主要是工程的属性，将两者分离，如图所示，可以提高CMakeLists.txt的可读性，而且可以使用工具生成大部分源文件列表，减少出错的可能，把维护工作变得更简单。

* 外部工程引用

  	.. image:: /images/includeothercmake.png

  可以在一个模块中包含另一个独立的模块(静态库)，这种做法容易出错，仅用于Server。

Tips
----

* Mac上从Terminal输入命令cmake-gui启动Cmake
  
  Mac上可以设置两种环境变量：系统环境变量，在/etc/profile或/etc/bashrc添加，需要管理员权限，而且注销重新登陆之后才能生效；本地环境变量，在/Usrs/username/.bash_profile中设置，不需要权限，执行source .bash_profile或重新打开一个Terminal即可生效，但是只在Terminal及其子进程中有效。如果从Mac的图形界面上启动CMake，它只能获得系统级的环境变量。因此，我们把环境变量添加到本地的.bash_profile中，从Terminal启动CMake读取所需的环境变量。

* VS中Build Package的时候偶尔会出现"系统找不到指定路径"的错误，重新用CMake生成即可。

  不明。出错的时候，重复Build Package依然会出错；没错的时候，重复Build Package不会出错，应该不是NSIS的问题。

* 变量CMAKE_INSTALL_PREFIX的值最好是绝对路径，一般是${CMAKE_CURRENT_BINARY_DIR}/SDK
  
  如果使用相对路径，有时候会被CMake忽略，在Windows和Mac上都出现过，原因不明，应该是CMake的Bug。
  另外，其他模块引用CMAKE_INSTALL_PREFIX的时候也比较简单。

* 复制客户端资源Asserts的时间：Windows上，在install的时候复制；Mac上，在编译链接完成后复制。
  
  VS中可以指定调试的command和working directory，因此可以在install的时候，复制资源到install目录下，调试install目录下的exe; 不知道Xcode里如何指定调试的command和working directory，因此，选择在编译链接完成后使用add_custom_command命令复制资源文件到app中，以便启动模拟器调试程序

* 使用EXISTS(kukuhero\CMakeModules\MyFindLib.cmake第9行)检查文件或文件夹是否存在有时候会出错，解决方法是重启CMake。

* 在Cmake的正则表达式中，使用\\去escape特别符号。例如：为了精确地匹配字符串"a.b"，必须使用正则表达式"a\\.b"

* if(IS_ABSOLUTE path)不能在Windows上用
  
* ``if("a" MATCHES "^ *[A-Za-z]:/")`` 为真，最好不要用这种方法

* 将一个列表作为函数的参数时，如果列表元素数量比较少，可以直接列出，用分号分隔，例如"./;./Memory"，又引号是必须的；如果元素数量比较多，可以首先设置一个变量，例如set(Dirs ./ ./Memory)，然后将"${ Dirs}"作为函数的参数。

* 除了CMakeLists.txt之外，其他的CMake脚本应该全部以.cmake为后缀，方便查找变量或函数，特别是在OGRE这种大工程中。

* 使用set(VarName  Values ....  PARENT_SCOPE)设置上一级Scope的变量，常用于函数中。注意：如果连续多次设置一个上层变量的值，只有最后一次是有效的。例如::
  
    set(A  ${A}  “1”  PARENT_SCOPE)
    set(A  ${A}  “2”  PARENT_SCOPE)
    set(A  ${A}  “3”  PARENT_SCOPE)

 希望的结果是变量A中增加三个元素：1，2，3，但是实际得到的是只增加了一个元素：3, 所以，最好还是只设置一次。

* 使用set_source_files_properties设置源文件的属性时，源文件的名称必须与源文件列表中的名字相同。

  如果源文件中列表中是stdafx.cpp，那么命令``set_source_files_properties(./stdafx.cpp PROPERTIES COMPILE_FLAGS /Yc"stdafx.h")``
  无效。

* VS中定义DLL所需的*.def文件也需要加入到源文件列表中，否则命令
  ``set_target_properties(UI PROPERTIES LINK_FLAGS /DEF:"UI.def" )``\ 无效。

* 如果需要更改CMake Cache中的变量，例如CMAKE_OSX_SYSROOT，使用下列两种方法::
  
    set(CMAKE_OSX_SYSROOT "iphoneos")
    set(CMAKE_OSX_SYSROOT "iphoneos" CACHE STRING “” FORCE)

  不要使用下面的方法，无用::

    set(CMAKE_OSX_SYSROOT "iphoneos" CACHE STRING “” )

* CMake生成XCode工程时，Debug模式下不会定义-DDEBUG，需要自己加上。在project命令之后::
  
    string(FIND "${CMAKE_C_FLAGS_DEBUG}" "-DDEBUG" HasDebug)
    if(HasDebug EQUAL -1)
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -DDEBUG" )
    endif()
    set(CMAKE_C_FLAGS_DEBUG ${CMAKE_C_FLAGS_DEBUG} CACHE STRING "" FORCE)

    string(FIND "${CMAKE_CXX_FLAGS_DEBUG}" "-DDEBUG" HasDebug)
    if(HasDebug EQUAL -1)
        set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DDEBUG")
    endif()
    set(CMAKE_CXX_FLAGS_DEBUG ${CMAKE_CXX_FLAGS_DEBUG} CACHE STRING "" FORCE)

* 下面这段代码在VS2008中管用，在VS2010中无效::
  
    install(TARGETS Example${index}
          RUNTIME DESTINATION "debug" CONFIGURATIONS Debug
          RUNTIME DESTINATION "release" CONFIGURATIONS Release  
        )
        
  所以最好拆成两个::

    install(TARGETS Example${index}
          RUNTIME DESTINATION "debug" CONFIGURATIONS Debug
        )
    install(TARGETS Example${index}
          RUNTIME DESTINATION "release" CONFIGURATIONS Release  
        )

* 在VS2010中执行Install时，可能会出现没有复制文件的问题，重启一下VS好像就好了。
  
* CMake 不喜欢带空格的路径, 如果 CMAKE_CURRENT_SOURCE_DIR 是 :file:`C:\Program Files (x86)` ，这一行代码就会报错。
  
  ``set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake;${CMAKE_MODULE_PATH}")``
