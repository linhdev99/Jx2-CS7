--����: �貨΢��

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
	{"skill_display_persist_time",{{1,200},{6,300}}},
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
	{magic="state_accelerate",
	damage_factor_z={{1,15},{2,15},{3,15},{4,15},{5,20},{6,20}},
	},
	{magic="state_accelerate_limit",
	damage_factor_z={{1,37},{2,37},{3,40},{4,40},{5,43},{6,43}},
	},
	{magic="state_accelerate_interval",
	damage_factor_z={{1,36},{6,36}},
	},
	{magic="state_shadow_run",
	damage_factor_z={{1,0},{2,0},{3,1605},{4,1605},{5,1610},{6,1610}},
	},
	{magic="state_del_skill_magic_when_stamina_exhaust",
	damage_factor_z={{1,30122},{6,30122}},
	},
	{magic="state_lost_stamina_per18",
	damage_factor_z={{1,2},{10,2}},
	},
  {magic="state_dodge_point_increase",
	damage_factor_z={{1,20},{2,40},{3,40},{4,60},{5,60},{6,80}},
	},
        
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
