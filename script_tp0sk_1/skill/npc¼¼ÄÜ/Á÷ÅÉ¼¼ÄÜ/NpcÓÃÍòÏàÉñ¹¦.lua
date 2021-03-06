--技能: 万相神功

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,30},{20,30}}},
	{"skill_need_practice",{{1,0},{4,0},{5,1},{9,1},{10,0},{20,0}}},
	{"skill_level_practice",{{1,0},{5,0},{6,100},{10,100},{11,0},{20,0}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_momentum",{{1,0},{2,0},{10,0},{11,0},{15,0},{16,0},{20,0}}},
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
	{magic="state_skill_caused_stand_change",
	damage_factor_z={{1,522},{20,522}},
	},
	{magic="state_skill_caused_move_change",
	damage_factor_z={{1,522},{20,522}},
	},
	{magic="state_diffuse_skill_effect",
	damage_factor_z={{1,34209812},{20,34209812}},
	},
	{magic="state_diffuse_skill_effect",
	damage_factor_z={{1,34275348},{20,34275348}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,20},{10,0},{11,5},{13,5},{14,10},{16,10},{17,15},{18,15},{19,20},{20,20}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,20},{10,0},{11,5},{13,5},{14,10},{16,10},{17,15},{18,15},{19,20},{20,20}},
	},
	{magic="state_physical_damage_absorb",
	damage_factor_z={{1,5000},{10,5000},{20,5000}},
	},
	{magic="state_magic_damage_absorb",
	damage_factor_z={{1,5000},{10,5000},{20,5000}},
	},
	{magic="state_immune",
	damage_factor_z={{1,100},{10,50},{20,100}},
	},
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,30},{15,0},{16,10},{17,10},{18,20},{19,20},{20,30}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}