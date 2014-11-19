Jenkins
=======

安装
----

* 在 Windows 上作为服务安装 **Jenkins** 之后，把该服务的用户名设置为当前桌面用户名，不然会出现各种异常现象，尤其是 CMake 。

    * **控制面板 -> 管理工具 -> 服务** 打开服务配置面板
    * 找到 **Jenkins** ，双击
    * **登录** 页，输入用户名密码
    * 重启服务

配置
----

* **系统管理** -> **系统设置** -> **执行者数量** 设为 1 
* **系统管理** -> **插件管理** 中的 **可选插件** 页中，安装 **Dependency Queue Plugin**
* svn 插件没用，因为它会在出现冲突时把整个目录全部删掉，重新 checkout
* msbuild 没用，因为它在 build INSTALL.vcxproj 时会 build 关联的 ALL_BUILD.vcxproj