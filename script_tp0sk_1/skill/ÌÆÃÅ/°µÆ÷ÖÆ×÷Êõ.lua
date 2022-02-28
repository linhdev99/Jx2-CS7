--技能: 暗器制作术

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,0},{3,0},{4,10},{5,0},{6,10},{7,0},{9,3}}},
	{"skill_display_persist_time",{{1,1},{9,9}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,10},{5,20},{9,40}}},
	{"cost_goods_id",{{1,131073},{2,131073},{3,131074},{4,131074},{5,524293},{6,524293},{7,131076},{8,131077},{9,131078}}},
	{"cost_goods_num",{{1,1},{9,1}}},
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_vanish_after_collide",{{1,0},{2,30},{3,0},{9,0}}},
	},

	--魔法属性

	--属性值:	普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E)
	--			+ 武器外功攻击点 * F + Z
	--			(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除Z外,其余各伤害因素为百分比数.)

	--成功几率:	(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
	--			(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
	{
	{magic="damage_reserved",
	damage_factor_c={{1,50},{9,50}},
	damage_factor_d={{1,100},{9,100}},
	damage_factor_z={{1,50},{9,50}},
	},
	{magic="damage_knockback",
	damage_factor_z={{1,0},{6,0},{7,2},{8,0},{9,0}},
	probability_factor_x={{1,0},{6,0},{7,15},{8,0},{9,0}},
	},
	{magic="damage_life",
	damage_factor_x={{1,10},{2,0},{9,0}},
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_missle_damage_range_add",
	damage_factor_z={{1,0},{2,0},{3,2},{4,0},{9,0}},
	probability_factor_x={{1,0},{2,0},{3,20},{4,0},{9,0}},
	},
	{magic="state_p_attack_percent_dec",
	damage_factor_z={{1,0},{3,0},{4,15},{5,0},{9,0}},
	probability_factor_x={{1,0},{3,0},{4,30},{5,0},{9,0}},
	},
	{magic="state_ghost_killer",
	damage_factor_z={{1,0},{4,0},{5,1},{6,0},{9,0}},
	},
	{magic="state_physical_parmor_poi_dec",
	damage_factor_z={{1,0},{5,0},{6,15},{7,0},{9,0}},
	probability_factor_x={{1,0},{5,0},{6,30},{7,0},{9,0}},
	},
	{magic="state_quench_posion_p_add",
	damage_factor_z={{1,0},{7,0},{8,20},{9,0}},
	},
	{magic="state_paralysis",
	probability_factor_x={{1,0},{8,0},{9,15}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
