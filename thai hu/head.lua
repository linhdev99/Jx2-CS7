-- 
-- 
Include("\\script\\class\\ktabfile.lua");
Include("\\script\\lib\\offline_head.lua");
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\lib\\vnglib_award.lua");
Include("\\script\\vng\\award\\feature_award.lua");
Include("\\script\\vng\\nhiemvuphucsinh2\\phucsinh2_head.lua")
Include("\\script\\tmp_task_id_def.lua")

MONSTER_FILE = new(KTabFile, "\\settings\\̫��þ�\\monster.txt")
FILE_ROW_COUNT = tonumber(MONSTER_FILE:getRow())
Include("\\script\\lib\\writelog.lua")

TAIXU_TASK_TEMP_BEGIN = 100
TAIXU_MONSTER_TYPE = 100	-- ��¼��ǰˢ�ֵ�����
TAIXU_ZONE_INDEX = 101		-- ��¼�����͵��ĸ��ռ�����
TAIXU_MAP_ID = 102			-- ��¼̫��þ��ĵ�ͼID
TAIXU_TEAM_SIZE = 107		-- ��¼����ʱ���������
TAIXU_RINGS_MAX = 103		-- ˢ�ֶ����ִ�
TAIXU_TEAM_INDEX = 108		-- ��¼��Ա����ʱ�Ƕ�����ĸ�λ��
TAIXU_RINGS = 104			-- ɱ�ֵ�����
TAIXU_STEPS = 105			-- ʱ�䴥�����ļƲ���
TAIXU_STEP_CONTROL = 106	-- ����ˢ�ֵ�ʱ��

TAIXU_TASK_TEMP_END = 108

TRIGGER_TIMER = 1011
TRIGGER_KILL = 1012
TRIGGER_RECT = 1013
TRIGGER_LOG = 1014

GROUP_OFFSET = 10

ONE_MONSTER_EXP = 2500
ONE_MONSTER_POPUR = 10

MAX_MONSTER_COUNT = 80		--���ˢ���ٹ���

RINGS_INTERVAL = 2		-- ˢ�ּ��

TAIXU_TIME = 1782		--��¼���һ�ν���̫��þ���ʱ��

tMAP_ID =
{
	[200] = 2010,
	[300] = 1010,
	[100] = 3010,
}

-- ��̫��þ����ͻ���������
tPos = 
{
	[3010] = {100, 1379, 2858},
	[2010] = {200, 1151, 2850},
	[1010] = {300, 1975, 3552},
	[4010] = {300, 1111, 1111},
	[5010] = {300, 1111, 1111},
}

tName =
{
	"B�ng Thi�n Tuy�t ��a",
	"Giang Nam Xu�n S�c",
	"Dung Nham ��a Ng�c",
	"H�n H�i Ho�ng Sa",
}

tNEW_WORLD =
{
	{1543, 3297},
	{1625, 3300},
	{1542, 3458},
	{1625, 3470},
}

tMonsterType = 
{
	[1] = {"Kinh nghi�m Th�", "Kinh nghi�m Ph�ng ho�ng", "Kinh nghi�m H�a K� L�n", "Kinh nghi�m Th�c nh�n th�o", "Kinh nghi�m B� T�y T�ng", "Kinh nghi�m C�m Ti�n T�","Phi Thi�n3","�� La Ni T�ng","��at B�o Nh�n"},
	[2] = {"Kinh nghi�m Th�", "Kinh nghi�m Ph�ng ho�ng", "Kinh nghi�m H�a K� L�n", "Kinh nghi�m Th�c nh�n th�o", "Kinh nghi�m B� T�y T�ng", "Kinh nghi�m C�m Ti�n T�","Phi Thi�n3","�� La Ni T�ng","��at B�o Nh�n"},
	[3] = {"Kinh nghi�m Th�", "Kinh nghi�m Ph�ng ho�ng", "Kinh nghi�m H�a K� L�n", "Kinh nghi�m Th�c nh�n th�o", "Kinh nghi�m B� T�y T�ng", "Kinh nghi�m C�m Ti�n T�","Phi Thi�n3","�� La Ni T�ng","��at B�o Nh�n"},
	[4] = {"Kinh nghi�m Th�", "Kinh nghi�m Ph�ng ho�ng", "Kinh nghi�m H�a K� L�n", "Kinh nghi�m Th�c nh�n th�o", "Kinh nghi�m B� T�y T�ng", "Kinh nghi�m C�m Ti�n T�","Phi Thi�n3","�� La Ni T�ng","��at B�o Nh�n"},
	
--	[2] = {"Luy�n Th� t�", "Luy�n Ph�ng Ho�ng", "Luy�n H�a K� L�n", "Luy�n Th�c Nh�n Hoa", "Luy�n Mao Ng�u", "Luy�n C�m Ti�n T�"},
--	[3] = {"B�o Th�ch Th�", "B�o Th�ch Ph�ng ho�ng", "B�o Th�ch H�a K� L�n", "B�o Th�ch Th�c Nh�n hoa", "B�o Th�ch B� T�y T�ng", "B�o Th�ch C�m Ti�n T�"},
--	[4] = {"Trang b� Th�", "Trang b� Ph�ng ho�ng", "Trang b� H�a K� L�n", "Trang b� Th�c nh�n th�o", "Trang b� B� T�y T�ng", "Trang b� C�m Ti�n T�"},
}
-- ��i t�n hi�n th� c�c lo�i qu�i
t1 =  {"Th�", "Ph�ng ho�ng", "H�a K� L�n", "Th�c nh�n th�o", "B� T�y T�ng", "C�m Ti�n T�", "Li�t Nhan Li Long", "�� La Ni T�ng", "T�m B�o Nh�n"}

