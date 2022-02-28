--技能: 下蛊秘方

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--技能属性

	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
	{
	{"skill_display_persist_time",{{1,1},{4,4}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
	{
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
	damage_factor_z={{1,354},{4,354}},
	},
	{magic="state_skill_convert_to_1",
	damage_factor_z={{1,23199749},{2,25427973},{3,25493509},{4,25559045}},
	},
	{magic="state_skill_convert_from_2",
	damage_factor_z={{1,356},{4,356}},
	},
	{magic="state_skill_convert_to_2",
	damage_factor_z={{1,23330821},{2,25624581},{3,25690117},{4,25755653}},
	},
	{magic="state_skill_convert_from_3",
	damage_factor_z={{1,358},{4,358}},
	},
	{magic="state_skill_convert_to_3",
	damage_factor_z={{1,23461893},{2,25821189},{3,25886725},{4,25952261}},
	},
	{magic="state_skill_convert_from_4",
	damage_factor_z={{1,360},{4,360}},
	},
	{magic="state_skill_convert_to_4",
	damage_factor_z={{1,23592965},{2,26017797},{3,26083333},{4,26148869}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
	{
	{magic="imme_mana_percent_damage",
	damage_factor_z={{1,4},{4,4}},
	},
	},
}
