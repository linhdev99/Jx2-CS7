--技能: 乌夜啼

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20}}},
	{"skill_sub_skill2_probability",{{1,0},{5,0},{6,5}}},
	{"skill_sub_skill2_factor",{{1,0},{5,0},{6,12}}},
	{"skill_display_persist_time",{{1,0},{3,0},{4,1},{6,1}}},
	{"skill_valid_object",{{1,456},{6,456}}},
	{"skill_effect_persist_time",{{1,2},{6,2}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,35},{6,60}}},
	{"cost_mana_per_second",{{1,6},{3,6},{4,12},{6,12}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_vanish_after_collide",{{1,1},{6,1}}},
	{"missle_damage_interval",{{1,99},{6,99}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_slow",
	damage_factor_c={{1,6},{3,8},{4,5},{6,5}},
	damage_factor_z={{1,15},{3,35},{4,10},{6,29}},
	damage_factor_m={{1,80},{6,80}},
	},
	{magic="state_damage_mana_max",
	damage_factor_z={{1,0},{3,0},{4,10},{6,20}},
	},
	{magic="state_fetter",
	damage_factor_z={{1,1},{6,1}},
	probability_factor_b={{1,0},{3,0},{4,1},{6,1}},
	probability_factor_x={{1,0},{3,0},{4,6},{6,10}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
