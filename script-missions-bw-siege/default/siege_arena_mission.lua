
-- Creator : lizhi
-- ¹¥³ÇÕ½±¨Ãû	2007-3-29 10:43

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
--			Say("<color=green>Chñ l«i ®µi<color>: Lo¹i h×nh tranh ®o¹t t­ c¸ch c«ng thµnh tuÇn nµy lµ "..szMethod..", thø 6 h·y quay l¹i ®©y tham gia.",0);
--		else
			local tb_dialog = {
				"Rêi khái/no_say",
			};
			--if nHour < 19 or (nHour == 19 and nMin < 30) then
			--	Say("<color=green> Chñ l«i ®µi<color>: §Ó cã t­ c¸ch c«ng thµnh vµo tuÇn nµy, quý bang ph¶i tham gia <color=green>"..szMethod.."<color>. Xin mêi quý bang héi mau mau chuÈn bÞ.!",0);
			--	return 0;
			--end			
			tinsert(tb_dialog, 1, "Tham gia L«i ®µi C«ng thµnh chiÕn/canjia_leitai");
			tinsert(tb_dialog, 2, "T×m thuyÕt minh L«i ®µi C«ng thµnh chiÕn/kan_shuoming");
			Say("L«i ®µi C«ng thµnh chiÕn lµ trËn ®Êu giµnh t­ c¸ch C«ng thµnh chiÕn gi÷a c¸c bang héi.", getn(tb_dialog), tb_dialog);			
			
--			if nType == 1 then--¹¥³ÇÕ½ÀÞÌ¨
--				tinsert(tb_dialog, 1, "Tham gia L«i ®µi C«ng thµnh chiÕn/canjia_leitai");
--				tinsert(tb_dialog, 2, "T×m thuyÕt minh L«i ®µi C«ng thµnh chiÕn/kan_shuoming");
--				Say("L«i ®µi C«ng thµnh chiÕn lµ trËn ®Êu giµnh t­ c¸ch C«ng thµnh chiÕn gi÷a c¸c bang héi.", getn(tb_dialog), tb_dialog);
--			else--
--				if nHour == 19 and nMin < 40 then
--					tinsert(tb_dialog, 1, "B¸o danh/baobing_jingtoutiaozhanling");
--					Say("<color=green> Chñ l«i ®µi<color>: HiÖn t¹i lµ thêi gian ®Êu gi¸ khiªu chiÕn lÖnh, ng­¬i muèn tham gia?", getn(tb_dialog), tb_dialog);
--				elseif nHour == 19 or (nHour == 20 and nMin < 10) then
--					tinsert(tb_dialog, 1, "Ta muèn ®Êu gi¸ khiªu chiÕn lÖnh/jingtou_tiaozhanling");
--					tinsert(tb_dialog, 2, "Muèn xem t×nh h×nh ®Êu gi¸ khiªu chiÕn lÖnh cña bang/view_tiaozhanling");
--					tinsert(tb_dialog, 3, "Muèn xem t×nh h×nh ®Êu gi¸ khiªu chiÕn lÖnh cña c¸c bang kh¸c/view_all_tiaozhanling");
--					Say("<color=green> Chñ l«i ®µi<color>: HiÖn t¹i lµ thêi gian ®Êu gi¸, h·y gÊp rót ®Êu gi¸.!", getn(tb_dialog), tb_dialog);
--				else
--					local szGong,szShou = GetCityWarAD(CITY_ID_CD);
--					if szGong == "" then	--Èç¹ûÃ»ÓÐ¹¥³Ç·½
--						if SubWorldID2Idx(CITY_ID_CD) >= 0 then	--Ö»ÔÚÄ¿±ê³ÇÊÐµØÍ¼Ëù´¦µÄ·þÎñÆ÷ÉÏ·¢ÏûÏ¢
--							if szShou ~= "" then
--								szShou = replace(szShou, "|" ,"-")
--								Say("<color=green> Chñ l«i ®µi<color>: Do v×"..tSignUpCityName[CITY_ID_CD].." C«ng thµnh chiÕn kh«ng cã phe c«ng"..tSignUpCityName[CITY_ID_CD].."Thµnh tiÕp tôc do "..szShou.." bang héi chiÕm lÜnh", 0);
--							else
--								Say("<color=green> Chñ l«i ®µi<color>: Do v×"..tSignUpCityName[CITY_ID_CD].." C«ng thµnh chiÕn kh«ng cã phe c«ng vµ phe thñ, v× vËy "..tSignUpCityName[CITY_ID_CD].." C«ng thµnh chiÕn t¹m dõng 1 trËn", 0);
--							end
--						end
--					else
--						szGong = replace(szGong, "|" ,"-")
--						Say("<color=green> Chñ l«i ®µi<color>: Qua mét kú ®Êu gi¸ n¶y löa, cuèi cïng còng chän mét bang héi cã t­ c¸ch c«ng thµnh cña tuÇn nµy. <enter>Ta trÞnh träng tuyªn bè, bªn c«ng thµnh cña tuÇn nµy lµ: "..szGong.."<enter>Chóc mõng bang héi ®· thµnh c«ng trong tuÇn nµy.", 0);
--					end
--				end
--			end
--		end
	else
		get_gongcheng_type();
	end
