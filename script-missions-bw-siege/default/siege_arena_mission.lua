
-- Creator : lizhi
-- ����ս����	2007-3-29 10:43

Include("\\script\\missions\\bw\\siege\\siege_arena_head.lua")
Include("\\script\\missions\\bw\\siege\\mission_room.lua")
Include("\\script\\missions\\bw\\siege\\jingtoutiaozhanling.lua")
Include("\\script\\online\\zgc_public_fun.lua")

function talk_to_npc()
	local nType = GetGlbValue(CITY_GLB_VALUE_TYPE);
	if nType ~= 0 then
		if nType == 2 then
			nType = 1
		end
		local szMethod = tSignMethod[nType];
		local nDay = tonumber(date("%w"));
		local nHour = tonumber(date("%H"));
		local nMin = tonumber(date("%M"));
--		if nDay ~= 5 then
--			Say("<color=green>Ch� l�i ��i<color>: Lo�i h�nh tranh �o�t t� c�ch c�ng th�nh tu�n n�y l� "..szMethod..", th� 6 h�y quay l�i ��y tham gia.",0);
--		else
			local tb_dialog = {
				"R�i kh�i/no_say",
			};
			--if nHour < 19 or (nHour == 19 and nMin < 30) then
			--	Say("<color=green> Ch� l�i ��i<color>: �� c� t� c�ch c�ng th�nh v�o tu�n n�y, qu� bang ph�i tham gia <color=green>"..szMethod.."<color>. Xin m�i qu� bang h�i mau mau chu�n b�.!",0);
			--	return 0;
			--end			
			tinsert(tb_dialog, 1, "Tham gia L�i ��i C�ng th�nh chi�n/canjia_leitai");
			tinsert(tb_dialog, 2, "T�m thuy�t minh L�i ��i C�ng th�nh chi�n/kan_shuoming");
			Say("L�i ��i C�ng th�nh chi�n l� tr�n ��u gi�nh t� c�ch C�ng th�nh chi�n gi�a c�c bang h�i.", getn(tb_dialog), tb_dialog);			
			
--			if nType == 1 then--����ս��̨
--				tinsert(tb_dialog, 1, "Tham gia L�i ��i C�ng th�nh chi�n/canjia_leitai");
--				tinsert(tb_dialog, 2, "T�m thuy�t minh L�i ��i C�ng th�nh chi�n/kan_shuoming");
--				Say("L�i ��i C�ng th�nh chi�n l� tr�n ��u gi�nh t� c�ch C�ng th�nh chi�n gi�a c�c bang h�i.", getn(tb_dialog), tb_dialog);
--			else--
--				if nHour == 19 and nMin < 40 then
--					tinsert(tb_dialog, 1, "B�o danh/baobing_jingtoutiaozhanling");
--					Say("<color=green> Ch� l�i ��i<color>: Hi�n t�i l� th�i gian ��u gi� khi�u chi�n l�nh, ng��i mu�n tham gia?", getn(tb_dialog), tb_dialog);
--				elseif nHour == 19 or (nHour == 20 and nMin < 10) then
--					tinsert(tb_dialog, 1, "Ta mu�n ��u gi� khi�u chi�n l�nh/jingtou_tiaozhanling");
--					tinsert(tb_dialog, 2, "Mu�n xem t�nh h�nh ��u gi� khi�u chi�n l�nh c�a bang/view_tiaozhanling");
--					tinsert(tb_dialog, 3, "Mu�n xem t�nh h�nh ��u gi� khi�u chi�n l�nh c�a c�c bang kh�c/view_all_tiaozhanling");
--					Say("<color=green> Ch� l�i ��i<color>: Hi�n t�i l� th�i gian ��u gi�, h�y g�p r�t ��u gi�.!", getn(tb_dialog), tb_dialog);
--				else
--					local szGong,szShou = GetCityWarAD(CITY_ID_CD);
--					if szGong == "" then	--���û�й��Ƿ�
--						if SubWorldID2Idx(CITY_ID_CD) >= 0 then	--ֻ��Ŀ����е�ͼ�����ķ������Ϸ���Ϣ
--							if szShou ~= "" then
--								szShou = replace(szShou, "|" ,"-")
--								Say("<color=green> Ch� l�i ��i<color>: Do v�"..tSignUpCityName[CITY_ID_CD].." C�ng th�nh chi�n kh�ng c� phe c�ng"..tSignUpCityName[CITY_ID_CD].."Th�nh ti�p t�c do "..szShou.." bang h�i chi�m l�nh", 0);
--							else
--								Say("<color=green> Ch� l�i ��i<color>: Do v�"..tSignUpCityName[CITY_ID_CD].." C�ng th�nh chi�n kh�ng c� phe c�ng v� phe th�, v� v�y "..tSignUpCityName[CITY_ID_CD].." C�ng th�nh chi�n t�m d�ng 1 tr�n", 0);
--							end
--						end
--					else
--						szGong = replace(szGong, "|" ,"-")
--						Say("<color=green> Ch� l�i ��i<color>: Qua m�t k� ��u gi� n�y l�a, cu�i c�ng c�ng ch�n m�t bang h�i c� t� c�ch c�ng th�nh c�a tu�n n�y. <enter>Ta tr�nh tr�ng tuy�n b�, b�n c�ng th�nh c�a tu�n n�y l�: "..szGong.."<enter>Ch�c m�ng bang h�i �� th�nh c�ng trong tu�n n�y.", 0);
--					end
--				end
--			end
--		end
	else
		get_gongcheng_type();
	end
