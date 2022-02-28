--技能: BOSS狂暴

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,10},{2,300},{3,99999999},{4,99999999},{5,99999999},{6,99999999},{7,99999999},{20,1}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
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
	{magic="state_move_speed_percent_add",
	damage_factor_z={{1,30},{2,0},{3,0},{4,0},{5,0},{6,50},{7,50},{20,0}},
	},
	{magic="state_attack_speed_add",
	damage_factor_z={{1,30},{2,0},{3,0},{4,0},{5,0},{6,30},{7,30},{20,0}},
	},
	{magic="state_burst_enhance_rate",
	damage_factor_z={{1,30},{2,0},{3,0},{4,0},{5,0},{6,30},{7,30},{20,0}},
	},
	{magic="state_p_attack_percent_add",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_m_attack_percent_add",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,0},{2,75},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_o_defence_point_add",
	damage_factor_z={{1,0},{2,0},{3,2000},{4,9999},{5,3000},{6,0},{7,1000},{20,0}},
	},
	{magic="state_i_defence_point_add",
	damage_factor_z={{1,0},{2,0},{3,2000},{4,9999},{5,9999},{6,0},{7,1000},{20,0}},
	},
	{magic="state_magic_parmor_poi_dec",
	damage_factor_z={{1,0},{2,0},{3,100},{4,0},{5,100},{6,0},{7,0},{20,0}},
	},
	{magic="state_physical_parmor_poi_dec",
	damage_factor_z={{1,0},{2,0},{3,100},{4,0},{5,100},{6,0},{7,0},{20,0}},
	},
	{magic="state_physical_def_point_dec",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	{magic="state_neili_defence_point_dec",
	damage_factor_z={{1,0},{2,0},{3,0},{4,0},{5,0},{6,0},{7,0},{20,0}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
