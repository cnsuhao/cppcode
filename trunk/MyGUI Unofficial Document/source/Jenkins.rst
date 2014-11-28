Jenkins
=======

坑
--

* Jenkins 必须在前台运行,否则无法启动 UnrealFrontEnd 等需要界面的工具。
* 如果 Windows 处于休眠状态，Jenkins 的定时功能无效，所以需要在控制面板的电源选项中关掉休眠。
* 启动 :file:`ROGGame.exe` 时，貌似要访问DX，所以必须有一个用户处于登陆状态。
* 远程登陆到服务器的时候，服务器本地的同名用户被迫退出，远程登陆断开后，服务器处于没有该用户的状态，所以最好用一个账户跑 Jenkins ，另一个用户用于远程登陆。
* Windows 默认不支持多用户同时登陆，需要安装 :file:`UniversalTermsrvPatch-x64.exe`
* 在控制面板的远程设置中开启远程登陆；客户端用 mstsc.exe ；登陆名不要用IP，用服务器的计算机名


安装配置
--------

* 设置环境变量 ``JENKINS_HOME = C:\Jenkins``
* 解压 :file:`org.tmatesoft.svn_1.7.10.standalone.zip` ，把 :file:`jsvn` 的路径加到系统 **Path** 中。
* 创建一个快捷方式运行 jenkins : ``java -war jenkins.war``
* 安装插件: **Email-ext plugin**
* 复制配置文件到 ``C:\\Jenkins`` 下，重启 Jenkis

注意
----

* 客户端浏览器用网址 ``服务器计算机名:8080`` 登陆 Jenkins
* 系统设置 

  :Subversion: 版本选 1.7   
  :系统管理员邮件地址: 用于发邮件                  
  :SMTP服务器: ``zhmail.kingsoft.com``     
  :邮件通知的高级选项: 邮箱的用户名和账号，端口 25 

* 配置任务
    
  * **Check-out Strategy** 选择 **Emulate clean checkout ...** 
