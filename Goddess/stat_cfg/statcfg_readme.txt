some more information about statistic config

[CommonAttrType]
ITEM_STAT means xxx_val is reference from [playeritemstat.txt].group_id
TASK_STAT means xxx_val is reference from [playertaskstat.txt].group_id
ROLE_BASE means xxx_val is predefined base attr of player, see [RoleBaseAttrDef]
ITEM_GROUP means xxx_val is reference from [itemgroup.txt].group_id
ITEM_BASE means xxx_val is an item base attribute, see [ItemBaseAttrDef]
CONST means xxx_val is a const number value
LIFE_SKILL means xxx_val is a life skill id referrence. xxx_val = Type*1000+SkillId Type0=collect Type1=compose
RECIPE means xxx_val a life skill recipe id reference.

[RoleBaseAttrDef]
0 = none
1 = LEVEL
2 = FACTION_PATH
3 = FACTION
4 = GOLD_ALL
5 = TRANS_LEVEL
9 = OFFLINE_DAYS
10 = LASTLOGIN_DAYS_PAST
11 = EXP
12 = REBORN_COUNT	
13 = REBORN_ROUTE	


[ItemBaseAttrDef]
0 = none
1001 = ITEM_G
1002 = ITEM_D
1003 = ITEM_P
1004 = ITEM_ENHANCE
1005 = ITEM_NUM
1006 = ITEM_PLACE	;values see [ItemPlaceDef]
1007 = ITEM_CUR_LINGQI
1008 = ITEM_MAX_LINGQI
1009 = ITEM_MAGIC1
1010 = ITEM_MAGIC2
1011 = ITEM_MAGIC3
1012 = ITEM_LEVEL
1013 = ITEM_DING7
1014 = ITEM_DING10
1015 = GEM_SOCKET1
1016 = GEM_SOCKET2
1017 = GEM_SOCKET3
1018 = GEM_SOCKET_OPEN_CNT

[ItemPlaceDef]
1 = CurEquip
2 = Bag
3 = StoreBox
7 = SelfStall

[StatType]
COUNT
SUM
AVG

[PreTreatmentType]
NONE
ABS
BYTE1
BYTE2
BYTE3
BYTE4
WORD1
WORD2
BIT1
BIT1
BIT2
BIT3
BIT4
BIT5
BIT6
BIT7
BIT8
BIT9
BIT10
BIT11
BIT12
BIT13
BIT14
BIT15
BIT16
BIT17
BIT18
BIT19
BIT20
BIT21
BIT22
BIT23
BIT24
BIT25
BIT26
BIT27
BIT28
BIT29
BIT30
BIT31
BIT32

[TaskStatType]
TASK means xxx_val is a task_id
GROUP means xxx_val is another task group_id

[OffLineDaysLimit]
-1 means config is not a valid config
0 means config is limit without offline time
>0 means offline time limit only less than this days

[LineID]
it is only a sign to each config, it never used in statistic
