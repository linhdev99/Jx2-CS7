-- ===================================================================
-- Name		:	business_link_head.lua
-- Desc		:	ĞÂÉÌ»áÈÎÎñ½Å±¾£¬µ÷ÕûÁËÈÎÎñĞÎÊ½ºÍ½±ÀøÄ£Ê½
-- Date		:	Sep 1st, 2006
-- Creator	:	Tony(Jizheng)
-- ===================================================================
-- ±í¸ñÎÄ¼şÀàµÄÖ§³ÖÒÔ¼°µØÍ¼Ìø×ªµÄÖ§³Ö
Include("\\script\\task\\random\\task_gotoworld.lua");
-- »Ô»ÍÖ®Ò¹Í·ÎÄ¼ş
Include("\\script\\shinynight_head.lua");
--2006ÄêÊ¥µ®½Ú»î¶¯½±ÀøÖ§³Ö
Include("\\script\\online\\zgc_temp_fun.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua")
Include("\\script\\vng\\nhiemvulamgiau\\nhiemvulamgiau.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	

-- ÈÎÎñ±äÁ¿IDµÄ¶¨Òå
LAST_WEEKEND_DATE	= 353
LAST_DAY_DATE		= 354
CURWEEK_DONE_TIMES	= 355
CURDAY_DONE_TIMES	= 356

--=====================================================================
tbCheck_Award = {
	[1] = {5, 1000000, 1},
	[2] = {8, 1500000, 2},
	[3] = {9, 2000000, 3},
}
-- Ä¬ÈÏÈë¿Úº¯Êı
function business_entrance()
	--µÈ¼¶¼ì²â	
	local nDate = tonumber(date("%Y%m%d"))
--====================== Nhiem Vu Thuong Hoi ==================	
	if CFG_NhiemVuThuongHoi == 1 then
		-- »ñÈ¡ÊÇ·ñÕıÔÚ×öÒ»¸öÈÎÎñ
		local nTaskState = GetChainTaskStatus(11)
		-- »ñÈ¡µ±Ç°×öµÄÈÎÎñµÄÖÖÀà
		local nTaskCurType = GetTaskType(11)
		local strTalkTab = {}
		tinsert(strTalkTab,"<color=yellow>.Peter Meow Cute.<color> võa ban chiÕu: Nh©n sÜ nµo gióp søc <color=yellow>Meo Cute<color> sÏ ®­îc träng th­ëng! Mçi ngµy cã thÓ nhËn tèi ®a <color=yellow>10.000 lÇn<color> nhiÖm vô!")
		tinsert(strTalkTab,"NhiÖm vô lÇn tr­íc ®· hoµn thµnh ch­a? Nhí lµ trong ngµy ph¶i hoµn thµnh <color=green>10.000 nhiÖm vô<color> nhĞ! NÕu <color=green> hñy 1 lÇn sÏ bŞ trõ ®i 1 lÇn<color> trªn tæng sè nhiÖm vô!")
		if nDate >= 20110913 and nDate <= 20110922 then
			tinsert(strTalkTab,"V× triÒu ®×nh cèng hiÕn søc lùc/no_accept_new_task")
		else
			tinsert(strTalkTab,"V× triÒu ®×nh cèng hiÕn søc lùc/accept_new_task")
		end
		tinsert(strTalkTab,"Kh«ng cã høng thó lµm nhiÖm vô nµy/exit_dialog") -- 4
		tinsert(strTalkTab,"NhiÖm vô ®· hoµn thµnh!/hand_up_task") -- 5
		tinsert(strTalkTab,"NhiÖm vô vÉn ch­a hoµn thµnh/exit_dialog") -- 6
		tinsert(strTalkTab,"Ta muèn hñy bá nhiÖm vô ®ang lµm/cancel_cur_task") -- 7
		tinsert(strTalkTab,"Giíi thiÖu tØ mØ nhiÖm vô th­¬ng héi/intro_new_task") -- 8 
		tinsert(strTalkTab,"Xem t×nh h×nh nhiÖm vô th­¬ng héi ®· hoµn thµnh/query_cur_week_info") -- 9
		tinsert(strTalkTab,"§­a ta ®Õn n¬i lµm nhiÖm vô/goto_mission_pos") -- 10
		tinsert(strTalkTab,"Mua ®å nhiÖm vô th­¬ng héi/mua_do_nv") -- 11
		-- ÕıÔÚÈÎÎñÖĞ
		if (nTaskState == 1) then
			if (nTaskCurType == 2) then
				Say(strTalkTab[2], 6, strTalkTab[5], strTalkTab[10], strTalkTab[7], strTalkTab[9], strTalkTab[11], strTalkTab[6])
			else
				Say(strTalkTab[2], 5, strTalkTab[5], strTalkTab[9], strTalkTab[6],strTalkTab[11], strTalkTab[7])
			end
		-- Ã»ÓĞ¿ªÊ¼×ö»òÕßÒÑ¾­×öÍêÁËÉÏÒ»¸öÁË
		else
			Say(strTalkTab[1], 5, strTalkTab[3], strTalkTab[9], strTalkTab[8], strTalkTab[11], strTalkTab[4])
		end
	end

--================ Nhiem Vu Lam Giau =========================
	if CFG_NhiemVuLamGiau == 1 then
		local szSay = "ChØ cÇn cã mét İt b¶n lÜnh hoµn thµnh c¸c thö th¸ch cña ta, ng­¬i sÏ nhËn ®­îc v« vµn tµi léc, sÏ kh«ng khã ®Ó trë thµnh phó hé. Ng­¬i cã muèn thö kh«ng?"
		local tbSay = {}
		tinsert(tbSay, "NhËn nhiÖm vô lµm giµu mçi ngµy (tiªu hao 99 xu vËt phÈm)./NhiemVuLamGiau_Nhan")
		tinsert(tbSay, "Xem tiÕn ®é thùc hiÖn nhiÖm vô./NhiemVuLamGiau_Xem")
		tinsert(tbSay, "NhËn tµi léc./NhiemVuLamGiau_Thuong")
		tinsert(tbSay, "Ta ch­a muèn giµu cã./gf_DoNothing")
		Say(szSay, getn(tbSay), tbSay)
	end
end;

-- ÍË³ö¶Ô»°µÄÄ¬ÈÏ¶Ô»°
function exit_dialog()
	Say("Ng­¬i v× n­íc x¶ th©n, v× d©n cøu n¹n thËt lµ ®¹i ©n ®¹i ®øc!", 0)
end;
function mua_do_nv()
	Sale(88)
end;
-- ½éÉÜĞÂµÄÉÌ»áÈÎÎñµÄ¶Ô»°
function intro_new_task()
--	Say("µ±½ñÊ¥ÉÏÓ¢Ã÷£¬ÔçÔÚ¿ªÕ½Ö®Ç°¾ÍÊÕ¼¯ÁË×ã¹»¶àµÄÕ½ÂÔÎï×Ê£¬²ÅÓĞÁË¼¸¸ö´óÊ¤µÄ±£ÕÏ°¡£¡ÎªÁË¸ĞĞ»½­ºşÏÀÊ¿ÃÇµÄ´óÁ¦Ğ­Öú£¬Ê¥ÉÏÌØÃü³¯Í¢ÄÃ³öÕ½ÀûÆ·êûÉÍ´ó¼Ò£¬Ö»ÒªÍê³ÉÒ»Ğ©´«ĞÅºÍÇå³ı¸÷µØÎ£º¦°ÙĞÕµÄÃÍÊŞ»òÕß·Ë°ï£¬¾ÍÄÜµÃµ½·áºñµÄ±¨³¥¡£²»¹ı»ú»áÓĞÏŞ£¬Ã¿ÈËÃ¿ÈÕÖ»ÓĞÒ»°Ù´Î»ú»á£¬´ó¼Ò¿ÉÒª×¥×¡»ú»á°¡¡£ÈôÊÇ½ñÈÕÎŞ·¨Íê³É£¬µÚ¶şÈÕÒ²²»»áÔÙ±£ÁôÇ°ÈÕ¹¦¼¨£¬¶øÊÇÖØĞÂ¿ªÊ¼¼ÆÊı¡£", 0)
	Say("Hoµng th­îng võa ban chiÕu: Nh©n sÜ nµo gióp søc TriÒu ®×nh sÏ ®­îc träng th­ëng! Mçi ngµy cã thÓ nhËn tèi ®a 60 lÇn nhiÖm vô. NÕu trong ngµy kh«ng hoµn thµnh th× h«m sau sÏ ®­îc tİnh l¹i tõ ®Çu!", 0)
end;
--¿ÉÒÔ½ÓÈÎÎñµÄÊ±¼ä¶Î
--13£º00-14£º30
--16£º00-17£º00
--21£º00-22£º00
--function check_accept_task_time()
--	local nTime = tonumber(date("%H%M"));
--	if (nTime >= 1300 and nTime <= 1430) or
--		(nTime >= 1600 and nTime <= 1700) or 
--		(nTime >= 2100 and nTime <= 2200) then
--		return 1;
--	else
--		return 0;
--	end;
--end;

-- ½ÓÈ¡Ò»¸öĞÂÈÎÎñ
function accept_new_task()

--	if check_accept_task_time() == 0 then
--		Talk(1,"","<color=green>ÉÌ»áÀÏ°å<color>£º×î½üÉúÒâÉõÎª·±Ã¦£¬ÈËÊÖÊµÔÚÊÇ²»¹»£¬Ã¦²»¹ıÀ´°¡£¬ÏÖÔÚÖ»ÔÚÃ¿ÈÕµÄ<color=red>13£º00-14£º30£¬16£º00-17£º00£¬21£º00-22£º00<color>ÎÒÕâÀï²Å×ö¸÷Î»µÄÉúÒâ£¬ÒªÀ´Çë¿´ºÃÊ±¼ä°¡£¡");
--		return 0;
--	end;
	local nReput, nFaction = 0,0
--	if GetCreateTime() < 1306861186 then --chØnh l¹i thêi gian lµ done
--		Say("Nh©n vËt ®­îc t¹o sau ngµy 01/06/2011 míi tham gia ®­îc.", 0)
--		return
--	end
	nReput = 3000
	nFaction = 4000	

	--if GetLevel() < 73 or GetReputation() < nReput or GetTask(336) < nFaction or GetPlayerRoute() == 0 then
	--	Say("N¨ng lùc cña ng­¬i cßn kĞm l¾m, ®îi ®Õn <color=yellow>cÊp 73, gia nhËp hÖ ph¸i, cã ®ñ ®iÓm danh väng vµ s­ m«n <color>h·y quay l¹i cèng hiÕn søc lùc còng ch­a muén.", 0)
	--	return
	--end
	local nDate = tonumber(date("%y%m%d"))
	local nLastGetDate = floor(GetTask(TSK_CHECK_BAOHAP) / 100)	
	if nLastGetDate ~= nDate then
	   SetTask(TSK_CHECK_BAOHAP, nDate * 100)
    end

	local nType = check_type()
	--if GetItemCount(2,1,30154) < tbCheck_Award[nType][1] and mod(GetTask(TSK_CHECK_BAOHAP),100) == 0 then
	--    Talk(1,"","§¹i hiÖp kh«ng mang theo ®ñ sè l­îng N÷ Oa B¶o H¹p ®Ó nhËn nhiÖm vô !!!")
	--    	return
	--end
    
	local bCanAccept = can_accept_task()
	if (bCanAccept == 1) then		-- ÅĞ¶ÏÊÇ·ñÄÜ¹»½ÓÈÎÎñ
		SelectRandomTask(11)
		-------------------------------------
		DelItem(2,1,30154,tbCheck_Award[nType][1])
		SetTask(TSK_CHECK_BAOHAP, GetTask(TSK_CHECK_BAOHAP) + 1)
		
		-- ÌáÊ¾ÈÎÎñ
		--local myText1,myText2,myText3,myText4 = "","","",""
		--myText1 = GetInfo(11, 1)
		--myText2 = GetInfo(11, 2)
		--myText3 = GetInfo(11, 3)
		--myText4 = GetInfo(11, 4)
		local myText = ""
		myText = GetInfo(11, 2)

		-- »ñÈ¡µ±Ç°×öµÄÈÎÎñµÄÖÖÀà
		local nTaskCurType = GetTaskType(11)
		gf_WriteLogEx("Nhiem vu Thuong Hoi", "tham gia")
		if (nTaskCurType == 2) then
			Say("<color=green>Chñ th­¬ng héi<color>:"..myText.."\n Cã cÇn ta ®­a ®Õn n¬i lµm nhiÖm vô kh«ng?",
				2,
				"PhiÒn ®­a ta ®i mét chuyÕn/goto_mission_pos",
				"Kh«ng cÇn ®©u/exit_dialog")
		else
			Say("<color=green>Chñ th­¬ng héi<color>:"..myText.."\n", 0)
		end
	else
		Say("H«m nay ng­¬i ®· lµm ®ñ nhiÖm vô råi, ngµy mai l¹i ®Õn nhĞ!", 0)
	end
end;


-- ËÍÍæ¼ÒÈ¥ÈÎÎñµØµã
function goto_mission_pos()
	-- »ñÈ¡¸ÃÈÎÎñµÄµØÍ¼ ID
	local nMapIndex = tonumber(GetCurTaskLinkMapIndex(11))
	if (nMapIndex ~= 0 and nMapIndex ~= nil) then
		gotoWorld(nMapIndex)
	end
end;


-- ÅĞ¶ÏÊÇ·ñÄÜ¹»½ÓÈÎÎñ
-- ÏÖÔÚ¸ÄÎª£¬Ã¿ÌìÉÏÏŞ100´Î£¬Ã»ÓĞÀÛ¼Ó£¬¹ıÒ»Ìì¾ÍÇå¿ÕÒ»ÌìµÄÊı¾İ - Oct 28, 2006 Jeep tag
function can_accept_task()
	local nRet = 0
	-- ¸üĞÂÈÕÆÚĞÅÏ¢
	refresh_time_records()
	
	--local nWeekDay = tonumber(date("%w"))
	--if (nWeekDay == 0) then
	--	nWeekDay = 7
	--end
	
	-- ±¾ÖÜ»¹ÄÜ×ö¶àÉÙ´Î
	--local nWeekCanDoTimes = nWeekDay * 20
	--local nHaveDoneCurWeek = GetTask(CURWEEK_DONE_TIMES)
	--nWeekCanDoTimes = nWeekCanDoTimes - nHaveDoneCurWeek
	
	-- ½ñÌì»¹ÄÜ×ö¶àÉÙ´Î
	--local nDayCanDoTimes = 3 * 20
--	local nDayCanDoTimes = 100
	local nDayCanDoTimes = 10000
	local nHaveDoneCurDay = GetTask(CURDAY_DONE_TIMES)
	nDayCanDoTimes = nDayCanDoTimes - nHaveDoneCurDay
	
	--if (nWeekCanDoTimes < nDayCanDoTimes) then
	--	nDayCanDoTimes = nWeekCanDoTimes
	--end
	
	if (nDayCanDoTimes > 0) then
		nRet = 1
	end
	
	local nCurrTime = {date("%y"), date("%m"), date("%d")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	
	-- Èç¹û¿ç»Øµ½ÒÔÇ°µÄ·şÎñÆ÷£¬¾Í×ö²»ÁËÉÌ»áÈÎÎñ
	if (nCurDay < GetTask(LAST_DAY_DATE)) then
		nRet = 0
	end
	
	return nRet
end;

-- Ìá½»Íê³ÉÁËµÄÈÎÎñ
function hand_up_task()
	local nTaskFinish = QueryTaskFinish(11)
	-- ¸üĞÂÈÕÆÚĞÅÏ¢
	refresh_time_records()
	local nType = check_type()	
	-- ½±Àø±¶ÂÊ
	--local nCount = prize_muti_by_time()
	--local multiple = 1		-- ÔİÊ±²»Äñ»Ô»ÍÖ®Ò¹µÄÓ°Ïì
	local nCount = 100		-- Ò²Ã»ÓĞÃ¿ÌìµÄË«±¶ÏŞÖÆÁË
	local multiple = get_reward_multiple(SYS_COC)
	-- ½±ÀøÀàĞÍ
	local nPrizeType = 1	-- ½ğÇ®

	-- ÒÑ¾­Íê³ÉÁËÈÎÎñ
	if (nTaskFinish == 1) then

		-- Í¨Öª³ÌĞò£¬Íê³ÉÁËÈÎÎñ
		FinishTaskStep(11, nPrizeType, nCount * multiple) 
		--if GetTask(CURDAY_DONE_TIMES) < 40 then
		--	ModifyReputation(5, 0)
		--else
		--	ModifyReputation(10, 0)
		--end
		ModifyReputation(10, 0)
		Msg2Player("B¹n nhËn ®­îc 10 ®iÓm danh väng")
		--- Modify ®iÓm danh väng
		if GetTask(CURDAY_DONE_TIMES)  <= 24 then
			if  GetLevel() >= 73 and GetLevel() <= 79  then
				--ModifyReputation(- 1, 0)
				--Msg2Player("B¹n ®· bŞ trõ 1 ®iÓm danh väng")
			end
			if GetLevel() >= 80 and GetLevel() <= 89  then
				--ModifyReputation(- 2, 0)
				--Msg2Player("B¹n ®· bŞ trõ 2 ®iÓm danh väng")
			end 
		end
		----------------------------------------------- ph¸t th­ëng theo møc lev
		--ModifyReputation(- 3, 0)		
		Earn(tbCheck_Award[nType][2])	
		-- ¸üĞÂµ±ÌìºÍ±¾ÖÜÒÑ¾­Íê³ÉµÄÈÎÎñ
		local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
		local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
		SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
		SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)
		--Ê¥µ®½Ú»î¶¯--
			--Xmas_prize_get(3)
		--½áÊø
		-- »î¶¯call back
		-- Thªm b¹c IPBonus
		--AddMoneyForIPBonus()
		-- Kh«ng sö dông hµm cña Kingsoft  viÕt (Hµm nµy sö dông theo d¹ng event 
--		Give_Business_Award();
		local nLastLoginIp,nCurrentLoginIp = GetLoginIP();	
		local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
		local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
		local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
		local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
		local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
		
--		WriteLogEx("Nhiem vu Thuong Hoi", "hoµn thµnh", tBonus[nLevel], "®ång")
		gf_WriteLogEx("Nhiem Vu Thuong Hoi", "hoµn thµnh 1 nhiÖm vô", 1, "Th­¬ng héi lo¹i "..tbCheck_Award[nType][3])
		if GetTask(CURDAY_DONE_TIMES)  == 60 then
			gf_WriteLogEx("Nhiem Vu Thuong Hoi", "hoµn thµnh 60 nhiÖm vô", 1, "Hoµn thµnh 60 nhiÖm vô")
		end
		-----------------------Chuçi nhiÖm vô §ång Hµnh
		if CFG_NhiemVuDongHanh == 1 then
			if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 12 or DongHanh_GetMission() == 13 or DongHanh_GetMission() == 14 or DongHanh_GetMission() == 15) then
				if DongHanh_GetMissionPart() > 0 then
					DongHanh_SetMissionPart()
					if DongHanh_GetMissionPart() == 0 then
						DongHanh_SetStatus()
					end
				end
			end
		end
		--------------------------
		-- Ê¦ÃÅÈÎÎñ £¨ÉÌ»á£©
		local nChance, nMaxChance = CustomDataRead("mp_shanghui")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shanghui", "dd", nChance, nMaxChance)
				Msg2Player("NhiÖm vô S­ ®å-T×nh h×nh hoµn thµnh Th­¬ng héi-:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say("Ng­¬i ch­a hoµn thµnh nhiÖm vô ta giao! TiÕp tôc cè g¾ng nhĞ!", 0)
	end
end;

function prize_muti_by_time()
	local nRet = 100
	local nCurrTime = {date("%w"), date("%H")}
	local nWeekday = tonumber(nCurrTime[1])
	local nHours = tonumber(nCurrTime[2])
	
	if (nWeekday == 0 or nWeekday == 6) then	-- ÖÜÄ©
		if (nHours == 18 or nHours == 19 or nHours == 20 or nHours == 21) then
			nRet = 200
		end
	else										-- Æ½Ê±
		if (nHours == 20 or nHours == 21) then	
			nRet = 200
		end									
	end
	
	return nRet
end;

-- È¡ÏûÕıÔÚ×öµÄÈÎÎñ
function cancel_cur_task()
--	Say("<color=green>ÉÌ»áÀÏ°å<color>£º<color=yellow>È¡ÏûÈÎÎñ<color>½«ºÄ·ÑÒ»´ÎÁìÈ¡ÈÎÎñ½±ÀøµÄ»ú»á£¬ÄãÈ·¶¨ÒªÈ¡Ïû´Ë´ÎÈÎÎñÂğ£¿",
	Say("<color=yellow>Kh«ng thİch lµm th× hñy<color> ! Cã g× ®©u mµ lo... Oh yeahhh!",
		2,
		"Hñy bá nhiÖm vô/confirm_cancel_task",
		"§Ó ta suy nghÜ l¹i/exit_dialog")
end;

-- È·ÈÏÈ¡ÏûÕıÔÚ×öµÄÈÎÎñ
--function confirm_cancel_task()
--	-- Í¨Öª³ÌĞòÈ¡Ïûµ±Ç°ÈÎÎñ
--	CleanTask(11)
--	-- ¸üĞÂÈÕÆÚĞÅÏ¢
--	refresh_time_records()
--	
--	-- ¸üĞÂµ±ÌìºÍ±¾ÖÜÒÑ¾­Íê³ÉµÄÈÎÎñ
--	local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
--	local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
--	SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
--	SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)
--	
--	-- ÌáÊ¾Íæ¼Ò
--	Say("<color=green>ÉÌ»áÀÏ°å<color>£ºÄãÒÑ¾­³É¹¦µÄÈ¡ÏûÁË±¾´ÎÈÎÎñ£¬µ«ÊÇÒ²ºÄ·ÑÁËÒ»´ÎÁìÈ¡ÈÎÎñ½±ÀøµÄ»ú»á£¡", 0)
--end;

-- Íæ¼ÒÈ·ÈÏÈ¡ÏûÈÎÎñ
function confirm_cancel_task()
	
	local nNum = GetTask(390);
	local nRound = 0;

	if GetReputation() >=0 then
		--ModifyReputation(-5,0);
		
		if nNum<=10 then
			nRound=0;
		else
			if mod(nNum, 10) == 0 then
				nRound = floor(nNum/10) - 1;
			else
				nRound = floor(nNum/10);
			end;
		end;

		do_cancel_task();  -- Çå¿ÕÈÎÎñ

		Say("Xong råi! b©y giê b»ng h÷u cã thÓ nhËn nhiÖm vô míi!",0);
		Msg2Player("Hñy xong råi ®ã !!! Meow Meow");
		TaskTip("Hñy xong råi ®ã !!! Meow Meow!");
	else
		Say("<color=yellow>§iÓm danh väng hiÖn t¹i<color> cña ng­¬i qu¸ thÊp, kh«ng thÓ hñy nhiÖm vô lÇn nµy!",0);
		Msg2Player("§iÓm danh väng qu¸ thÊp, kh«ng thÓ hñy nhiÖm vô!");
		TaskTip("§iÓm danh väng qu¸ thÊp, kh«ng thÓ hñy nhiÖm vô!");
		return
	end;
	return
end

-- È·ÈÏÈ¡ÏûÕıÔÚ×öµÄÈÎÎñ
function do_cancel_task()
	-- Í¨Öª³ÌĞòÈ¡Ïûµ±Ç°ÈÎÎñ
	CleanTask(11);
	-- ¸üĞÂÈÕÆÚĞÅÏ¢
	refresh_time_records()
	
	-- ¸üĞÂµ±ÌìºÍ±¾ÖÜÒÑ¾­Íê³ÉµÄÈÎÎñ
	local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
	local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
	SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
	SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)
	
end;

-- ²é¿´±¾ÖÜÎÒÍê³ÉÉÌ»áÈÎÎñµÄÇé¿ö
function query_cur_week_info()
	--local strDayDesc = {"Ò»", "¶ş", "Èı", "ËÄ", "Îå", "Áù", "ÈÕ"}
	
	-- ÏÈ¸üĞÂÊı¾İ
	refresh_time_records()
	
	--local nWeekDay = tonumber(date("%w"))
	--if (nWeekDay == 0) then
	--	nWeekDay = 7
	--end
	
	-- ±¾ÖÜ»¹ÄÜ×ö¶àÉÙ´Î
	--local nWeekCanDoTimes = nWeekDay * 20
	--local nHaveDoneCurWeek = GetTask(CURWEEK_DONE_TIMES)
	--nWeekCanDoTimes = nWeekCanDoTimes - nHaveDoneCurWeek
	
	-- ½ñÌì»¹ÄÜ×ö¶àÉÙ´Î
	--local nDayCanDoTimes = 3 * 20
--	local nDayCanDoTimes = 100
	local nDayCanDoTimes = 10000
	local nHaveDoneCurDay = GetTask(CURDAY_DONE_TIMES)
	nDayCanDoTimes = nDayCanDoTimes - nHaveDoneCurDay
	--if (nWeekCanDoTimes < nDayCanDoTimes) then
	--	nDayCanDoTimes = nWeekCanDoTimes
	--end
	
	Say("H«m nay ®· hoµn thµnh <color=yellow>"..nHaveDoneCurDay.."<color> lÇn nhiÖm vô. Cßn cã thÓ nhËn <color=yellow>"..nDayCanDoTimes.."<color> lÇn! ", 0)
end;

-- Ë¢ĞÂÈÕÆÚĞÅÏ¢
function refresh_time_records()
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%w")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	--local nCurWeekDay = tonumber(nCurrTime[4])
	
	-- ¸üĞÂµ±ÌìµÄÈÕÆÚ
	if (nCurDay > GetTask(LAST_DAY_DATE)) then
		SetTask(LAST_DAY_DATE, nCurDay)		-- ¸üĞÂÉÏÌìµÄÈÕÆÚ
		SetTask(CURDAY_DONE_TIMES, 0)		-- ¸üĞÂ±¾Ìì×öÁËµÄÈÎÎñ´ÎÊı
	end
	
	-- ¸üĞÂ±¾ÖÜµÄĞÅÏ¢
	--if (nCurDay > GetTask(LAST_WEEKEND_DATE)) then
	--	local nNextWeekEnd = refresh_last_week_end()
	--	SetTask(LAST_WEEKEND_DATE, nNextWeekEnd)		-- ¸üĞÂÏÂ¸öÖÜÄ©µÄÊ±¼ä
	--	SetTask(CURWEEK_DONE_TIMES, 0)					-- ¸üĞÂ±¾ÖÜ×öÁËµÄÈÎÎñ´ÎÊı
	--end
end;

-- ¸üĞÂÏÂ¸öÖÜÄ©µÄÊ±¼ä
function refresh_last_week_end()
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%w")}
	local nCurDate = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])		-- µ±Ç°µÄÈÕÆÚ
	local nCurYear = tonumber(nCurrTime[1])			-- µ±Ç°Äê·İ
	local nCurMonth = tonumber(nCurrTime[2])		-- µ±Ç°ÔÂ·İ
	local nCurDay = tonumber(nCurrTime[3])			-- µ±Ç°Ìì
	local nCurWeekDay = tonumber(nCurrTime[4])		-- µ±Ç°ÖÜ¼¸
	
	-- ÖÜÈÕ¾ÍÖ±½Ó·µ»Øµ±ÌìÈÕÆÚ
	if (nCurWeekDay == 0) then
		return nCurDate
	end
	
	local nPassDay = 31									-- ÆäËüÔÂ·İ31ÌìµÄ´¦Àí
	if (nCurMonth == 2) then							-- 2ÔÂ·İµÄ´¦Àí£¬ 28ÌìµÄ´¦Àí
		nPassDay = 28
		if (nCurYear == 8 or nCurYear == 12) then		-- ÈòÄê
			nPassDay = 29
		end
	elseif (nCurMonth == 4 or nCurMonth == 6 or
			nCurMonth == 9 or nCurMonth == 11) then		-- 4¡¢6¡¢9¡¢11ÔÂµÄ´¦Àí£¬30ÌìµÄ´¦Àí
		nPassDay = 30
	end
	
	-- ĞèÒª¼ÓµÄÌìÊı
	local nShouldPlus = 7 - nCurWeekDay
	nCurDay = nCurDay + nShouldPlus
	
	if (nCurDay > nPassDay) then
		nCurDay = nCurDay - nPassDay
		nCurMonth = nCurMonth + 1
		if (nCurMonth > 12) then
			nCurMonth = 1
			nCurYear = nCurYear + 1
		end
	end
	
	nCurDate = nCurYear * 10000 + nCurMonth * 100 + nCurDay
	return nCurDate
