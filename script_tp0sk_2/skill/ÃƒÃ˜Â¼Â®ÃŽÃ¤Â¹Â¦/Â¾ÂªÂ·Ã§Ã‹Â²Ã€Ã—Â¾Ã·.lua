--技能: 惊风瞬雷诀

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{4,0},{5,8},{8,11},{10,15}}},
	{"skill_sub_skill1_factor",{{1,0},{4,0},{5,10},{7,18},{10,33}}},
	{"skill_effect_persist_time",{{1,6},{10,15}}},
	{"skill_display_persist_time",{{1,6},{10,15}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_percent",{{1,5},{1,5}}}
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
	{magic="state_special_weather_state",
	damage_factor_z={{1,64},{10,64}},
	},
	{magic="state_attack_add_spec",
	damage_factor_z={{1,66912261},{10,66912306}},
	},
	{magic="state_skill_cast_interval_dec_spec_1",
	damage_factor_z={{1,67239945},{10,67240026}},
	},
	{magic="state_persist_time_add_spec",
	damage_factor_z={{1,66977801},{10,66977882}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