tbMobsRate = {
	[1] = {[1] = 1, nRate = 5.00},
	[2] = {[1] = 2, nRate = 15.00},
	[3] = {[1] = 3, nRate = 15.00},
	[4] = {[1] = 4, nRate = 10.00},
	[5] = {[1] = 5, nRate = 5.00},
	[6] = {[1] = 6, nRate = 10.00},
	[7] = {[1] = 7, nRate = 15.00},
	[8] = {[1] = 8, nRate = 15.00},
	[9] = {[1] = 9, nRate = 10.00},
}
-- Table v�ng Th�i H�
tThaiHuRing = 
{
	{"V�ng Th�i H� B�t Qu�i - C�n",2,1,469},
	{"V�ng Th�i H� B�t Qu�i - Kh�n",2,1,470},	
	{"V�ng Th�i H� B�t Qu�i - Kh�m",2,1,471},	
	{"V�ng Th�i H� B�t Qu�i - �o�i",2,1,472},
	{"V�ng Th�i H� B�t Qu�i - Ly",2,1,473},	
	{"V�ng Th�i H� B�t Qu�i - Ch�n",2,1,474},	
	{"V�ng Th�i H� B�t Qu�i - C�n",2,1,475},
	{"V�ng Th�i H� B�t Qu�i - T�n",2,1,476},
}
function GetTabData(nRow, nCell)
	local tempdata = MONSTER_FILE:getCell(nRow, nCell)
	if tonumber(tempdata) == nil then
		return tempdata
	else
		return tonumber(tempdata)
	end
end

-- �ж϶����Ƿ��ܹ�����
function Chk_Enter()
	local szSex = {"Thi�u hi�p", "N� hi�p "}
	local szNoTeam ={"Th�i H� Huy�n C�nh nguy hi�m tr�ng tr�ng,", " n�n t� ��i hay h�n!"}
	local nSex = GetSex()
	local szLevel = "<color=green>L�n h�n ho�c b�ng c�p 70<color>"
	local szItemCount = "<color=green>1 Th�i H� �a M�t qu�<color>"
	local szTimes = "<color=green>1 l�n<color>"
	local szLeader = "<color=green>��i tr��ng<color>"
	local szTown = "<color=green>��i vi�n c�ng m�t th�nh th�<color>"
	local szExMsg = ""				-- �������Ϣ
	local nRetCode = 1
	
	if IsinTeam() == 0 then
		nRetCode = 0
		return nRetCode, szNoTeam[1]..szSex[nSex]..szNoTeam[2]
	end
	
	if IsCaptain() == 0 then
		nRetCode = 0
		szLeader = "<color=red>��i tr��ng<color>" 
	end
	
	local nSize = GetTeamSize()
	local nCount = 1
	local OldPlayer = PlayerIndex
	-- for i = 1, nSize do
	-- 	PlayerIndex = GetTeamMember(i)
	for i = 1, 8 do
		PlayerIndex = GetTeamMember(0)
		if GetLevel() < 70 then
			nRetCode = 0
			szLevel = "<color=red>L�n h�n ho�c b�ng c�p 70<color>"
			break
		end
	end
    
--    --�ӳ�Я��1��̫���
--    PlayerIndex = GetTeamMember(0)
--    if PlayerIndex <= 0 then
--    	print("###̫��þ� Chk_Enter ���ӳ�Я��̫�������")
--    	return
--    end
--   	if GetItemCount(2,1,387) < 1 then
--   		nRetCode = 0
--   		szItemCount = "<color=red>1��̫����ۻ���<color>"
--    end
    -- Ki�m tra ng�y �i Th�i H� m�t l�n
