--技能: 杨家正气箭

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_sub_skill1_probability",{{1,0},{3,0},{4,8},{8,12},{9,15}}},
	{"skill_sub_skill1_factor",{{1,0},{3,0},{4,10},{8,18},{9,20}}},
	{"skill_effect_persist_time",{{1,10},{9,10}}},
	{"skill_display_persist_time",{{1,1},{3,3},{4,1},{6,3},{7,1},{9,3}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,4},{3,4},{4,7},{6,7},{7,10},{9,10}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
	{"missle_damage_interval",{{1,-1},{9,-1}}},
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
	{magic="common_probability",
	probability_factor_b={{1,20},{10,20}},
	probability_factor_x={{1,100},{10,100}},
	},
	{magic="state_lost_life_per18",
	damage_factor_x={{1,20},{9,60}},
	},
	{magic="state_lost_life_per18_monster",
	damage_factor_x={{1,80},{9,200}},
	},
	{magic="state_lost_life_per18_summon",
	damage_factor_x={{1,80},{9,240}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