end

function kan_shuoming()
	Say("Bªn d­íi lµ thuyÕt minh L«i ®µi C«ng thµnh chiÕn.",
		5,
		"§iÒu kiÖn b¸o danh/baoming_shuoming",
		"Vµo l«i ®µi/jinru_shuoming",
		"Thêi h¹n L«i ®µi/shixian_shuoming",
		"Quy t¾c ph©n th¾ng b¹i L«i ®µi/shengfu_shuoming",
		"Rêi khái/no_say")
end

function baoming_shuoming()
	Say("ChØ cã bang chñ nhËn chøc 7 ngµy trë lªn, tæ ®éi ®ñ 8 ng­êi nhËp bang trong 7 ngµy trë lªn vµ ®éi viªn ph¶i ®¹t cÊp 80 trë lªn míi ®­îc b¸o danh, ®ång thêi ph¶i cã th­ tiÕn cö lÊy ë Thµnh §« Chu ThiÖn Nh©n, tham kh¶o thêi gian b¸o danh trong Quy tr×nh L«i §µi.", 2, "trë l¹i/kan_shuoming", "Rêi khái/no_say")
end

function jinru_shuoming()
	Say("Tham gia trËn ®Êu ph¶i do Bang chñ, phã bang chñ hoÆc Tr­ëng l·o dÉn d¾t ®éi, tÊt c¶ thµnh viªn bæn bang ph¶i tõ cÊp 80 trë lªn, vµ ph¶i nhËp bang tõ 7 ngµy trë lªn? (kh«ng h¹n chÕ mét nhãm ®ñ 8 ng­êi vµo L«i ®µi)", 2, "trë l¹i/kan_shuoming", "Rêi khái/no_say")
end

function shixian_shuoming()
	Say("Thêi h¹n L«i ®µi ®¬n trËn lµ 7 phót, sau ®ã cã 3 phót nghØ. Trong 3 phót, ®éi th¾ng trËn ph¶i chuÈn bÞ tiÕp tôc vµo khu vùc, ®éi míi khiªu chiÕn trong 3 phót ph¶i vµo khu vùc, nÕu kh«ng xem nh­ tõ bá quyÒn lîi. TÊt nhiªn sÏ cã hÖ thèng th«ng b¸o thêi gian vµo khu vùc.", 2, "trë l¹i/kan_shuoming", "Rêi khái/no_say")
end

