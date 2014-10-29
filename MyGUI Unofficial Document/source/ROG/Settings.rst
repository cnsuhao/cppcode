常用设置
========

* 窗口分辨率: 
  :file:`Client/ROGGame/Config/DefaultSystemSettings.ini` 中的 **ResX** 和 **ResY**

* 客户端更改DevMode:     
  :file:`KLogicCore.uc` 中的 ``mDevMode``

* DevMode下服务端IP:    
  :file:`KProcedureRoot.uc` 中的 ``Initial()``

* 非DevMode下服务端IP:   
  :file:`KProcedure_Login.uc` 中的 ``ConnectLoginServer()``

* 内网测试服 
  非Dev模式 IP: ``10.235.2.48`` 端口: 8100