--    for i = 1, nSize do
--    	PlayerIndex = GetTeamMember(i)
--    	-- �i�u ki�n ch�n ng�y
----    	if TodayCanEnter() <= 0 then
----    		nRetCode = 0
----    		szTimes = "<color=red>1 l�n<color>"
----    		szExMsg = szExMsg..GetName()..", "
----    	end
--    end
--    PlayerIndex = OldPlayer
--    if szExMsg ~= "" then
--	    local nLen = strlen(szExMsg)
--	    szExMsg = strsub(szExMsg, 1, nLen - 2)
--	    szExMsg = szExMsg.."Kh�ng v�o ���c Th�i H� Huy�n C�nh (H�m nay �� v�o 1 l�n)"
--	end
	
    
    if AreaCheck() == 0 then
    	nRetCode = 0
    	szTown = "<color=red>��i vi�n c�ng m�t th�nh th�<color>"
    end
    
    local nSleepCheckRet = 0
    local szSleepCheck = ""
    nSleepCheckRet, szSleepCheck = SleepCheck()
    if nSleepCheckRet == 0 then
    	nRetCode = 0
    end

	if szExMsg ~= "" then
		Msg2Team(szExMsg)
	end
	if szSleepCheck ~= "" then
		Msg2Team(szSleepCheck)
	end

    local szMsg = "Do "..szLeader.."d�n ��u"..szLevel..szTown..", 1 ng�y v�o"..szTimes.."Th�i H� Huy�n C�nh. \n\n(<color=white>M�u xanh t��ng tr�ng �� �i�u ki�n, m�u �� kh�ng �� nguy�n nh�n<color>)"
    return nRetCode, szMsg
end

-- �Ƿ��ڶ�����
function IsinTeam()
	if GetTeamSize() < 1 then
		return 0
	else
		return 1
	end
end

-- �Ƿ�Ϊ�ӳ�
function IsCaptain()
	if IsinTeam() == 0 then
		return 0
	end
	
	local nCaptain = GetTeamMember(0)
	if nCaptain == PlayerIndex then
		return 1
	else
		return 0
	end
end

function TodayCanEnter()
	local nNow = date("%y%m%d")
	local nLastTime = GetTask(TAIXU_TIME)
	local nDuration = nNow - nLastTime
	return nDuration
end

function GetRouteCount()
	local RouteTable = {}
	-- local nCount = 1
	-- local nRoute = 0
	-- local flagInTable = 0
	local nCount = 8
	local nRoute = 8
	local flagInTable = 8
	local nOldIndex = PlayerIndex
	--for i=1, GetTeamSize() do
	-- for i=1, 8 do
		-- PlayerIndex = GetTeamMember(i)
		-- nRoute = GetPlayerRoute()
	for i=1, 8 do
		PlayerIndex = GetTeamMember(0)
		nRoute = i
		for index, value in RouteTable do
			if value == nRoute then
				flagInTable = 1
				break
			end
		end
		if flagInTable == 1 then
			flagInTable = 0
		else
			RouteTable[nCount] = nRoute;
			nCount = nCount + 1
		end
	end
	PlayerIndex = nOldIndex
	print(nCount)
	print(RouteTable)
	return nCount - 1
end

-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
	local nRestMin = floor(nSec / 60)
	local nRestSec = mod(nSec, 60)
	return nRestMin, nRestSec
end;


function InitPlayerStatus(nMapid, nIndex)
	--Msg2Player("Trong quy t�c b� tr� �i��")
	-- ����Ƕӳ�
	if IsCaptain() == 1 then
		SetDeathScript("\\script\\̫��þ�\\death.lua")
		SetTaskTemp(TAIXU_STEPS, 0)
		SetTaskTemp(TAIXU_STEP_CONTROL, 2)
		SetTaskTemp(TAIXU_RINGS, 0)
		SetTaskTemp(TAIXU_ZONE_INDEX, nIndex)
		SetTaskTemp(TAIXU_MAP_ID, nMapid)
		SetTaskTemp(TAIXU_TEAM_SIZE, 8)
		-- SetTaskTemp(TAIXU_TEAM_SIZE, GetTeamSize())
		local nRouteCount = GetRouteCount()
		if nRouteCount > 8 then
			nRouteCount = 8
		end
		SetTaskTemp(TAIXU_RINGS_MAX, nRouteCount)

		local nTrigger = CreateTrigger(1, 1106, TRIGGER_TIMER)
		
		ContinueTimer(nTrigger)
	end

	-- �ӳ��ͳ�Ա���еĳ�ʼ��
	local nNow = date("%y%m%d")
	SetTask(TAIXU_TIME, nNow)
	
	SetLogoutRV(1)						-- ��;�жϺ�س�
	SetFightState(1)					-- ����Ϊ��ս��
	SetCreateTeam(1)					-- �ر���ӹ���
	--UseScrollEnable(0)					-- ��ֹʹ�ûسǷ�
	InteractiveEnable(0)					-- �������أ�0�رգ�1��
	StallEnable(0)						-- ��̯����
	ForbitTrade(1)						-- ��ֹ����
	OpenFriendliness(0)					-- �������ø�
	SetDeathPunish(0)					-- �������ͷ�
	
	CreateTrigger(0, 1106, TRIGGER_KILL)
	CreateTrigger(2, 1106, TRIGGER_RECT)
	CreateTrigger(3, 1106, TRIGGER_LOG)
	--OnKill����
	SetTaskTemp(TMP_TASK_TAIXU_TAG, 0);
	--cdkey�
	SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_Raid_Set(1)");	
