--技能: 心蛊

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,90},{5,90},{6,60},{7,60}}},
	{"skill_display_persist_time",{{1,0},{5,0},{6,0},{7,1}}},
	{"skill_cast_interval",{{1,54},{5,54},{6,270},{7,540}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,82},{5,90},{6,100},{7,100}}},
	{"cost_goods_id",{{1,1114129},{5,1114129},{6,1114130},{7,1114131}}},
	{"cost_goods_num",{{1,1},{7,1}}},
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
	{magic="state_random_curse",
	damage_factor_z={{1,131090},{5,131102},{6,196648},{7,131107}},
	probability_factor_b={{1,20},{7,20}},
	probability_factor_x={{1,100},{7,100}},
	},
	{magic="state_random_curse_sort",
	damage_factor_z={{1,62},{7,62}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
