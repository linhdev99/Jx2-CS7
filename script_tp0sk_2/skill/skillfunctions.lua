--技能通用数据格式

--[说明]
--	技能的各项属性数值由一系列二维曲线提供;
--	曲线是一个一元函数.其中自变量为技能等级,因变量为特定技能属性数值.形如: Y = F(X) (X, 技能等级; Y, 技能属性值; F, 曲线)
--	实际应用的技能属性数值曲线是由若干(也可以是1条)曲线段连接而成的.以点列的形式定义,形如:
--	{技能等级X1, 属性值Y1, 曲线F1}, ... {技能等级Xn-1, 属性值Yn-1, 曲线Fn-1}, {技能等级Xn, 属性值Yn, 曲线Fn}, ...
--	若Xn-1 <= X <= Xn, 则Y = Fn(X)
--	曲线缺省为Line(直线)
--
--SKILL = {
--	******************************技能属性******************************
--	数据格式:
--	技能属性类 =
--	{
--		{属性A, {技能等级X1, 属性值Y1, 曲线F1}, {技能等级X2, 属性值Y2, 曲线F2}, ...},
--		{属性B, {技能等级X1, 属性值Y1, 曲线F1}, {技能等级X2, 属性值Y2, 曲线F2}, ...},
--		...
--	例如:
--		{"skill_use_range", {{1, 100}, {10, 300, Line}, {20, 500, Conic}}}	-- 技能使用范围
--	}
--
--	SKILL_LEVEL_BASE_ATTRIB	  =	--技能等级相关基本属性
--	{
--		...
--	},
--
--	SKILL_LEVEL_COST_ATTRIB	  =	--技能等级相关消耗属性
--	{
--		...
--	},
--
--	SKILL_LEVEL_MISSLE_ATTRIB =	--技能等级相关子弹属性
--	{
--		...
--	},
--
--	******************************魔法属性******************************
--
--	属性值:		Min[(普通攻击力 * X + (1 + 技能等级 * Y) * (力量 * A + 根骨 * B + 身法 * C + 内功 * D + 洞察 * E) + 武器外功攻击点 * F + Z), M]
--				(其中,A,B,C,D,E,F,X,Y,Z为伤害因素.除M、Z外,其余各伤害因素为百分比数. M为属性值上限)
--
--	成功几率:		(属性值 * A + (自身等级 - 对方等级) * B + 技能等级 * C) * D + X
--				(其中,A,B,C,D,X为几率因素.除X外,其余各几率因素为百分比数.)
--
--	数据格式:
--	[说明]
--	  伤害因素,几率因素缺省为0
--	魔法属性类 =
--	{
--		{
--			magic = 魔法属性1,
--			damage_factor_a = {{技能等级X1, 伤害因素Y1, 曲线F1}, {技能等级X2, 伤害因素Y2, 曲线F2}...}
--			...
--			damage_factor_z = {{技能等级X1, 伤害因素Y1, 曲线F1}, {技能等级X2, 伤害因素Y2, 曲线F2}...}
--			probability_factor_a = {{技能等级X1, 几率因素Y1, 曲线F1}, {技能等级X2, 几率因素Y2, 曲线F2}...}
--			...
--			probability_factor_x = {{技能等级X1, 几率因素Y1, 曲线F1}, {技能等级X2, 几率因素Y2, 曲线F2}...}
--		}
--		...
--		例如:
--		{
--			magic = "damage_life",						--伤害减生命
--			damage_factor_z = {{20,1}, {20,20}},		--伤害因素Z
--			probability_factor_x = {{100,1}, {100,20}}	--几率因素X
--		}
--	}
--
--	SKILL_MAGIC_DAMAGE_ATTRIB =	--技能等级相关伤害魔法属性
--	{
--		...
--	},
--
--	SKILL_MAGIC_STATE_ATTRIB  =	--技能等级相关状态魔法属性
--	{
--		...
--	},
--
--	SKILL_MAGIC_IMME_ATTRIB   =	--技能等级相关立即魔法属性
--	{
--		...
--	},
--}


--技能通用函数

-------------------------------------------------------------
--函数:	Line
--功能:	直线取值 F(X)=aX + b
--参数:	x, 待求点x坐标(技能等级)
--		(x1, y1), (x2, y2) 端点坐标
--返回:	x处技能属性值
-------------------------------------------------------------
function Line(x, x1, y1, x2, y2)
	if (y1 == y2) then
		return y2
	end

	return (y2 - y1) * (x - x1)/(x2 - x1) + y1
end

