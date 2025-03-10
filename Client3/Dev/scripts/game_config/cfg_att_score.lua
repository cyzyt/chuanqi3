local config = { 
	[0] = { 
		Idx=0,
		name="全系魔法",
		nbvalue="100#100#100",
		desc="全系魔法（全系写法: 3#0#1-2）",
		isshow=0,
		szshow=1,
		sort=4,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[1] = { 
		Idx=1,
		name="生命值",
		nbvalue="4680#14040#7020",
		type=1,
		desc="生命值",
		isshow=0,
		szshow=1,
		scolor=213,
		sort=400,
		zl=7,
		upNotShow=0,
		tipsNotShow=0,
	},
	[2] = { 
		Idx=2,
		name="魔法值",
		nbvalue="11640#1838#3492",
		type=1,
		desc="魔法值",
		isshow=0,
		szshow=1,
		scolor=213,
		sort=401,
		zl=7,
		upNotShow=0,
		tipsNotShow=0,
	},
	[3] = { 
		Idx=3,
		name="破坏下限",
		nbvalue="43200#1#1",
		type=1,
		desc="战士的核心属性，决定物理伤害",
		isshow=0,
		szshow=1,
		sort=1,
		zl=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[4] = { 
		Idx=4,
		name="破坏上限",
		nbvalue="43200#1#1",
		type=1,
		desc="战士的核心属性，决定物理伤害",
		isshow=0,
		szshow=1,
		sort=1,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[5] = { 
		Idx=5,
		name="自然下限",
		nbvalue="0#43200#0",
		type=1,
		desc="法师的核心属性，决定魔法伤害",
		isshow=0,
		szshow=1,
		sort=2,
		zl=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[6] = { 
		Idx=6,
		name="自然上限",
		nbvalue="0#43200#0",
		type=1,
		desc="法师的核心属性，决定魔法伤害",
		isshow=0,
		szshow=1,
		sort=2,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[7] = { 
		Idx=7,
		name="灵魂下限",
		nbvalue="0#0#43200",
		type=1,
		desc="道士的核心属性，决定道术伤害",
		isshow=0,
		szshow=1,
		sort=3,
		zl=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[8] = { 
		Idx=8,
		name="灵魂上限",
		nbvalue="0#0#43200",
		type=1,
		desc="道士的核心属性，决定道术伤害",
		isshow=0,
		szshow=1,
		sort=3,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[9] = { 
		Idx=9,
		name="防御下限",
		nbvalue="13200#14400#14400",
		type=1,
		desc="抵抗受到的物理伤害",
		isshow=0,
		szshow=1,
		sort=6,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[10] = { 
		Idx=10,
		name="防御上限",
		nbvalue="19200#21600#21600",
		type=1,
		desc="抵抗受到的物理伤害",
		isshow=0,
		szshow=1,
		sort=6,
		zl=4,
		upNotShow=0,
		tipsNotShow=0,
	},
	[11] = { 
		Idx=11,
		name="魔防下限",
		nbvalue="14400#14400#14400",
		type=1,
		desc="抵抗受到的魔法伤害",
		isshow=0,
		szshow=1,
		sort=7,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[12] = { 
		Idx=12,
		name="魔防上限",
		nbvalue="21600#21600#21600",
		type=1,
		desc="抵抗受到的魔法伤害",
		isshow=0,
		szshow=1,
		sort=7,
		zl=4,
		upNotShow=0,
		tipsNotShow=0,
	},
	[13] = { 
		Idx=13,
		name="准确",
		nbvalue="20000#20000#20000",
		type=1,
		desc="物理攻击的命中概率",
		isshow=0,
		szshow=1,
		sort=11,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[14] = { 
		Idx=14,
		name="敏捷",
		nbvalue="20000#20000#20000",
		type=1,
		desc="闪避受到的物理攻击",
		isshow=0,
		szshow=1,
		sort=13,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[15] = { 
		Idx=15,
		name="魔法躲避",
		nbvalue="11520#11520#11520",
		type=3,
		desc="闪避受到的魔法攻击",
		isshow=2,
		szshow=2,
		sort=200,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[16] = { 
		Idx=16,
		name="毒物躲避",
		nbvalue="11520#11520#11520",
		type=3,
		desc="增加一定的麻痹抗性",
		isshow=2,
		szshow=2,
		sort=201,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[17] = { 
		Idx=17,
		name="中毒恢复",
		nbvalue="11520#11520#11520",
		type=3,
		desc="缩减中毒时间和麻痹时间",
		isshow=2,
		szshow=1,
		sort=202,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[18] = { 
		Idx=18,
		name="体力恢复",
		nbvalue="11520#11520#11520",
		type=3,
		desc="提高生命值恢复效果",
		isshow=2,
		szshow=1,
		sort=203,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[19] = { 
		Idx=19,
		name="魔法恢复",
		nbvalue="11520#11520#11520",
		type=3,
		desc="提高魔法值恢复效果",
		isshow=2,
		szshow=1,
		sort=204,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[20] = { 
		Idx=20,
		name="攻击速度",
		nbvalue="100#100#100",
		type=1,
		desc="影响角色攻击速度",
		isshow=0,
		szshow=1,
		sort=12,
		zl=8,
		upNotShow=0,
		tipsNotShow=0,
	},
	[21] = { 
		Idx=21,
		name="暴击几率",
		nbvalue="159600#159600#159600",
		type=2,
		desc="攻击时触发暴击的概率",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=206,
		zl=8,
		upNotShow=0,
		tipsNotShow=0,
	},
	[22] = { 
		Idx=22,
		name="暴击伤害",
		nbvalue="15960#15960#15960",
		type=2,
		desc="暴击时的伤害",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=207,
		zl=8,
		upNotShow=0,
		tipsNotShow=0,
	},
	[23] = { 
		Idx=23,
		name="韧性",
		nbvalue="159600#159600#159600",
		type=2,
		desc="降低被暴击概率",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=208,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[24] = { 
		Idx=24,
		name="暴击抵抗",
		nbvalue="63600#63600#63600",
		type=2,
		desc="降低受到的暴击伤害",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=209,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[25] = { 
		Idx=25,
		name="攻击伤害",
		nbvalue="259200#259200#259200",
		type=2,
		desc="增加造成的伤害",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=210,
		zl=7,
		upNotShow=0,
		tipsNotShow=0,
	},
	[26] = { 
		Idx=26,
		name="物理伤害减少",
		nbvalue="259200#259200#259200",
		type=2,
		desc="减少受到的物理伤害",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=211,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[27] = { 
		Idx=27,
		name="魔法伤害减少",
		nbvalue="259200#259200#259200",
		type=2,
		desc="减少受到的魔法伤害",
		isshow=2,
		szshow=1,
		scolor=2002,
		sort=212,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[28] = { 
		Idx=28,
		name="忽视防御",
		nbvalue="100#100#100",
		type=2,
		desc="攻击无视对方一定的防御力",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=213,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[29] = { 
		Idx=29,
		name="伤害反弹",
		nbvalue="100#100#100",
		type=2,
		desc="反弹一定的伤害（所有伤害）",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=214,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[30] = { 
		Idx=30,
		name="生命加成",
		nbvalue="100#100#100",
		type=2,
		desc="增加一定比例的生命",
		isshow=2,
		szshow=1,
		scolor=213,
		sort=410,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[31] = { 
		Idx=31,
		name="魔力",
		nbvalue="100#100#100",
		type=2,
		desc="增加一定比例的魔法",
		isshow=2,
		szshow=1,
		scolor=213,
		sort=411,
		zl=7,
		upNotShow=0,
		tipsNotShow=0,
	},
	[32] = { 
		Idx=32,
		name="增加目标爆率",
		nbvalue="100#100#100",
		type=2,
		desc="提高击杀玩家的爆装几率",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=215,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[33] = { 
		Idx=33,
		name="爆率降低",
		nbvalue="100#100#100",
		type=2,
		desc="降低死亡时的爆装几率",
		isshow=2,
		szshow=2,
		sort=216,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[34] = { 
		Idx=34,
		name="吸血",
		nbvalue="100#100#100",
		type=2,
		desc="回复一定攻击比例的生命",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=217,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[35] = { 
		Idx=35,
		name="攻魔道伤",
		nbvalue="100#100#100",
		type=2,
		desc="攻击/魔法/道术提升一定比例",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=218,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[36] = { 
		Idx=36,
		name="防御加成",
		nbvalue="100#100#100",
		type=2,
		desc="防御提升一定比例",
		isshow=2,
		szshow=1,
		sort=219,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[37] = { 
		Idx=37,
		name="魔防加成",
		nbvalue="100#100#100",
		type=2,
		desc="魔防提升一定比例",
		isshow=2,
		szshow=1,
		sort=220,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[38] = { 
		Idx=38,
		name="神圣",
		nbvalue="100#100#100",
		type=2,
		desc="物理伤害对不死族造成额外的伤害",
		isshow=2,
		szshow=1,
		sort=221,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[39] = { 
		Idx=39,
		name="幸运",
		nbvalue="100#100#100",
		type=1,
		desc="提高攻击时发挥的最低伤害",
		isshow=0,
		szshow=1,
		sort=5,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[40] = { 
		Idx=40,
		name="对怪伤害",
		nbvalue="100#100#100",
		type=1,
		desc=" 对怪物额外造成的固定伤害（弃用）请使用74号属性",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=222,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[41] = { 
		Idx=41,
		name="对怪增伤",
		nbvalue="100#100#100",
		type=2,
		desc="对怪物造成伤害提高（弃用）请使用75号属性    ",
		isshow=2,
		szshow=1,
		scolor=254,
		sort=223,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[42] = { 
		Idx=42,
		name="怒气恢复增加",
		nbvalue="100#100#100",
		type=1,
		isshow=2,
		szshow=2,
		sort=999,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[43] = { 
		Idx=43,
		name="合击攻击增加",
		nbvalue="100#100#100",
		type=2,
		isshow=2,
		szshow=0,
		sort=999,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[44] = { 
		Idx=44,
		name="怪物爆率",
		nbvalue="100#100#100",
		type=2,
		desc="怪物掉落概率（只对老爆率文件生效）",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=224,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[45] = { 
		Idx=45,
		name="防止麻痹",
		nbvalue="100#100#100",
		type=2,
		desc="防止防痹戒指生效，首先计算麻痹机率，麻痹机率生效中再计算麻痹抗性机率,抗性成功麻痹100%失效（对怪物麻痹无效）",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=225,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[46] = { 
		Idx=46,
		name="防止护身",
		nbvalue="100#100#100",
		type=2,
		desc="防止护身戒指生效，护身机率生效中再计算护身抗性机率,抗性成功护身100%失效",
		isshow=2,
		szshow=2,
		sort=226,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[47] = { 
		Idx=47,
		name="防止复活",
		nbvalue="100#100#100",
		type=2,
		desc="防止复活戒指生效，复活机率生效中再计算复活抗性机率,抗性成功复活100%失效",
		isshow=2,
		szshow=2,
		sort=227,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[48] = { 
		Idx=48,
		name="防止全度",
		nbvalue="100#100#100",
		type=2,
		isshow=2,
		szshow=2,
		sort=228,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[49] = { 
		Idx=49,
		name="防止诱惑",
		nbvalue="100#100#100",
		type=2,
		isshow=2,
		szshow=2,
		sort=229,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[50] = { 
		Idx=50,
		name="防止火墙",
		nbvalue="100#100#100",
		type=2,
		isshow=2,
		szshow=2,
		sort=230,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[51] = { 
		Idx=51,
		name="防止冰冻",
		nbvalue="100#100#100",
		type=2,
		isshow=2,
		szshow=2,
		sort=231,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[52] = { 
		Idx=52,
		name="防止蛛网",
		nbvalue="100#100#100",
		type=2,
		isshow=2,
		szshow=2,
		sort=232,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[54] = { 
		Idx=54,
		name="对战增伤",
		nbvalue="100#100#100",
		type=2,
		desc="增加对战士的伤害",
		isshow=2,
		szshow=2,
		sort=233,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[55] = { 
		Idx=55,
		name="受战减伤",
		nbvalue="100#100#100",
		type=2,
		desc="减少来自战士的伤害",
		isshow=2,
		szshow=2,
		sort=234,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[56] = { 
		Idx=56,
		name="对法增伤",
		nbvalue="100#100#100",
		type=2,
		desc="增加对法师的伤害",
		isshow=2,
		szshow=2,
		sort=235,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[57] = { 
		Idx=57,
		name="受法减伤",
		nbvalue="100#100#100",
		type=2,
		desc="减少来自法师的伤害",
		isshow=2,
		szshow=2,
		sort=236,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[58] = { 
		Idx=58,
		name="对道增伤",
		nbvalue="100#100#100",
		type=2,
		desc="增加对道士的伤害",
		isshow=2,
		szshow=2,
		sort=237,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[59] = { 
		Idx=59,
		name="受道减伤",
		nbvalue="100#100#100",
		type=2,
		desc="减少来自道士的伤害",
		isshow=2,
		szshow=2,
		sort=238,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[60] = { 
		Idx=60,
		name="生命加成",
		nbvalue="100#100#100",
		type=2,
		desc="基于等级的HP加成",
		isshow=2,
		szshow=1,
		sort=239,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[61] = { 
		Idx=61,
		name="生命恢复",
		nbvalue="100#100#100",
		type=1,
		desc="每10秒恢复生命",
		isshow=2,
		szshow=1,
		sort=240,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[62] = { 
		Idx=62,
		name="魔法恢复",
		nbvalue="100#100#100",
		type=1,
		desc="每10秒恢复魔法",
		isshow=2,
		szshow=2,
		sort=241,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[63] = { 
		Idx=63,
		name="格挡概率",
		nbvalue="100#100#100",
		type=2,
		desc="受到伤害时出发格挡的概率",
		isshow=2,
		szshow=1,
		sort=242,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[64] = { 
		Idx=64,
		name="格挡伤害",
		nbvalue="100#100#100",
		type=2,
		desc="格挡时减免的伤害",
		isshow=2,
		szshow=1,
		sort=243,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[65] = { 
		Idx=65,
		name="掉落概率",
		nbvalue="100#100#100",
		type=2,
		desc="怪物掉落概率",
		isshow=2,
		szshow=2,
		sort=244,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[66] = { 
		Idx=66,
		name="经验倍率",
		nbvalue="100#100#100",
		type=2,
		desc="增加获取到的基础经验，可被高级、超级经验放大",
		isshow=2,
		szshow=2,
		sort=245,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[67] = { 
		Idx=67,
		name="倍攻",
		nbvalue="100#100#100",
		type=2,
		desc="提升装备的基础攻魔道属性，包括极品属性",
		isshow=2,
		szshow=2,
		sort=246,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[68] = { 
		Idx=68,
		name="对人伤害",
		nbvalue="100#100#100",
		type=1,
		desc="对玩家造成无视防御的伤害",
		isshow=2,
		szshow=2,
		sort=247,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[69] = { 
		Idx=69,
		name="冰冻概率",
		nbvalue="100#100#100",
		type=2,
		desc="攻击时触发冰冻效果的概率",
		isshow=2,
		szshow=2,
		sort=248,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[70] = { 
		Idx=70,
		name="蛛网概率",
		nbvalue="100#100#100",
		type=2,
		desc="攻击时触发蛛网效果的概率",
		isshow=2,
		szshow=2,
		sort=249,
		zl=5,
		upNotShow=0,
		tipsNotShow=0,
	},
	[71] = { 
		Idx=71,
		name="每秒恢复",
		nbvalue="100#100#100",
		type=1,
		desc="人物每秒恢复一定数值的血量，怪物每3秒恢复一定数值的HP",
		isshow=2,
		scolor=88,
		sort=250,
		upNotShow=0,
		tipsNotShow=0,
	},
	[72] = { 
		Idx=72,
		name="对怪暴击率",
		nbvalue="100#100#100",
		type=2,
		desc="攻击怪物时额外附加的暴击率",
		isshow=2,
		scolor=88,
		sort=251,
		upNotShow=0,
		tipsNotShow=0,
	},
	[73] = { 
		Idx=73,
		name="攻击加成",
		nbvalue="100#100#100",
		type=2,
		desc="攻击时，提升一定比例的攻击",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=252,
		upNotShow=0,
		tipsNotShow=0,
	},
	[74] = { 
		Idx=74,
		name="对怪伤害",
		nbvalue="100#100#100",
		type=1,
		desc="攻击怪物时造成的固定伤害",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=253,
		upNotShow=0,
		tipsNotShow=0,
	},
	[75] = { 
		Idx=75,
		name="对怪增伤",
		nbvalue="100#100#100",
		type=2,
		desc="按比例提升对怪物的伤害",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=254,
		ys=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[76] = { 
		Idx=76,
		name="PK增伤",
		nbvalue="100#100#100",
		type=2,
		desc="PK时按比例提升伤害",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=255,
		upNotShow=0,
		tipsNotShow=0,
	},
	[77] = { 
		Idx=77,
		name="PK减伤",
		nbvalue="100#100#100",
		type=2,
		desc="PK时按比例减少伤害",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=256,
		upNotShow=0,
		tipsNotShow=0,
	},
	[78] = { 
		Idx=78,
		name="穿透",
		nbvalue="100#100#100",
		type=1,
		desc="突破对方防御",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=257,
		upNotShow=0,
		tipsNotShow=0,
	},
	[79] = { 
		Idx=79,
		name="神圣一击",
		nbvalue="100#100#100",
		type=2,
		desc="对目标造成3倍伤害",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=258,
		upNotShow=0,
		tipsNotShow=0,
	},
	[80] = { 
		Idx=80,
		name="神圣伤害",
		nbvalue="100#100#100",
		type=1,
		desc="触发致命一击时额外伤害",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=259,
		upNotShow=0,
		tipsNotShow=0,
	},
	[81] = { 
		Idx=81,
		name="对怪吸血",
		nbvalue="100#100#100",
		type=2,
		desc="仅对怪物伤害时提升的吸血比例",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=260,
		upNotShow=0,
		tipsNotShow=0,
	},
	[82] = { 
		Idx=82,
		name="受怪减伤",
		nbvalue="100#100#100",
		type=2,
		desc="按比例减少受到来自怪物的伤害",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=261,
		upNotShow=0,
		tipsNotShow=0,
	},
	[83] = { 
		Idx=83,
		name="药品恢复加成",
		nbvalue="100#100#100",
		type=2,
		desc="按比例提升药品的恢复量",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=262,
		upNotShow=0,
		tipsNotShow=0,
	},
	[84] = { 
		Idx=84,
		name="吸血抵抗",
		nbvalue="100#100#100",
		type=2,
		desc="抵抗吸血概率",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=263,
		upNotShow=0,
		tipsNotShow=0,
	},
	[85] = { 
		Idx=85,
		name="破防抵抗",
		nbvalue="100#100#100",
		type=2,
		desc="抵抗忽视防御概率",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=264,
		upNotShow=0,
		tipsNotShow=0,
	},
	[86] = { 
		Idx=86,
		name="烈火减免",
		nbvalue="100#100#100",
		type=2,
		desc="减少烈火伤害比例",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=265,
		upNotShow=0,
		tipsNotShow=0,
	},
	[87] = { 
		Idx=87,
		name="刺杀减免",
		nbvalue="100#100#100",
		type=2,
		desc="减少刺杀伤害比例",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=266,
		upNotShow=0,
		tipsNotShow=0,
	},
	[88] = { 
		Idx=88,
		name="攻杀减免",
		nbvalue="100#100#100",
		type=2,
		desc="减少攻杀伤害比例",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=267,
		upNotShow=0,
		tipsNotShow=0,
	},
	[89] = { 
		Idx=89,
		name="hp加成",
		nbvalue="100#100#100",
		type=2,
		desc="新hp加成，万分比",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=268,
		upNotShow=0,
		tipsNotShow=0,
	},
	[90] = { 
		Idx=90,
		name="神圣抵抗",
		nbvalue="100#100#100",
		type=2,
		desc="被攻击时，抵抗神圣一击的几率",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=269,
		upNotShow=0,
		tipsNotShow=0,
	},
	[91] = { 
		Idx=91,
		name="每秒恢复MP",
		nbvalue="100#100#100",
		type=1,
		desc="每秒恢复一定数值的MP值",
		isshow=2,
		szshow=2,
		scolor=254,
		sort=270,
		upNotShow=0,
		tipsNotShow=0,
	},
	[92] = { 
		Idx=92,
		name="舒适",
		nbvalue="100#100#100",
		type=1,
		desc="1点舒适度减少N毫秒回血时间（M2上可配）",
		isshow=2,
		szshow=2,
		sort=300,
		zl=3,
		upNotShow=0,
		tipsNotShow=0,
	},
	[94] = { 
		Idx=94,
		name="背包负重",
		nbvalue="100#100#100",
		type=1,
		desc="当前背包负重",
		isshow=2,
		szshow=2,
		sort=999,
		upNotShow=0,
		tipsNotShow=0,
	},
	[95] = { 
		Idx=95,
		name="背包负重",
		nbvalue="100#100#100",
		type=1,
		desc="最大背包负重",
		isshow=2,
		szshow=2,
		sort=999,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[96] = { 
		Idx=96,
		name="装备负重",
		nbvalue="100#100#100",
		type=1,
		desc="装备负重（穿戴负重）",
		isshow=0,
		szshow=2,
		sort=301,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[97] = { 
		Idx=97,
		name="装备负重",
		nbvalue="100#100#100",
		type=1,
		desc="最大穿戴负重",
		isshow=0,
		szshow=2,
		sort=301,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[98] = { 
		Idx=98,
		name="手持负重",
		nbvalue="100#100#100",
		type=1,
		desc="手持负重（腕力）",
		isshow=0,
		szshow=2,
		sort=302,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[99] = { 
		Idx=99,
		name="手持负重",
		nbvalue="100#100#100",
		type=1,
		desc="最大手持负重(腕力)",
		isshow=0,
		szshow=2,
		sort=302,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[100] = { 
		Idx=100,
		name="强度",
		nbvalue="100#100#100",
		type=1,
		desc="额外提升武器持久",
		isshow=2,
		szshow=2,
		sort=14,
		zl=0,
		upNotShow=0,
		tipsNotShow=0,
	},
	[101] = { 
		Idx=101,
		name="火(火焰)",
		nbvalue="100#100#100",
		type=1,
		desc="增加攻击元素-火(火焰)",
		isshow=0,
		szshow=2,
		sort=8,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[102] = { 
		Idx=102,
		name="冰(冰寒)",
		nbvalue="100#100#100",
		type=1,
		desc="增加攻击元素-冰(冰寒)",
		isshow=0,
		szshow=2,
		sort=8,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[103] = { 
		Idx=103,
		name="雷(电击)",
		nbvalue="100#100#100",
		type=1,
		desc="增加攻击元素-雷(电击)",
		isshow=0,
		szshow=2,
		sort=8,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[104] = { 
		Idx=104,
		name="风(飓风)",
		nbvalue="100#100#100",
		type=1,
		desc="增加攻击元素-风(飓风)",
		isshow=0,
		szshow=2,
		sort=8,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[105] = { 
		Idx=105,
		name="圣(神圣)",
		nbvalue="100#100#100",
		type=1,
		desc="增加攻击元素-圣(神圣)",
		isshow=0,
		szshow=2,
		sort=8,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[106] = { 
		Idx=106,
		name="暗(暗黑)",
		nbvalue="100#100#100",
		type=1,
		desc="增加攻击元素-暗(暗黑)",
		isshow=0,
		szshow=2,
		sort=8,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[107] = { 
		Idx=107,
		name="幻(幻影)",
		nbvalue="100#100#100",
		type=1,
		desc="增加攻击元素-幻(幻影)",
		isshow=0,
		szshow=2,
		sort=8,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[111] = { 
		Idx=111,
		name="火(火焰)",
		nbvalue="100#100#100",
		type=1,
		desc="强弱元素-火(火焰)",
		isshow=0,
		szshow=2,
		sort=9,
		zl=7,
		ts=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[112] = { 
		Idx=112,
		name="冰(冰寒)",
		nbvalue="100#100#100",
		type=1,
		desc="强弱元素-冰(冰寒)",
		isshow=0,
		szshow=2,
		sort=9,
		zl=7,
		ts=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[113] = { 
		Idx=113,
		name="雷(电击)",
		nbvalue="100#100#100",
		type=1,
		desc="强弱元素-雷(电击)",
		isshow=0,
		szshow=2,
		sort=9,
		zl=7,
		ts=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[114] = { 
		Idx=114,
		name="风(飓风)",
		nbvalue="100#100#100",
		type=1,
		desc="强弱元素-风(飓风)",
		isshow=0,
		szshow=2,
		sort=9,
		zl=7,
		ts=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[115] = { 
		Idx=115,
		name="圣(神圣)",
		nbvalue="100#100#100",
		type=1,
		desc="强弱元素-圣(神圣)",
		isshow=0,
		szshow=2,
		sort=9,
		zl=7,
		ts=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[116] = { 
		Idx=116,
		name="暗(暗黑)",
		nbvalue="100#100#100",
		type=1,
		desc="强弱元素-暗(暗黑)",
		isshow=0,
		szshow=2,
		sort=9,
		zl=7,
		ts=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[117] = { 
		Idx=117,
		name="幻(幻影)",
		nbvalue="100#100#100",
		type=1,
		desc="强弱元素-幻(幻影)",
		isshow=0,
		szshow=2,
		sort=9,
		zl=7,
		ts=2,
		upNotShow=0,
		tipsNotShow=0,
	},
	[118] = { 
		Idx=118,
		name="复活",
		nbvalue="100#100#100",
		type=1,
		desc="带原地复活功能(配置方法 3#118#1  有这条配置后下面119、120、121属性配置生效)",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=100,
		zl=10,
		upNotShow=0,
		tipsNotShow=1,
	},
	[119] = { 
		Idx=119,
		name="复活CD(秒)",
		nbvalue="100#100#100",
		type=1,
		desc="每次生效CD间隔(秒)（复活戒指）",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=101,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[120] = { 
		Idx=120,
		name="复活HP恢复",
		nbvalue="100#100#100",
		type=2,
		desc="当前HP最大值的%（复活戒指生效后恢复）",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=102,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[121] = { 
		Idx=121,
		name="MP恢复",
		nbvalue="100#100#100",
		type=2,
		desc="当前MP最大值的%（复活戒指生效后恢复）",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=103,
		zl=10,
		upNotShow=0,
		tipsNotShow=1,
	},
	[122] = { 
		Idx=122,
		name="麻痹",
		nbvalue="100#100#100",
		type=1,
		desc="攻击有几率麻痹目标，使其无法攻击和移动(配置方法 3#122#1  有这条配置后下面123、124、125属性配置生效)",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=104,
		zl=10,
		upNotShow=0,
		tipsNotShow=1,
	},
	[123] = { 
		Idx=123,
		name="麻痹时间(秒)",
		nbvalue="100#100#100",
		type=1,
		desc="麻痹时长（秒）（麻痹戒指）",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=105,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[124] = { 
		Idx=124,
		name="麻痹机率",
		nbvalue="100#100#100",
		type=2,
		desc="麻痹几率（%）（麻痹戒指）",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=106,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[125] = { 
		Idx=125,
		name="麻痹最大数量",
		nbvalue="100#100#100",
		type=1,
		desc="麻痹最大数量",
		isshow=0,
		scolor=254,
		sort=107,
		upNotShow=0,
		tipsNotShow=1,
	},
	[126] = { 
		Idx=126,
		name="护身",
		nbvalue="100#100#100",
		type=1,
		desc="受到伤害优先由魔法值承担(配置方法 3#126#1  有这条配置后下面127、128属性配置生效)",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=108,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[127] = { 
		Idx=127,
		name="承担比例",
		nbvalue="100#100#100",
		type=2,
		desc="扣除HP时多少比例扣除魔法值",
		isshow=2,
		szshow=0,
		scolor=254,
		sort=109,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[128] = { 
		Idx=128,
		name="扣除MP比例",
		nbvalue="100#100#100",
		type=3,
		desc="扣除魔法值时扩大多少比例",
		isshow=2,
		szshow=0,
		scolor=254,
		sort=110,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[129] = { 
		Idx=129,
		name="吸收伤害",
		nbvalue="100#100#100",
		type=2,
		desc="在受到伤害的时候可吸收伤害%",
		isshow=2,
		szshow=0,
		scolor=254,
		sort=111,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[130] = { 
		Idx=130,
		name="沉默",
		nbvalue="100#100#100",
		type=1,
		desc="使对方沉默不能施放技能(配置方法 3#130#1  有这条配置后下面131、132、133属性配置生效)",
		isshow=0,
		scolor=254,
		sort=112,
		upNotShow=0,
		tipsNotShow=0,
	},
	[131] = { 
		Idx=131,
		name="沉默时长（秒）",
		nbvalue="100#100#100",
		type=1,
		desc="沉默成功后，沉默时间（秒）",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=113,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[132] = { 
		Idx=132,
		name="沉默概率",
		nbvalue="100#100#100",
		type=2,
		desc="沉默成功概率%",
		isshow=2,
		szshow=0,
		scolor=254,
		sort=114,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[133] = { 
		Idx=133,
		name="沉默最大数量",
		nbvalue="100#100#100",
		type=1,
		desc="沉默最大数量",
		isshow=2,
		scolor=254,
		sort=115,
		upNotShow=0,
		tipsNotShow=0,
	},
	[134] = { 
		Idx=134,
		name="定身",
		nbvalue="100#100#100",
		type=1,
		desc="使对方定身不能动可施放技能(配置方法 3#134#1  有这条配置后下面135、136、137属性配置生效)",
		isshow=0,
		scolor=254,
		sort=116,
		upNotShow=0,
		tipsNotShow=0,
	},
	[135] = { 
		Idx=135,
		name="定身时长（秒）",
		nbvalue="100#100#100",
		type=1,
		desc="定身成功后，沉默时间（秒）",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=117,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[136] = { 
		Idx=136,
		name="定身概率",
		nbvalue="100#100#100",
		type=2,
		desc="定身成功概率%",
		isshow=2,
		szshow=0,
		scolor=254,
		sort=118,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[137] = { 
		Idx=137,
		name="定身最大数量",
		nbvalue="100#100#100",
		type=1,
		desc="定身最大数量",
		isshow=2,
		scolor=254,
		sort=119,
		upNotShow=0,
		tipsNotShow=0,
	},
	[138] = { 
		Idx=138,
		name="麻痹抗性生效几率",
		nbvalue="100#100#100",
		type=2,
		desc="麻痹抗性机率（计算麻痹机率，如麻痹抗性值大于或等于麻痹值，则麻痹效果失效，如麻痹抗性值小于麻痹值，则麻痹值减去麻痹抗性值）(对怪麻痹生效)",
		isshow=2,
		scolor=254,
		sort=120,
		upNotShow=0,
		tipsNotShow=0,
	},
	[139] = { 
		Idx=139,
		name="麻痹效果减少时间",
		nbvalue="100#100#100",
		type=1,
		desc="麻痹抗性时间（计算麻痹时间，如麻痹抗性时间大于或等于麻痹时间，则麻痹效果失效，如麻痹抗性时间小于麻痹时间，则麻痹时间减去麻痹抗性时间）(对怪麻痹生效)",
		isshow=0,
		scolor=254,
		sort=121,
		upNotShow=0,
		tipsNotShow=0,
	},
	[140] = { 
		Idx=140,
		name="沉默抗性生效几率",
		nbvalue="100#100#100",
		type=2,
		desc=" 沉默抗性机率（计算沉默机率，如沉默抗性值大于或等于沉默值，则沉默效果失效，如沉默抗性值小于沉默值，则沉默值减去沉默抗性值）",
		isshow=2,
		scolor=254,
		sort=122,
		upNotShow=0,
		tipsNotShow=0,
	},
	[141] = { 
		Idx=141,
		name="沉默效果减少时间",
		nbvalue="100#100#100",
		type=1,
		desc=" 沉默抗性时间（计算沉默时间，如沉默抗性时间大于或等于沉默时间，则沉默效果失效，如沉默抗性时间小于沉默时间，则沉默时间减去沉默抗性时间）",
		isshow=0,
		scolor=254,
		sort=123,
		upNotShow=0,
		tipsNotShow=0,
	},
	[142] = { 
		Idx=142,
		name="定身抗性生效几率",
		nbvalue="100#100#100",
		type=2,
		desc="定身抗性机率（计算定身机率，如定身抗性值大于或等于定身值，则定身效果失效，如定身抗性值小于定身值，则定身值减去定身抗性值）",
		isshow=2,
		scolor=254,
		sort=124,
		upNotShow=0,
		tipsNotShow=0,
	},
	[143] = { 
		Idx=143,
		name="定身效果减少时间",
		nbvalue="100#100#100",
		type=1,
		desc=" 定身抗性时间（计算定身时间，如定身抗性时间大于或等于定身时间，则定身效果失效，如定身抗性时间小于定身时间，则定身时间减去定身抗性时间）",
		isshow=0,
		scolor=254,
		sort=125,
		upNotShow=0,
		tipsNotShow=0,
	},
	[144] = { 
		Idx=144,
		name="护身抗性生效几率",
		nbvalue="100#100#100",
		type=2,
		desc="护身抗性生效几率",
		isshow=2,
		scolor=254,
		sort=126,
		upNotShow=0,
		tipsNotShow=0,
	},
	[145] = { 
		Idx=145,
		name="护身抗性增加的HP扣减比例",
		nbvalue="100#100#100",
		type=2,
		desc="护身抗性比例（减去护身MP承担比例，如当前护身MP承担比例为90%，HP承担10%，护身抗性比例为5%，生效后则比例变为MP承担85%，HP承担15%）",
		isshow=2,
		scolor=254,
		sort=127,
		upNotShow=0,
		tipsNotShow=0,
	},
	[146] = { 
		Idx=146,
		name="复活抗性生效几率",
		nbvalue="100#100#100",
		type=2,
		desc="复活抗性生效几率",
		isshow=2,
		scolor=254,
		sort=128,
		upNotShow=0,
		tipsNotShow=0,
	},
	[147] = { 
		Idx=147,
		name="复活戒指增加的CD时间",
		nbvalue="100#100#100",
		type=1,
		desc="复活抗性时间（该时间内复活戒指功能失效）",
		isshow=0,
		scolor=254,
		sort=129,
		upNotShow=0,
		tipsNotShow=0,
	},
	[148] = { 
		Idx=148,
		name="中绿毒机率",
		nbvalue="100#100#100",
		type=2,
		desc="使攻击对像中绿毒 （必须配上150中毒时间才会生效,中毒最大数量使用158）",
		isshow=2,
		scolor=254,
		sort=130,
		upNotShow=0,
		tipsNotShow=0,
	},
	[149] = { 
		Idx=149,
		name="中绿毒点数",
		nbvalue="100#100#100",
		type=1,
		desc="中绿毒点数（必须配上150中毒时间才会生效）",
		isshow=2,
		scolor=254,
		sort=131,
		upNotShow=0,
		tipsNotShow=0,
	},
	[150] = { 
		Idx=150,
		name="中绿毒时间（秒）",
		nbvalue="100#100#100",
		type=1,
		desc="中毒时间",
		isshow=0,
		scolor=254,
		sort=132,
		upNotShow=0,
		tipsNotShow=0,
	},
	[151] = { 
		Idx=151,
		name="中绿毒吸血几率",
		nbvalue="100#100#100",
		type=2,
		desc="中绿毒吸血几率（血花落照属性）",
		isshow=2,
		scolor=254,
		sort=133,
		upNotShow=0,
		tipsNotShow=0,
	},
	[152] = { 
		Idx=152,
		name="中绿毒吸血比例",
		nbvalue="100#100#100",
		type=2,
		desc="中绿毒时吸血比例万分比",
		isshow=2,
		scolor=254,
		sort=134,
		upNotShow=0,
		tipsNotShow=0,
	},
	[153] = { 
		Idx=153,
		name="会心一击",
		nbvalue="100#100#100",
		type=2,
		desc="2倍伤害",
		isshow=2,
		scolor=254,
		sort=135,
		upNotShow=0,
		tipsNotShow=0,
	},
	[154] = { 
		Idx=154,
		name="会心抵抗",
		nbvalue="100#100#100",
		type=2,
		desc="会心一击抵抗几率",
		isshow=2,
		scolor=254,
		sort=136,
		upNotShow=0,
		tipsNotShow=0,
	},
	[155] = { 
		Idx=155,
		name="中红毒机率",
		nbvalue="100#100#100",
		type=2,
		desc="使攻击对像中红毒（必须配上150中毒时间才会生效）",
		isshow=2,
		scolor=254,
		sort=130,
		upNotShow=0,
		tipsNotShow=0,
	},
	[156] = { 
		Idx=156,
		name="中红毒增伤比",
		nbvalue="100#100#100",
		type=2,
		desc="中红毒增伤比（必须配上150中毒时间才会生效）",
		isshow=2,
		scolor=254,
		sort=131,
		upNotShow=0,
		tipsNotShow=0,
	},
	[157] = { 
		Idx=157,
		name="中红毒时间（秒）",
		nbvalue="100#100#100",
		type=1,
		desc="中毒时间",
		isshow=0,
		scolor=254,
		sort=132,
		upNotShow=0,
		tipsNotShow=0,
	},
	[158] = { 
		Idx=158,
		name="中毒最大数量",
		nbvalue="100#100#100",
		type=1,
		desc="中毒最大数量",
		isshow=2,
		scolor=254,
		sort=135,
		upNotShow=0,
		tipsNotShow=0,
	},
	[161] = { 
		Idx=161,
		name="魔法躲避",
		nbvalue="11520#11520#11520",
		type=2,
		desc="闪避受到的魔法攻击-万分比 （技能不同上限%比不同,只有部分技能生效）",
		isshow=2,
		szshow=2,
		sort=200,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[162] = { 
		Idx=162,
		name="毒物躲避",
		nbvalue="11520#11520#11520",
		type=2,
		desc="增加一定的麻痹抗性-万分比",
		isshow=2,
		szshow=2,
		sort=201,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[163] = { 
		Idx=163,
		name="中毒恢复",
		nbvalue="11520#11520#11520",
		type=2,
		desc="缩减中毒时间和麻痹时间-万分比",
		isshow=2,
		szshow=2,
		sort=202,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[164] = { 
		Idx=164,
		name="体力恢复",
		nbvalue="11520#11520#11520",
		type=2,
		desc="提高安全区生命值恢复效果-万分比",
		isshow=2,
		szshow=2,
		sort=203,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[165] = { 
		Idx=165,
		name="魔法恢复",
		nbvalue="11520#11520#11520",
		type=2,
		desc="提高安全区魔法值恢复效果-万分比",
		isshow=2,
		szshow=2,
		sort=204,
		zl=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[171] = { 
		Idx=171,
		name="火增加",
		nbvalue="100#100#100",
		type=2,
		desc="增加攻击元素-火(火焰)-万分比",
		isshow=2,
		szshow=2,
		scolor=146,
		sort=20,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[172] = { 
		Idx=172,
		name="冰增加",
		nbvalue="100#100#100",
		type=2,
		desc="增加攻击元素-冰(冰寒)-万分比",
		isshow=2,
		szshow=2,
		scolor=146,
		sort=21,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[173] = { 
		Idx=173,
		name="电增加",
		nbvalue="100#100#100",
		type=2,
		desc="增加攻击元素-雷(电击)-万分比",
		isshow=2,
		szshow=2,
		scolor=146,
		sort=22,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[174] = { 
		Idx=174,
		name="风增加",
		nbvalue="100#100#100",
		type=2,
		desc="增加攻击元素-风(飓风)-万分比",
		isshow=2,
		szshow=2,
		scolor=146,
		sort=23,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[175] = { 
		Idx=175,
		name="神圣增加",
		nbvalue="100#100#100",
		type=2,
		desc="增加攻击元素-圣(神圣)-万分比",
		isshow=2,
		szshow=2,
		scolor=146,
		sort=24,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[176] = { 
		Idx=176,
		name="暗黑增加",
		nbvalue="100#100#100",
		type=2,
		desc="增加攻击元素-暗(暗黑)-万分比",
		isshow=2,
		szshow=2,
		scolor=146,
		sort=25,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[177] = { 
		Idx=177,
		name="幻影增加",
		nbvalue="100#100#100",
		type=2,
		desc="增加攻击元素-幻(幻影)-万分比",
		isshow=2,
		szshow=2,
		scolor=146,
		sort=26,
		zl=5,
		ts=1,
		upNotShow=0,
		tipsNotShow=0,
	},
	[190] = { 
		Idx=190,
		name="会心一击机率",
		nbvalue="100#100#100",
		type=2,
		desc="会心一击机率-万分比",
		isshow=2,
		scolor=254,
		sort=135,
		upNotShow=0,
		tipsNotShow=0,
	},
	[191] = { 
		Idx=191,
		name="会心一击倍率",
		nbvalue="100#100#100",
		type=2,
		desc="会心一击倍率-万分比",
		isshow=2,
		scolor=254,
		sort=135,
		upNotShow=0,
		tipsNotShow=0,
	},
	[192] = { 
		Idx=192,
		name="会心一击伤害",
		nbvalue="100#100#100",
		type=1,
		desc="会心一击伤害-数值",
		isshow=2,
		scolor=254,
		sort=135,
		upNotShow=0,
		tipsNotShow=0,
	},
	[200] = { 
		Idx=200,
		name="刀刀切割",
		nbvalue="100#100#100",
		type=1,
		desc="攻击怪物时造成的固定伤害（cfg_damage_number飘字类型12）",
		isshow=2,
		szshow=2,
		scolor=253,
		sort=137,
		ys="对怪伤害：",
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[300] = { 
		Idx=300,
		name="蛛网时长（秒）",
		nbvalue="100#100#100",
		type=1,
		desc="蛛网成功后，蛛网时间（秒） 暂末生效",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=117,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[301] = { 
		Idx=301,
		name="蛛网概率",
		nbvalue="100#100#100",
		type=2,
		desc="蛛网成功概率%       暂末生效",
		isshow=2,
		szshow=0,
		scolor=254,
		sort=118,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[302] = { 
		Idx=302,
		name="蛛网最大数量",
		nbvalue="100#100#100",
		type=1,
		desc="蛛网最大数量         暂末生效",
		isshow=2,
		scolor=254,
		sort=119,
		upNotShow=0,
		tipsNotShow=0,
	},
	[303] = { 
		Idx=303,
		name="蛛网速度",
		nbvalue="100#100#100",
		type=2,
		desc="蛛网速度M2-跑步间隔CD、走路间隔CD速度增加万分比       暂末生效",
	},
	[304] = { 
		Idx=304,
		name="冰缓时长（秒）",
		nbvalue="100#100#100",
		type=1,
		desc="冰冻成功后，冰冻时间（秒）    暂末生效",
		isshow=0,
		szshow=0,
		scolor=254,
		sort=117,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[305] = { 
		Idx=305,
		name="冰缓概率",
		nbvalue="100#100#100",
		type=2,
		desc="冰冻成功概率%        暂末生效",
		isshow=2,
		szshow=0,
		scolor=254,
		sort=118,
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[306] = { 
		Idx=306,
		name="冰缓最大数量",
		nbvalue="100#100#100",
		type=1,
		desc="冰冻最大数量          暂末生效",
		isshow=2,
		scolor=254,
		sort=119,
		upNotShow=0,
		tipsNotShow=0,
	},
	[307] = { 
		Idx=307,
		name="冰缓攻速",
		nbvalue="100#100#100",
		type=2,
		desc="冰缓攻速M2-攻击间隔CD、魔法间隔CD速度增加万分比      暂末生效",
		isshow=2,
		scolor=254,
		sort=119,
		upNotShow=0,
		tipsNotShow=0,
	},
	[308] = { 
		Idx=308,
		name="冰缓移速",
		nbvalue="100#100#100",
		type=2,
		desc="冰缓移速M2-跑步间隔CD、走路间隔CD速度增加万分比      暂末生效",
	},
	[201] = { 
		Idx=201,
		name="回收增加",
		nbvalue="100#100#100",
		type=2,
		desc="回收增加的比例",
		isshow=2,
		szshow=2,
		scolor=253,
		sort=137,
		ys="回收增加",
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
	[202] = { 
		Idx=202,
		name="鞭尸概率",
		nbvalue="100#100#100",
		type=2,
		desc="鞭尸概率",
		isshow=2,
		szshow=2,
		scolor=253,
		sort=137,
		ys="回收增加",
		zl=10,
		upNotShow=0,
		tipsNotShow=0,
	},
}
return config