function shengfu_shuoming()
	Say("Quy t¾c duy nhÊt cña L«i ®µi lµ khi toµn bé thµnh viªn tiÒu ®éi bÞ ®¸nh b¹i, L«i ®µi buéc ph¶i kÕt thóc. NÕu trong thêi h¹n kh«ng ph©n th¾ng b¹i, thµnh viªn ®éi nµo cßn l¹i nhiÒu h¬n sÏ th¾ng trËn, sè thµnh viªn cßn l¹i cña hai ®éi t­¬ng ®­¬ng th× ®éi cã tæng ®iÓm kinh nghiÖm cao h¬n sÏ th¾ng, nÕu ®iÓn kinh nghiÖm còng t­¬ng ®­¬ng th× sÏ chän ngÉu nhiªn quyÕt ®Þnh ®éi nµo sÏ nhËn ®uîc t­ c¸ch C«ng thµnh.", 2, "trë l¹i/kan_shuoming", "Rêi khái/no_say")
end


function canjia_leitai()
	local nState = KMissionRecordRoom:GetState(CITY_SIGNUP_MAP_ID)
	if nState == NO_START then
		Say("Thêi gian L«i ®µi b¸o danh: 19:30 tèi thø s¸u b¾t ®Çu b¸o danh\n19:30 tranh t­ c¸ch Thµnh §« C«ng thµnh L«i ®µi.", 0)
		--\n20:13Îª¶áÈ¡ÈªÖÞ¹¥³Ç×Ê¸ñÀÞÌ¨\n21:03Îª¶áÈ¡ÏåÑô¹¥³Ç×Ê¸ñÀÞÌ¨",0)
	elseif nState == SIGNUP_TIME then
		local nMin = 0
		local nSec = 0
		nMin, nSec = KMissionRecordRoom:GetSignLeftTime(CITY_SIGNUP_MAP_ID)
		Say("B©y giê lµ thêi gian b¸o danh C«ng thµnh L«i ®µi, b¹n muèn tham gia?\rThêi gian b¸o danh cßn <color=yellow>"..nMin.." Phót "..nSec.." gi©y<color>", 3, "B¸o danh/signup_yes", "KiÓm tra c¸c ®éi b¸o danh/view_sign_team", "Ta chØ ghÐ ngang qua th«i./no_say")
	elseif nState == VIEW_TIME then
		Talk(1,"","§ang s¾p xÕp b¶ng thi ®Êu ngÉu nhiªn. Xin ®îi trong gi©y l¸t....")
	elseif nState == PREPARE_TIME then
		ViewFightState()
	elseif nState == FIGHT_TIME then
		local szInfo = KMissionRecordRoom:FightingInfo(CITY_SIGNUP_MAP_ID)
		if szInfo ~= "" then
			Talk(1,"","T×nh h×nh c¸c trËn ®Êu nh­ sau\n"..szInfo)
		else
			Talk(1,"","L«i ®µi chiÕn kh«ng cã ®éi tû thÝ")
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
		Talk(1,"", "T¹m thêi kh«ng cã ®éi tham gia thi ®Êu.")
	else
		szMsg = replace(szMsg, "|" ,"-")
		Talk(1,"","HiÖn cã c¸c ®éi sau b¸o danh tham gia thi ®Êu: \r"..szMsg)
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

	for i = 1, getn(tTeamName1) do	-- Ðû¸æ¶ÔÕóÇé¿ö
		if tTeamName1[i] == "" and tTeamName2[i] == "" then
			
		elseif tTeamName1[i] == "" or tTeamName2[i] == "" then
			if tTeamName1[i] == szTongName or tTeamName2[i] == szTongName then
				szMsg = szMsg.."<color=green>"..tTeamName1[i]..tTeamName2[i].."<color>TrËn nµy bÞ bá\n"
			else
				szMsg = szMsg..tTeamName1[i]..tTeamName2[i].."TrËn nµy bÞ bá\n"
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
	Say("G©y giê lµ thêi gian chuÈn bÞ cho c¸c ®éi tham gia C«ng thµnh L«i ®µi, mêi hai ®éi tham gia thi ®Êu tiÕn vµo L«i ®µi, ®éi kh«ng tham gia xin nhÊp vµo quan s¸t trËn ®Êu ®Ó vµo L«i ®µi. Thêi gian chuÈn bÞ cßn <color=green>"..nMin.." Phót "..nSec.."gi©y<color>\n<color=red>kh«ng cã ®éi bá trËn, qu¸ thêi gian chuÈn bÞ vÉn ch­a vµo thi ®Êu xem nh­ bá cuéc<color>\n"..szMsg, 
		2, 
		"\nTiÕn vµo L«i ®µi/EnterFight", 
--		"ÎÒÒª¹ÛÕ½/EnterView", 
		"Ta chØ ghÐ ngang qua th«i./no_say")
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
	for i = 1, getn(tTeamName1) do	-- Ðû¸æ¶ÔÕóÇé¿ö
		if tTeamName1[i] == "" and tTeamName2[i] == "" then
			
		elseif tTeamName1[i] == "" or tTeamName2[i] == "" then
			tSaytab[nIndex] = tTeamName1[i]..tTeamName2[i].."TrËn nµy bÞ bá/no_say"
			nIndex = nIndex + 1
		else
			tSaytab[nIndex] = tTeamName1[i].." as- "..tTeamName2[i].."/#EnterView_yes("..nIndex..")"
			nIndex = nIndex + 1
		end
	end
	tSaytab[nIndex] = "Kh«ng muèn vµo quan chiÕn/no_say"
	
	Say("T×nh h×nh 2 bªn tham chiÕn hiÖp sau nh­ sau, mêi chän vµo xem thi ®Êu.", getn(tSaytab), tSaytab)
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
		Talk(1,"","§éi b¹n kh«ng cã tªn trong b¶ng thi ®Êu lÇn nµy, kh«ng ®­îc vµo.")
		return
	end
	-- »ñµÃ¶ÔÊÖÐÅÏ¢
	local szFightTeam = ""
	local nCamp = CAMP_FIGHT1
	if mod(nTeamIdx, 2) == 0 then	-- Å¼Êý
		szFightTeam = tTeamName[nTeamIdx - 1]
		szFightTeam = replace(szFightTeam, "|" ,"-")
		nCamp = CAMP_FIGHT2
	elseif nTeamIdx ~= getn(tTeamName) then	-- ÂÖ¿Õ
		szFightTeam = tTeamName[nTeamIdx + 1]
		szFightTeam = replace(szFightTeam, "|" ,"-")
	end
	
	if szFightTeam == "" then
		Say("§éi b¹n trèng hiÖp, trùc tiÕp vµo hiÖp sau.", 0)
		return
	end
	-- ¼ÆËã½øÈëÄÇ¸ö³¡µØ
	local nPlaceIdx = ceil(nTeamIdx / 2)
	Say("§èi thñ cña ng­¬i lµ "..szFightTeam..", Muèn vµo trËn kh«ng??", 2, "Vµo/enter_yes", "Ta ®ang chuÈn bÞ/no_say")
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
	-- »ñµÃ¶ÔÊÖÐÅÏ¢
	local szFightTeam = ""
	local nCamp = CAMP_FIGHT1
	if mod(nTeamIdx, 2) == 0 then	-- Å¼Êý
		szFightTeam = tTeamName[nTeamIdx - 1]
		szFightTeam = replace(szFightTeam, "|" ,"-")
		nCamp = CAMP_FIGHT2
	elseif nTeamIdx ~= getn(tTeamName) then	-- ÂÖ¿Õ
		szFightTeam = tTeamName[nTeamIdx + 1]
		szFightTeam = replace(szFightTeam, "|" ,"-")
	end
	
	if szFightTeam == "" then
		return
	end
	-- ¼ÆËã½øÈëÄÇ¸ö³¡µØ
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
		Say("L«i ®µi ®· ®Çy, lÇn sau Bang chñ ph¶i nhanh tay lªn míi ®­îc",0)
		return
	end
	
	if CanSignup() == 1 then
		KMissionRecordRoom:AddTeam(GetTongName(), CITY_SIGNUP_MAP_ID)
	end