end

function kan_shuoming()
	Say("B�n d��i l� thuy�t minh L�i ��i C�ng th�nh chi�n.",
		5,
		"�i�u ki�n b�o danh/baoming_shuoming",
		"V�o l�i ��i/jinru_shuoming",
		"Th�i h�n L�i ��i/shixian_shuoming",
		"Quy t�c ph�n th�ng b�i L�i ��i/shengfu_shuoming",
		"R�i kh�i/no_say")
end

function baoming_shuoming()
	Say("Ch� c� bang ch� nh�n ch�c 7 ng�y tr� l�n, t� ��i �� 8 ng��i nh�p bang trong 7 ng�y tr� l�n v� ��i vi�n ph�i ��t c�p 80 tr� l�n m�i ���c b�o danh, ��ng th�i ph�i c� th� ti�n c� l�y � Th�nh �� Chu Thi�n Nh�n, tham kh�o th�i gian b�o danh trong Quy tr�nh L�i ��i.", 2, "tr� l�i/kan_shuoming", "R�i kh�i/no_say")
end

function jinru_shuoming()
	Say("Tham gia tr�n ��u ph�i do Bang ch�, ph� bang ch� ho�c Tr��ng l�o d�n d�t ��i, t�t c� th�nh vi�n b�n bang ph�i t� c�p 80 tr� l�n, v� ph�i nh�p bang t� 7 ng�y tr� l�n? (kh�ng h�n ch� m�t nh�m �� 8 ng��i v�o L�i ��i)", 2, "tr� l�i/kan_shuoming", "R�i kh�i/no_say")
end

function shixian_shuoming()
	Say("Th�i h�n L�i ��i ��n tr�n l� 7 ph�t, sau �� c� 3 ph�t ngh�. Trong 3 ph�t, ��i th�ng tr�n ph�i chu�n b� ti�p t�c v�o khu v�c, ��i m�i khi�u chi�n trong 3 ph�t ph�i v�o khu v�c, n�u kh�ng xem nh� t� b� quy�n l�i. T�t nhi�n s� c� h� th�ng th�ng b�o th�i gian v�o khu v�c.", 2, "tr� l�i/kan_shuoming", "R�i kh�i/no_say")
end

function shengfu_shuoming()
	Say("Quy t�c duy nh�t c�a L�i ��i l� khi to�n b� th�nh vi�n ti�u ��i b� ��nh b�i, L�i ��i bu�c ph�i k�t th�c. N�u trong th�i h�n kh�ng ph�n th�ng b�i, th�nh vi�n ��i n�o c�n l�i nhi�u h�n s� th�ng tr�n, s� th�nh vi�n c�n l�i c�a hai ��i t��ng ���ng th� ��i c� t�ng �i�m kinh nghi�m cao h�n s� th�ng, n�u �i�n kinh nghi�m c�ng t��ng ���ng th� s� ch�n ng�u nhi�n quy�t ��nh ��i n�o s� nh�n �u�c t� c�ch C�ng th�nh.", 2, "tr� l�i/kan_shuoming", "R�i kh�i/no_say")
