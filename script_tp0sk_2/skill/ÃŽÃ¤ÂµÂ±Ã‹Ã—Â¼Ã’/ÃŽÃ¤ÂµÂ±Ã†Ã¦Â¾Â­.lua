--����: �䵱�澭

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--��������

	SKILL_LEVEL_BASE_ATTRIB	  =	--���ܵȼ���ػ�������
	{
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
	{magic="state_dodge_percent_adjust",
	damage_factor_z={{1,5},{10,5}},
	},
	{magic="state_physicalwound_per_add",
	damage_factor_z={{1,0},{2,0},{3,5},{9,20},{10,25}},
	},
	{magic="state_weapon_limit",
	damage_factor_z={{1,512},{10,512}},
	},
	{magic="state_physical_parmor_per_dec_no_ignore",
	damage_factor_z={{1,15},{10,15}},
	},
	{magic="state_magic_parmor_per_dec_no_ignore",
	damage_factor_z={{1,15},{10,15}},
	},
	{magic="state_medica_neili_effect_add",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="state_abrade_attack_interval",
	damage_factor_z={{1,3},{10,3}},
	},
	{magic="state_observe_physical_atk_increase",
	damage_factor_z={{1,100},{10,100}},
	},
	{magic="state_desterity_physical_atk_increase",
	damage_factor_z={{1,50},{10,50}},
	},
	{magic="state_level_2_max_life_rate",
	damage_factor_z={{1,300},{10,300}},
	},	
	{magic="state_trans_2_max_life_rate",
	damage_factor_z={{1,3000},{10,3000}},
	},
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--���ܵȼ��������ħ������
	{
	},
}