end

-- ÊÇ·ñÄÜ±¨Ãû
function CanSignup()
	-- ¶ÓÎéÊÇ·ñÂú8ÈË
	if gf_GetTeamSize() < 8 then
		Talk(1,"","Ph¶i tæ ®éi vµ sè thµnh viªn lµ 8 ng­êi míi ®­îc tham gia L«i ®µi C«ng thµnh chiÕn.")
		return 0
	end
	
	-- ÊÇ·ñ¶Ó³¤
	if gf_GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "", "Kh«ng cã ®éi tr­ëng kh«ng ®­îc b¸o danh.")
		return 0
	end
	
	-- ÊÇ·ñÒÑ¾­²Î¼Ó¹ý
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szTongName = GetTongName()
	local nTeamIdx = GetIdxFromTeamInfo(tTeamName, szTongName)
	if nTeamIdx > 0 then
		Talk(1,"","§éi b¹n ®· b¸o danh trËn L«i ®µi chiÕn nµy råi.")
		return 0
	end
	
	-- ÊÇ·ñÊÇ°ïÖ÷
	if IsTongMaster() == 0 then
		Talk(1,"","ChØ cã bang chñ lµm ®éi tr­ëng dÉn ®éi míi ®­îc b¸o danh tham gia L«i ®µi chiÕn.")
		return 0
	end
	
	-- ÊÇ¹¥³Ç»òÕßÊØ³Ç·½ÈÎÒâÒ»·½
	for index, value in tFightCityName do
		local szAttack, szDefence = GetCityWarAD(index)
		if szTongName == szAttack then
			Talk(1,"","B¹n ®· lµ ng­êi cña "..value.." (phe C«ng), kh«ng ®­îc b¸o danh tham gia thi ®Êu.")
			return 0
		end
		
		if szTongName == szDefence then
			Talk(1,"","B¹n ®· lµ ng­êi cña "..value.."(phe thñ), kh«ng ®­îc b¸o danh n÷a.")
			return 0
		end
	end
	
	-- ÊÇ·ñÊÇ°ïÖ÷
	if IsTongMaster() == 0 then
		Talk(1,"","ChØ cã bang chñ lµm ®éi tr­ëng dÉn ®éi míi ®­îc b¸o danh tham gia L«i ®µi chiÕn.")
		return 0
	end
	
	-- °ïÖ÷±ØÐëÔÚÎ»7ÌìÒÔÉÏ
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","B¹n nhËn chøc ch­a ®ñ 7 ngµy, kh«ng ®­îc dÉn ®éi tham gia thi ®Êu")
		return 0
	end
	
	-- ¶ÓÎéÀïµÄÈËÊÇ·ñ¶¼ÊÇÕâ¸ö°ï»áµÄ¶øÇÒ¶¼Èë°ï7ÌìÒÔÉÏ
	local nOldPlayer = PlayerIndex
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i)
		if PlayerIndex > 0 then
			local szTong = GetTongName()
			local nJoinTime = GetJoinTongTime()
			if GetPlayerRoute() == 0 then
				TeamMsg(GetName().."V« m«n ph¸i, kh«ng ®­îc tham gia thi ®Êu")
				return 0
			end
			
			if GetLevel() < 80 then
				TeamMsg(GetName().."Ch­a ®ñ cÊp 80, kh«ng ®­îc tham gia thi ®Êu")
				return 0
			end

			if szTong ~= szTongName then
				TeamMsg(GetName().."Kh«ng ph¶i thµnh viªn quý bang, kh«ng ®­îc tham gia thi ®Êu")
				return 0
			end
			
			if nNow - nJoinTime < 604800 then
				TeamMsg(GetName().."Tham gia quý bang ch­a ®ñ 7 ngµy, kh«ng ®­îc tham gia thi ®Êu")
				return 0
			end
		end
	end
	
	-- ´øÓÐÍÆ¼öÐÅ
	PlayerIndex = nOldPlayer
	if DelItem(2,1,1200,1) ~= 1 then
		Talk(1,"","Mang theo th­ tiÕn cö råi h·y ®Õn b¸o danh tham gia thi ®Êu")
		return 0
	end
	return 1
