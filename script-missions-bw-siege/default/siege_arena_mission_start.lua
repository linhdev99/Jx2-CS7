
-- Creator : lizhi
-- ¹¥³ÇÕ½±¨Ãû	2007-3-29 10:43

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\missions\\bw\\siege\\mission_room.lua")

-- ÎªÁË²âÊÔ·½±ã£¬¸ÄÎªNPCÐÎÊ½Æô¶¯ºÍ¹Ø±Õ
function main()
	if PlayerIndex > 0 then
		if GetMissionV(2) > 0 then
			Say("§ãng", 2, "§ãng/close_mission", "Qua ®­êng/no_say")
		else
			Say("B¾t ®Çu", 2, "B¾t ®Çu/start_mission", "Qua ®­êng/no_say")
		end
	elseif tonumber(date("%w")) == 5 then
		start_mission()
	end
end

function no_say()
end

function close_mission()
	KMissionRecordRoom:CloseMe(CITY_SIGNUP_MAP_ID)
end

function start_mission()
	-- ÔÚ³É¶¼·þÎñÆ÷¿ªÊ¼ÀÞÌ¨
	if SubWorldID2Idx(CITY_SIGNUP_MAP_ID) == -1 then
		return
	end
	-- ¼ì²éÊ±¼ä,»ñµÃµ±Ç°¿ªÆôµÄÀÞÌ¨
	local nHour = tonumber(date("%H"))
	local nCityID = tHourCity[nHour]
	if nCityID == nil then
		LOG_SIEGE(LOG_SIEGE_ERROR, "Thêi gian më kh«ng phï hîp")
		return
	end
	
--È¡µÃ±¾´Î¹¥³ÇÕ½ÀàÐÍµÄ·½·¨--------------------------------------------------------------
	get_gongcheng_type();
	local nType = GetGlbValue(CITY_GLB_VALUE_TYPE);
	if nType == 2 then
		AddGlobalNews("B¾t ®Çu b¸o danh tranh ®o¹t"..tFightCityName[nCityID].."Lo¹i h×nh c«ng thµnh chiÕn lµ: "..tSignMethod[nType])		
		return 0;
	end
--Èç¹ûÊÇ¾ºÍ¶ÌôÕ½Áî·½·¨£¬Ôò²»¿ªÆô¹¥³ÇÕ½ÀÞÌ¨
-------------------------------------------------------------------------------------------------------
	
	-- ¼ì²éÀÞÌ¨µØÍ¼
	local tArenaID = tArenaMapID[nCityID]
	if tArenaID == nil then
		LOG_SIEGE(LOG_SIEGE_ERROR, "Khu vùc bè trÝ kh«ng phï hîp")
		return
	end

	for index, value in tArenaID do
		if SubWorldID2Idx(value) == -1 then
			LOG_SIEGE(LOG_SIEGE_ERROR, "Kh«ng t×m thÊy khu vùc môc tiªu")
			return
		end
	end
	
	-- Éú³É·¿¼äOK, ¿ªÊ¼±¨Ãû
	KMissionRecordRoom:Open(CITY_SIGNUP_MAP_ID, RECORD_MISSION_ID, nCityID)	
	AddGlobalNews("B¾t ®Çu b¸o danh tranh ®o¹t"..tFightCityName[nCityID].." L«i ®µi C«ng thµnh chiÕn, h·y nhanh chãng ®Õn chç Thµnh §« Chñ L«i ®µi b¸o danh.")
end

function get_gongcheng_type()
	ApplyRelayShareData("gongchengtype",0,0,"\\script\\missions\\bw\\siege\\siege_arena_mission_start.lua","get_type");
end

function get_type(szKey, nKey1, nKey2, nCount)
	local nType = 0;
	if nCount == 0 then
		nType = 1;
	else
		nType = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
		DelRelayShareDataCopy(szKey,nKey1,nKey2);
	end
	SetGlbValue(CITY_GLB_VALUE_TYPE, nType);
end