end

function ClearMonster(nIndex)
	nIndex = nIndex + GROUP_OFFSET					-- ����Ͳؽ���ͻ
	SetGroupLifeTime(nIndex, nLifeTime)
	SetGroupDeathScript(nIndex, "")
	return ClearGroup(nIndex)
end

function Move2Stage(nIndex)
	local szMsg = ""
	local nMapid = GetWorldPos()
	
	-- 8����Ա�����ƫ�ƣ���֤trap�󲻻ᴫ�͵�ͬһ��
	local tOffset =
	{
		{-2, 0},
		{-1, 0},
		{0, 0},
		{1, 0},
		{-2, 1},
		{-1, 1},
		{0, 1},
		{1, 1},
	}

	local pos = {}
	pos[1] = tMAP_ID[nMapid]

	local nOldPlayer = PlayerIndex
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	for i=1, 8 do
		PlayerIndex = GetTeamMember(0)
		CleanInteractive()
		SCCheckOfflineExp(3)
		local nPlayerTeamIndex = GetTaskTemp(TAIXU_TEAM_INDEX)
		
		if nPlayerTeamIndex > 0 and nPlayerTeamIndex <= 8 then
			pos[2] = tNEW_WORLD[nIndex + 1][1] + tOffset[nPlayerTeamIndex][1]
			pos[3] = tNEW_WORLD[nIndex + 1][2] + tOffset[nPlayerTeamIndex][2]
		else
			pos[2] = tNEW_WORLD[nIndex + 1][1]
			pos[3] = tNEW_WORLD[nIndex + 1][2]
		end
		
		if NewWorld(pos[1], pos[2], pos[3]) ~= 1 then
			Msg2Player("chuy�n ti�p th�t b�i, kh�ng th� v�o Th�i H� Huy�n C�nh")
			LeaveTeam()
			WriteLog("**Th�i H� Huy�n C�nh "..GetName().."Chuy�n ti�p th�t b�i, th�i gian : "..date("%H%M"))
		end
	end
	
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	for i=1, 8 do
		PlayerIndex = GetTeamMember(0)
		InitPlayerStatus(pos[1], nIndex)
	end
	PlayerIndex = nOldPlayer
	
	-- ��¼��ZONE�Ѿ��ж������
	SetMapTaskTemp(pos[1], nIndex, 1)
end

function EnterTx()
--	Talk(1, "", "Th�i H� �� h�t linh kh�, ��i hi�p h�y quay l�i sau nha !!!!")
--	do return end
	-- �򵥼���������ȷ��
	local nMap = GetWorldPos()
	if nMap ~= 100 then
		Talk(1,"","C�c h� ch� c� th� v�o Th�i H� Huy�n C�nh t� Tuy�n Ch�u!")
		return
	end
