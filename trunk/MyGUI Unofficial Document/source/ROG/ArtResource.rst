美术资源
========

图标命名规范
------------

:download:`图标命名规范.xls`

UI资源
------

* 地标图素

    * 把新增的图标放到 :file:`Build\\Win32\\Asserts\\UI\\GameSkins_MapIcon\\` 下，打开 :file:`GameSkins_MapIcon.tps` ，发布到 
      :file:`Build\\Win32\\Asserts\\UI\\GameSkins_MapIcon.png`
    * 导入到 RogGame -> interface -> B_UI2 中，注意选择  TEXTUREGROUP_UI 和 TMGS_NoMipmaps
    * 打开 :file:`Client\\ROGGame\\Content\\Maps\\starsky_ENV.umap`
    * 在地标的属性中修改 Mobile Touch Actor -> Animated Sprite -> Sprite Component 下的 U UL V VL