end


function canjia_leitai()
	local nState = KMissionRecordRoom:GetState(CITY_SIGNUP_MAP_ID)
	if nState == NO_START then
		Say("Th�i gian L�i ��i b�o danh: 19:30 t�i th� s�u b�t ��u b�o danh\n19:30 tranh t� c�ch Th�nh �� C�ng th�nh L�i ��i.", 0)
		--\n20:13Ϊ��ȡȪ�޹����ʸ���̨\n21:03Ϊ��ȡ���������ʸ���̨",0)
	elseif nState == SIGNUP_TIME then
		local nMin = 0
		local nSec = 0
		nMin, nSec = KMissionRecordRoom:GetSignLeftTime(CITY_SIGNUP_MAP_ID)
		Say("B�y gi� l� th�i gian b�o danh C�ng th�nh L�i ��i, b�n mu�n tham gia?\rTh�i gian b�o danh c�n <color=yellow>"..nMin.." Ph�t "..nSec.." gi�y<color>", 3, "B�o danh/signup_yes", "Ki�m tra c�c ��i b�o danh/view_sign_team", "Ta ch� gh� ngang qua th�i./no_say")
	elseif nState == VIEW_TIME then
		Talk(1,"","�ang s�p x�p b�ng thi ��u ng�u nhi�n. Xin ��i trong gi�y l�t....")
	elseif nState == PREPARE_TIME then
		ViewFightState()
	elseif nState == FIGHT_TIME then
		local szInfo = KMissionRecordRoom:FightingInfo(CITY_SIGNUP_MAP_ID)
		if szInfo ~= "" then
			Talk(1,"","T�nh h�nh c�c tr�n ��u nh� sau\n"..szInfo)
		else
			Talk(1,"","L�i ��i chi�n kh�ng c� ��i t� th�")
		end
	end
end

function view_sign_team()
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szMsg = ""
	for index, value in tTeamName do
		if value ~= "" then
			if value == GetTongName() then
				szMsg = szMsg.."<color=green>"..value.."<color>\n"
			else
				szMsg = szMsg..value.."\n"
			end
		end
	end
	if szMsg == "" then
		Talk(1,"", "T�m th�i kh�ng c� ��i tham gia thi ��u.")
	else
		szMsg = replace(szMsg, "|" ,"-")
		Talk(1,"","Hi�n c� c�c ��i sau b�o danh tham gia thi ��u: \r"..szMsg)
	end
end