--	ReSetDateTH()
	if CheckMaxJoinCount() ~= 1 then
		return
	end
	if (FILE_ROW_COUNT - 2) > MAX_MONSTER_COUNT then
		Msg2Team("Th�i H� Huy�n C�nh �ang h�n lo�n, m�i ng��i kh�ng n�n v�o!", 2)
		WriteLog("**Th�i H� Huy�n C�nh monster.txt v� MAX_MONSTER_COUNT kh�ng ph�i h�p ���c")
		return
	end

	local nRetCode, szMsg = Chk_Enter()
	if nRetCode == 0 then
		Talk(1, "", szMsg)
		return
	end

	local t = {}
	local nCount = 0
	local nMapid = GetWorldPos()
	-- ��ͼ������0��1��2��3��ֵ��ʾ�Ƿ�ռ�ã�0Ϊûռ�ã�1Ϊ��ռ��
	for i = 0, 3 do
		local nValue = GetMapTaskTemp(tMAP_ID[nMapid], i)
		--local nLastTime = GetMapTaskTemp(tMAP_ID[nMapid], i + 4)
		if nValue == 0 then
			nCount = nCount + 1
			t[nCount] = i
		end
	end

	if nCount == 0 then
		Msg2Team("Th�i H� Huy�n C�nh �� ��y, khi kh�c h�y quay l�i!", 2)
		return
	end

	local n = random(1, getn(t))
	local nIndex = t[n]

	Msg2Team("Ph� sinh nh�t tr��ng, uy�n nh� xu�n m�ng; th� gian v�n t��ng, huy�n h�a th�i h�.", 2)
	-- Tr� v�ng v� v�t ph�m xu tr��c khi v�o Th�i H�
	local nOldIndex = PlayerIndex
		----------------------- Chu�i nhi�m v� Chuy�n Sinh ��n, l�u s� th� 4 v� 5 ��u b�n ph�i
--	local nCSD_TH = floor(GetTask(TSK_CSD_COUNT_A) / 1000)  -- CSD
--	local nNumBK = mod(GetTask(TSK_CSD_COUNT_A),1000)		--CSD
	-- for i=1, GetTeamSize() do
	for i=1, 8 do
		-- PlayerIndex = GetTeamMember(i)
		PlayerIndex = GetTeamMember(0)
		if mod(GetTask(TSK_THAIHU_DAY), 100) < 1 then
			Pay(290000)
			SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 1)
			--=================== Chu�i nhi�m v� Ph�c Sinh 2 ==================
			if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 20 and PhucSinh2_GetMissionPart() > 0 then
				PhucSinh2_SetMissionPart()
			end
			--=============================================================
			if mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000), 100) < 30 and GetTask(TSK_CSD) == 1 then
				local nCSD_TH = (floor(GetTask(TSK_CSD_COUNT_A) / 1000) + 1) * 1000 + mod(GetTask(TSK_CSD_COUNT_A),1000)
				SetTask(TSK_CSD_COUNT_A, nCSD_TH)
			--	Msg2Player("Gia tri 4: "..nCSD_TH)
			--	Msg2Player("Gia tri 5: "..GetTask(TSK_CSD_COUNT_A))
			end
			 gf_WriteLogEx("Thai Hu Huyen Canh","tham gia th�nh c�ng",1,"Tham gia l�n 1")
		else
			DelItem(2, 1, 30230, 20)
			SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 1)
			--=================== Chu�i nhi�m v� Ph�c Sinh 2 ==================
			if PhucSinh2_CheckActive() == 1 and PhucSinh2_GetDailyMission() == 21 and PhucSinh2_GetMissionPart() > 0 then
				PhucSinh2_SetMissionPart()
			end
			--=============================================================
			if mod(floor(GetTask(TSK_CSD_COUNT_A) / 1000), 100) < 30 and GetTask(TSK_CSD) == 1 then
				local nCSD_THa = (floor(GetTask(TSK_CSD_COUNT_A) / 1000) + 1) * 1000 + mod(GetTask(TSK_CSD_COUNT_A),1000)
				SetTask(TSK_CSD_COUNT_A, nCSD_THa)
			--	Msg2Player("Gia tri 4: "..nCSD_THa)
			--	Msg2Player("Gia tri 5: "..GetTask(TSK_CSD_COUNT_A))
			end
			gf_WriteLogEx("Thai Hu Huyen Canh","tham gia th�nh c�ng",1,"Tham gia l�n 2 tr� l�n")
			WriteLogEx("LOG XU VAT PHAM","Tham gia Th�i H� l�n 2 tr� l�n (20 xu)")
		end
		--nhi�m v� l�m gi�u
		if CFG_NhiemVuLamGiau == 1 then
			if gf_GetTaskBit(TSK_LAMGIAU, 12) == 1 and  gf_GetTaskBit(TSK_LAMGIAU, 2) == 0 then
		     		gf_SetTaskBit(TSK_LAMGIAU, 2, 1, 0)
		     		TaskTip("Ho�n th�nh nhi�m v� l�m gi�u: Ho�n th�nh 01 l�n Th�i H� Huy�n C�nh.")
	     		end
	     end
		-----------------------Chu�i nhi�m v� ��ng H�nh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and DongHanh_GetMission() == 11 then
				DongHanh_SetStatus()
			end
		end
		-----------------------	     
	end

	PlayerIndex = nOldIndex
	SetPlayerTeamIndex()	-- �����Ա�ڶ����е�λ��
	ClearMonster(nIndex)
	Move2Stage(nIndex)
