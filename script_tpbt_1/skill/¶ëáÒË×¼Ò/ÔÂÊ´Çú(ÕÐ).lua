--技能: 月蚀曲(招)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,3},{8,3}}}
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_vanish_after_collide",{{1,1},{8,1}}},
	{"missle_damage_interval",{{1,99},{8,99}}},
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
	damage_factor_z={{1,380},{8,800}},
	probability_factor_b={{1,20},{8,20}},
	probability_factor_x={{1,100},{8,100}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_damage_life_when_doskill",
	damage_factor_c={{1,10},{2,11},{3,12},{4,14},{5,10},{6,10},{7,10},{8,10}},
	damage_factor_z={{1,70},{3,90},{4,110},{5,70},{7,90},{8,118}},
	damage_factor_m={{1,210},{8,210}},
	probability_factor_b={{1,15},{8,15}},
	probability_factor_x={{1,75},{8,75}},
	},
	{magic="state_attack_speed_add",
	damage_factor_z={{1,0},{4,0},{5,50},{8,50}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_mana_percent_damage",
	damage_factor_z={{1,5},{8,5}},
	},
	},
	
}