function ViewFightState()
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szTongName = GetTongName()
	local szMsg = ""
	local tTeamName1 = {}
	local tTeamName2 = {}
	for i=1, floor(MAX_TEAM_COUNT / 2) do
		tTeamName1[i] = tTeamName[i * 2 - 1]
		tTeamName1[i] = replace(tTeamName1[i], "|" ,"-")
		tTeamName2[i] = tTeamName[i * 2]
		tTeamName2[i] = replace(tTeamName2[i], "|" ,"-")
	end

	for i = 1, getn(tTeamName1) do	-- ����������
		if tTeamName1[i] == "" and tTeamName2[i] == "" then
			
		elseif tTeamName1[i] == "" or tTeamName2[i] == "" then
			if tTeamName1[i] == szTongName or tTeamName2[i] == szTongName then
				szMsg = szMsg.."<color=green>"..tTeamName1[i]..tTeamName2[i].."<color>Tr�n n�y b� b�\n"
			else
				szMsg = szMsg..tTeamName1[i]..tTeamName2[i].."Tr�n n�y b� b�\n"
			end
		else
			if tTeamName1[i] == szTongName or tTeamName2[i] == szTongName then
				szMsg = szMsg.."<color=green>"..tTeamName1[i].." as- "..tTeamName2[i].."<color>\n"
			else
				szMsg = szMsg..tTeamName1[i].." as- "..tTeamName2[i].."\n"
			end
		end
	end
	local nMin = 0
	local nSec = 0
	nMin, nSec = KMissionRecordRoom:GetPrepareLeftTime(CITY_SIGNUP_MAP_ID)
	szMsg = replace(szMsg, "|" ,"-")
	Say("G�y gi� l� th�i gian chu�n b� cho c�c ��i tham gia C�ng th�nh L�i ��i, m�i hai ��i tham gia thi ��u ti�n v�o L�i ��i, ��i kh�ng tham gia xin nh�p v�o quan s�t tr�n ��u �� v�o L�i ��i. Th�i gian chu�n b� c�n <color=green>"..nMin.." Ph�t "..nSec.."gi�y<color>\n<color=red>kh�ng c� ��i b� tr�n, qu� th�i gian chu�n b� v�n ch�a v�o thi ��u xem nh� b� cu�c<color>\n"..szMsg, 
		2, 
		"\nTi�n v�o L�i ��i/EnterFight", 
--		"��Ҫ��ս/EnterView", 
		"Ta ch� gh� ngang qua th�i./no_say")
end

function EnterView()
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szMsg = ""
	local tTeamName1 = {}
	local tTeamName2 = {}
	for i=1, floor(MAX_TEAM_COUNT / 2) do
		tTeamName1[i] = tTeamName[i * 2 - 1]
		tTeamName1[i] = replace(tTeamName1[i], "|" ,"-")
		tTeamName2[i] = tTeamName[i * 2]
		tTeamName2[i] = replace(tTeamName2[i], "|" ,"-")
	end
	
	local tSaytab = {}
	local nIndex = 1
	for i = 1, getn(tTeamName1) do	-- ����������
		if tTeamName1[i] == "" and tTeamName2[i] == "" then
			
		elseif tTeamName1[i] == "" or tTeamName2[i] == "" then
			tSaytab[nIndex] = tTeamName1[i]..tTeamName2[i].."Tr�n n�y b� b�/no_say"
			nIndex = nIndex + 1
		else
			tSaytab[nIndex] = tTeamName1[i].." as- "..tTeamName2[i].."/#EnterView_yes("..nIndex..")"
			nIndex = nIndex + 1
		end
	end
	tSaytab[nIndex] = "Kh�ng mu�n v�o quan chi�n/no_say"
	
	Say("T�nh h�nh 2 b�n tham chi�n hi�p sau nh� sau, m�i ch�n v�o xem thi ��u.", getn(tSaytab), tSaytab)
end

function EnterView_yes(nPlaceIdx)
	KMissionRecordRoom:AddViewer(nPlaceIdx, CAMP_VIEWER, CITY_SIGNUP_MAP_ID)
end

function EnterFight()
	if CanEnter() == 0 then
		return
	end
	
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szTongName = GetTongName()
	local nTeamIdx = GetIdxFromTeamInfo(tTeamName, szTongName)
	if nTeamIdx == 0 then
		Talk(1,"","��i b�n kh�ng c� t�n trong b�ng thi ��u l�n n�y, kh�ng ���c v�o.")
		return
	end
	-- ��ö�����Ϣ
	local szFightTeam = ""
	local nCamp = CAMP_FIGHT1
	if mod(nTeamIdx, 2) == 0 then	-- ż��
		szFightTeam = tTeamName[nTeamIdx - 1]
		szFightTeam = replace(szFightTeam, "|" ,"-")
		nCamp = CAMP_FIGHT2
	elseif nTeamIdx ~= getn(tTeamName) then	-- �ֿ�
		szFightTeam = tTeamName[nTeamIdx + 1]
		szFightTeam = replace(szFightTeam, "|" ,"-")
	end
	
	if szFightTeam == "" then
		Say("��i b�n tr�ng hi�p, tr�c ti�p v�o hi�p sau.", 0)
		return
	end
	-- ��������Ǹ�����
	local nPlaceIdx = ceil(nTeamIdx / 2)
	Say("��i th� c�a ng��i l� "..szFightTeam..", Mu�n v�o tr�n kh�ng??", 2, "V�o/enter_yes", "Ta �ang chu�n b�/no_say")
