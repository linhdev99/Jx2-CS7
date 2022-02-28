--技能: 罗汉阵

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,2},{6,2}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,10},{5,12},{6,12}}},

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
	{magic="state_physic_damage_rebound",
	damage_factor_z={{1,5},{2,10},{3,10},{4,15},{5,15},{6,20}},
	},
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,5},{2,10},{5,10},{6,15}},
	},
	{magic="state_sub1_rate_add",
	damage_factor_z={{1,1},{2,1},{3,2},{4,2},{5,3},{6,3}},
	},
	{magic="state_sub2_rate_add",
	damage_factor_z={{1,0},{5,0},{6,1}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