end

function CanEnter()	
	-- ÊÇ·ñ¶Ó³¤
	if gf_GetTeamMember(0) ~= PlayerIndex then
		Talk(1, "", "ChØ cã ®éi tr­ëng míi ®­îc d¾t ®éi vµo L«i ®µi thi ®Êu.")
		return 0
	end
	
	local tTeamName = KMissionRecordRoom:GetTeamInfo(CITY_SIGNUP_MAP_ID)
	local szTongName = GetTongName()
	local nTeamIdx = GetIdxFromTeamInfo(tTeamName, szTongName)
	if nTeamIdx == 0 then
		Talk(1,"","§éi b¹n kh«ng cã tªn trong b¶ng thi ®Êu lÇn nµy, kh«ng ®­îc vµo.")
		return 0
	end
	
	-- ÅÐ¶ÏÀÞÌ¨ÀïÃæµÄÈËÊÇ·ñÒÑ¾­ÂúÁË
	local nTeamSize = gf_GetTeamSize()
	local nPlaceIdx = ceil(nTeamIdx / 2)
	local nCamp = CAMP_FIGHT1
	if mod(nTeamIdx, 2) == 0 then	-- Å¼Êý
		nCamp = CAMP_FIGHT2
	end
	local nJoinCount = KMissionRecordRoom:GetMemberCount(nPlaceIdx, nCamp, CITY_SIGNUP_MAP_ID)
	if nJoinCount == -1 then
		return 0
	end
	if nTeamSize + nJoinCount > 8 then
		Talk(1,"","Quý bang ®· cã <color=yellow>"..nJoinCount.." <color> ®éi viªn trong L«i ®µi råi, sè thµnh viªn ®éi b¹n hiÖn lµ <color=yellow>"..nTeamSize.."ng­êi<color>, L«i ®µi C«ng thµnh chiÕn cho phÐp nhiÒu nhÊt <color=yellow>8 ng­êi<color> vµo.")
		return 0
	end
	
	-- ÊÇ·ñÊÇ°ïÖ÷
	if not (IsTongMember() == 1 or IsTongMember() == 2 or IsTongMember() == 3) then
		Talk(1,"","ChØ cã bang chñ, phã bang chñ hoÆc tr­ëng l·o d¾t ®éi míi ®­îc tham gia L«i ®µi chiÕn.")
		return 0
	end
	
	-- °ïÖ÷±ØÐëÔÚÎ»7ÌìÒÔÉÏ
	local nLastAssignTime = GetLastAssignTime()
	local nNow = GetTime()
	if nNow - nLastAssignTime < 604800 then
		Talk(1,"","B¹n nhËn chøc ch­a ®ñ 7 ngµy, kh«ng ®­îc dÉn ®éi tham gia thi ®Êu")
		return 0
	end
	
	-- ¶ÓÎéÀïµÄÈËÊÇ·ñ¶¼ÊÇÕâ¸ö°ï»áµÄ¶øÇÒ¶¼Èë°ï7ÌìÒÔÉÏ
	local nOldPlayer = PlayerIndex
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i)
		if PlayerIndex > 0 then
			local szTong = GetTongName()
			local nJoinTime = GetJoinTongTime()
			if GetPlayerRoute() == 0 then
				TeamMsg(GetName().."V« m«n ph¸i, kh«ng ®­îc tham gia thi ®Êu")
				return 0
			end
			
			if GetLevel() < 80 then
				TeamMsg(GetName().."Ch­a ®ñ cÊp 80, kh«ng ®­îc tham gia thi ®Êu")
				return 0
			end
				
			if szTong ~= szTongName then
				TeamMsg(GetName().."Kh«ng ph¶i thµnh viªn quý bang, kh«ng ®­îc tham gia thi ®Êu")
				return 0
			end
			
			if nNow - nJoinTime < 604800 then
				TeamMsg(GetName().."Tham gia quý bang ch­a ®ñ 7 ngµy, kh«ng ®­îc tham gia thi ®Êu")
				return 0
			end
		end
	end
	PlayerIndex = nOldPlayer