end

function enter_yes()
	if CanEnter() == 0 then
		return
	end
	
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szTongName = GetTongName()
	local nTeamIdx = GetIdxFromTeamInfo(tTeamName, szTongName)
	if nTeamIdx == 0 then
		return
	end
	-- ��ö�����Ϣ
	local szFightTeam = ""
	local nCamp = CAMP_FIGHT1
	if mod(nTeamIdx, 2) == 0 then	-- ż��
		szFightTeam = tTeamName[nTeamIdx - 1]
		szFightTeam = replace(szFightTeam, "|" ,"-")
		nCamp = CAMP_FIGHT2
	elseif nTeamIdx ~= getn(tTeamName) then	-- �ֿ�
		szFightTeam = tTeamName[nTeamIdx + 1]
		szFightTeam = replace(szFightTeam, "|" ,"-")
	end
	
	if szFightTeam == "" then
		return
	end
	-- ��������Ǹ�����
	local nPlaceIdx = ceil(nTeamIdx / 2)
	KMissionRecordRoom:AddTeamMember(nPlaceIdx, nCamp, CITY_SIGNUP_MAP_ID)
	
	local LogStr = "[siege_arena] enter="..szTongName.." tongs="
	for i, v in tTeamName do
		LogStr = LogStr..v.." "
	end
	WriteLog(LogStr)
end

function GetIdxFromTeamInfo(t, szName)
	for i=1, getn(t) do
		if szName == t[i] then
			return i
		end
	end
	return 0
end

function signup_yes()
	local nFreeSlot = KMissionRecordRoom:GetFreeSlot(CITY_SIGNUP_MAP_ID)
	if nFreeSlot == 0 then
		Say("L�i ��i �� ��y, l�n sau Bang ch� ph�i nhanh tay l�n m�i ���c",0)
		return
	end
	
	if CanSignup() == 1 then
		KMissionRecordRoom:AddTeam(GetTongName(), CITY_SIGNUP_MAP_ID)
	end
end

-- �Ƿ��ܱ���
function CanSignup()
	-- �����Ƿ���8��
	if gf_GetTeamSize() < 8 then
		Talk(1,"","Ph�i t� ��i v� s� th�nh vi�n l� 8 ng��i m�i ���c tham gia L�i ��i C�ng th�nh chi�n.")
		return 0
	end
	
	-- �Ƿ�ӳ�
	if gf_GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "", "Kh�ng c� ��i tr��ng kh�ng ���c b�o danh.")
		return 0
	end
	
	-- �Ƿ��Ѿ��μӹ�
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szTongName = GetTongName()
	local nTeamIdx = GetIdxFromTeamInfo(tTeamName, szTongName)
	if nTeamIdx > 0 then
		Talk(1,"","��i b�n �� b�o danh tr�n L�i ��i chi�n n�y r�i.")
		return 0
	end
	
	-- �Ƿ��ǰ���
	if IsTongMaster() == 0 then
		Talk(1,"","Ch� c� bang ch� l�m ��i tr��ng d�n ��i m�i ���c b�o danh tham gia L�i ��i chi�n.")
		return 0
	end
	
	-- �ǹ��ǻ����سǷ�����һ��
	for index, value in tFightCityName do
		local szAttack, szDefence = GetCityWarAD(index)
		if szTongName == szAttack then
			Talk(1,"","B�n �� l� ng��i c�a "..value.." (phe C�ng), kh�ng ���c b�o danh tham gia thi ��u.")
			return 0
		end
		
		if szTongName == szDefence then
			Talk(1,"","B�n �� l� ng��i c�a "..value.."(phe th�), kh�ng ���c b�o danh n�a.")
			return 0
		end
	end
	
	-- �Ƿ��ǰ���
	if IsTongMaster() == 0 then
		Talk(1,"","Ch� c� bang ch� l�m ��i tr��ng d�n ��i m�i ���c b�o danh tham gia L�i ��i chi�n.")
		return 0
	end
	
	-- ����������λ7������
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","B�n nh�n ch�c ch�a �� 7 ng�y, kh�ng ���c d�n ��i tham gia thi ��u")
		return 0
	end
	
	-- ����������Ƿ���������Ķ��Ҷ����7������
	local nOldPlayer = PlayerIndex
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i)
		if PlayerIndex > 0 then
			local szTong = GetTongName()
			local nJoinTime = GetJoinTongTime()
			if GetPlayerRoute() == 0 then
				TeamMsg(GetName().."V� m�n ph�i, kh�ng ���c tham gia thi ��u")
				return 0
			end
			
			if GetLevel() < 80 then
				TeamMsg(GetName().."Ch�a �� c�p 80, kh�ng ���c tham gia thi ��u")
				return 0
			end

			if szTong ~= szTongName then
				TeamMsg(GetName().."Kh�ng ph�i th�nh vi�n qu� bang, kh�ng ���c tham gia thi ��u")
				return 0
			end
			
			if nNow - nJoinTime < 604800 then
				TeamMsg(GetName().."Tham gia qu� bang ch�a �� 7 ng�y, kh�ng ���c tham gia thi ��u")
				return 0
			end
		end
	end
	
	-- �����Ƽ���
	PlayerIndex = nOldPlayer
	if DelItem(2,1,1200,1) ~= 1 then
		Talk(1,"","Mang theo th� ti�n c� r�i h�y ��n b�o danh tham gia thi ��u")
		return 0
	end
	return 1
