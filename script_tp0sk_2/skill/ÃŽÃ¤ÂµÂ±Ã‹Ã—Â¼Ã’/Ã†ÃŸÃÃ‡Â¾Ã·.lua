--技能: 七星诀

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_burst_time",{{1,14},{2,14},{3,24},{7,24}}},
	{"skill_nextskill_wait_time",{{1,8},{2,8},{3,10},{4,10},{5,12},{6,12},{7,14}}},
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,8},{4,9},{5,10},{6,12},{7,15},{17,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,12},{5,15},{6,17},{7,20},{17,20}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,12},{7,15}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"skill_missle_num",{{1,2},{2,2},{3,3},{4,3},{5,4},{6,4},{7,5}}},
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
	damage_factor_c={{1,30},{7,60}},
	damage_factor_e={{1,30},{7,60}},
	damage_factor_x={{1,65},{2,70},{3,70},{4,75},{5,75},{6,80},{7,80}},
	probability_factor_b={{1,20},{7,20}},
	probability_factor_x={{1,100},{7,100}},
	}
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
