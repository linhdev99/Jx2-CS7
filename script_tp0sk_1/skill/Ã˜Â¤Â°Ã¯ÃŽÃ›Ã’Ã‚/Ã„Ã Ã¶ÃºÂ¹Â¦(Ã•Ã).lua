--����: ������(��)

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_effect_persist_time",{{1,180},{8,180}}},
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--���ܵȼ������������
	{
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
	{magic="state_no_affect_per_move_speed",
	damage_factor_c={{1,1},{4,2},{7,2},{8,2}},
	damage_factor_e={{1,2},{4,3},{7,3},{8,3}},
	damage_factor_m={{1,75},{8,75}},
	damage_factor_z={{1,5},{2,5},{3,10},{4,10},{5,10},{6,15},{7,15},{8,19}},
	},
	{magic="state_no_affect_per_att_speed",
	damage_factor_c={{1,1},{4,2},{7,2},{8,2}},
	damage_factor_e={{1,2},{4,3},{7,3},{8,3}},
	damage_factor_m={{1,75},{8,75}},
	damage_factor_z={{1,5},{2,10},{3,10},{4,10},{5,15},{6,15},{7,15},{8,24}},
	},
	{magic="state_accuracy_percent_adjust",
	damage_factor_z={{1,5},{8,5}},
	},
	{magic="state_dodge_percent_adjust",
	damage_factor_z={{1,5},{8,5}},
	}
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
