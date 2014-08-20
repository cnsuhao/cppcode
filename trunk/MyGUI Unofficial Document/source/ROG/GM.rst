GM指令
------

相关代码
~~~~~~~~

``CSGMCommandHandler::Execute``

``event GMCommand(string Cmd)``

Commands
~~~~~~~~

* 游戏内\ :kbd:`~`\ 键开启
* 下表中参数的取值如下:
	* **[pos]**\ 是操作者的位置,1v1 为 0 1  3v3 为 0 1 2 3 4 5
	* **[index]**\ 是单位的位置,0 - 主英雄 1 - 第一个护卫 2 - 第二个
	* **[depleteid]** (1:粮食 2:金币 3:宝石)
	* **[suit]** (1:太阳 2:月亮 3:星星)

===================     =====================   =========================================
命令|缩写               参数                    作用
===================     =====================   =========================================
addcard | ac            [pos] [depleteid]       增加一张手牌
additem | ai            [pos] [cardid]          增加一张道具
addequip | ae           [pos] [cardid]          增加一张装备
refreshhero | rh                                刷新备选英雄	
judgecardsuit | jcs     [index] [suit]          设置判断花色
addhp | ah              [pos] [index] [hp]	加血量
addattack | aa          [pos] [index] [att]	加攻击
addrange | ar           [pos] [index] [range]   增加范围
resetaction | ra        [pos] [index]           刷新行动
resettime | rt          [time]                  重置行动时间，单位秒
createhero | ch         [pos] [heroid]          召唤魂石
dismisshero | dh        [pos] [heroid]          解散魂石
finishbattle | fb       [force]                 结束战斗 force 0 GOD胜利 1 失败 先手为GOD
===================     =====================   =========================================

卡牌id对照表
~~~~~~~~~~~~

======  ========
cardid	name
======  ========
72      草药
73      草药
74      老酒
75      老酒
76      黑水
77      回复药
78      回复药
79      补给箱
80      补给
81      炸药包
82      神之精华
83      神力药水
84      长剑
85      长剑
86      长剑
87      斩铁剑
88      射日弓
89      雷神锤
90      永恒之枪
91      混沌魔剑
92      皮甲
93      皮甲
94      皮甲
95      铁片甲
96      锁链甲
97      巫师袍
98      龙鳞铠甲
99      影子法袍
100     铁戒
101     铁戒
102     铁戒
103     八尺玉
104     狮心戒
105     金项链
106     所罗门戒
107     诅咒指环
======  ========