end

function Msg2Team(msg, msgtype)
    -- local num = GetTeamSize()
	local num = 8
    msg = tostring(msg)
    if (num < 1) then
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
        return
    end
    local OldPlayer = PlayerIndex
    -- for i=1, num do
    --     PlayerIndex = GetTeamMember(i)
	for i=1, 8 do
		PlayerIndex = GetTeamMember(0)
    	if msgtype == 2 then 
    		Talk(1, "", msg)
        elseif msgtype == 1 then
        	Say(msg, 0)
        else
        	Msg2Player(msg)
        end
    end
    PlayerIndex = OldPlayer
end

function CreateMonster(nZone, nType)
	local nMapid = GetWorldPos()
	if not (nMapid == 2010 or nMapid == 1010 or nMapid == 3010) then
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		RemoveTrigger(GetTrigger(TRIGGER_KILL))
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		return
	end
	
	local n = mod(random(4315511), 100)
	local nMonsterType = 0
	if nType == 0 then
		if n < 75 then
			nMonsterType = 1
		else
			nMonsterType = 2
		end
	elseif nType == 1 then
		if n < 25 then
			nMonsterType = 4
		elseif n < 75 then
			nMonsterType = 1
		else
			nMonsterType = 2
		end
	end

	local t = tMonsterType[nMonsterType];
	n = random(1, getn(t));
	local szMonsterName = t[n];
	local szMonsterMode = "";
	if nMonsterType == 2 then		-- ��Ϊ��Ҳ�þ����ģ��
		szMonsterMode = tMonsterType[1][n];
	else
		szMonsterMode = t[n];
	end

	local x, y
	for i = 3, FILE_ROW_COUNT do
		x = GetTabData(i, nZone * 2 + 1)
		y = GetTabData(i, nZone * 2 + 2)
		local npcIndex = CreateNpc(szMonsterMode, szMonsterName, nMapid, x, y)
		AddGroupUnit(nZone + GROUP_OFFSET, npcIndex)
	end
	
	-- ��¼��ǰˢ������
	SetTaskTemp(TAIXU_MONSTER_TYPE, nMonsterType)
end

function GiveAward(nType)
	local nMonsterCount = FILE_ROW_COUNT - 2		-- ��������
	local nTeamSize = 0
	local nRouteCount = 0
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nTeamSize = GetTaskTemp(TAIXU_TEAM_SIZE)
		nRouteCount = GetTaskTemp(TAIXU_RINGS_MAX)
	end
	--============= Th��ng v��t �i
	ThaiHu_ThuongVuotAi()
	--===========================
	-- for i = 1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	for i = 1, 8 do
		PlayerIndex = GetTeamMember(0)
		if nType == 1 then	--����
			local nExpAll = nMonsterCount * ONE_MONSTER_EXP * nRouteCount
			local nExp = floor(nExpAll / nTeamSize)
			-- ��������
			if nExp > MAX_MONSTER_COUNT * ONE_MONSTER_EXP then
				nExp = MAX_MONSTER_COUNT * ONE_MONSTER_EXP
				WriteLog("** Th�i H� Huy�n C�nh, tr� kinh nghi�m �� v��t m�c, FILE_ROW_COUNT = "..FILE_ROW_COUNT..", s� l�n ��nh qu�i nhi�u nh�t= "..nRouteCount..", s� ng��i ��i ng� tr��c= "..nTeamSize)
			end
--			ModifyExp(nExp)
--			Msg2Player("��i ng� t�ng c�ng nh�n ���c"..nExpAll.." �i�m kinh nghi�m, b�nh qu�n m�i ng��i ���c"..nExp)
		elseif nType == 2 then	--��Ϊ
			local nPopurAll = nMonsterCount * ONE_MONSTER_POPUR * nRouteCount
			local nPopur = floor(nPopurAll / nTeamSize)
			if nPopur > MAX_MONSTER_COUNT * ONE_MONSTER_POPUR then
				nPopur = MAX_MONSTER_COUNT * ONE_MONSTER_POPUR
				WriteLog("**Th�i H� Huy�n C�nh: tr� �� v��t m�c, FILE_ROW_COUNT = "..FILE_ROW_COUNT..", s� l�n ��nh qu�i nhi�u nh�t= "..nRouteCount..", s� ng��i ��i ng� tr��c= "..nTeamSize)
			end
