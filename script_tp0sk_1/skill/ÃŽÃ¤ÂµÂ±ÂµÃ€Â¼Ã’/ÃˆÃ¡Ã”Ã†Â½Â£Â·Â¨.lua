--技能: 柔云剑法

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{7,12},{8,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{7,18},{8,20}}},
	{"skill_burst_time",{{1,28},{4,28},{5,30},{6,30},{7,33},{8,33}}},
	{"skill_burst_speed_percent",{{1,150},{4,150},{5,100},{6,100},{7,75},{8,75}}},
	{"skill_effect_persist_time",{{1,2},{8,2}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,10},{4,30},{8,70}}}
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
	damage_factor_x={{1,30},{4,60},{5,50},{6,55},{7,50},{8,55}},
	damage_factor_z={{1,35},{4,65},{5,55},{6,60},{7,55},{8,60}},
	probability_factor_b={{1,20},{8,20}},
	probability_factor_x={{1,100},{8,100}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="common_probability",
	probability_factor_b={{1,20},{8,20}},
	probability_factor_x={{1,100},{8,100}},
	},
	{magic="state_attack_speed_dec",
	damage_factor_z={{1,20},{8,20}},
	},
	{magic="state_burst_dec_rate",
	damage_factor_z={{1,20},{8,20}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
