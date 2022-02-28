--技能: 无天魔功

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,10},{10,10},{11,11},{19,15},{20,15}}},
	{"skill_display_persist_time",{{1,40},{9,56},{10,60},{20,80}}},
	{"skill_need_practice",{{1,0},{4,0},{5,1},{9,1},{10,0},{20,0}}},
	{"skill_level_practice",{{1,0},{5,0},{6,100},{10,100},{11,0},{20,0}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_momentum",{{1,5},{2,6},{10,6},{11,8},{15,8},{16,10},{20,10}}},
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
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_npc_corpse_revival",
	damage_factor_z={{1,151},{20,151}},
	},
	{magic="imme_summon_attack_add",
	damage_factor_z={{1,3900},{9,5500},{10,5900},{20,7900}},
	},
	{magic="imme_summon_speed_add",
	damage_factor_z={{1,100},{9,180},{10,200},{20,400}},
	},
	{magic="imme_summon_ai_param_1",
	damage_factor_z={{1,2000},{20,2000}},
	},
	{magic="imme_summon_ai_param_2",
	damage_factor_z={{1,1},{20,1}},
	},
	{magic="imme_summon_ai_param_3",
	damage_factor_z={{1,90},{20,90}},
	},
	{magic="imme_summon_ai_param_4",
	damage_factor_z={{1,54},{4,54},{5,72},{7,72},{8,90},{14,90},{15,108},{17,108},{18,126},{19,126},{20,144}},
	},
	},
}
