local config = { 
	[1] = { 
		id=1,
		showcaption="<攻        击：%s-%s/FCOLOR=253>",
		tubiao="1=res/public/btn_szjm_01_3.png#res/public/btn_szjm_01_4.png",
	},
	[2] = { 
		id=2,
		showcaption="<伤害加成：%s/FCOLOR=253>",
		tubiao="2=2#3",
	},
	[3] = { 
		id=3,
		showcaption="<防御加成：%s%/FCOLOR=254>",
	},
	[4] = { 
		id=4,
		showcaption="<暴击几率：%s/FCOLOR=253>",
	},
	[5] = { 
		id=5,
		showcaption="<伤害减免：%s%/FCOLOR=254>",
	},
	[6] = { 
		id=6,
		showcaption="<攻击加成：%s/FCOLOR=253>",
	},
	[7] = { 
		id=7,
		showcaption="<HP加成：%s/FCOLOR=253>",
	},
	[8] = { 
		id=8,
		showcaption="<伤害反弹：%s/FCOLOR=253>",
	},
	[9] = { 
		id=9,
		showcaption="<武力值：%s/FCOLOR=254>",
	},
	[10] = { 
		id=10,
		showcaption="<武力值：%s/FCOLOR=254>",
	},
	[11] = { 
		id=11,
		showcaption="<攻击加成：+%s%/FCOLOR=254>",
	},
	[12] = { 
		id=12,
		showcaption="<血量加成：+%s/FCOLOR=253>",
	},
	[13] = { 
		id=13,
		showcaption="<体力1：+%s   扩展属性：%s/FCOLOR=254>",
	},
	[14] = { 
		id=14,
		showcaption="<体力2：+%s   扩展属性：%s/FCOLOR=254>",
	},
	[15] = { 
		id=15,
		showcaption="<体力3：+%s   扩展属性：%s/FCOLOR=254>",
	},
	[16] = { 
		id=16,
		showcaption="<体力4：+%s   扩展属性：%s/FCOLOR=254>",
	},
	[17] = { 
		id=17,
		showcaption="<体力5：+%s   扩展属性：%s/FCOLOR=254>",
	},
	[18] = { 
		id=18,
		showcaption="<体力6：+%s   扩展属性：%s/FCOLOR=254>",
	},
	[19] = { 
		id=19,
		showcaption="<体力7：+%s   扩展属性：%s/FCOLOR=254>",
	},
	[20] = { 
		id=20,
		showcaption="<体力8：+%s   扩展属性：%s/FCOLOR=254>",
	},
	[21] = { 
		id=21,
		showcaption="<强力9：+%s~%s   自定义属性：%s/FCOLOR=254>",
	},
	[22] = { 
		id=22,
		showcaption="<灼伤：%s几率灼烧目标/FCOLOR=254>\\<每秒燃烧目标5%生命值/FCOLOR=249>",
	},
	[23] = { 
		id=23,
		showcaption="<伤害吸血：%s%/FCOLOR=254>",
	},
	[24] = { 
		id=24,
		showcaption="<攻击力加：%s点/FCOLOR=254>",
	},
	[25] = { 
		id=25,
		showcaption="<道术力加：%s点/FCOLOR=254>",
	},
	[26] = { 
		id=26,
		showcaption="<魔法力加：%s点/FCOLOR=254>",
	},
	[27] = { 
		id=27,
		showcaption="<防御增加：%s点/FCOLOR=254>",
	},
	[28] = { 
		id=28,
		showcaption="<魔御增加：%s点/FCOLOR=254>",
	},
	[29] = { 
		id=29,
		showcaption="<体力值加：%s点/FCOLOR=254>",
	},
	[30] = { 
		id=30,
		showcaption="<魔力值加：%s点/FCOLOR=254>",
	},
	[31] = { 
		id=31,
		showcaption="<真实爆率：%s/FCOLOR=254>",
		tubiao="1=res/public/btn_szjm_01_4.png#res/public/btn_szjm_01_3.png",
	},
	[32] = { 
		id=32,
		showcaption="<切割倍数：%s/FCOLOR=254>",
		tubiao="1=res/public/btn_szjm_01_4.png#res/public/btn_szjm_01_3.png",
	},
	[33] = { 
		id=33,
		showcaption="<卸装几率：%s/FCOLOR=254>",
		tubiao="1=res/public/btn_szjm_01_4.png#res/public/btn_szjm_01_3.png",
	},
	[34] = { 
		id=34,
		showcaption="<禁锢BUFF：%s/FCOLOR=254>",
		tubiao="1=res/public/btn_szjm_01_4.png#res/public/btn_szjm_01_3.png",
	},
	[35] = { 
		id=35,
		showcaption="<无敌之力：%s/FCOLOR=254>",
		tubiao="1=res/public/btn_szjm_01_4.png#res/public/btn_szjm_01_3.png",
	},
	[36] = { 
		id=36,
		showcaption="<【攻击暴涨】：攻击+%s%/FCOLOR=254>",
	},
	[37] = { 
		id=37,
		showcaption="<攻击：+%s/FCOLOR=254>",
	},
	[38] = { 
		id=38,
		showcaption="<神力倍攻：+%s%/FCOLOR=254>",
	},
	[39] = { 
		id=39,
		showcaption="<【江湖破功】：怪伤+%s/FCOLOR=254>",
	},
	[40] = { 
		id=40,
		showcaption="<攻击加成：%s%/FCOLOR=254>",
	},
	[41] = { 
		id=41,
		showcaption="<生命加成：%s%/FCOLOR=254>",
	},
	[42] = { 
		id=42,
		showcaption="<怪物切割：%s/FCOLOR=254>",
	},
}
return config
