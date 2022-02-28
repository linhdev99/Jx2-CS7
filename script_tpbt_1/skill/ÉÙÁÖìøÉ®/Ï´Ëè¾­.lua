--技能: 洗髓经

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,30},{20,30}}},
	{"skill_burst_time",{{1,126},{4,126},{5,144},{8,144},{9,162},{11,162},{12,180},{13,180},{14,198},{15,198},{16,216},{17,216},{18,234},{19,252},{20,270}}},
	{"skill_need_practice",{{1,0},{4,0},{5,1},{9,1},{10,0},{20,0}}},
	{"skill_level_practice",{{1,0},{5,0},{6,100},{10,100},{11,0},{20,0}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_momentum",{{1,5},{2,6},{10,6},{11,8},{15,8},{16,10},{20,10}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_vanish_after_collide",{{1,1},{20,1}}},
	{"missle_damage_interval",{{1,36},{20,36}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	{magic="damage_life_monster",
	damage_factor_z={{1,2000},{9,2800},{10,3000},{20,5000}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_physical_parmor_per_dec",
	damage_factor_z={{1,20},{5,40},{20,40}},
	},
	{magic="state_magic_parmor_per_dec",
	damage_factor_z={{1,20},{5,40},{20,40}},
	},
	{magic="state_physical_def_point_dec",
	damage_factor_z={{1,0},{11,60},{15,100},{20,100}},
	},
	{magic="state_neili_defence_point_dec",
	damage_factor_z={{1,0},{11,60},{15,100},{20,100}},
	},
	{magic="state_slow",
	damage_factor_z={{1,0},{15,0},{16,5},{17,5},{18,10},{19,15},{20,15}},
	},
	{magic="state_damage0_add",
	damage_factor_z={{1,0},{5,0},{6,100},{20,1500}},
	},
	{magic="state_imme0_add",
	damage_factor_z={{1,0},{5,0},{6,1},{10,2},{13,3},{16,4},{19,5},{20,5}},
	},
	{magic="state_state0_add",
	damage_factor_z={{1,0},{5,0},{6,2},{10,10},{20,10}},
	},
	{magic="state_state4_add",
	damage_factor_z={{1,0},{16,0},{17,5},{19,15},{20,10}},
	},
	{magic="state_state2_add",
	damage_factor_z={{1,0},{10,0},{11,10},{15,50},{20,50}},
	},
	{magic="state_state3_add",
	damage_factor_z={{1,0},{10,0},{11,10},{15,50},{20,50}},
	},
	{magic="state_state1_add",
	damage_factor_z={{1,0},{5,0},{6,2},{10,10},{20,10}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_life_percent_damage",
	damage_factor_z={{1,8},{3,8},{4,9},{7,9},{8,10},{20,10}},
	},
	},
}
