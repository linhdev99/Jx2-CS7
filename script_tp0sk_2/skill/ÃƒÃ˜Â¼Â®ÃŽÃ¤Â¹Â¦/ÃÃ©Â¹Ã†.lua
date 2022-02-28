--技能: 灵蛊

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,300},{8,300},{9,60},{10,15}}},
	{"skill_display_persist_time",{{1,0},{9,0},{10,1}}},
	{"skill_cast_interval",{{1,54},{8,54},{9,270},{10,54}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,86},{8,100},{9,110},{10,120}}},
	{"cost_goods_id",{{1,1114138},{8,1114138},{9,1114139},{10,1114140}}},
	{"cost_goods_num",{{1,1},{10,1}}},
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
	{magic="state_strength_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_vitality_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_energy_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_dexterity_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_observe_add_percent",
	damage_factor_z={{1,1},{8,8},{9,10},{10,9}},
	},
	{magic="state_receive_half_damage",
	damage_factor_z={{1,3},{8,10},{9,15},{10,12}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
