--技能: 杨家战定诀

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,10},{5,12},{6,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,13},{5,16},{6,20}}},
	{"skill_effect_persist_time",{{1,180},{6,180}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,4},{4,5},{6,5}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
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
	{magic="state_knockback_immune",
	damage_factor_b={{1,5},{6,7}},
	damage_factor_z={{1,10},{6,37}},
	damage_factor_m={{1,100},{6,100}},
	},
	{magic="state_knockdown_immune",
	damage_factor_b={{1,7},{6,9}},
	damage_factor_z={{1,20},{6,43}},
	damage_factor_m={{1,130},{6,130}},
	},
	{magic="state_o_defence_point_add",
	damage_factor_z={{1,10},{6,60}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}