--技能: 烈焰剑法

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{7,12},{8,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{7,18},{8,20}}},
	{"skill_burst_time",{{1,14},{4,14},{5,18},{6,18},{7,23},{8,23}}},
	{"skill_burst_speed_percent",{{1,70},{4,70},{5,45},{6,45},{7,30},{8,30}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,12},{4,36},{5,50},{8,80}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"skill_missle_num",{{1,1},{4,1},{5,2},{6,2},{7,3},{8,3}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	{magic="damage_life",
	damage_factor_x={{1,55},{4,130},{5,85},{6,110},{7,80},{8,100}},
	damage_factor_z={{1,40},{4,130},{5,90},{6,115},{7,80},{8,100}},
	probability_factor_b={{1,20},{8,20}},
	probability_factor_x={{1,100},{8,100}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