-------------------------------------------------------------
--函数:	Conic
--功能:	二次曲线取值 F(X)=aX^2 + c
--参数:	x, 待求点x坐标(技能等级)
--		(x1, y1), (x2, y2) 端点坐标
--返回:	x处技能属性值
-------------------------------------------------------------
function Conic(x, x1, y1, x2, y2)
	if((x1 < 0) or (x2 < 0)) then
		return 0
	end

	if (y1 == y2) then
		return y2;
	end

	return x * x * (y1 - y2) / (x1 * x1 - x2 * x2) + y1 - (y1 - y2) * x1 * x1 / (x1 * x1 - x2 * x2)
end

-------------------------------------------------------------
--函数:	Link(x, points)
--功能:	获取技能等级为x时的技能属性值
--参数:	x, 这里特指技能等级;
--		points, 曲线点列;
--返回:	技能等级为x时的技能属性值
-------------------------------------------------------------
function Link(x, points)
	num = getn(points)
	if (num < 2) then
		return -1
	end

--	曲线缺省为Line(直线)
	for i = 1, num do
		if (points[i][3] == nil) then
			points[i][3] = Line
		end
	end

--	边界值处理
--	下边界
	if (x < points[1][1]) then
		return points[1][3](x, points[1][1], points[1][2], points[2][1], points[2][2])
	end
--	上边界
	if(x > points[num][1]) then
		return points[num][3](x, points[num-1][1], points[num-1][2], points[num][1], points[num][2])
	end

	c = 2
	for i = 2, num do
		if((x >= points[i-1][1]) and (x <= points[i][1])) then
			c = i
			break
		end
	end

	return points[c][3](x, points[c-1][1], points[c-1][2], points[c][1], points[c][2])
end

-------------------------------------------------------------
--函数:	Param2String
--参数:	Param1,需要连接的参数1
--		Param2,需要连接的参数2
--返回:  将参数1和参数2以逗号隔开连成的一个字符串
-------------------------------------------------------------
function Param2String(Param1, Param2)
    return Param1..","..Param2
end

-----------------------------------------------------------
--函数:	GetSkillLevelData(sType, nIndex, nlevel)
--功能:	获得技能等级相关属性及魔法属性
--参数:	sType, 属性类型
--		("SKILL_LEVEL_BASE_ATTRIB",		"SKILL_LEVEL_COST_ATTRIB",	"SKILL_LEVEL_MISSLE_ATTRIB",
--		 "SKILL_MAGIC_DAMAGE_ATTRIB",	"SKILL_MAGIC_STATE_ATTRIB",	"SKILL_MAGIC_IMME_ATTRIB")
--		nIndex,属性在属性类型sType中的序数(从1开始索引)
--		nlevel,技能等级
--返回:	属性类型sType中第nIndex个属性的相关值(以字符串形式)
--备注:	技能属性返回值:	"属性,属性值"
--		魔法属性返回值:	"属性,伤害因素A,伤害因素B,伤害因素C,伤害因素D,伤害因素E,伤害因素F,伤害因素X,伤害因素Y,伤害因素Z,
--						几率因素A,几率因素B,几率因素C,几率因素D,几率因素X"
--		返回-1表明已读完属性类型sType中的所有属性
-----------------------------------------------------------
function GetSkillLevelData(sType, nIndex, nlevel)
	if (sType == "SKILL_LEVEL_BASE_ATTRIB" or
		sType == "SKILL_LEVEL_COST_ATTRIB" or
		sType == "SKILL_LEVEL_MISSLE_ATTRIB") then
	--技能属性
		if (SKILL[sType][nIndex] == nil) then
 			return -1
		end

		value = floor(Link(nlevel,SKILL[sType][nIndex][2]))
		return Param2String(SKILL[sType][nIndex][1], value)
	else
	--魔法属性
		if (SKILL[sType][nIndex] == nil) then
 			return -1
		end

		MAGIC_FACTORS = {
		--	伤害因素
			{"damage_factor_a",			0},
			{"damage_factor_b",			0},
			{"damage_factor_c",			0},
			{"damage_factor_d",			0},
			{"damage_factor_e",			0},
			{"damage_factor_f",			0},
			{"damage_factor_m",			0},
			{"damage_factor_x",			0},
			{"damage_factor_y",			0},
			{"damage_factor_z",			0},

		--	几率因素
			{"probability_factor_a",	0},
			{"probability_factor_b",	0},
			{"probability_factor_c",	0},
			{"probability_factor_d",	100},
			{"probability_factor_x",	100},
		}

		ResultString = SKILL[sType][nIndex]["magic"]

		for i = 1, getn(MAGIC_FACTORS) do
			if (SKILL[sType][nIndex][MAGIC_FACTORS[i][1]] == nil) then
				ResultString = Param2String(ResultString, MAGIC_FACTORS[i][2])
			else
				value = floor(Link(nlevel,SKILL[sType][nIndex][MAGIC_FACTORS[i][1]]))
				ResultString = Param2String(ResultString, value)
			end
		end

		return ResultString
	end
end

