--技能: 静夜思(子)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20}}},
	{"skill_valid_object",{{1,456},{6,456}}},
	{"skill_effect_persist_time",{{1,2},{6,2}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
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
	{magic="state_p_attack_percent_dec",
	damage_factor_c={{1,6},{3,8},{4,5},{6,7}},
	damage_factor_z={{1,15},{3,35},{4,10},{6,30}},
	},
	{magic="state_m_attack_percent_dec",
	damage_factor_c={{1,6},{3,8},{4,5},{6,7}},
	damage_factor_z={{1,15},{3,35},{4,10},{6,30}},
	},
	{magic="state_sleep",
	probability_factor_b={{1,0},{3,0},{4,1},{6,1}},
	probability_factor_x={{1,0},{3,0},{4,6},{6,10}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