end

function CanEnter()	
	-- �Ƿ�ӳ�
	if gf_GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "", "Ch� c� ��i tr��ng m�i ���c d�t ��i v�o L�i ��i thi ��u.")
		return 0
	end
	
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szTongName = GetTongName()
	local nTeamIdx = GetIdxFromTeamInfo(tTeamName, szTongName)
	if nTeamIdx == 0 then
		Talk(1,"","��i b�n kh�ng c� t�n trong b�ng thi ��u l�n n�y, kh�ng ���c v�o.")
		return 0
	end
	
	-- �ж���̨��������Ƿ��Ѿ�����
	local nTeamSize = gf_GetTeamSize()
	local nPlaceIdx = ceil(nTeamIdx / 2)
	local nCamp = CAMP_FIGHT1
	if mod(nTeamIdx, 2) == 0 then	-- ż��
		nCamp = CAMP_FIGHT2
	end
	local nJoinCount = KMissionRecordRoom:GetMemberCount(nPlaceIdx, nCamp, CITY_SIGNUP_MAP_ID)
	if nJoinCount == -1 then
		return 0
	end
	if nTeamSize + nJoinCount > 8 then
		Talk(1,"","Qu� bang �� c� <color=yellow>"..nJoinCount.." <color> ��i vi�n trong L�i ��i r�i, s� th�nh vi�n ��i b�n hi�n l� <color=yellow>"..nTeamSize.."ng��i<color>, L�i ��i C�ng th�nh chi�n cho ph�p nhi�u nh�t <color=yellow>8 ng��i<color> v�o.")
		return 0
	end
	
	-- �Ƿ��ǰ���
	if not (IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() == 3) then
		Talk(1,"","Ch� c� bang ch�, ph� bang ch� ho�c tr��ng l�o d�t ��i m�i ���c tham gia L�i ��i chi�n.")
		return 0
	end
	
	-- ����������λ7������
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","B�n nh�n ch�c ch�a �� 7 ng�y, kh�ng ���c d�n ��i tham gia thi ��u")
		return 0
	end
	
	-- ����������Ƿ���������Ķ��Ҷ����7������
	local nOldPlayer = PlayerIndex
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i)
		if PlayerIndex > 0 then
			local szTong = GetTongName()
			local nJoinTime = GetJoinTongTime()
			if GetPlayerRoute() == 0 then
				TeamMsg(GetName().."V� m�n ph�i, kh�ng ���c tham gia thi ��u")
				return 0
			end
			
			if GetLevel() < 80 then
				TeamMsg(GetName().."Ch�a �� c�p 80, kh�ng ���c tham gia thi ��u")
				return 0
			end
				
			if szTong ~= szTongName then
				TeamMsg(GetName().."Kh�ng ph�i th�nh vi�n qu� bang, kh�ng ���c tham gia thi ��u")
				return 0
			end
			
			if nNow - nJoinTime < 604800 then
				TeamMsg(GetName().."Tham gia qu� bang ch�a �� 7 ng�y, kh�ng ���c tham gia thi ��u")
				return 0
			end
		end
	end
	PlayerIndex = nOldPlayer
