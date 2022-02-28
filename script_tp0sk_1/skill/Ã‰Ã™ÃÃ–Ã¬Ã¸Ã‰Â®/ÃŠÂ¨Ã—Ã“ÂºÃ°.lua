--技能: 狮子吼

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{2,8},{3,10},{4,12},{5,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,10},{3,13},{4,16},{5,20}}},
	{"skill_sub_skill2_probability",{{1,0},{4,0},{5,5}}},
	{"skill_sub_skill2_factor",{{1,0},{4,0},{5,12}}},
	{"skill_effect_persist_time",{{1,2},{5,2}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,110},{5,150}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_vanish_after_collide",{{1,1},{5,1}}},
	{"missle_damage_interval",{{1,99},{5,99}}},
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
	damage_factor_x={{1,50},{4,80},{5,100}},
	damage_factor_z={{1,200},{4,560},{5,700}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_vertigo",
	damage_factor_z={{1,1},{5,1}},
	probability_factor_b={{1,10},{5,10}},
	probability_factor_x={{1,45},{5,75}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
