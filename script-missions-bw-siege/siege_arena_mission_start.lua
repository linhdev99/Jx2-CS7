
-- Creator : lizhi
-- ����ս����	2007-3-29 10:43

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\missions\\bw\\siege\\mission_room.lua")

-- Ϊ�˲��Է��㣬��ΪNPC��ʽ�����͹ر�
function main()
	if PlayerIndex > 0 then
		if GetMissionV(2) > 0 then
			Say("��ng", 2, "��ng/close_mission", "Qua ���ng/no_say")
		else
			Say("B�t ��u", 2, "B�t ��u/start_mission", "Qua ���ng/no_say")
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
	-- �ڳɶ���������ʼ��̨
	if SubWorldID2Idx(CITY_SIGNUP_MAP_ID) == -1 then
		return
	end
	-- ���ʱ��,��õ�ǰ��������̨
	local nHour = tonumber(date("%H"))
	local nCityID = tHourCity[nHour]
	if nCityID == nil then
		LOG_SIEGE(LOG_SIEGE_ERROR, "Th�i gian m� kh�ng ph� h�p")
		return
	end
	
--ȡ�ñ��ι���ս���͵ķ���--------------------------------------------------------------
	get_gongcheng_type();
	local nType = GetGlbValue(CITY_GLB_VALUE_TYPE);
	if nType == 2 then
		AddGlobalNews("B�t ��u b�o danh tranh �o�t"..tFightCityName[nCityID].."Lo�i h�nh c�ng th�nh chi�n l�: "..tSignMethod[nType])		
		return 0;
	end
--����Ǿ�Ͷ��ս������򲻿�������ս��̨
-------------------------------------------------------------------------------------------------------
	
	-- �����̨��ͼ
	local tArenaID = tArenaMapID[nCityID]
	if tArenaID == nil then
		LOG_SIEGE(LOG_SIEGE_ERROR, "Khu v�c b� tr� kh�ng ph� h�p")
		return
	end

	for index, value in tArenaID do
		if SubWorldID2Idx(value) == -1 then
			LOG_SIEGE(LOG_SIEGE_ERROR, "Kh�ng t�m th�y khu v�c m�c ti�u")
			return
		end
	end
	
	-- ���ɷ���OK, ��ʼ����
	KMissionRecordRoom:Open(CITY_SIGNUP_MAP_ID, RECORD_MISSION_ID, nCityID)	
	AddGlobalNews("B�t ��u b�o danh tranh �o�t"..tFightCityName[nCityID].." L�i ��i C�ng th�nh chi�n, h�y nhanh ch�ng ��n ch� Th�nh �� Ch� L�i ��i b�o danh.")
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