end

function tongcitywar_setpstate(nCamp, nFlag)
	SetLogoutRV(1 - nFlag)		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
	SetDeathPunish(nFlag)		--�������ͷ�
	SetCreateTeam(1 - nFlag)	--�ر���ӹ���
	ForbitTrade(1 - nFlag)		--��������
	SetFightState(0)			--����̨����̨���Ƿ�ս��״̬
	InteractiveEnable(nFlag)	--�������أ�0�رգ�1��
	StallEnable(nFlag)			--��̯����
	
	if nFlag == 1 then			-- ������ʱ��Ҫ�ȿ��Ըı�PK״̬,����SetPKFlag��Ч
		ForbidChangePK(0)
	end
	
	if nFlag == 0 then
		--�жϽ�ɫ�����Ƿ��ܹ�ʹ���书
		if GetUseSkillEnable() == 0 then
			SetTask(SKILLENABLE, 1)
		elseif GetUseSkillEnable() == 1 then
			SetTask(SKILLENABLE, 0)
		end
	end
	
	if nCamp == 1 or nCamp == 2 then
		SetPKFlag(1, nCamp)
		-- ɱ��ֵ����
		SetMomentum(0)
	else
		DesaltPlayer(1 - nFlag)
		SetPKFlag(0, 0)
		if nFlag == 0 then			-- �����ʱ��
			UseSkillEnable(0)
		elseif nFlag == 1 then		-- ������ʱ��
			if GetTask(SKILLENABLE) == 0 then
				UseSkillEnable(1)--  (1����ʹ���书��0��ֹʹ���书)
			elseif GetTask(SKILLENABLE) == 1 then
				UseSkillEnable(0)--  (1����ʹ���书��0��ֹʹ���书)
				SetTask(SKILLENABLE, 0)
			end
		end
	end
	ForbidChangePK(1 - nFlag)
end

function InitMission()
	-- Mission��Open��ʱ���Ѿ���ʼ������,����Ϊ��
end

function RunMission()
end

function EndMission()
	if SubWorldIdx2ID(SubWorld) == CITY_SIGNUP_MAP_ID then
		KMissionRecordRoom:UnInit()
	else
		KMissionArenaRoom:UnInit()
	end
end

function OnLeave(RoleIndex)
	-- ֱ�Ӷ�Player���д����OK��,����Mission����û�е���Player����Ϣ
	-- ����3��Mission����һ��OnLeaveû������
	PlayerIndex = RoleIndex;
	tongcitywar_setpstate(0, 1)	-- �����뿪�����?Ӧ��ûӰ��
    NewWorld(tLeavePos[1], tLeavePos[2], tLeavePos[3])
end

function OnTimer()
	if SubWorldIdx2ID(SubWorld) == CITY_SIGNUP_MAP_ID then
		KMissionRecordRoom:OnTimer()
	else
		KMissionArenaRoom:OnTimer()
	end
end

function no_say()

end

-- Team��Ϣ
function TeamMsg(szMsg)
	local nOldPlayer = PlayerIndex
	for i=1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i)
		if PlayerIndex > 0 then
			Msg2Player(szMsg)
		end
	end
end

function get_gongcheng_type()
	ApplyRelayShareData("gongchengtype",0,0,"\\script\\missions\\bw\\siege\\siege_arena_mission.lua","get_type");
end

