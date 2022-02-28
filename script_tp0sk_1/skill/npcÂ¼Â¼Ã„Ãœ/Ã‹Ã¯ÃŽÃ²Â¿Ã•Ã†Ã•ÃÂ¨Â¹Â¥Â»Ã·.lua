

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
		{"skill_effect_persist_time",{{1,1},{20,20}}},
	{"skill_display_persist_time",{{1,1},{20,20}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{

	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
	{
       {"skill_missle_waittime",{{1,15},{10,15},{11,0},{20,0}}},
       {"missle_damage_range_w",{{1,30},{20,30}}},
       {"missle_damage_range_h",{{1,30},{20,30}}},
       {"missle_collide_range_w",{{1,30},{20,30}}},
       {"missle_collide_range_h",{{1,30},{20,30}}},
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
       damage_factor_x={{1,100},{10,500},{11,100},{20,500}},
	},
	{magic="damage_knockback",
	damage_factor_z={{1,2},{20,2}},
	
	},
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
	{
	{magic="state_block_qinggong",
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
