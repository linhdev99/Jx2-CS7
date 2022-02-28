--技能: 混沌镇岳掌

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{4,0},{5,8},{8,11},{10,15}}},
	{"skill_sub_skill1_factor",{{1,0},{4,0},{5,10},{7,18},{10,33}}},
	{"skill_effect_persist_time",{{1,5},{10,5}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"skill_param1",{{1,5},{10,5}}},
	{"skill_param2",{{1,5},{10,5}}},
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
	damage_factor_a={{1,80},{8,115},{10,130}},
	damage_factor_b={{1,80},{8,115},{10,130}},
	damage_factor_c={{1,80},{8,115},{10,130}},
	damage_factor_d={{1,80},{8,115},{10,130}},
	damage_factor_e={{1,80},{8,115},{10,130}},
	damage_factor_z={{1,110},{10,200}},
	probability_factor_b={{1,20},{10,20}},
	probability_factor_x={{1,100},{10,100}},
	},
	{magic="damage_ignore_rebound_per",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="damage_interrupt_rate_add",
	damage_factor_z={{1,30},{10,75}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_slow",
	damage_factor_z={{1,20},{5,20},{6,25},{8,25},{9,30},{10,30}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