function get_type(szKey, nKey1, nKey2, nCount)
	local nType = 1;
	if nCount ~= 0 then
		nType = GetRelayShareDataByKey(szKey, nKey1, nKey2, "type");
		DelRelayShareDataCopy(szKey,nKey1,nKey2);
	end
	if nType == 0 then
		nType = 1;
	end
	SetGlbValue(CITY_GLB_VALUE_TYPE, nType);
	local szMethod = tSignMethod[nType];
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
--	if nDay ~= 5 then
--		Say("<color=green>Ch� l�i ��i<color>: Lo�i h�nh tranh �o�t t� c�ch c�ng th�nh tu�n n�y l� "..szMethod..", th� 6 h�y quay l�i ��y tham gia.",0);
--	else
		szMethod = tSignMethod[nType];
		local tb_dialog = {
			"R�i kh�i/no_say",
		};
		--if nHour < 19 or (nHour == 19 and nMin < 30) then
		--	Say("<color=green> Ch� l�i ��i<color>: �� c� t� c�ch c�ng th�nh v�o tu�n n�y, qu� bang ph�i tham gia <color=green>"..szMethod.."<color>. Xin m�i qu� bang h�i mau mau chu�n b�.!",0);
		--	return 0;
		--end
		if nType == 1 then--����ս��̨
			tinsert(tb_dialog, 1, "Tham gia L�i ��i C�ng th�nh chi�n/canjia_leitai");
			tinsert(tb_dialog, 2, "T�m thuy�t minh L�i ��i C�ng th�nh chi�n/kan_shuoming");
			Say("L�i ��i C�ng th�nh chi�n l� tr�n ��u gi�nh t� c�ch C�ng th�nh chi�n gi�a c�c bang h�i.", getn(tb_dialog), tb_dialog);
		else--
			if nHour == 19 and nMin < 40 then
				tinsert(tb_dialog, 1, "B�o danh/baobing_jingtoutiaozhanling");
				Say("<color=green> Ch� l�i ��i<color>: Hi�n t�i l� th�i gian ��u gi� khi�u chi�n l�nh, ng��i mu�n tham gia?", getn(tb_dialog), tb_dialog);
			elseif nHour == 19 or (nHour == 20 and nMin < 10) then
				tinsert(tb_dialog, 1, "Ta mu�n ��u gi� khi�u chi�n l�nh/jingtou_tiaozhanling");
				tinsert(tb_dialog, 2, "Mu�n xem t�nh h�nh ��u gi� khi�u chi�n l�nh/view_tiaozhanling");
				Say("<color=green> Ch� l�i ��i<color>: Hi�n t�i l� th�i gian ��u gi�, h�y g�p r�t ��u gi�.!", getn(tb_dialog), tb_dialog);
			else
				local szGong,szShou = GetCityWarAD(CITY_ID_CD);
				if szGong == "" then	--���û�й��Ƿ�
					if SubWorldID2Idx(CITY_ID_CD) >= 0 then	--ֻ��Ŀ����е�ͼ�����ķ������Ϸ���Ϣ
						if szShou ~= "" then
							Say("<color=green> Ch� l�i ��i<color>: Do v�"..tSignUpCityName[CITY_ID_CD].." C�ng th�nh chi�n kh�ng c� phe c�ng"..tSignUpCityName[CITY_ID_CD].."Th�nh ti�p t�c do "..szShou.." bang h�i chi�m l�nh", 0);
						else
							Say("<color=green> Ch� l�i ��i<color>: Do v�"..tSignUpCityName[CITY_ID_CD].." C�ng th�nh chi�n kh�ng c� phe c�ng v� phe th�, v� v�y "..tSignUpCityName[CITY_ID_CD].." C�ng th�nh chi�n t�m d�ng 1 tr�n", 0);
						end
					end
				else
					Say("<color=green> Ch� l�i ��i<color>: Qua m�t k� ��u gi� n�y l�a, cu�i c�ng c�ng ch�n m�t bang h�i c� t� c�ch c�ng th�nh c�a tu�n n�y. <enter>Ta tr�nh tr�ng tuy�n b�, b�n c�ng th�nh c�a tu�n n�y l�: "..szGong.."<enter>Ch�c m�ng bang h�i �� th�nh c�ng trong tu�n n�y.", 0);
				end
			end
		end
	--end
end