end

function tongcitywar_setpstate(nCamp, nFlag)
	SetLogoutRV(1 - nFlag)		--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊÐÖØÉúµã£¬·ÇÍË³öµã)
	SetDeathPunish(nFlag)		--ÎÞËÀÍö³Í·£
	SetCreateTeam(1 - nFlag)	--¹Ø±Õ×é¶Ó¹¦ÄÜ
	ForbitTrade(1 - nFlag)		--²»ÔÊÐí½»Ò×
	SetFightState(0)			--³öÀÞÌ¨½øÀÞÌ¨¶¼ÊÇ·ÇÕ½¶·×´Ì¬
	InteractiveEnable(nFlag)	--½»»¥¿ª¹Ø£¬0¹Ø±Õ£¬1´ò¿ª
	StallEnable(nFlag)			--°ÚÌ¯¿ª¹Ø
	
	if nFlag == 1 then			-- ³öÀ´µÄÊ±ºòÒªÏÈ¿ÉÒÔ¸Ä±äPK×´Ì¬,·ñÔòSetPKFlagÎÞÐ§
		ForbidChangePK(0)
	end
	
	if nFlag == 0 then
		--ÅÐ¶Ï½ÇÉ«±¾ÉíÊÇ·ñÄÜ¹»Ê¹ÓÃÎä¹¦
		if GetUseSkillEnable() == 0 then
			SetTask(SKILLENABLE, 1)
		elseif GetUseSkillEnable() == 1 then
			SetTask(SKILLENABLE, 0)
		end
	end
	
	if nCamp == 1 or nCamp == 2 then
		SetPKFlag(1, nCamp)
		-- É±ÆøÖµÇåÁã
		SetMomentum(0)
	else
		DesaltPlayer(1 - nFlag)
		SetPKFlag(0, 0)
		if nFlag == 0 then			-- ½øÈëµÄÊ±ºò
			UseSkillEnable(0)
		elseif nFlag == 1 then		-- ³öÀ´µÄÊ±ºò
			if GetTask(SKILLENABLE) == 0 then
				UseSkillEnable(1)--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
			elseif GetTask(SKILLENABLE) == 1 then
				UseSkillEnable(0)--  (1¿ÉÒÔÊ¹ÓÃÎä¹¦£¬0½ûÖ¹Ê¹ÓÃÎä¹¦)
				SetTask(SKILLENABLE, 0)
			end
		end
	end
	ForbidChangePK(1 - nFlag)
