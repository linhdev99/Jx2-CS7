--����: ����

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_sub_skill1_probability",{{1,0},{2,0},{3,5},{4,10},{5,15}}},
	{"skill_sub_skill1_factor",{{1,0},{2,0},{3,10},{4,15},{5,20}}},
	{"skill_effect_persist_time",{{1,1800},{5,1800}}},
	{"skill_display_persist_time",{{1,1800},{5,1800}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
	{"cost_mana_percent",{{1,2},{5,2}}}
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--���ܵȼ�����ӵ�����
	{
	},

	--ħ������

	--����ֵ:	��ͨ������ * X + (1 + ���ܵȼ� * Y) * (���� * A + ���� * B + �� * C + �ڹ� * D + ���� * E)
	--			+ �����⹦������ * F + Z
	--			(����,A,B,C,D,E,F,X,Y,ZΪ�˺�����.��Z��,������˺�����Ϊ�ٷֱ���.)

	--�ɹ�����:	(����ֵ * A + (����ȼ� - �Է��ȼ�) * B + ���ܵȼ� * C) * D + X
	--			(����,A,B,C,D,XΪ��������.��X��,�������������Ϊ�ٷֱ���.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--���ܵȼ�����˺�ħ������
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--���ܵȼ����״̬ħ������
	{
	{magic="state_special_dancing_state",
	damage_factor_z={{1,2048},{5,2048}},
	},
	{magic="state_cast_technique_rate",
	damage_factor_z={{1,1},{5,5}},
	},
	{magic="state_forbid_dispel",
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