--			ModifyPopur(nPopur)
--			Msg2Player("��i ng� t�ng c�ng nh�n ���c"..nPopurAll.." �i�m tu luy�n, b�nh qu�n m�i ng��i ���c "..nPopur)
		elseif nType == 3 then	--��ʯ
			--AddItem(1, 0, 32, 1, 1)		--��תһ������ʱ��
		end
	end
	PlayerIndex = nOldPlayer
end

function ResetPlayerStatus()
	SetLogoutRV(0)						-- ��;�жϺ�س�
	SetFightState(0)					-- ����Ϊ��ս��
	SetCreateTeam(0)					-- �ر���ӹ���
	--UseScrollEnable(0)					-- ��ֹʹ�ûسǷ�
	InteractiveEnable(1)					-- �������أ�0�رգ�1��
	StallEnable(1)		   				-- ��̯����
	ForbitTrade(0)						-- ��ֹ����
	OpenFriendliness(1)					-- �ָ������ø�
	SetDeathPunish(1)					-- �ָ������ͷ�
end

function GameOver(nType)
	local nMapid = 0
	local nOldPlayer = PlayerIndex
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		nMapid = GetTaskTemp(TAIXU_MAP_ID)
	end
	PlayerIndex = nOldPlayer
	
	if nType == 0 then		--����GameOver
		RemoveTrigger(GetTrigger(TRIGGER_RECT))
		RemoveTrigger(GetTrigger(TRIGGER_KILL))
		RemoveTrigger(GetTrigger(TRIGGER_LOG))
		NewWorld(tPos[nMapid][1], tPos[nMapid][2], tPos[nMapid][3])
		ResetPlayerStatus()
		LeaveTeam()
	elseif nType == 1 then
		-- �ȴ���ӳ�
		nOldPlayer = PlayerIndex
		PlayerIndex = GetTeamMember(0)
		local nZone = GetTaskTemp(TAIXU_ZONE_INDEX)
		SetDeathScript("")
		RemoveTrigger(GetTrigger(TRIGGER_TIMER))
		for i = TAIXU_TASK_TEMP_BEGIN, TAIXU_TASK_TEMP_END do
			SetTaskTemp(i, 0)
		end
		-- Ȼ���Ա
		-- for i=1, GetTeamSize() do
		-- 	PlayerIndex = GetTeamMember(i)
		for i = 1, 8 do
			PlayerIndex = GetTeamMember(0)
			if PlayerIndex > 0 then
				SetTaskTemp(TAIXU_TEAM_INDEX, 0)
				RemoveTrigger(GetTrigger(TRIGGER_RECT))
				RemoveTrigger(GetTrigger(TRIGGER_KILL))
				RemoveTrigger(GetTrigger(TRIGGER_LOG))
				NewWorld(tPos[nMapid][1], tPos[nMapid][2], tPos[nMapid][3])
				ResetPlayerStatus()
			end
		end
		PlayerIndex = nOldPlayer
		-- �ѵ�ͼ���Ϊ�޶ӽ���
		SetMapTaskTemp(nMapid, nZone, 0)
		SetMapTaskTemp(nMapid, nZone + 4, 0)
		SetGroupLifeTime(nZone + GROUP_OFFSET, 1)
		ClearGroup(nZone + GROUP_OFFSET)
	end
end

function no()

end


function Hewei()
	Say("C�u Thi�n Huy�n N� l�y tam thu thanh l� v� b�ch hoa qu� m�t l�m ra nhi�u lo�i linh th�; ngo�i ra c�n l�y m�y m� luy�n ng� s�c k� th�ch ��t ch�ng t�i m�t th� gi�i huy�n �o c� t�n Th�i H�. Ph�m ai v�o ���c trong ��u to�i nguy�n.",
		1, "Ta ch� h�i th�i!/no")
end

function Ruhe()
	Say("Ch� c�n <color=yellow>t� ��i<color> mang theo <color=yellow>1 Th�i H� �a M�t qu�<color> ��n t�m b�n ��o l� ���c. Th�i H� Huy�n C�nh l� ch�n th�n ti�n m�i ng�y ch� v�o ���c t�i �a <color=yellow>1 l�n<color>.",
		1, "Ta ch� h�i th�i!/no")
end

-- �ڽ���ǰ�ж����ж�Ա�Ƿ���ͬһ������
function AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--���ȡһ����Ա��worldpos
	local nOldIndex = PlayerIndex
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	for i = 1, 8 do
		PlayerIndex = GetTeamMember(0)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	-- if GetTeamSize() == nTeamSize then
	if  nTeamSize <= 8 then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function SleepCheck()
	local nTeamSize = 0
	local szExMsg = ""
	local nOldIndex = PlayerIndex
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	for i = 1, 8 do
		PlayerIndex = GetTeamMember(0)
		if IsSleeping() == 1 then
			szExMsg = szExMsg..GetName()..", "
		else
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if szExMsg ~= "" then
	    local nLen = strlen(szExMsg)
	    szExMsg = strsub(szExMsg, 1, nLen - 2)
	    szExMsg = szExMsg.."Kh�ng th� v�o Th�i H� Huy�n C�nh (�ang ��ng)"
	end
	if (GetTeamSize() == nTeamSize) and (GetTeamSize() > 0) then
		return 1, szExMsg
	else
		return 0, szExMsg
	end