end

function InitMission()
	-- MissionÔÚOpenµÄÊ±ºòÒÑ¾­³õÊ¼»¯¹ýÁË,ÕâÀïÎª¿Õ
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
	-- Ö±½Ó¶ÔPlayer½øÐÐ´¦Àí¾ÍOKÁË,·´ÕýMissionÀïÃæÃ»ÓÐµ¥¶ÀPlayerµÄÐÅÏ¢
	-- ËùÒÔ3¸öMission¹«ÓÃÒ»¸öOnLeaveÃ»ÓÐÎÊÌâ
	PlayerIndex = RoleIndex;
	tongcitywar_setpstate(0, 1)	-- ²»ÓÃÀë¿ª¶ÓÎé°É?Ó¦¸ÃÃ»Ó°Ïì
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

-- TeamÏûÏ¢
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
--		Say("<color=green>Chñ l«i ®µi<color>: Lo¹i h×nh tranh ®o¹t t­ c¸ch c«ng thµnh tuÇn nµy lµ "..szMethod..", thø 6 h·y quay l¹i ®©y tham gia.",0);
--	else
		szMethod = tSignMethod[nType];
		local tb_dialog = {
			"Rêi khái/no_say",
		};
		--if nHour < 19 or (nHour == 19 and nMin < 30) then
		--	Say("<color=green> Chñ l«i ®µi<color>: §Ó cã t­ c¸ch c«ng thµnh vµo tuÇn nµy, quý bang ph¶i tham gia <color=green>"..szMethod.."<color>. Xin mêi quý bang héi mau mau chuÈn bÞ.!",0);
		--	return 0;
		--end
		if nType == 1 then--¹¥³ÇÕ½ÀÞÌ¨
			tinsert(tb_dialog, 1, "Tham gia L«i ®µi C«ng thµnh chiÕn/canjia_leitai");
			tinsert(tb_dialog, 2, "T×m thuyÕt minh L«i ®µi C«ng thµnh chiÕn/kan_shuoming");
			Say("L«i ®µi C«ng thµnh chiÕn lµ trËn ®Êu giµnh t­ c¸ch C«ng thµnh chiÕn gi÷a c¸c bang héi.", getn(tb_dialog), tb_dialog);
		else--
			if nHour == 19 and nMin < 40 then
				tinsert(tb_dialog, 1, "B¸o danh/baobing_jingtoutiaozhanling");
				Say("<color=green> Chñ l«i ®µi<color>: HiÖn t¹i lµ thêi gian ®Êu gi¸ khiªu chiÕn lÖnh, ng­¬i muèn tham gia?", getn(tb_dialog), tb_dialog);
			elseif nHour == 19 or (nHour == 20 and nMin < 10) then
				tinsert(tb_dialog, 1, "Ta muèn ®Êu gi¸ khiªu chiÕn lÖnh/jingtou_tiaozhanling");
				tinsert(tb_dialog, 2, "Muèn xem t×nh h×nh ®Êu gi¸ khiªu chiÕn lÖnh/view_tiaozhanling");
				Say("<color=green> Chñ l«i ®µi<color>: HiÖn t¹i lµ thêi gian ®Êu gi¸, h·y gÊp rót ®Êu gi¸.!", getn(tb_dialog), tb_dialog);
			else
				local szGong,szShou = GetCityWarAD(CITY_ID_CD);
				if szGong == "" then	--Èç¹ûÃ»ÓÐ¹¥³Ç·½
					if SubWorldID2Idx(CITY_ID_CD) >= 0 then	--Ö»ÔÚÄ¿±ê³ÇÊÐµØÍ¼Ëù´¦µÄ·þÎñÆ÷ÉÏ·¢ÏûÏ¢
						if szShou ~= "" then
							Say("<color=green> Chñ l«i ®µi<color>: Do v×"..tSignUpCityName[CITY_ID_CD].." C«ng thµnh chiÕn kh«ng cã phe c«ng"..tSignUpCityName[CITY_ID_CD].."Thµnh tiÕp tôc do "..szShou.." bang héi chiÕm lÜnh", 0);
						else
							Say("<color=green> Chñ l«i ®µi<color>: Do v×"..tSignUpCityName[CITY_ID_CD].." C«ng thµnh chiÕn kh«ng cã phe c«ng vµ phe thñ, v× vËy "..tSignUpCityName[CITY_ID_CD].." C«ng thµnh chiÕn t¹m dõng 1 trËn", 0);
						end
					end
				else
					Say("<color=green> Chñ l«i ®µi<color>: Qua mét kú ®Êu gi¸ n¶y löa, cuèi cïng còng chän mét bang héi cã t­ c¸ch c«ng thµnh cña tuÇn nµy. <enter>Ta trÞnh träng tuyªn bè, bªn c«ng thµnh cña tuÇn nµy lµ: "..szGong.."<enter>Chóc mõng bang héi ®· thµnh c«ng trong tuÇn nµy.", 0);
				end
			end
		end
	--end
end