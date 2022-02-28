--技能: 如意锁元功

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_effect_persist_time",{{1,600},{10,600}}},
	{"skill_display_persist_time",{{1,60},{2,60},{3,75},{4,75},{5,90},{6,90},{7,105},{8,105},{9,120},{10,120}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
	{"cost_mana_point",{{1,410},{10,500}}}
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
	{magic="state_skill_convert_from_1",
	damage_factor_z={{1,76},{10,76}},
	},
	{magic="state_skill_convert_to_1",
	damage_factor_z={{1,27328513},{10,27328522}},
	},
	{magic="state_physical_parmor_poi_add",
	damage_factor_z={{1,1},{3,1},{4,2},{6,2},{7,3},{9,3},{10,5}},
	},
	{magic="state_magic_parmor_poi_add",
	damage_factor_z={{1,1},{3,1},{4,2},{6,2},{7,3},{9,3},{10,5}},
	},
	--84号技能间隔时间延长6秒，因为是延长，所以6秒为负数，必须取补码
	{magic="state_skill_cast_interval_dec_spec_1",
	damage_factor_z={{1,5570452},{10,5570452}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	},
}
