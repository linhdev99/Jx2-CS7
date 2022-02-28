--¼¼ÄÜ: »Ä»ğöÌ½ğò

Include("\\script\\skill\\skillfunctions.lua")

SKILL = {
	--¼¼ÄÜÊôĞÔ

	SKILL_LEVEL_BASE_ATTRIB	  =	--¼¼ÄÜµÈ¼¶Ïà¹Ø»ù±¾ÊôĞÔ
	{
	},

	SKILL_LEVEL_COST_ATTRIB	  =	--¼¼ÄÜµÈ¼¶Ïà¹ØÏûºÄÊôĞÔ
	{
	},

	SKILL_LEVEL_MISSLE_ATTRIB =	--¼¼ÄÜµÈ¼¶Ïà¹Ø×Óµ¯ÊôĞÔ
	{
	{"missle_collide_range_h",{{1,50},{2,50}}},
	{"missle_collide_range_w",{{1,50},{2,50}}},
	{"missle_damage_range_w",{{1,50},{2,50}}},
	{"missle_damage_range_h",{{1,50},{2,50}}},
	{"missle_vanish_after_collide",{{1,1},{2,1}}},
	{"missle_damage_interval",{{1,18},{2,18}}},
	{"missle_life_time",{{1,180},{2,180}}},
	},

	--Ä§·¨ÊôĞÔ

	--ÊôĞÔÖµ:	ÆÕÍ¨¹¥»÷Á¦ * X + (1 + ¼¼ÄÜµÈ¼¶ * Y) * (Á¦Á¿ * A + ¸ù¹Ç * B + Éí·¨ * C + ÄÚ¹¦ * D + ¶´²ì * E)
	--			+ ÎäÆ÷Íâ¹¦¹¥»÷µã * F + Z
	--			(ÆäÖĞ,A,B,C,D,E,F,X,Y,ZÎªÉËº¦ÒòËØ.³ıZÍâ,ÆäÓà¸÷ÉËº¦ÒòËØÎª°Ù·Ö±ÈÊı.)

	--³É¹¦¼¸ÂÊ:	(ÊôĞÔÖµ * A + (×ÔÉíµÈ¼¶ - ¶Ô·½µÈ¼¶) * B + ¼¼ÄÜµÈ¼¶ * C) * D + X
	--			(ÆäÖĞ,A,B,C,D,XÎª¼¸ÂÊÒòËØ.³ıXÍâ,ÆäÓà¸÷¼¸ÂÊÒòËØÎª°Ù·Ö±ÈÊı.)

	SKILL_MAGIC_DAMAGE_ATTRIB =	--¼¼ÄÜµÈ¼¶Ïà¹ØÉËº¦Ä§·¨ÊôĞÔ
	{
	},

	SKILL_MAGIC_STATE_ATTRIB  =	--¼¼ÄÜµÈ¼¶Ïà¹Ø×´Ì¬Ä§·¨ÊôĞÔ
	{
	},

	SKILL_MAGIC_IMME_ATTRIB   =	--¼¼ÄÜµÈ¼¶Ïà¹ØÁ¢¼´Ä§·¨ÊôĞÔ
	{
	{magic="imme_damage_life",
	damage_factor_z={{1,6000},{2,1400}},
	},
	},
}