end

function SetPlayerTeamIndex()
	local nOldIndex = PlayerIndex
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	for i = 1, 8 do
		PlayerIndex = GetTeamMember(0)
		SetTaskTemp(TAIXU_TEAM_INDEX, i)
		WriteLogEx("Thai Hu Huyen Canh", "Tham gia");
	end
	PlayerIndex = nOldIndex
end
-- ReSet qua ng�y
--function ReSetDateTH()
--	local nDate = tonumber(date("%y%m%d"))
--	local nOldIndex = PlayerIndex
--	for i=1, GetTeamSize() do
--		PlayerIndex = GetTeamMember(i)
--		if floor( GetTask(TSK_THAIHU_DAY)/100) ~= nDate then
--			SetTask(TSK_THAIHU_DAY,nDate*100)
--		end
--	end
--	PlayerIndex = nOldIndex
--end
-- Check xem th�nh vi�n trong t� ��i �� tham gia 6 l�n trong ng�y ch�a
function CheckMaxJoinCount()
	local nOldIndex = PlayerIndex
	-- for i=1, GetTeamSize() do
	-- 	PlayerIndex = GetTeamMember(i)
	for i = 1, 8 do
		PlayerIndex = GetTeamMember(0)
		local nCount =	mod(GetTask(TSK_THAIHU_DAY),100)
		if nCount >= 6 then
			gf_Msg2Team("T� ��i c�a b�n c� th�nh vi�n "..GetName().." �� tham gia 6 l�n",2)
			return 0
		elseif nCount < 1 then
			if GetCash()<290000 then
				gf_Msg2Team("T� ��i c�a b�n c� th�nh vi�n "..GetName().." kh�ng c� 29 v�ng",2)
				return 0
			end
		elseif nCount >= 1 and nCount <= 6 then
			if GetItemCount(2,1,30230) < 20 then
				gf_Msg2Team("T� ��i c�a b�n c� th�nh vi�n "..GetName().." kh�ng c� 20 xu v�t ph�m",2)
				return 0
			end
		end
	end
	PlayerIndex = nOldIndex
	return 1
end


function Award_Max()
	if gf_JudgeRoomWeight(3,100) == 0 then
		Talk(1,"","H�nh trang ho�c s�c l�c kh�ng ��, ng��i h�y s�p x�p l�i nh�!");
		return 0
	end
	local nCheck =	floor(GetTask(TSK_THAIHU_DAY)/100)
	if nCheck > 0 then
		Talk(1,"","Ph�n th��ng h�m nay �� nh�n r�i, mai ti�p t�c c� g�ng nh�!");
		return 0
	end
	local tbAward = {fn="RandomAward()",	nDanhvong = 60, nSumon = 60, nExp = 24000000
	}	--nGold = 100000, item={{gdp={2,1,2652	,20}, name = "X�ch Thi�t Tinh"}, {gdp={2,1,3219,1}, name="Nguy�t Hoa Chi Tinh"}},	
	LIB_Award.szLogTitle = "Thai Hu Huyen Canh"
	LIB_Award.szLogAction = "nh�n"
	LIB_Award:Award(tbAward)
	SetTask(TSK_THAIHU_DAY, GetTask(TSK_THAIHU_DAY) + 100)
	gf_WriteLogEx("Thai Hu Huyen Canh","nh�n",1,"Ph�n th��ng cu�i")
end

function RandomAward()
	local tbAward_ThaiHu = {
								{1, 2500, "L�c Mai", {1, 1, 16, 5}},
								{1, 2500, "M�c Lan Xu�n", {1, 1, 18, 5}},
								{1, 2000, "B�nh B�t V�ng", {1, 1, 15, 5}},
								{1, 2000, "T�y B�c V�ng", {1, 1, 19, 5}},
								{1, 999, "Minh D� Nguy�t", {1, 1, 17, 5}},
								{1, 1, "T�ng R��ng", {2, 1, 30341, 2}},
							}
	gf_EventGiveRandAward(tbAward_ThaiHu, 10000,1,"Thai Hu Huyen Canh","ph�n th��ng ng�u nhi�n")							
end