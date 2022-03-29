
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
	-- ÎªÁËÄÜ¹»Reload,ÕâÐ©ÊýÖµ²»¼ÇÂ¼ÔÚ½Å±¾±äÁ¿ÖÐ,¼ÇÂ¼ÔÚ¶ÔÓ¦µÄMISSION±äÁ¿ÖÐ,ËùÒÔÒÔÏÂ±äÁ¿¼ÇÂ¼µÄÊÇ¶ÔÓ¦Mission±äÁ¿µÄË÷Òý
	-- µ«ÕâÑùµÄ×ö·¨Ê¹µÃKMissionRoom²»ÄÜÉú³ÉÒ»¸öObject
	m_nMapID = 51,
	m_nMissionID = 52,
	m_nTimerID = 53,
	m_nTimerInterVal = 54,
	m_nTimeStep = 55,
	
	-- ChangeSubWorldÊ±ÁÙÊ±´æÖü
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
	-- ÕâÐ©±äÁ¿Í¬ÑùÊÇmission±äÁ¿µÄË÷Òý
	
	m_nSignupTimeEnd = 60,	-- ±¨ÃûÊ±¼ä½áÊø
	m_nRing1Begin = 61,		-- µÚÒ»ÂÖ±ÈÈü¿ªÊ¼
	m_nRing1Fight = 62,		-- µÚÒ»ÂÖ±ÈÈü¿ª´ò
	m_nRing2Begin = 63,		-- µÚ¶þÂÖ±ÈÈü¿ªÊ¼
	m_nRing2Fight = 64,		-- µÚ¶þÂÖ±ÈÈü¿ª´ò
	m_nRing3Begin = 65,		-- µÚÈýÂÖ±ÈÈü¿ªÊ¼
	m_nRing3Fight = 66,		-- µÚÈýÂÖ±ÈÈü¿ª´ò
	m_nAllEnd = 67,			-- Õû¸öÀÞÌ¨½áÊø
	
	m_nSlotIndex = 70,		-- ±¨ÃûÐòºÅ,ÆäÊµ¾ÍÊÇ±íÊ¾ÓÐ¶àÉÙ¸ö¶ÓÎé±¨Ãû
	m_nState = 71,			-- µ±Ç°MissionµÄ×´Ì¬
	m_nFightCity = 72,		-- µ±Ç°½øÐÐÊÇÄÄ¸ö³ÇÊÐµÄ×Ê¸ñÈü
	
	Open = function(self, nMapID, nMissionID, nFightCity)
		if self:ChangeSubWorld(nMapID) == 0 then
			return
		end
		OpenMission(nMissionID)
		self:Init(nMapID, nMissionID, nFightCity)
		--	RunMission(nMissionID)	-- ÓÃÏÂÃæµÄself:RunÌæ´ú
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
		-- Í£Ö¹¼ÆÊ±Æ÷
		StopMissionTimer(GetMissionV(self.m_nMissionID), GetMissionV(self.m_nTimerID))
	end,
	
	Run = function(self)
		-- ¼ÆËã¸÷¸öÊ±¼äµã
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
		SetMissionV(self.m_nState, SIGNUP_TIME)					-- ±¨Ãû¿ªÊ¼ÁË
		
		-- ¿ªÊ¼¼ÆÊ±Æ÷
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
		SetMissionV(self.m_nTimeStep, nTimeStep + 1)		-- ¾ÍËãÏÂÃæÄÄ¸öÁ÷³Ì³ö´íÁË,Ê±¼ä¼Æ²½Æ÷»¹ÊÇÒªÒ»Ö±×ßÏÂÈ¥
		if nTimeStep == GetMissionV(self.m_nSignupTimeEnd) then
			SetMissionV(self.m_nState, VIEW_TIME)
			self:RandTeam()				-- Ëæ»úÅÅÐò
		elseif nTimeStep == GetMissionV(self.m_nRing1Begin) then
			self:DoOpenArenaRoom(0)		-- ¿ª·¿¼ä
			self:NotifyTeam()			-- Í¨¸æ¶ÓÎéµÄ¶ÔÕóÇé¿ö
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing1Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- µÚÒ»ÂÖ¿ª´ò
		elseif nTimeStep == GetMissionV(self.m_nRing2Begin) then
			self:NextFight()			-- ÏÂÒ»ÂÖ¶ÔÕó
			self:CloseArenaRoom()		-- ½áÊøÁËÒ»ÂÖ±ÈÈü
			self:DoOpenArenaRoom(0)		-- ¿ªÊ¼ÐÂµÄÒ»ÂÖ
			self:NotifyTeam()
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing2Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- µÚ¶þÂÖ¿ª´ò
		elseif nTimeStep == GetMissionV(self.m_nRing3Begin) then
			self:NextFight()			-- ÏÂÒ»ÂÖ¶ÔÕó
			self:CloseArenaRoom()		-- ½áÊøÁËÒ»ÂÖ±ÈÈü
			self:DoOpenArenaRoom(1)		-- ¿ªÊ¼ÐÂµÄÒ»ÂÖ
			self:NotifyTeam()
			SetMissionV(self.m_nState, PREPARE_TIME)
		elseif nTimeStep == GetMissionV(self.m_nRing3Fight) then
			SetMissionV(self.m_nState, FIGHT_TIME)
			self:DoFight()				-- µÚÈýÂÖ¿ª´ò
		elseif nTimeStep == GetMissionV(self.m_nAllEnd) then
			self:NextFight()
			self:ReferResult()			-- Ìá½»×îÖÕ½á¹û
			self:CloseArenaRoom()		-- ½áÊøÒ»ÂÖ±ÈÈü
			self:Close()				-- ¹Ø±ÕMISSION
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
		if nSlotIndex == 0 then	-- Èç¹ûÃ»ÓÐ¶ÓÎé,ÔòÕû¸ö½áÊø°É
			if GetGlbValue(1019) == 1 then
				Msg2SubWorld("Do kh«ng cã nhãm nµo tham gia trËn L«i ®µi C«ng thµnh chiÕn, trËn nµy hñy bá.")
			end
			self:ReferResult()
			self:CloseArenaRoom()
			self:Close()
			return
		end
		-- Ëæ»úÅÅÐò
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
		-- ÏÈÅÅÂúÆæÊý£¬ÔÙÅÅÅ¼Êý
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

		for i = 1, getn(tTeamName1) do	-- Ðû¸æ¶ÔÕóÇé¿ö,²¢ÉèÖÃÏàÓ¦missionµÄ¶ÔÕóË«·½
			if tTeamName1[i] == "" or tTeamName2[i] == "" then
				--print("¶ÔÕó : "..tTeamName1[i]..tTeamName2[i].." ´ËÂÖÂÖ¿Õ")
			else
				--print("¶ÔÕó : "..tTeamName1[i].." ¶Ô "..tTeamName2[i].."\tMapID = "..tArenaRoom[i])
			end
			-- ÂÖ¿ÕµÄ¶ÓÎéÒ²¼ÓÈëmissionÖÐ
			KMissionArenaRoom:SetTeamName(tArenaRoom[i], ARENA_MISSION_ID, tTeamName1[i], tTeamName2[i])
		end
		Msg2SubWorld("Mêi tham gia L«i ®µi C«ng thµnh, trong 3 phót ph¶i vµo trËn, nÕu kh«ng sÏ xö lý v× hñy bá quyÒn lîi")
		AddGlobalNews("Mêi tham gia L«i ®µi C«ng thµnh, trong 3 phót ph¶i vµo trËn, nÕu kh«ng sÏ xö lý v× hñy bá quyÒn lîi")
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
			LOG_SIEGE(LOG_SIEGE_ERROR, "TrËn quyÕt chiÕn cuèi cïng kh«ng cã ng­êi th¾ng cuéc")
			return
		end
		-- Ìá½»½á¹û
		local szA, szD = GetCityWarAD(nFightCity)
		if szD ~= "" then						-- Èç¹ûÓÐÊØ³Ç·½
			SetCityWarAttack(nFightCity, szFinalWinner)
			Msg2SubWorld("Chóc mõng bang héi:"..szFinalWinner.."Bang héi nhËn ®­îc "..tFightCityName[nFightCity].."_t­ c¸ch c«ng thµnh")
			AddGlobalNews("Chóc mõng bang héi:"..szFinalWinner.."Bang héi nhËn ®­îc "..tFightCityName[nFightCity].."_t­ c¸ch c«ng thµnh")
			WriteLogEx("Cong Thanh Chien",szFinalWinner.." nhËn ®­îc "..tFightCityName[nFightCity].."_t­ c¸ch c«ng thµnh")
		elseif szD == "" then					-- Èç¹ûÃ»ÓÐÊØ³Ç·½£¬ÔòÖ±½ÓÕ¼ÓÐ³ÇÊÐ
			SetCityWarWinner(nFightCity, szFinalWinner)
			Msg2SubWorld("Chóc mõng bang héi:"..szFinalWinner.." ®· chiÕm ®­îc "..tFightCityName[nFightCity])
			AddGlobalNews("Chóc mõng bang héi:"..szFinalWinner.." ®· chiÕm ®­îc "..tFightCityName[nFightCity])
			WriteLogEx("Cong Thanh Chien",szFinalWinner.." ®· chiÕm ®­îc "..tFightCityName[nFightCity])
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
		for i=1, gf_GetTeamSize() do	-- °Ñµ±Ç°×éÄÚµÄÈË¶¼¼ÇÂ¼ÉÏ
			PlayerIndex = gf_GetTeamMember(i)
			if PlayerIndex > 0 then
				Talk(1,"","mêi ®îi trong thµnh, thuyÒn ®i kh«ng ®îi ng­êi, qu¸ thêi h¹n ch­a v« xem nh­ tõ bá quyÒn lîi.")
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
	-- ÕâÐ©±äÁ¿Í¬ÑùÊÇmission±äÁ¿µÄË÷Òý
	m_nPrepareTimeEnd = 60,		-- ×¼±¸Ê±¼äµ½
	m_nFightTimeEnd = 61,		-- ½áÊøÊ±¼äµ½
	m_nFinal = 62,				-- ÊÇ·ñÎª¾öÈü
	m_nFinalLost = 63,			-- Èç¹ûÆ½¾ÖµÄ»°£¬×îÖÕË­Ê§°Ü£¬ÓÐµãÆæ¹ÖµÄÂß¼­£¬²»¹ýÎªÁËºÃ´¦Àí
	
	m_nEndTick = 64,			-- Ê¤ÀûÒÔºóÁôÒ»¸ö»º³åÊ±¼ä
	
	m_sCamp1Team = 1,			-- 1¶ÓµÄÃû×Ö
	m_sCamp2Team = 2,			-- 2¶ÓµÄÃû×Ö
	
	m_sCamp1TeamBak = 3,		-- ¼ÇÂ¼²ÎÈü1¶ÓµÄÃû×Ö
	m_sCamp2TeamBak = 4,		-- ¼ÇÂ¼²ÎÈü2¶ÓµÄÃû×Ö
	
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
		-- ¼ÆËã¸÷¸öÊ±¼äµã
		local nPrepareTimeEnd = SUB_ARENA_PREPARE_TIME_END
		local nFightTimeEnd = nPrepareTimeEnd + SUB_ARENA_FIGHT_TIME_END
		
		SetMissionV(self.m_nPrepareTimeEnd, nPrepareTimeEnd)
		SetMissionV(self.m_nFightTimeEnd, nFightTimeEnd)
		SetMissionV(self.m_nFinal, nFinal)
		
		-- ¿ªÊ¼¼ÆÊ±Æ÷
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
		-- ÉÆºó´¦Àí
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
			-- Í¨±¨¾àÀë¿ªÕ½Ê±¼ä»¹ÓÐ¶àÉÙ
			self:NotifyMsg("Thêi gian khai chiÕn cßn  ", nPrepareTimeEnd, nTimeStep)
		elseif nTimeStep < nFightTimeEnd then
			local nMissionID = GetMissionV(self.m_nMissionID)
			if GetMissionV(self.m_nEndTick) == 2 then	-- »º³åÊ±¼äµ½
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
				StopMissionTimer(nMissionID, GetMissionV(self.m_nTimerID))		-- ÒÑ¾­½áÊø£¬Ò²Í£Ö¹¼ÆÊ±Æ÷·µ»Ø
				return
			end
			if GetMissionV(self.m_nEndTick) > 0 then	-- Èç¹ûÊÇ½áÊøÁË£¬µÝÔö»º³åÊ±¼ä
				SetMissionV(self.m_nEndTick, GetMissionV(self.m_nEndTick) + 1)
				return
			end
			-- Èç¹ûÊÇÒ»·½ÂÖ¿Õ£¬»òÕßÒÑ¾ö³öÊ¤¸º£¬ÔòÍ£Ö¹¼ÆÊ±Æ÷·µ»Ø
			if my_getmissions(self.m_sCamp1Team) == "" or my_getmissions(self.m_sCamp2Team) == "" then
				StopMissionTimer(nMissionID, GetMissionV(self.m_nTimerID))
				return
			end
			
			-- Èç¹û´ËÆÚ¼äÃ»ÓÐ¶ÔÊÖÁË£¬¾Í°Ñ×Ô¼ººÍ¹ÛÖÚÒ²´«³öÈ¥
			local nIsEnd = 0
			local szMsg = ""
			if GetMSPlayerCount(nMissionID, 1) == 0 and GetMSPlayerCount(nMissionID, 2) == 0 then
				local nLost = GetMissionV(self.m_nFinalLost)
				szMsg = my_getmissions(self.m_sCamp1Team).."cïng víi "..my_getmissions(self.m_sCamp2Team).."qua mét håi tû thÝ kÞch liÖt, cuèi cïng: "..my_getmissions(nLost).." kinh nghiÖm giang hå non kÐm, thua trËn thËt ®¸ng tiÕc"
				my_setmissions(nLost, "")
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			elseif GetMSPlayerCount(nMissionID, 1) == 0 then
				my_setmissions(self.m_sCamp1Team, "")
				szMsg = my_getmissions(self.m_sCamp2Team).." giµnh ®­îc chiÕn th¾ng L«i ®µi lÇn nµy"
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			elseif GetMSPlayerCount(nMissionID, 2) == 0 then
				my_setmissions(self.m_sCamp2Team, "")
				szMsg = my_getmissions(self.m_sCamp1Team).." giµnh ®­îc chiÕn th¾ng L«i ®µi lÇn nµy"
				nIsEnd = 1
				WriteLogEx("Cong Thanh Chien",szMsg)
			end
			
			if nIsEnd == 1 then
				SetMissionV(self.m_nEndTick, 1)
				Msg2MSAll(nMissionID, szMsg)
				return
			end
			
			-- Èç¹û´ËÆÚ¼ä¶ÓÎéÈ«Ãð,¾Í°ÑÕû¸ö¶ÓÎé´«³öÈ¥
			---------Õâ¼¸¸öÊÇÆ½¾Ö²Å»áÓÃµÄ-------
			local tLevel = {}
			local tExp = {}
			local nDeadTeamCount = 0
			---------Õâ¼¸¸öÊÇÆ½¾Ö²Å»áÓÃµÄ-------
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
						Msg2Player("§éi cña b¹n bÞ tiªu diÖt s¹ch, hiÖn chuyÓn ®éi ngò cña b¹n ra khái trËn ®Þa!")
						-- ¼ÆËãÒ»ÏÂ¹ÒµôÒ»·½µÄ¾­ÑéºÍµÈ¼¶£¬ÒÔ·ÀÍòÒ»Á½±ßÍ¬Ê±¹ÒÁË
				   		tLevel[i] = tLevel[i] + GetLevel()
				   		tExp[i] = tExp[i] + GetExp()
						DelMSPlayer(nMissionID, PlayerIndex, 0)
					end
				end
			end
			
			if nDeadTeamCount == 2 then		-- Èç¹ûÊÇÁ½±ß¶¼¹ÒµôÁË
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
			
			self:NotifyMsg("thêi gian thi ®Êu cßn  ", nFightTimeEnd, nTimeStep)
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
		-- ¹ÛÖÚÓÐÉÏÏÞ
		if GetMSPlayerCount(nMission, nCamp) > MAX_VIEWER then
			Talk(1,"","Ng­êi xem trËn L«i ®µi ®· ®Çy råi")
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
		if my_getmissions(self.m_sCamp1Team) == "" then		-- Èç¹ûÂÖ¿ÕµÄ£¬»òÕß°Ñ¶Ô·½Ö±½ÓÉ±³öÈ¥ÁË£¬×ÔÈ»¾Í½øÈëÏÂÒ»ÂÖÁË
			szWinner = my_getmissions(self.m_sCamp2Team)
		elseif my_getmissions(self.m_sCamp2Team) == "" then
			szWinner = my_getmissions(self.m_sCamp1Team)
		else								-- ÅÐ¶Ï»î×ÅµÄÈËÊý,Èç¹ûÏàµÈÔòÅÐ¶Ï»îÈËµÄ×Ü¾­ÑéÖµ,Èç¹û»¹ÏàµÈ¾ÍËæ»úÒ»¸ö
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
					elseif nTeam1Exp == nTeam2Exp then		-- Ëæ»úÒ»¸ö
						szWinner = my_getmissions(random(self.m_sCamp1Team, self.m_sCamp2Team))
					end
				end
			end
		end
		if szWinner ~= "" then
			Msg2SubWorld("Bang héi: "..szWinner.." giµnh th¾ng lîi.")
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
			   	Talk(1,"","TrËn chiÕn b¾t ®Çu!")
			end
		end
		
		idx = 0
		for i=1, GetMSPlayerCount(nMissionID, 2) do
			idx, pidx = GetNextPlayer(nMissionID, idx, 2)
			if pidx > 0 then
			   	PlayerIndex = pidx
			   	SetFightState(1)
			   	Talk(1,"","TrËn chiÕn b¾t ®Çu!")
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
			szInfo = my_getmissions(self.m_sCamp2TeamBak).."TrËn nµy trèng, trùc tiÕp vµo hiÖp sau\n"
		elseif my_getmissions(self.m_sCamp2TeamBak) == "" then
			szInfo = my_getmissions(self.m_sCamp1TeamBak).."TrËn nµy trèng, trùc tiÕp vµo hiÖp sau\n"
		else
			if my_getmissions(self.m_sCamp1Team) == "" and my_getmissions(self.m_sCamp2Team) == "" then
				szInfo = "Bang héi <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> vµ bang héi <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> cïng rêi trËn, ra khái trËn L«i ®µi nµy\n"
			elseif my_getmissions(self.m_sCamp1Team) == "" then
				szInfo = "Bang héi <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> vµ bang héi <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> trËn ®Êu, bang héi <color=yellow>"..my_getmissions(self.m_sCamp2Team).."<color> cuèi cïng ®· th¾ng\n"
			elseif my_getmissions(self.m_sCamp2Team) == "" then
				szInfo = "Bang héi <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> vµ bang héi <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> trËn ®Êu, bang héi <color=yellow>"..my_getmissions(self.m_sCamp1Team).."<color> cuèi cïng ®· th¾ng\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 1) == 0 and GetMSPlayerCount(ARENA_MISSION_ID, 2) == 0 then
				szInfo = "Bang héi <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> vµ bang héi <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> ®Òu kh«ng vµo ®Êu tr­êng thi ®Êu\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 1) == 0 then
				szInfo = "Bang héi <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> vµ bang héi <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> trËn ®Êu, bang héi <color=yellow>"..my_getmissions(self.m_sCamp1Team).."<color> kh«ng vµo ®Êu tr­êng thi ®Êu\n"
			elseif GetMSPlayerCount(ARENA_MISSION_ID, 2) == 0 then
				szInfo = "Bang héi <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> vµ bang héi <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> trËn ®Êu, bang héi <color=yellow>"..my_getmissions(self.m_sCamp2Team).."<color> kh«ng vµo ®Êu tr­êng thi ®Êu\n"
			else
				szInfo = "Bang héi <color=yellow>"..my_getmissions(self.m_sCamp1TeamBak).."<color> vµ bang héi <color=yellow>"..my_getmissions(self.m_sCamp2TeamBak).."<color> ®ang håi kÞch liÖt\n"
			end
		end
		self:ReSetSubWorld()
		return szInfo
	end,
	
	NotifyMsg = function(self, szPreMsg, nEndStep, nNowStep)
		-- ×¢Òâ:ARENA_TIME_SEC±ØÐëÄÜ±»10Õû³ý,·ñÔòÕâÐ©ÌáÊ¾Ìõ¼þ¶¼²»³ÉÁ¢
		local nAllSec = ((nEndStep - nNowStep) * ARENA_TIME_SEC)
		local nMin = floor(nAllSec / 60)
		local nSec = mod(nAllSec, 60)
		
		if nMin > 1 and nSec == 0 then		-- ´óÓÚ1·ÖÖÓÔò1·ÖÖÓÒ»±¨
			Msg2MSAll(GetMissionV(self.m_nMissionID), szPreMsg..nMin.." Phót ")
		elseif nMin == 0 and mod(nSec, 10) == 0 then	-- Ð¡ÓÚ1·ÖÖÓÔò10ÃëÒ»±¨
			Msg2MSAll(GetMissionV(self.m_nMissionID), szPreMsg..nSec.." Gi©y ")
		end
	end,
	
}

KMissionRecordRoom = inherit(KMissionRoom, KMissionRecordAppend)
KMissionArenaRoom = inherit(KMissionRoom, KMissionArenaAppend)