end;

-- §iÒu kiÖn thªm b¹c IPBonus ( tr­êng hîp 2 b¹c vµ 20 b¹c )
function AddMoneyForIPBonus()
	if GetPlayerRoute() == 0 or VET_CheckIpBonus() == 0 then
		return
	end
	
	local tIpBonusReq =
	{
		[1] = {80, 10000, 10000, 2000},
		[2] = {73, 3000, 4000, 200},
	}
	
	-- T×m møc thuëng phï hîp víi ®iÒu kiÖn cña ng­êi ch¬i
	local nCheck = 0
	for i = 1, getn(tIpBonusReq) do
		if GetLevel() >= tIpBonusReq[i][1] and GetReputation() > tIpBonusReq[i][2] and GetTask(336) > tIpBonusReq[i][3] then
			nCheck = i
			break
		end
	end
	
	if nCheck == 0 then 
		return
	end
	
	-- Th­ëng tiÒn vµ ghi log trong nhãm IPBonus
	local nBonusMoney = tIpBonusReq[nCheck][4]
	Earn(nBonusMoney)
	nBonusMoney = nBonusMoney / 100
	Msg2Player("B¹n nhËn ®­îc "..nBonusMoney.." b¹c")
	gf_WriteCustomLog(VET_STR_IPBONUS_LOG_TITLE, "nhËn ®­îc "..nBonusMoney.." b¹c")
end

	-- Kh«ng cho nhËn nv Th­¬ng héi
function no_accept_new_task()
	Talk(1,"","B¹n ®· nhËn nhiÖm vô råi, h·y hoµn thµnh ®Ó nhËn phÇn th­ëng!!!")
	return
end

function check_type()
	local nLev = GetLevel()
	local nType = 0
	if nLev >= 73 and nLev <= 76 then
		nType = 1
	elseif nLev >= 77 and nLev <= 95 then
		nType = 2
	else
		nType = 3
	end 
	return nType
end