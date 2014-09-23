版本构建
========

**首先编译ROGGame Win32 Release**

环境配置
========

Mac 编译机
~~~~~~~~~~

#. 安装OS X Lion
#. 通过App Store安装最新的Xcode
#. 把 :download:`startURT.sh` 和 :file:`Client/Binaries/UnrealRemoteTool` 复制到同一个文件夹下，执行 ``bash startURT.sh`` ，第一次执行时需要输入密码。
   
配置Provision
~~~~~~~~~~~~~

#. 运行 :file:`Client/Binaries/IPhone/iPhonePackager.exe` 选择 **Already a registered iOS developer** 标签页
#. 点击 **Import a mobile provision** ，导入文件 :download:`Relics_of_Gods_for_Dev.mobileprovision`
#. 点击 **Import a certificate** ，导入文件 :download:`Certificates.p12` ，在弹出的密码框输入 ``20121221``
#. 点击 **Edit Info.plist overrides** ，在 **CFBundleIdentifier** 框输入 ``com.xishanju.relicsofgods``

Android开发工具
~~~~~~~~~~~~~~~

#. 新建文件夹 :file:`X:\\Android`
#. 从ftp上下载下列工具,解压到 :file:`X:\\Android` ::

    ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/android-ndk-r9-windows-x86.zip
    ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/android-sdk.zip
    ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/apache-ant-1.9.2.zip
    ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/cygwin.zip
    
#. 下载安装jdk到 :file:`X:\\Android`::

    ftp://king1@ftp.xsjme.com/tools/share/酷酷英雄项目工作/常用软件/jdk-7u5-windows-x64.exe

其他
~~~~

#. 运行 :download:`SetIOSAndroidEnvs.bat` ，设置相关的环境变量，运行前确认 **编译机IP** 、 **签名机IP** 、 **iOS SDK版本** 、 **Android路径**
#. 安装最新版itunes

构建版本
========

构建IOS版本
~~~~~~~~~~~

#. 运行 :file:`Client/Development/Src/BuildIOSRelease.bat` ，运行前确认 **编译机IP** 、 **签名机IP** 、 **iOS SDK版本** ，出InHouse版本ue3.iPhone_SigningServerName改为永泉的签名服务器的IP。

.. seealso::
    https://udn.unrealengine.com/docs/ue3/INT/Platforms/iOS/GettingStarted/Licensees/index.html#DebuggingonaMac

Android版本构建
~~~~~~~~~~~~~~~

#. 编译UE3中的 **ROGGame AndroidARM**
   
UnrealFrontend
~~~~~~~~~~~~~~

#. 启动 :file:`Client/Binaries/UnrealFrontend.exe`
#. 使用adb devices查看Android设备状态