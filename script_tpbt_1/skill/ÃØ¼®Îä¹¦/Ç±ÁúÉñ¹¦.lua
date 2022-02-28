--技能: 潜龙神功

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{4,0},{5,8},{8,11},{10,15}}},
	{"skill_sub_skill1_factor",{{1,0},{4,0},{5,10},{7,18},{10,33}}},
	{"skill_effect_persist_time",{{1,30},{10,30}}},
	{"skill_display_persist_time",{{1,5},{3,5},{4,10},{6,10},{7,15},{9,15},{10,20}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,110},{10,200}}}
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
	{magic="state_retrusive_rate_add",
	damage_factor_z={{1,1},{9,5},{10,5}},
	},
	{magic="state_knockback_immune",
	damage_factor_z={{1,5},{10,20}},
	},
	{magic="state_i_defence_point_add",
	damage_factor_z={{1,65},{10,200}},
	},
	{magic="state_slow_attack",
	damage_factor_z={{1,327730},{3,327730},{4,655410},{6,655410},{7,983090},{9,983090},{10,1310770}},
	},
	{magic="state_confusion_immune",
	damage_factor_z={{1,15},{10,45}},
	},
	{magic="state_sleep_immune",
	damage_factor_z={{1,15},{10,45}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
