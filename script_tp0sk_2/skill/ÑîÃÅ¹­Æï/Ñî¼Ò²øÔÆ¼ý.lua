--技能: 杨家缠云箭

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{7,12},{8,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{7,18},{8,20}}},
	{"skill_effect_persist_time",{{1,6},{4,6},{5,8},{8,8}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,4},{5,5},{8,5}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_damage_interval",{{1,-1},{8,-1}}},
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
	damage_factor_x={{1,0},{4,0},{5,120},{8,180}},
	probability_factor_b={{1,20},{8,20}},
	probability_factor_x={{1,100},{8,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_slow",
	damage_factor_d={{1,5},{8,5}},
	damage_factor_z={{1,20},{4,35},{5,20},{8,39}},
	damage_factor_m={{1,85},{8,85}},
	probability_factor_b={{1,15},{8,15}},
	probability_factor_x={{1,100},{8,100}},
	},
	{magic="state_dodge_percent_adjust",
	damage_factor_d={{1,-3},{8,-3}},
	damage_factor_z={{1,-6},{8,-28}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
