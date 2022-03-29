
-- Creator : lizhi
-- mission room 2007-3-29 15:44

Include("\\script\\class\\mem.lua")

function my_setmissions(nIndex, str)
	SetMissionS(10 + nIndex, str)
end

function my_getmissions(nIndex)
	return GetMissionS(10 + nIndex)
end

KMissionRoom =
{
	-- Ϊ���ܹ�Reload,��Щ��ֵ����¼�ڽű�������,��¼�ڶ�Ӧ��MISSION������,�������±�����¼���Ƕ�ӦMission����������
	-- ������������ʹ��KMissionRoom��������һ��Object
	m_nMapID = 51,
	m_nMissionID = 52,
	m_nTimerID = 53,
	m_nTimerInterVal = 54,
	m_nTimeStep = 55,
	
	-- ChangeSubWorldʱ��ʱ����
	_tempSubWorld = 0,
	
	ChangeSubWorld = function(self, nMapID)
		local nMapIdx = SubWorldID2Idx(nMapID)
		if nMapIdx ~= -1 then
			self._tempSubWorld = SubWorld
			SubWorld = nMapIdx
			return 1
		end
		return 0
	end,
	
	ReSetSubWorld = function(self)
		SubWorld  = self._tempSubWorld
	end,
	
	GetPlayerCount = function(self, nGroup, nMapID, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		
		local nCount = GetMSPlayerCount(nMissionID, nGroup)
		self:ReSetSubWorld()
		return nCount
	end,
}

KMissionRecordAppend =
{
	-- ��Щ����ͬ����mission����������
	
	m_nSignupTimeEnd = 60,	-- ����ʱ�����
	m_nRing1Begin = 61,		-- ��һ�ֱ�����ʼ
	m_nRing1Fight = 62,		-- ��һ�ֱ�������
	m_nRing2Begin = 63,		-- �ڶ��ֱ�����ʼ
	m_nRing2Fight = 64,		-- �ڶ��ֱ�������
	m_nRing3Begin = 65,		-- �����ֱ�����ʼ
	m_nRing3Fight = 66,		-- �����ֱ�������
	m_nAllEnd = 67,			-- ������̨����
	
	m_nSlotIndex = 70,		-- �������,��ʵ���Ǳ�ʾ�ж��ٸ����鱨��
	m_nState = 71,			-- ��ǰMission��״̬
	m_nFightCity = 72,		-- ��ǰ�������ĸ����е��ʸ���
	
	Open = function(self, nMapID, nMissionID, nFightCity)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		OpenMission(nMissionID)
		self:Init(nMapID, nMissionID, nFightCity)
		--	RunMission(nMissionID)	-- �������self:Run���
		self:Run()
		self:ReSetSubWorld()
	end,
	
	Close = function(self)
		CloseMission(GetMissionV(self.m_nMissionID))
	end,
	
	CloseMe = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		self:CloseArenaRoom()
		self:Close()
		self:ReSetSubWorld()
	end,
	
	Init = function(self, nMapID, nMissionID, nFightCity)
		for i = 50, 100 do
			SetMissionV(i, 0)
		end
		for i = 1, 10 do
			my_setmissions(i, "")
		end
		
		SetMissionV(self.m_nMapID, nMapID)
		SetMissionV(self.m_nMissionID, nMissionID)
		SetMissionV(self.m_nTimerID, TIMER_ID)
		SetMissionV(self.m_nTimerInterVal, TIMER_INTERVAL)
		SetMissionV(self.m_nTimeStep, 0)
		SetMissionV(self.m_nFightCity, nFightCity)
	end,
	
	UnInit = function(self)
		for i = 50, 100 do
			SetMissionV(i, 0)
		end
		for i = 1, 10 do
			my_setmissions(i, "")
		end
		-- ֹͣ��ʱ��
		StopMissionTimer(GetMissionV(self.m_nMissionID), GetMissionV(self.m_nTimerID))
	end,
	
	Run = function(self)
		-- �������ʱ���
		local nSignupTimeEnd = RECORD_SIGNUP_TIME_INTERVAL
		local nRing1Begin = nSignupTimeEnd + RECORD_RAND_TIME_INTERVAL
		local nRing1Fight = nRing1Begin + ARENA_PREPARE_TIME_INTERVAL
		local nRing2Begin = nRing1Fight + ARENA_FIGHT_TIME_INTERVAL
		local nRing2Fight = nRing2Begin + ARENA_PREPARE_TIME_INTERVAL
		local nRing3Begin = nRing2Fight + ARENA_FIGHT_TIME_INTERVAL
		local nRing3Fight = nRing3Begin + ARENA_PREPARE_TIME_INTERVAL
		local nAllEnd = nRing3Fight + ARENA_FIGHT_TIME_INTERVAL
		
		SetMissionV(self.m_nSignupTimeEnd, nSignupTimeEnd)
		SetMissionV(self.m_nRing1Begin, nRing1Begin)
		SetMissionV(self.m_nRing1Fight, nRing1Fight)
		SetMissionV(self.m_nRing2Begin, nRing2Begin)
		SetMissionV(self.m_nRing2Fight, nRing2Fight)
		SetMissionV(self.m_nRing3Begin, nRing3Begin)
		SetMissionV(self.m_nRing3Fight, nRing3Fight)
		SetMissionV(self.m_nAllEnd, nAllEnd)
		SetMissionV(self.m_nState, SIGNUP_TIME)					-- ������ʼ��
		
		-- ��ʼ��ʱ��
		StartMissionTimer(GetMissionV(self.m_nMissionID), GetMissionV(self.m_nTimerID), GetMissionV(self.m_nTimerInterVal))
	end,
	
	GetState = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nState = GetMissionV(self.m_nState)
		self:ReSetSubWorld()
		return nState
	end,
	
	GetTeamInfo = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local t = {}
		for i=1, MAX_TEAM_COUNT do
			t[i] = my_getmissions(i)
		end
		self:ReSetSubWorld()
		return t
	end,
	
	GetSignLeftTime = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nMin = 0
		local nSec = 0
		if GetMissionV(self.m_nState) == SIGNUP_TIME then
			local nTimeStep = GetMissionV(self.m_nTimeStep)
			local nSignEnd = GetMissionV(self.m_nSignupTimeEnd)
			local nStep = nSignEnd - nTimeStep
			local nAllSec = nStep * TIME_SEC
			nMin = floor(nAllSec / 60)
			nSec = mod(nAllSec, 60)
		end
		self:ReSetSubWorld()
		return nMin, nSec
	end,
	
	GetPrepareLeftTime = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nMin = 0
		local nSec = 0
		if GetMissionV(self.m_nState) == PREPARE_TIME then
			local nTimeStep = GetMissionV(self.m_nTimeStep)
			local nSignEnd = 0
			if nTimeStep < GetMissionV(self.m_nRing1Fight) then
				nSignEnd = GetMissionV(self.m_nRing1Fight)
			elseif nTimeStep < GetMissionV(self.m_nRing2Fight) then
				nSignEnd = GetMissionV(self.m_nRing2Fight)
			elseif nTimeStep < GetMissionV(self.m_nRing3Fight) then
				nSignEnd = GetMissionV(self.m_nRing3Fight)
			end
			
			local nStep = nSignEnd - nTimeStep
			if nStep > ARENA_PREPARE_TIME_INTERVAL or nStep < 0 then
				nStep = 0
			end
			local nAllSec = nStep * TIME_SEC
			nMin = floor(nAllSec / 60)
			nSec = mod(nAllSec, 60)
		end
		self:ReSetSubWorld()
		return nMin, nSec
	end,
	
	OnTimer = function(self)
		local nTimeStep = GetMissionV(self.m_nTimeStep)
		SetMissionV(self.m_nTimeStep, nTimeStep + 1)		-- ���������ĸ����̳�����,ʱ��Ʋ�������Ҫһֱ����ȥ
		if nTimeStep == GetMissionV(self.m_nSignupTimeEnd) then
			SetMissionV(self.m_nState, VIEW_TIME)
			self:RandTeam()				-- �������
		elseif nTimeStep == GetMissionV(self.m_nRing1Begin) then
			self:DoOpenArenaRoom(0)		-- ������
			self:NotifyTeam()			-- ͨ�����Ķ������
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing1Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- ��һ�ֿ���
		elseif nTimeStep == GetMissionV(self.m_nRing2Begin) then
			self:NextFight()			-- ��һ�ֶ���
			self:CloseArenaRoom()		-- ������һ�ֱ���
			self:DoOpenArenaRoom(0)		-- ��ʼ�µ�һ��
			self:NotifyTeam()
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing2Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- �ڶ��ֿ���
		elseif nTimeStep == GetMissionV(self.m_nRing3Begin) then
			self:NextFight()			-- ��һ�ֶ���
			self:CloseArenaRoom()		-- ������һ�ֱ���
			self:DoOpenArenaRoom(1)		-- ��ʼ�µ�һ��
			self:NotifyTeam()
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing3Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- �����ֿ���
		elseif nTimeStep == GetMissionV(self.m_nAllEnd) then
			self:NextFight()
			self:ReferResult()			-- �ύ���ս��
			self:CloseArenaRoom()		-- ����һ�ֱ���
			self:Close()				-- �ر�MISSION
		end
	end,
	
	DoOpenArenaRoom = function(self, nFinal)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		for index, value in tArenaRoom do
			KMissionArenaRoom:Open(value, ARENA_MISSION_ID, nFinal)
		end
	end,
	
	CloseArenaRoom = function(self)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		if tArenaRoom == nil then
			return
		end
		for index, value in tArenaRoom do
			KMissionArenaRoom:Close(value)
		end
	end,
	
	RandTeam = function(self)
		local nSlotIndex = GetMissionV(self.m_nSlotIndex)
		if nSlotIndex == 0 then	-- ���û�ж���,������������
			if GetGlbValue(1019) == 1 then
				Msg2SubWorld("Do kh�ng c� nh�m n�o tham gia tr�n L�i ��i C�ng th�nh chi�n, tr�n n�y h�y b�.")
			end
			self:ReferResult()
			self:CloseArenaRoom()
			self:Close()
			return
		end
		-- �������
		local tStr = {}
		for i=1, nSlotIndex do
			local nChangeIndex = random(1, nSlotIndex)
			local _tempstr = my_getmissions(nChangeIndex)
			my_setmissions(nChangeIndex, my_getmissions(i))
			my_setmissions(i, _tempstr)
		end
		for i=1, nSlotIndex do
			tStr[i] = my_getmissions(i)
			my_setmissions(i, "")
		end
		-- ����������������ż��
		local nIndex = 1
		for i=1, MAX_TEAM_COUNT, 2 do
			my_setmissions(i, tStr[nIndex])
			nIndex = nIndex + 1
		end
		
		for i=2, MAX_TEAM_COUNT, 2 do
			my_setmissions(i, tStr[nIndex])
			nIndex = nIndex + 1
		end
	end,
	
	NextFight = function(self)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		local tWinner = {}
		for index, value in tArenaRoom do
			tWinner[index] = KMissionArenaRoom:GetWinner(value)
		end
		
		for i=1, MAX_TEAM_COUNT do
			if i <= getn(tWinner) then
				my_setmissions(i, tWinner[i])
			else
				my_setmissions(i, "")
			end
		end
	end,
	
	NotifyTeam = function(self)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		local tTeamName1 = {}
		local tTeamName2 = {}
		for i=1, floor(MAX_TEAM_COUNT / 2) do
			tTeamName1[i] = my_getmissions(i * 2 - 1)
			tTeamName2[i] = my_getmissions(i * 2)
		end

		for i = 1, getn(tTeamName1) do	-- ����������,��������Ӧmission�Ķ���˫��
			if tTeamName1[i] == "" or tTeamName2[i] == "" then
				--print("���� : "..tTeamName1[i]..tTeamName2[i].." �����ֿ�")
			else
				--print("���� : "..tTeamName1[i].." �� "..tTeamName2[i].."\tMapID = "..tArenaRoom[i])
			end
			-- �ֿյĶ���Ҳ����mission��
			KMissionArenaRoom:SetTeamName(tArenaRoom[i], ARENA_MISSION_ID, tTeamName1[i], tTeamName2[i])
		end
		Msg2SubWorld("M�i tham gia L�i ��i C�ng th�nh, trong 3 ph�t ph�i v�o tr�n, n�u kh�ng s� x� l� v� h�y b� quy�n l�i")
		AddGlobalNews("M�i tham gia L�i ��i C�ng th�nh, trong 3 ph�t ph�i v�o tr�n, n�u kh�ng s� x� l� v� h�y b� quy�n l�i")
	end,
	
	DoFight = function(self)
		local nMapID = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nMapID]
		for index, value in tArenaRoom do
			KMissionArenaRoom:DoFight(value, ARENA_MISSION_ID)
		end
	end,
	
	ReferResult = function(self)
		local nFightCity = GetMissionV(self.m_nFightCity)
		local szFinalWinner = my_getmissions(1)
		if szFinalWinner == "" then
			LOG_SIEGE(LOG_SIEGE_ERROR, "Tr�n quy�t chi�n cu�i c�ng kh�ng c� ng��i th�ng cu�c")
			return
		end
		-- �ύ���
		local szA, szD = GetCityWarAD(nFightCity)
		if szD ~= "" then						-- ������سǷ�
			SetCityWarAttack(nFightCity, szFinalWinner)
			Msg2SubWorld("Ch�c m�ng bang h�i:"..szFinalWinner.."Bang h�i nh�n ���c "..tFightCityName[nFightCity].."_t� c�ch c�ng th�nh")
			AddGlobalNews("Ch�c m�ng bang h�i:"..szFinalWinner.."Bang h�i nh�n ���c "..tFightCityName[nFightCity].."_t� c�ch c�ng th�nh")
			WriteLogEx("Cong Thanh Chien",szFinalWinner.." nh�n ���c "..tFightCityName[nFightCity].."_t� c�ch c�ng th�nh")
		elseif szD == "" then					-- ���û���سǷ�����ֱ��ռ�г���
			SetCityWarWinner(nFightCity, szFinalWinner)
			Msg2SubWorld("Ch�c m�ng bang h�i:"..szFinalWinner.." �� chi�m ���c "..tFightCityName[nFightCity])
			AddGlobalNews("Ch�c m�ng bang h�i:"..szFinalWinner.." �� chi�m ���c "..tFightCityName[nFightCity])
			WriteLogEx("Cong Thanh Chien",szFinalWinner.." �� chi�m ���c "..tFightCityName[nFightCity])
		end
	end,
	
	GetFreeSlot = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nCount = MAX_TEAM_COUNT - GetMissionV(self.m_nSlotIndex)
		self:ReSetSubWorld()
		return nCount
	end,
	
	GetMemberCount = function(self, nPlaceIdx, nCamp, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nFightCity = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nFightCity]
		local nCount = KMissionArenaRoom:GetMemberCount(tArenaRoom[nPlaceIdx], nCamp, ARENA_MISSION_ID)
		self:ReSetSubWorld()
		return nCount
	end,
	
	AddTeam = function(self, szTeamName, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nIndex = GetMissionV(self.m_nSlotIndex) + 1
		my_setmissions(nIndex, szTeamName)
		SetMissionV(self.m_nSlotIndex, nIndex)
		local nOldPlayer = PlayerIndex
		for i=1, gf_GetTeamSize() do	-- �ѵ�ǰ���ڵ��˶���¼��
			PlayerIndex = gf_GetTeamMember(i)
			if PlayerIndex > 0 then
				Talk(1,"","m�i ��i trong th�nh, thuy�n �i kh�ng ��i ng��i, qu� th�i h�n ch�a v� xem nh� t� b� quy�n l�i.")
			end
		end
		PlayerIndex = nOldPlayer
		self:ReSetSubWorld()
	end,
	
	AddTeamMember = function(self, nPlaceIdx, nCamp, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nFightCity = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nFightCity]
		KMissionArenaRoom:AddTeamMember(tArenaRoom[nPlaceIdx], nCamp, ARENA_MISSION_ID)
		self:ReSetSubWorld()
	end,
	
	AddViewer = function(self, nPlaceIdx, nCamp, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nFightCity = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nFightCity]
		KMissionArenaRoom:AddViewer(tArenaRoom[nPlaceIdx], nCamp, ARENA_MISSION_ID)
		self:ReSetSubWorld()
	end,
	
	FightingInfo = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local szInfo = ""
		local nFightCity = GetMissionV(self.m_nFightCity)
		local tArenaRoom = tArenaMapID[nFightCity]
		for index, value in tArenaRoom do
			szInfo = szInfo..KMissionArenaRoom:GetFightInfo(value)
		end
		self:ReSetSubWorld()
		if strfind(szInfo, GetTongName()) ~= nil then
			return "<color=green>"..szInfo.."<color>"
		else
			return szInfo
		end
	end,
}

KMissionArenaAppend =
{
	-- ��Щ����ͬ����mission����������
	m_nPrepareTimeEnd = 60,		-- ׼��ʱ�䵽
	m_nFightTimeEnd = 61,		-- ����ʱ�䵽
	m_nFinal = 62,				-- �Ƿ�Ϊ����
	m_nFinalLost = 63,			-- ���ƽ�ֵĻ�������˭ʧ�ܣ��е���ֵ��߼�������Ϊ�˺ô���
	
	m_nEndTick = 64,			-- ʤ���Ժ���һ������ʱ��
	
	m_sCamp1Team = 1,			-- 1�ӵ�����
	m_sCamp2Team = 2,			-- 2�ӵ�����
	
	m_sCamp1TeamBak = 3,		-- ��¼����1�ӵ�����
	m_sCamp2TeamBak = 4,		-- ��¼����2�ӵ�����
	
	Open = function(self, nMapID, nMissionID, nFinal)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		OpenMission(nMissionID)
		self:Init(nMapID, nMissionID)
		self:Run(nFinal)
		self:ReSetSubWorld()
	end,
	
	Run = function(self, nFinal)
		-- �������ʱ���
		local nPrepareTimeEnd = SUB_ARENA_PREPARE_TIME_END
		local nFightTimeEnd = nPrepareTimeEnd + SUB_ARENA_FIGHT_TIME_END
		
		SetMissionV(self.m_nPrepareTimeEnd, nPrepareTimeEnd)
		SetMissionV(self.m_nFightTimeEnd, nFightTimeEnd)
		SetMissionV(self.m_nFinal, nFinal)
		
		-- ��ʼ��ʱ��
		StartMissionTimer(GetMissionV(self.m_nMissionID), GetMissionV(self.m_nTimerID), GetMissionV(self.m_nTimerInterVal))
	end,
	
	Close = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		CloseMission(GetMissionV(self.m_nMissionID))
		self:ReSetSubWorld()
	end,
	
	Init = function(self, nMapID, nMissionID)
		for i = 50, 100 do 
			SetMissionV(i, 0)
		end
		for i = 1, 10 do 
			my_setmissions(i, "")
		end
		
		SetMissionV(self.m_nMapID, nMapID)
		SetMissionV(self.m_nMissionID, nMissionID)
		SetMissionV(self.m_nTimerID, TIMER_ID)
		SetMissionV(self.m_nTimerInterVal, ARENA_TIME_INTERVAL)
		SetMissionV(self.m_nTimeStep, 0)
	end,
	
	UnInit = function(self)
		-- �ƺ���
		local idx = 0
		local pidx = 0
		local nAlive = 0
		local nMissionID = GetMissionV(self.m_nMissionID)
		local tPlayer = {}
		for i=1, GetMSPlayerCount(nMissionID, 0) do
			idx, pidx = GetNextPlayer(nMissionID, idx, 0)
	 		tPlayer[i] = pidx
		end
		
		for index, value in tPlayer do
			DelMSPlayer(nMissionID, value, 0)
		end		
		StopMissionTimer(nMissionID, GetMissionV(self.m_nTimerID))
	end,
	
	OnTimer = function(self)
		local nTimeStep = GetMissionV(self.m_nTimeStep)
		SetMissionV(self.m_nTimeStep, nTimeStep + 1)
		local nPrepareTimeEnd = GetMissionV(self.m_nPrepareTimeEnd)
		local nFightTimeEnd = GetMissionV(self.m_nFightTimeEnd)
		if nTimeStep < nPrepareTimeEnd then
			-- ͨ�����뿪սʱ�仹�ж���
			self:NotifyMsg("Th�i gian khai chi�n c�n  ", nPrepareTimeEnd, nTimeStep)
		elseif nTimeStep < nFightTimeEnd then
			local nMissionID = GetMissionV(self.m_nMissionID)
			if GetMissionV(self.m_nEndTick) == 2 then	-- ����ʱ�䵽
				local idx = 0
				local pidx = 0
				local tPlayer = {}
				for i=1, GetMSPlayerCount(nMissionID, 0) do
					idx, pidx = GetNextPlayer(nMissionID, idx, 0)
			 		tPlayer[i] = pidx
				end
				for index, value in tPlayer do
					DelMSPlayer(nMissionID, value, 0)
				end
				StopMissionTimer(nMissionID, GetMissionV(self.m_nTimerID))		-- �Ѿ�������Ҳֹͣ��ʱ������
				return
			end
			if GetMissionV(self.m_nEndTick) > 0 then	-- ����ǽ����ˣ���������ʱ��
				SetMissionV(self.m_nEndTick, GetMissionV(self.m_nEndTick) + 1)
				return
			end
			-- �����һ���ֿգ������Ѿ���ʤ������ֹͣ��ʱ������
			if my_getmissions(self.m_sCamp1Team) == "" or my_getmissions(self.m_sCamp2Team) == "" then
				StopMissionTimer(nMissionID, GetMissionV(self.m_nTimerID))
				return
			end
			
			-- ������ڼ�û�ж����ˣ��Ͱ��Լ��͹���Ҳ����ȥ
			local nIsEnd = 0
			local szMsg = ""
			if GetMSPlayerCount(nMissionID, 1) == 0 and GetMSPlayerCount(nMissionID, 2) == 0 then
				local nLost = GetMissionV(self.m_nFinalLost)
				szMsg = my_getmissions(self.m_sCamp1Team).."c�ng v�i "..my_getmissions(self.m_sCamp2Team).."qua m�t h�i t� th� k�ch li�t, cu�i c�ng: "..my_getmissions(nLost).." kinh nghi�m giang h� non k�m, thua tr�n th�t ��ng ti�c"
				my_setmissions(nLost, "")
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			elseif GetMSPlayerCount(nMissionID, 1) == 0 then
				my_setmissions(self.m_sCamp1Team, "")
				szMsg = my_getmissions(self.m_sCamp2Team).." gi�nh ���c chi�n th�ng L�i ��i l�n n�y"
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			elseif GetMSPlayerCount(nMissionID, 2) == 0 then
				my_setmissions(self.m_sCamp2Team, "")
				szMsg = my_getmissions(self.m_sCamp1Team).." gi�nh ���c chi�n th�ng L�i ��i l�n n�y"
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			end
			
			if nIsEnd == 1 then
				SetMissionV(self.m_nEndTick, 1)
				Msg2MSAll(nMissionID, szMsg)
				return
			end
			
			-- ������ڼ����ȫ��,�Ͱ��������鴫��ȥ
			---------�⼸����ƽ�ֲŻ��õ�-------
			local tLevel = {}
			local tExp = {}
			local nDeadTeamCount = 0
			---------�⼸����ƽ�ֲŻ��õ�-------
			for i=1, 2 do
				tLevel[i] = 0
				tExp[i] = 0
				local idx = 0
				local pidx = 0
				local nAlive = 0
				local t = {}
				local nCount = 1
				for j=1, GetMSPlayerCount(nMissionID, i) do
					idx, pidx = GetNextPlayer(nMissionID, idx, i)
					if pidx > 0 then
						t[nCount] = pidx
				   		PlayerIndex = pidx
				   		if IsPlayerDeath() == 0 then
				   			nAlive = nAlive + 1
				   			break
				   		end
				   		nCount = nCount + 1
					end
				end
				if nAlive == 0 then
					nDeadTeamCount = nDeadTeamCount + 1
					for k = 1, nCount - 1 do
						PlayerIndex = t[k]
						Msg2Player("��i c�a b�n b� ti�u di�t s�ch, hi�n chuy�n ��i ng� c�a b�n ra kh�i tr�n ��a!")
						-- ����һ�¹ҵ�һ���ľ���͵ȼ����Է���һ����ͬʱ����
				   		tLevel[i] = tLevel[i] + GetLevel()
				   		tExp[i] = tExp[i] + GetExp()
						DelMSPlayer(nMissionID, PlayerIndex, 0)
					end
				end
			end
			
			if nDeadTeamCount == 2 then		-- ��������߶��ҵ���
				if tLevel[1] > tLevel[2] then
					SetMissionV(self.m_nFinalLost, self.m_sCamp2Team)
				elseif tLevel[1] < tLevel[2] then
					SetMissionV(self.m_nFinalLost, self.m_sCamp1Team)
				else
					if tExp[1] > tExp[2] then
						SetMissionV(self.m_nFinalLost, self.m_sCamp2Team)
					elseif tExp[1] < tExp[2] then
						SetMissionV(self.m_nFinalLost, self.m_sCamp1Team)
					else
						SetMissionV(self.m_nFinalLost, random(self.m_sCamp1Team,self.m_sCamp2Team))
					end
				end
			end
			
			self:NotifyMsg("th�i gian thi ��u c�n  ", nFightTimeEnd, nTimeStep)
		end
	end,
	
	SetTeamName = function(self, nMapID, nMissionID, szTeamName1, szTeamName2)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		my_setmissions(self.m_sCamp1Team, szTeamName1)
		my_setmissions(self.m_sCamp2Team, szTeamName2)
		---------------------------------------------
		my_setmissions(self.m_sCamp1TeamBak, szTeamName1)
		my_setmissions(self.m_sCamp2TeamBak, szTeamName2)
		self:ReSetSubWorld()
	end,
	
	GetMemberCount = function(self, nMapID, nCamp, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return -1
		end
		local nCount = 0
		nCount = GetMSPlayerCount(nMissionID, nCamp)
		self:ReSetSubWorld()
		return nCount
	end,
	
	AddTeamMember = function(self, nMapID, nCamp, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local nOldPlayer = PlayerIndex
		for i=1, gf_GetTeamSize() do
			PlayerIndex = gf_GetTeamMember(i)
			if PlayerIndex > 0 then
				CleanInteractive()
				if NewWorld(nMapID, tArenaMapPos[nMapID][1], tArenaMapPos[nMapID][2]) == 1 then
					AddMSPlayer(nMissionID, nCamp)
					tongcitywar_setpstate(nCamp, 0)
				end
			end
		end
		self:ReSetSubWorld()
	end,
	
	AddViewer = function(self, nMapID, nCamp, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		-- ����������
		if GetMSPlayerCount(nMission, nCamp) > MAX_VIEWER then
			Talk(1,"","Ng��i xem tr�n L�i ��i �� ��y r�i")
		else
			CleanInteractive()
			if NewWorld(nMapID, tArenaMapPos[nMapID][1], tArenaMapPos[nMapID][2]) == 1 then
				AddMSPlayer(nMissionID, nCamp)
				tongcitywar_setpstate(nCamp, 0)
			end
		end
		self:ReSetSubWorld()
	end,
	
	GetWinner = function(self, nMapID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		local szWinner = ""
		if my_getmissions(self.m_sCamp1Team) == "" then		-- ����ֿյģ����߰ѶԷ�ֱ��ɱ��ȥ�ˣ���Ȼ�ͽ�����һ����
			szWinner = my_getmissions(self.m_sCamp2Team)
		elseif my_getmissions(self.m_sCamp2Team) == "" then
			szWinner = my_getmissions(self.m_sCamp1Team)
		else								-- �жϻ��ŵ�����,���������жϻ��˵��ܾ���ֵ,�������Ⱦ����һ��
			local nMissionID = GetMissionV(self.m_nMissionID)
			local idx = 0
			local pidx = 0
			local nTeam1Alive = 0
			local nTeam1Level = 0
			local nTeam1Exp = 0
			for i=1, GetMSPlayerCount(nMissionID, 1) do
				idx, pidx = GetNextPlayer(nMissionID, idx, 1)
				if pidx > 0 then
			   		PlayerIndex = pidx
			   		if IsPlayerDeath() == 0 then
			   			nTeam1Alive = nTeam1Alive + 1
			   			nTeam1Level = nTeam1Level + GetLevel()
			   			nTeam1Exp = nTeam1Exp + GetExp()
			   		end
				end
			end
			idx = 0
			local nTeam2Alive = 0
			local nTeam2Level = 0
			local nTeam2Exp = 0
			for i=1, GetMSPlayerCount(nMissionID, 2) do
				idx, pidx = GetNextPlayer(nMissionID, idx, 2)
				if pidx > 0 then
				   	PlayerIndex = pidx
				   	if IsPlayerDeath() == 0 then
			   			nTeam2Alive = nTeam2Alive + 1
			   			nTeam2Level = nTeam2Level + GetLevel()
			   			nTeam2Exp = nTeam2Exp + GetExp()
			   		end
				end
			end
			
			if nTeam1Alive < nTeam2Alive then
				szWinner = my_getmissions(self.m_sCamp2Team)
			elseif nTeam1Alive > nTeam2Alive then
				szWinner = my_getmissions(self.m_sCamp1Team)
			else
				if nTeam1Level > nTeam2Level then
					szWinner = my_getmissions(self.m_sCamp1Team)
				elseif nTeam1Level < nTeam2Level then
					szWinner = my_getmissions(self.m_sCamp2Team)
				else
					if nTeam1Exp > nTeam2Exp then
						szWinner = my_getmissions(self.m_sCamp1Team)
					elseif nTeam1Exp < nTeam2Exp then
						szWinner = my_getmissions(self.m_sCamp2Team)
					elseif nTeam1Exp == nTeam2Exp then		-- ���һ��
						szWinner = my_getmissions(random(self.m_sCamp1Team, self.m_sCamp2Team))
					end
				end
			end
		end
		if szWinner ~= "" then
			Msg2SubWorld("Bang h�i: "..szWinner.." gi�nh th�ng l�i.")
		end
		self:ReSetSubWorld()
		return szWinner
	end,
	
	DoFight = function(self, nMapID, nMissionID)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		
		local idx = 0
		local pidx = 0
		for i=1, GetMSPlayerCount(nMissionID, 1) do
			idx, pidx = GetNextPlayer(nMissionID, idx, 1)
			if pidx > 0 then
			   	PlayerIndex = pidx
			   	SetFightState(1)
			   	Talk(1,"","Tr�n chi�n b�t ��u!")
			end
		end
		
		idx = 0
		for i=1, GetMSPlayerCount(nMissionID, 2) do
			idx, pidx = GetNextPlayer(nMissionID, idx, 2)
			if pidx > 0 then
			   	PlayerIndex = pidx
			   	SetFightState(1)
			   	Talk(1,"","Tr�n chi�n b�t ��u!")
			end
		end
		self:ReSetSubWorld()
	end,
	
	GetFightInfo = function(self, nMapID)
		local szInfo = ""
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		if my_getmissions(self.m_sCamp1TeamBak) == "" and my_getmissions(self.m_sCamp2TeamBak) == "" then
			
		elseif my_getmissions(self.m_sCamp1TeamBak) == "" then
			szInfo = my_getmissions(self.m_sCamp2TeamBak).."Tr�n n�y tr�ng, tr�c ti�p v�o hi�p sau\n"
		elseif my_getmissions(self.m_sCamp2TeamBak) == "" then
			szInfo = my_getmissions(self.m_sCamp1TeamBak).."Tr�n n�y tr�ng, tr�c ti�p v�o hi�p sau\n"
		else
			if my_getmissions(self.m_sCamp1Team) == "" and my_getmissions(self.m_sCamp2Team) == "" then
				szInfo = "Bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v� bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> c�ng r�i tr�n, ra kh�i tr�n L�i ��i n�y\n"
			elseif my_getmissions(self.m_sCamp1Team) == "" then
				szInfo = "Bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v� bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> tr�n ��u, bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2Team).."<color> cu�i c�ng �� th�ng\n"
			elseif my_getmissions(self.m_sCamp2Team) == "" then
				szInfo = "Bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v� bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> tr�n ��u, bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1Team).."<color> cu�i c�ng �� th�ng\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 1) == 0 and GetMSPlayerCount(ARENA_MISSION_ID, 2) == 0 then
				szInfo = "Bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v� bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> ��u kh�ng v�o ��u tr��ng thi ��u\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 1) == 0 then
				szInfo = "Bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v� bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> tr�n ��u, bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1Team).."<color> kh�ng v�o ��u tr��ng thi ��u\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 2) == 0 then
				szInfo = "Bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v� bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> tr�n ��u, bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2Team).."<color> kh�ng v�o ��u tr��ng thi ��u\n"
			else
				szInfo = "Bang h�i <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> v� bang h�i <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> �ang h�i k�ch li�t\n"
			end
		end
		self:ReSetSubWorld()
		return szInfo
	end,
	
	NotifyMsg = function(self, szPreMsg, nEndStep, nNowStep)
		-- ע��:ARENA_TIME_SEC�����ܱ�10����,������Щ��ʾ������������
		local nAllSec = ((nEndStep - nNowStep) * ARENA_TIME_SEC)
		local nMin = floor(nAllSec / 60)
		local nSec = mod(nAllSec, 60)
		
		if nMin > 1 and nSec == 0 then		-- ����1������1����һ��
			Msg2MSAll(GetMissionV(self.m_nMissionID), szPreMsg..nMin.." Ph�t ")
		elseif nMin == 0 and mod(nSec, 10) == 0 then	-- С��1������10��һ��
			Msg2MSAll(GetMissionV(self.m_nMissionID), szPreMsg..nSec.." Gi�y ")
		end
	end,
	
}

KMissionRecordRoom = inherit(KMissionRoom, KMissionRecordAppend)
KMissionArenaRoom = inherit(KMissionRoom, KMissionArenaAppend)
