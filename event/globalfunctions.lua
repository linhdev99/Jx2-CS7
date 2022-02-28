--±¾ÎÄ¼þ¶¨ÒåÐ´½£Íø¶þ½Å±¾µÄÒ»Ð©¹«¹²º¯Êý
--±¾ÎÄ¼þ°üº¬Ò»Ð©×ÓÏµÍ³µÄ¹«¹²º¯ÊýÈçMissionº¯Êý
Include("\\script\\lib\\missionfunctions.lua");
Include("\\settings\\static_script\\lib\\teamfunctions.lua");
Include("\\script\\lib\\time.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\lingshi_head.lua");
Include("\\script\\online_activites\\task_values.lua");
Include("\\script\\online_activites\\reborn\\tongban\\strings.lua");
Include("\\script\\class\\ktabfile.lua")
Include("\\script\\ks2vng\\lib\\globalfunctions.lua")
Include("\\settings\\static_script\\online\\general_award_group.lua")
Include("\\script\\meridian\\meridian_script_api.lua")
Include("\\script\\task_access_code_def.lua")
Include("\\script\\tmp_task_id_def.lua")
Include("\\script\\lib\\teamfunctions.lua")
Include("\\script\\lib\\define.lua");

--ÅÐ¶ÏÉíÉÏµÄ¸ñ×ÓºÍ¸ºÖØÂú²»Âú×ãÌõ¼þ£¬µÚÈý¸ö²ÎÊýÌîÁËµÄ»°±íÊ¾Òª×÷TalkÌáÊ¾£¬ÄÚÈÝÊÇÌáÊ¾ÈËµÄÃû×Ö
strLog = ""
STR_OVERWEIGHT = "Hµnh trang hoÆc søc lùc kh«ng ®ñ, xin s¾p xÕp l¹i!"

--==============================================
--function describe:ÓÃÓÚÀ©Õ¹¶Ô»°TALKº¯Êý¹¦ÄÜ
--function params : fnNextTaskÏÂÒ»²½µ÷ÓÃµÄº¯ÊýÃû
--                  tbMsg npcËµµÄ»°
--function return value: ÎÞ·µ»ØÖµ
--===============================================
tRouteSkillInfo =
{
				[0] = 0,
				[1] = 0,
				[2] = 31,
				[3] = 56,
				[4] = 43,
				[5] = 0,
				[6] = 73,
				[7] = 0,
				[8] = 88,
				[9] = 101,
				[10] = 0,
				[11] = 112,
				[12] = 123,
				[13] = 0,
				[14] = 145,
				[15] = 158,
				[16] = 0,
				[17] = 731,
				[18] = 744,
				[19] = 0,
				[20] = 377,
				[21] = 363,
				[23] = 1030,
				[25] = 1065 ,
				[26] = 1095,
				[27] = 1143,
				[28] = 0,
				[29] = 1176,
				[30] = 1229,
}
tMasterSkillInfo =
{
		[0] = 0,
		[1] = 0,
		[2] = 32,
		[3] = 57,
		[4] = 44,
		[5] = 0,
		[6] = 74,
		[7] = 0,
		[8] = 89,
		[9] = 102,
		[10] = 0,
		[11] = 113,
		[12] = 124,
		[13] = 0,
		[14] = 146,
		[15] = 159,
		[16] = 0,
		[17] = 732,
		[18] = 745,
		[19] = 0,
		[20] = 775,
		[21] = 774,
		[23] = 1032,
		[25] = 1066 ,
		[26] = 1096,
		[27] = 1213,
		[28] = 0,
		[29] = 1196,
		[30] = 1230,
}
function gf_Talk(fnNextTask,tbMsg)
    local nNum = getn(tbMsg)
    local szMsg = ""
    for i = 1, nNum-1 do
        szMsg = szMsg..format("%q",tbMsg[i])..","
    end
    szMsg = szMsg..format("%q",tbMsg[nNum])
    szMsg = "Talk("..nNum..","..format("%q",fnNextTask)..","..szMsg..")"
    dostring(szMsg)
    return
end

--==============================================
--function describe:ÓÃÓÚÀ©Õ¹Sayº¯Êý¹¦ÄÜ
--function params : tbMsg npcËµµÄ»°¼°Ñ¡Ïî±í
--function return value: ÎÞ·µ»ØÖµ
--remark: ±í½á¹¹Ö»ÓÐÒ»²ã±í£¬Àý£ºtb = {"",""}
--===============================================
function gf_Say(tbMsg)
	if tbMsg == nil then return end
    local nNum = getn(tbMsg)
    local szMsg = ""
    local szOption = ""
    szMsg = szMsg..""..format("%q",tbMsg[1])..","..(nNum-1)..","
    for i = 2, nNum do
        szOption = szOption..format("%q",tbMsg[i])
        if i ~= nNum then
            szOption = szOption..","
        end
    end
    szMsg = "Say("..szMsg.."{"..szOption.."})"
    --Msg2Player(szMsg)
    dostring(szMsg)
    return
end


--¶Ô»°·ÖÒ³º¯Êý£¬ÔÙµ÷ÓÃÇ°ÐèÒªÏÈÌîºÃ¶Ô»°±í
--²ÎÊý
--tbDialogList ¶Ô»°ÁÐ±í£¬±í½á¹¹ÈçÏÂ£º
--tbDiaList = {[0] = "tital",[1] = "1/#a(%d)",...}
--tbDiaList[0] ±íÊ¾¶Ô»°Í·£¬ºóÃæµÄ±íÊ¾¿ÉÑ¡¶Ô»°£¬Ö»ÄÜ´øÒ»¸ö²ÎÊý£¬
--Èç¹ûÓÐÐèÒªÌí¼ÓÁ½¸ö»òÒÔÉÏ²ÎÊý£¬ÐèÒªÐÞ¸Äº¯Êý
--nStartDialogNum´ÓÄÄ¾ä¿ªÊ¼ÏÔÊ¾£¬Èç¹û²»ÌîÔò±íÊ¾´Ó1¿ªÊ¼
--nEveryPage±íÊ¾Ã¿Ò³ÏÔÊ¾¼¸¾ä¶Ô»°£¬Ä¬ÈÏÎª6,
--×¢Òâ£¬ÓÉÓÚ¶Ô»°½çÃæ²»ÄÜÏÔÊ¾ºÜ¶àÐÐ£¬ËùÒÔ²»½¨ÒéÌî6ÒÔÉÏÊýÖµ


function gf_PageSay(tbDialogList1, n_start_dialog_num, n_every_page)
	tbDialogList = tbDialogList1
	function gf_pagesay(nStartDialogNum, nEveryPage)
    	if nStartDialogNum == nil then
        	nStartDialogNum = 1
    	end
    	if nEveryPage == nil then
      		nEveryPage = 6
    	end
    	local nCount = getn(tbDialogList)
    	local nLen = nEveryPage
    	if nStartDialogNum + nEveryPage - 1 > nCount then
      		nLen = nCount - nStartDialogNum + 1
    	end
    	local tbCurrentlyShow = {}
    	tinsert(tbCurrentlyShow,1,"KÕt thóc ®èi tho¹i/gf_DoNothing")
    	if nStartDialogNum ~= 1 then
        	tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(1,%d)","trë l¹i",nEveryPage))
    	end
    	if nStartDialogNum + nEveryPage - 1 < nCount then
	        tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(%d,%d)","Trang kÕ",nStartDialogNum+nEveryPage,nEveryPage))
    	end
    	if nStartDialogNum ~= 1 then
        	tinsert(tbCurrentlyShow,1,format("%s/#gf_pagesay(%d,%d)","Trang tr­íc",nStartDialogNum-nEveryPage,nEveryPage))
	    end
    	for i = 1, nLen do
        	tinsert(tbCurrentlyShow,1,format(tbDialogList[nStartDialogNum+nLen-i],nStartDialogNum+nLen-i))
    	end
    	Say(tbDialogList[0],getn(tbCurrentlyShow),tbCurrentlyShow)
    end
    gf_pagesay(n_start_dialog_num,n_every_page)
end
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Judge_Room_Weight / gf_JudgeRoomWeight
-- Content			: 	¼ì²é±³°üÊÇ·ñ×ã¹»¿Õ¼ä/¸ºÖØ?
-- Return value	:	0: ²»¹»/  1: ¹»
-- Parameter		:
--		+ nNeedRoom	(value)		:  ±³°ü¿Õ¼äÐèÇó
--		+ nNeedWeight (value)	:  ¸ºÖØÐèÇó
--		+ szMsgHead (string)		:  ±êÌâ £¨²»¹æ¶¨)
-- Example		:	gf_Judge_Room_Weight ( 1, 10, " " ) --> =0 --> ²»¹»¿Õ¼ä; =1 --> ¹»¿Õ¼ä
-- **********************************************************************************************************************

function gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,szMsgHead)
	if GetFreeItemRoom() < nNeedRoom or GetMaxItemWeight()-GetCurItemWeight() < nNeedWeight then
		if szMsgHead ~= nil then	--Èç¹ûÌîÁËµÚÈý¸ö²ÎÊý (if the 3rd param isn't nil)
			Talk(1,"",szMsgHead.."Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng hoÆc søc lùc kh«ng ®ñ, xin h·y s¾p xÕp l¹i hµnh trang!");
		end;
		return 0;
	else
		return 1;
	end;
end;
function gf_JudgeRoomWeight(nNeedRoom,nNeedWeight,bShowMsg)
	return gf_Judge_Room_Weight(nNeedRoom,nNeedWeight,bShowMsg);
end;

gf_CheckInv = gf_JudgeRoomWeight;

function gf_SetLogCaption(strCap)
	strLog = strCap;
end

-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Modify
-- Content			:	Ìí¼Ó¾­ÑéÖµ£¬ÉùÍûÖµÒÔ¼°½ðÇ®È«¶¼ÓÐ¼ÇÂ¼log
-- Return value	:	None
-- Parameter		:
--		+ strType	:
--				* Exp (value) 		:	¾­ÑéÖµ
--				* Rep (value) 		:	ÉùÍûÖµ
--				* Money (value)	:	½ðÇ®
--		+ nCount	:	½ðÇ®Ìí¼ÓÊýÁ¿
-- Example		: gf_Modify ("Exp", 200000) -->Give 20000 of Exp
-- **********************************************************************************************************************
function gf_Modify(strType,nCount)
	local strShow = "";
	if strType == "Exp" then
		if not nCount or nCount > 2000000000 or nCount < -2000000000 then
			WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." got "..nCount.." "..strType);
			return 0;
		end
		ModifyExp(nCount);
		strShow = nCount.."Kinh nghiÖm";
	elseif strType == "Rep" then
		ModifyReputation(nCount,0);
		strShow = nCount.."Danh väng"
	elseif strType == "Money" then
		if nCount < 0 then
			WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." got "..nCount.." "..strType);
			return 0
		end
		Earn(nCount);
		strShow = gf_GetMoneyString(nCount);
	elseif strType == "ShiMen" then
		SetTask(336, GetTask(336) + nCount);
		strShow = nCount.."§iÓm s­ m«n";
	elseif strType == "JunGong" then
		if GetTask(701) >= 0 then
			SetTask(701, GetTask(701) + nCount)
		else
			SetTask(701, GetTask(701) - nCount)
		end
		strShow = nCount.."C«ng tr¹ng"
	elseif strType == "ZhenQi" then
		AwardGenuineQi(nCount);
		strShow = nil;
	else -- Error
		WriteLog("["..strLog.."]\tgf_Modify Error:\t"..GetName().." Modify "..nCount.." "..strType );
		return 0;
	end
	if strShow then
		Msg2Player("B¹n nhËn ®­îc  "..strShow.." !");
	end
	WriteLog("["..strLog.."]\tgf_Modify:\t"..GetName().." got "..nCount.." "..strType);
	return 1;
end

function gf_AddItemEx(sItemIds, strName, nCount)
	if type(sItemIds) ~= "table" then
		WriteLog("["..strLog.."\tAddItemEx:\t tham sè sai!");
		return 0;
	end
	nCount = nCount or sItemIds[4];
	local nAmg = (nCount and 3) or 4;
	if getn(sItemIds) < nAmg then
		WriteLog("["..strLog.."\tAddItemEx:\t tham sè sai!");
		return 0;
	end

	local nRet, nItemIdx = 0;
	if sItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13]);
	else
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
	end
	if nRet == 0 then
		WriteLog("["..strLog.."]\tAddItemEx:\t"..GetName().."\t thÊt b¹i\t"..sItemIds[1]..","..sItemIds[2]..","..sItemIds[3]..","..sItemIds[4]);
	elseif nRet == 1 then
		Msg2Player("B¹n nhËn ®­îc  "..nCount.." "..strName);
		WriteLog("["..strLog.."]\tAddItemEx:\t"..GetName().."\tnhËn ®­îc vËt phÈm\t"..sItemIds[1]..","..sItemIds[2]..","..sItemIds[3]..","..sItemIds[4]);
	elseif nRet == 2 then
		Msg2Player("MÊt råi "..nCount.." "..strName);
		WriteLog("["..strLog.."]\tAddItemEx:\t"..GetName().."\t phÇn th­ëng r¬i ra\t"..sItemIds[1]..","..sItemIds[2]..","..sItemIds[3]..","..sItemIds[4]);
	end
	return nRet, nItemIdx;
end

--×ª»»Ç®£¬±ÈÈçÊäÈë100323£¬ÔòÊä³ö×Ö·û´®£º1Á½½ð×Ó3Á½Òø½ð23Á½Í­Ç®
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetMoneyString
-- Content			:	²ú³öÌáÊ¾¸úÓÎÏ·ÖÐµÄÒøÁ½¸ñÊ½
-- Return value	:	None
-- Parameter		:
--		* nMoney	(value)	: The unit of param is coin!
-- Example		: 	Í¶Èë  --> 1 ½ð 3 Òø 23 Í­
-- **********************************************************************************************************************
function gf_GetMoneyString(nMoney)
	local nGold = floor(nMoney/10000);
	local nSilver = floor(mod(nMoney,10000)/100)
	local nCopper = mod(nMoney,100);
	local sString = "";
	if nGold > 0 then
		sString = sString..nGold.."vµng"
	end;
	if nSilver > 0 then
		sString = sString..nSilver.." b¹c "
	end;
	if nCopper > 0 then
		sString = sString..nCopper.."®ång <color>"
	end;
	return sString;
end;
--¸ñÊ½»¯£¨Ê¹Ö®¹Ì¶¨³¤¶È£©×Ö·û´®»òÊý×Ö¡£ÀýÈçÊäÈë("123456",3)£¬ÔòÊä³ö"123"£¬ÀýÈçÊäÈë("123456",8)£¬ÔòÊä³ö"123456  "
--Õâ¸öº¯Êý¿ÉÒÔ·½±ãÔÚTalk»òSayÖÐ¶ÔÆë×Ö·û´®£¬bLeftÖ¸×ó¶ÔÆë»¹ÊÇÓÒ¶ÔÆë£¬Ä¬ÈÏÊÇ×ó¶ÔÆë
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_FormatStringLength
-- Content			:	Deal string with some formats
-- Return value	:	string
-- Parameter		:
-- 		* sString (string)		: The string need deal
-- 		* nLength (value)		: Length of string which be returned
-- 		* bLeft (value)			: format string
-- Example		:
-- 			gf_FormatStringLength("abcdef",3,1)	--> abc
--	 		gf_FormatStringLength("abcdef",3)		--> abc
-- 			gf_FormatStringLength("abcdef",8,1)	--> abcdef__	(Align text left)
-- 			gf_FormatStringLength("abcdef",8,2)	--> __abcdef	(Align text right)
-- **********************************************************************************************************************
function gf_FormatStringLength(sString,nLength,bLeft)
	sString = tostring(sString);
	local nStrLen = strlen(sString);
	if nStrLen >= nLength then
		return strsub(sString,1,nLength)
	end;
	for i=1,nLength-nStrLen do
		if bLeft == nil or bLeft == 1 then
			sString = sString.." ";
		else
			sString = " "..sString;
		end;
	end;
	return sString;
end;
--»ñµÃÍæ¼ÒµÄÐÔ±ð³ÆºÅ
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetPlayerSexName
-- Content			:	Create the name of player's sex.
-- Return value	:	string
-- Parameter		:	None
-- Example		:
-- 			gf_GetPlayerSexName ( )
-- **********************************************************************************************************************
function gf_GetPlayerSexName()
	local strSex = ""
	if GetSex() == 1 then
		strSex = "ThiÕu hiÖp"
	elseif GetSex() == 2 then
		strSex = "N÷ hiÖp "
	else
		strSex = "ThiÕu hiÖp/N÷ hiÖp"
	end;
	return strSex;
end;
--µÃµ½Á½¸ö×ø±êÖ®¼äµÄ¾àÀë£¬Èç¹ûµÚÈýµÚËÄ¸ö²ÎÊý²»Ìî£¬ÔòÄ¬ÈÏÊÇÍæ¼ÒÓëÄ³×ø±êµÄ¾àÀë
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_GetDistance
-- Content			:	Count the distance of two coordinates
-- Return value	:	value
-- Parameter	(value)	:
--		* nX 			:
--		* nY 			:
--		* nPosX 	:
--		* nPosY	:
-- Example		:
-- 			local _,nMapX,nMapY = GetNpcWorldPos(nNpcIdx);
--			if gf_GetDistance(nMapX,nMapY) > 10 then
--				Msg2Player("You are far away from the target!");
--				return 0;
--			end
-- **********************************************************************************************************************
function gf_GetDistance(nX,nY,nPosX,nPosY)
	if nPosX == nil or nPosY == nil then
		_,nPosX,nPosY = GetWorldPos();
	end;
	local nDis = floor(sqrt((nPosX-nX)^2+(nPosY-nY)^2));
	return nDis;
end;
--µ÷ÊÔÊ±ÓÃÖ¸Áî£¬nType²ÎÊýÈç¹û²»Ð´»òÎª£°±íÊ¾ÊÇprintÊä³ö£¬·ñÔòÊÇMsg2SubWorldÊä³ö
--Ê¹ÓÃÕâ¸öÖ¸ÁîÐèÒª¶¨ÒåÒ»¸öDEBUG_VERSION³£Á¿£¬1±íÊ¾ÊÇµ÷ÊÔ°æ±¾£¬0±íÊ¾·Çµ÷ÊÔ°æ±¾
function gf_ShowDebugInfor(Arg,nType)
	if Arg == nil then
		Arg = "nil";
	end;
	if DEBUG_VERSION == nil then
		DEBUG_VERSION = 0;
	end;
	if DEBUG_VERSION == 1 then
		if nType == nil or nType == 0 then
			print("\n §iÒu chØnh tin tøc:"..Arg.."\n")
		elseif nType == 1 then
			Msg2SubWorld("ChØnh tin tøc:"..Arg);
		end;
	else	--Èç¹ûÎª·Çµ÷ÊÔ°æ±¾ÔòÎª¼ÇÈÕÖ¾
		WriteLog(Arg);
	end;
end;
--½¡¿µ¾­Ñé×ª»»Îª¾­Ñé
function gf_GoldenExp2Exp(nGoldenExp)
	local nCurrGoldenExp = GetGoldenExp();
	if nCurrGoldenExp < nGoldenExp then
		nGoldenExp = nCurrGoldenExp
	end;
	ModifyGoldenExp(-nGoldenExp);
	ModifyExp(nGoldenExp)
	Msg2Player(nGoldenExp.."®iÓm søc kháe ®· ®æi thµnh"..nGoldenExp.." ®iÓm kinh nghiÖm");
	return nGoldenExp;
end;
--Ïò¶ÓÎéÀïÃæµÄ³ÉÔ±·¢ÏûÏ¢£¬²ÎÊýÒ»ÊÇ×Ö·û´®£¬²ÎÊý¶þ±íÊ¾ÏûÏ¢ÀàÐÍ£¬1ÊÇMsg2Player£¬2ÊÇTalk£¬3ÊÇSay
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_Msg2Team
-- Content			:	Send a message to a team,Msg2Player / Talk / Say
-- Return value	:	string
-- Parameter		:
--		* sMsg (string)		:Content of mesage
--		* nType (value)	: The way of showing the message
--				+ 1 / nil		: Msg2Player
--				+ 2 				: Talk
--				+ 3				: Say
-- Example		:
--		* gf_Msg2Team ("Good luck!", 1)
-- **********************************************************************************************************************
function gf_Msg2Team(sMsg,nType)
	sMsg = tostring(sMsg);
	local nTeamSize = GetTeamSize();
	if nTeamSize <= 1 then	--Èç¹ûÃ»×é¶Ó»ò¶ÓÎéÖ»ÓÐ×Ô¼ºÒ»¸öÈË  (neu ko co to doi)
		if nType == 1 or nType == nil then
			Msg2Player(sMsg);
		elseif nType == 2 then
			Talk(1,"",sMsg);
		elseif nType == 3 then
			Say(sMsg,0);
		end;
		return 0;
	end;
	local nOldPlayerIdx = PlayerIndex;
	for i=1,nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if nType == 1 or nType == nil then
			Msg2Player(sMsg);
		elseif nType == 2 then
			Talk(1,"",sMsg);
		elseif nType == 3 then
			Say(sMsg,0);
		end;
	end;
	PlayerIndex = nOldPlayerIdx;
end;
--¼ì²éÍæ¼ÒÊÇ·ñ¼ÓÈëÁËÁ÷ÅÉ£¨×¢Òâ²»ÊÇÖ¸ÃÅÅÉÅ¶£©
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Check the route of playe is join the faction?
-- Return value	:	value, value
-- Parameter		:	None
-- Example		:
--		* gf_CheckPlayerRoute ( ) :
-- **********************************************************************************************************************
function gf_CheckPlayerRoute()
	local nRoute = GetPlayerRoute();
	--ÊÇÃæÊÇºÏ·¨µÄÁ÷ÅÉ
	local tValidRoute = gf_GetRouteTable();
	for i=1,getn(tValidRoute) do
		if nRoute == tValidRoute[i] then
			return 1,i;
		end;
	end;
	return 0,0;
end;
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Check player is join the route?
-- Return value	:	value, value
-- Parameter		:	None
-- Example		:
--		* gf_CheckPlayerRoute ( ) :
-- **********************************************************************************************************************
--·µ»ØÁ÷ÅÉtable
function gf_GetRouteTable()
	return {2,3,4,6,8,9,11,12,14,15,17,18,20,21,23,25,26,27,29,30};
end;
-- ******************************************* Comment by Vilh *****************************************************
-- Name			: 	gf_CheckPlayerRoute
-- Content			:	Return the number of the GS's Player
-- Return value	:	value
-- Example		:
--		* gf_GetServerPlayerCount ( ) : Return the number of the GS's Player
-- **********************************************************************************************************************
--»ñµÃµ±Ç°·þÎñÆ÷µÄÍæ¼ÒÊýÁ¿
function gf_GetServerPlayerCount()
	local nCount = 0;
	local player = FirstPlayer()
	while (player > 0) do
		nCount = nCount + 1;
		player = NextPlayer(player)
	end
	return nCount;
end;
--¸ù¾ÝÒ»¸öÍæ¼ÒË÷ÒýtableÀ´²Ù×÷Íæ¼Ò
--tbPlayerÎªÍæ¼ÒË÷Òýtable£¬¼´Òª²Ù×÷µÄÍæ¼Ò¼¯Ìå
--funcÊÇÖ´ÐÐº¯Êý£¬tbArgÊÇÖ´ÐÐº¯ÊýµÄÎ¨Ò»²ÎÊý
function gf_OperatePlayers(tbPlayer,func,tbArg)
	local nPlayerCount = getn(tbPlayer);
	local OldPlayerIndex = PlayerIndex;
	if nPlayerCount > 0 then
		for i=1,nPlayerCount do
			PlayerIndex = tbPlayer[i];
			if PlayerIndex > 0 then
				func(tbArg);
			end;
		end;
	end;
	PlayerIndex = OldPlayerIndex;
end;
--¶ÓÎé²Ù×÷
function gf_OperateTeamMember(func,tbArg)
	local tbPlayer = gf_GetAllTeamMember();
	gf_OperatePlayers(tbPlayer,func,tbArg)
end;
--ºÏ²¢table£¬ÀýÈçÁ½¸ötable: {1,2,3},{4,5,6}£¬ºÏ²¢ºó×é³ÉÒ»¸öÐÂµÄtable:{1,2,3,4,5,6}
--´Ëº¯ÊýÒ²¿ÉÒÔÓÃÀ´¸´ÖÆtable
function gf_MergeTable(...)
	local tbTable = {};
	local nIdx = 1;
	for i=1,arg.n do
		for j=1,getn(arg[i]) do
			tbTable[nIdx] = arg[i][j];
			nIdx = nIdx + 1;
		end;
	end;
	return tbTable;
end;
--»ñÈ¡²»Óëµ±Ç°tableË÷ÒýÏàÍ¬µÄËæ»útableË÷Òý
function gf_GetNextRandomIndex(nCurIdx,nTableSize)
	local nRand = random(2,nTableSize);
	return mod(nCurIdx+nRand-2,nTableSize)+1;
end;
--»ñÈ¡Â·ÏßÃû×Ö
function gf_GetRouteName(nRoute)
	nRoute = nRoute or GetPlayerRoute();
	local tRoute = 	--Â·Ïß
	{
		[0] = "V« m«n ph¸i",
		[1] = "ThiÕu L©m",
		[2] = "ThiÕu L©m tôc gia",
		[3] = "ThiÕu L©m thiÒn t¨ng",
		[4] = "ThiÕu L©m vâ t¨ng",
		[5] = "§­êng M«n",
		[6] = "§­êng M«n",
		[7] = "Nga My",
		[8] = "Nga My phËt gia",
		[9] = "Nga My tôc gia",
		[10] = "C¸i Bang",
		[11] = "C¸i Bang TÜnh y",
		[12] = "C¸i Bang ¤ Y",
		[13] = "Vâ §ang",
		[14] = "Vâ §ang ®¹o gia",
		[15] = "Vâ §ang tôc gia",
		[16] = "D­¬ng M«n",
		[17] = "D­¬ng M«n th­¬ng Kþ",
		[18] = "D­¬ng M«n Cung Kþ",
		[19] = "Ngò §éc",
		[20] = "HiÖp §éc",
		[21] = "Tµ §éc",
		[22] = "C«n L«n",
		[23] = "C«n L«n Thiªn S­",
		[24] = "Minh Gi¸o",
		[25] = "Minh Gi¸o Th¸nh Chi?n",
		[26] = "Minh Gi¸o TrËn Binh",
		[27] = "Minh Gi¸o Huy?t Nh©n",
		[28] = "Thóy Yªn",
		[29] = "Thóy Yªn Vò N÷",
		[30] = "Thóy Yªn Linh N÷",
	}
	if nRoute < 0 or nRoute > getn(tRoute) then
		return "Kh«ng râ h­íng";
	end;
	return tRoute[nRoute];
end;
--»ñµÃÃÅÅÉÃû
function gf_GetFactionName(nFac)
	nFac = nFac or GetPlayerFaction();
	local tFaction = --ÃÅÅÉ
	{
		[0] = "V« m«n ph¸i",
		[1] = "ThiÕu L©m",
		[2] = "Vâ §ang",
		[3] = "Nga My",
		[4] = "C¸i Bang",
		[5] = "§­êng M«n",
		[6] = "D­¬ng M«n",
		[7] = "Ngò §éc",
		[8] = "C«n L«n",
		[9] = "Minh gi¸o",
		[10] = "Thóy Yªn",
	}
	if nFac < 0 or nFac > getn(tFaction) then
		return "Kh«ng râ m«n ph¸i";
	end;
	return tFaction[nFac];
end;
--°ÑÒ»¸öÖµÏÞ¶¨ÔÚÄ³¸öÇø¼äÄÚ
function gf_MinMax(nNum,nMin,nMax)
	nNum = max(nNum,nMin);
	nNum = min(nNum,nMax);
	return nNum;
end;
--·â×°ºÍÔö¼Ó¾­Ñéº¯Êý£¬´øÏµÍ³ÏûÏ¢
function gf_ModifyExp(nExp)
	ModifyExp(nExp);
	Msg2Player(format("Thu ®­îc %d ®iÓm kinh nghiÖm",nExp));
end;

--½â°ütable¡£
--²ÎÊý1£ºÊäÈëtable
--²ÎÊý2£º¿ªÊ¼Î»ÖÃ¡£Ä¬ÈÏÖµÎª1
--²ÎÊý3£º½áÊøÎ»ÖÃ¡£Ä¬ÈÏÖµÎªtable´óÐ¡
function gf_UnPack(tbTable,nStartIdx,nEndIdx)
	local nSize = getn(tbTable);
	nStartIdx = nStartIdx or 1;
	nEndIdx = nEndIdx or nSize;
	if tbTable[nStartIdx] and nStartIdx <= nEndIdx then
		return tbTable[nStartIdx],gf_UnPack(tbTable,nStartIdx+1,nEndIdx);
	end;
end;
--´¦Àí×Ö·û´®ÑÕÉ«
function gf_ColorReplace(szMsg)
	szMsg = gsub(szMsg,"<>","<color>");
	szMsg = gsub(szMsg,"<r>","<color=red>");
	szMsg = gsub(szMsg,"<y>","<color=yellow>");
	szMsg = gsub(szMsg,"<g>","<color=green>");
	szMsg = gsub(szMsg,"<p>","<color=purple>");
	return szMsg;
end;
--º¯ÊýÃû³Æ£ºNPCË÷ÒýÖµÉè¶¨
--¹¦        ÄÜ£ºÖ±½ÓÉè¶¨NPCË÷ÒýÎ»ÖÃµÄÖµ
--1,4,5,6Î»ÖÃ¼ÇµÄÊýÖµ¿ÉÒÔ´óÓÚ99,ÆäËüµÄ²»ÐÐ
--1ÊÇNPCµÄÉúÃüÖµ£¬²»ÄÜÐ¡ÓÚµÈÓÚ0,·ñÔòNPC»á¡°ËÀµô¡±
function gf_SetUnitCurState(Npc_index,att_seq,number)
	if number > 99 and att_seq ~= 1 and att_seq ~= 4 and att_seq ~= 5 and att_seq ~= 6 then
		print("ThiÕt lËp trÞ sè NPC nhÇm: VÞ trÝ:"..att_seq.."TrÞ:"..number)
		return 0
	end
	local num_save = GetUnitCurStates(Npc_index,att_seq)
	num_save = number - num_save
	AddUnitStates(Npc_index,att_seq,num_save)
	return 1
end

function gf_InRange(tbRange,nValue)
	for i,v in pairs(tbRange) do
		if nValue >= v[1] and nValue <= v[2] then
			return 1;
		end;
	end;
	return 0;
end;
--ÒÆ³ýËùÓÐÁÙÊ±State£¬IDÎª2600001ÖÁ2600010
function gf_RemoveTempState()
	for i=2600001,2600020 do
		RemoveState(i);
	end;
end
--¸ù¾ÝÎïÆ·Ë÷ÒýÉèÖÃÎïÆ·µÄ´æÔÚÊ±¼ä
--Èç¹û²ÎÊýÊýÁ¿Îª2,Ôò¹¦ÄÜÈçSetItemExpireTime
--Èç¹û²ÎÊýÊýÁ¿´óÓÚ2,ÔòÎªÖ±½ÓÉèÖÃÎïÆ·µÄµ½ÆÚÊ±¼ä
function gf_SetItemExpireTime(nItem, ...)
	if nItem == nil or nItem == 0 then
		return 0;
	end
	local nArgSize = getn(arg);
	if nArgSize == 1 then
		SetItemExpireTime(nItem,arg[1]);
		return 0;
	end;

	for i=1, 6 do
		arg[i] = arg[i] or 0;
	end;
	local nCurTime = GetTime();
	local nThatTime = MkTime(arg[1],arg[2],arg[3],arg[4],arg[5],arg[6]);
	local nTimePassed = nThatTime - nCurTime;
	if nTimePassed < 0 then
		nTimePassed = 0;
	end;
	SetItemExpireTime(nItem,nTimePassed);
	return nTimePassed;
end;
--»ñµÃµ±Ç°µØÍ¼ID
function gf_GetCurMapID()
	return SubWorldIdx2ID(SubWorld);
end;
--»ñµÃÒ»¸öÊý×é£¬ÈçÊäÈë1,4,6,7£¬·µ»ØÒ»¸ötable = {1,4,6,7}
function gf_GetDataTable(...)
	local t = {};
	for i=1,arg.n do
		t[i] = arg[i];
	end;
	return t;
end;
--¸ÅÂÊÅÐ¶Ï£¬Ö§³Ö¸¡µãÊý¸ÅÂÊ
function gf_ProbabilityJudge(nProbability)
	local StringFind = function(sString,nTag)
		for i=1,strlen(sString) do
			if strsub(sString,i,i) == nTag then
				return i;
			end;
		end;
		return 0;
	end;
	if nProbability > 100 or nProbability < 0 then
		return 0;
	end;
	local nDotPos = StringFind(tostring(nProbability),".")
	local nStrLen = strlen(tostring(nProbability));
	local nRandomNum = random(1,100*(10^(nStrLen-nDotPos)));
	if nRandomNum <= nProbability*(10^(nStrLen-nDotPos)) then
		return 1;
	else
		return 0;
	end;
end;
--¸´ÖÆÒ»¸ötable
--orgÎªÔ´table£¬desÎª¸´ÖÆ³öÀ´µÄÐÂtable
function gf_CopyTable(org,des)
	des = des or {};
	local i,j
	for i,j in org do
		if(type(j)=="table") then
			if(not des[i]) then
				des[i]={}
				gf_CopyTable(j,des[i])
			end
		else
			if(not des[i]) then
				des[i]=j
			end
		end
	end
	return des;
end
--ÆÁ±ÎÕòÅÉ¼¼ÄÜ
--nTypeÎª1Ê±±íÊ¾ÆÁ±Î£¬Îª0Ê±±íÊ¾´ò¿ª
function gf_ForbidFactionSkill(nType)
	local nRoute = GetPlayerRoute();
	if nRoute == nil then
		return 0;
	end;
	local tbSkillID =
	{
		[0] = 0,
		[1] = 0,
		[2] = 32,	--ÉÙÁÖË×¼Ò,Ò×½î¾­
		[3] = 57,	--ÉÙÁÖìøÉ®,Ï´Ëè¾­
		[4] = 44,	--ÉÙÁÖÎäÉ®,ÈçÀ´ÉñÕÆ
		[5] = 0,			--ÌÆÃÅ
		[6] = 74,	--ÌÆÃÅ,ÎüÐÇÕó
		[7] = 0,			--¶ëáÒ
		[8] = 89,	--¶ëáÒ·ð¼Ò,ÍòÏàÉñ¹¦
		[9] = 102,	--¶ëáÒË×¼Ò,ÌìÒôÕò»êÇú
		[10] = 0,			--Ø¤°ï
		[11] = 113,--Ø¤°ï¾»ÒÂ,½µÁúÊ®°ËÕÆ
		[12] = 124,--Ø¤°ïÎÛÒÂ,´ò¹·¹÷Õó
		[13] = 0,			--Îäµ±
		[14] = 146,--Îäµ±µÀ¼Ò,ÎÞÉÏÌ«¼«½£
		[15] = 159,--Îäµ±Ë×¼Ò,Ì«¼«Éñ¹¦
		[16] = 0,			--ÑîÃÅ
		[17] = 732,--ÑîÃÅÇ¹Æï,Á¬»·×êÁúÇ¹
		[18] = 745,--ÑîÃÅ¹­Æï,°ÔÍõÏè·ï¼ý
		[19] = 0,			--Îå¶¾
		[20] = 775,--Îå¶¾Ð°ÏÀ,ÎÞÌìÄ§¹¦
		[21] = 774,--Îå¶¾¹ÆÊ¦,ÎÞÓ°Ä§¹Æ
		[23] = 1032,--ÌìÊ¦£¬ÎÞ¼«·çÀ×¾÷
		[25] = 1066,
		[26] = 1096,
		[27] = 1213,
		[29] = 1196,--ÎèÅ®£¬ð½·ï¾ÅÌì
		[30] = 1230,--ÁéÅ®£¬¾ÅÎ²»¨ÏÉ¾÷
	}
	local nSkillID = tbSkillID[nRoute];
	if nSkillID ~= 0 then
		if nType == 0 then
			UnBlockSkill(nSkillID);
		else
			BlockSkill(nSkillID);
		end;
	end;
end;
--½áºÏSay£¬Talk£¬MsgÈýÕß
--nTypeÎª1Ê±ÓÃSay£¬Îª2Ê±ÓÃTalk£¬Ä¬ÈÏÖµÎª1
function gf_ShowMsg(szMsg,nType,nPIdx)
	local nOldPIdx = PlayerIndex;
	nType = nType or 1;
	PlayerIndex = nPIdx or PlayerIndex;
	if nType == 1 then
		Say(szMsg,0);
	else
		Talk(1,"",szMsg);
	end;
	gf_Msg2Player(szMsg);
	PlayerIndex = nOldPIdx;
end;
--·â±ÕµÄMsg2Player£¬È¥µôÑÕÉ«´¦Àí×Ö·û
function gf_Msg2Player(szMsg,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	szMsg = sf_RemoveTag(szMsg,"<",">");
	Msg2Player(szMsg);
	PlayerIndex = nOldPIdx;
end;
--ÊäÈëÈÕÆÚÊý×Ö£º2008072808
--·µ»Ø2008,7,28,8
--ÓÃÓÚÏÔÊ¾ÈÕÆÚ£º2008Äê7ÔÂ28ÈÕ8Ê±
function gf_GetDateData(nDate)
	local nYear = tonumber(strsub(nDate,1,4));
	local nMonth = tonumber(strsub(nDate,5,6));
	local nDay = tonumber(strsub(nDate,7,8));
	local nHour = tonumber(strsub(nDate,9,10));
	return nYear or 0,nMonth or 0,nDay or 0,nHour or 0;
end;
--·â×°µÄWriteLog
--ÔÚÍæ¼ÒË÷ÒýÓÐÐ§µÄÇé¿öÏÂÒª¼ÇÂ¼Íæ¼ÒµÄÒ»Ð©Ïà¹ØÐÅÏ¢
function gf_WriteLog(szHead,szEvenDescribe,nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	if not PlayerIndex then	--Èç¹ûÃ»ÓÐÍæ¼ÒË÷Òý
		WriteLog("["..szHead.."]:"..szEvenDescribe);
	else
		WriteLog("["..szHead.."]: Tµi kho¶n:"..GetAccount()..",Nh©n vËt:"..GetName()..",CÊp:"..GetLevel()..",M«n ph¸i:"..GetPlayerRoute()..",ThÓ h×nh:"..GetBody()..",Miªu t¶:"..szEvenDescribe);
	end;
	PlayerIndex = nOldPIdx;
end;
--»ñµÃÒ»¸ö±ê×¼table:{1,2,3,4,5,.....n,n+1,n+2}
function gf_GetNormalTable(nSize)
	local tbRet = {};
	for i=1,nSize do
		tbRet[i] = i;
	end;
	return tbRet;
end;

--ÐÞ¸ÄÄ³¸ö±äÁ¿µÄÖµ£¨Æ«ÒÆÁ¿£©
function gf_ModifyTask(nTaskID, nChange, nAccessCode)
	nTaskID = nTaskID or 0
	nChange =  nChange or 0
	if nChange ~= 0 then
		SetTask(nTaskID, GetTask(nTaskID) + nChange, nAccessCode)
	end
end

-------------------------------------------------------------------
--ÉèÖÃÄ³¸öÈÎÎñ±äÁ¿µÄ×Ö½Ú
function gf_SetTaskByte(nTaskID,nByte,nValue,nAccess)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskByte nValue > 255 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SetByte(GetTask(nTaskID),nByte,nValue),nAccess);
end;
--»ñµÃÄ³¸öÈÎÎñ±äÁ¿µÄÄ³¸ö×Ö½ÚµÄÖµ
function gf_GetTaskByte(nTaskID,nByte)
	return GetByte(GetTask(nTaskID),nByte);
end;

function gf_SafeSetTaskByte(nTaskID,nByte,nValue,nAccess)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskByte nValue > 255 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SafeSetByte(GetTask(nTaskID),nByte,nValue),nAccess);
end;
--»ñµÃÄ³¸öÈÎÎñ±äÁ¿µÄÄ³¸ö×Ö½ÚµÄÖµ
function gf_SafeGetTaskByte(nTaskID,nByte)
	return SafeGetByte(GetTask(nTaskID),nByte);
end;
--------------------------------
--ÉèÖÃÄ³¸öÁÙÊ±ÈÎÎñ±äÁ¿µÄ×Ö½Ú
function gf_SetTaskTempByte(nTaskID,nByte,nValue)
	if not nValue or nValue > 255 then
		print("ERROR:gf_SetTaskTempByte nValue > 255 or nil");
	end
	SetTaskTemp(nTaskID,SetByte(GetTaskTemp(nTaskID),nByte,nValue));
end;
--»ñµÃÄ³¸öÁÙÊ±ÈÎÎñ±äÁ¿µÄÄ³¸ö×Ö½ÚµÄÖµ
function gf_GetTaskTempByte(nTaskID,nByte)
	return GetByte(GetTaskTemp(nTaskID),nByte);
end;
--=======================================================
--ÉèÖÃÄ³¸öÈÎÎñ±äÁ¿µÄ×Ö½Ú
function gf_SetTaskBit(nTaskID,nBit,nValue,nAccess)
	if not nValue or nValue > 1 then
		print("ERROR:gf_SetTaskBit nValue > 1 or nil");
	end
	nAccess = nAccess or 0;
	SetTask(nTaskID,SetBit(GetTask(nTaskID),nBit,nValue),nAccess);
end;
--»ñµÃÄ³¸öÈÎÎñ±äÁ¿µÄÄ³¸ö×Ö½ÚµÄÖµ
function gf_GetTaskBit(nTaskID,nBit)
	return GetBit(GetTask(nTaskID),nBit);
end;
--------------------------------
--ÉèÖÃÄ³¸öÁÙÊ±ÈÎÎñ±äÁ¿µÄÎ»
function gf_SetTaskTempBit(nTaskID,nBit,nValue)
	if not nValue or nValue > 1 then
		print("ERROR:gf_SetTaskTempBit nValue > 1 or nil");
	end
	SetTaskTemp(nTaskID,SetBit(GetTaskTemp(nTaskID),nBit,nValue));
end;
--»ñµÃÄ³¸öÁÙÊ±ÈÎÎñ±äÁ¿µÄÄ³¸öÎ»µÄÖµ
function gf_GetTaskTempBit(nTaskID,nBit)
	return GetBit(GetTaskTemp(nTaskID),nBit);
end;
--============================================================
--»ñÈ¡ÈÎÎñ±äÁ¿ÈÎÒâÁ¬Ðø×Ö½ÚµÄÖµ
function gf_GetMyTaskByte(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskByte(nTask,i) * (256^(i-nStart));
	end
	return nCount;
end
--Áé»îÊ¹ÓÃÈÎÎñ±äÁ¿ÈÎÒâÁ¬Ðø×Ö½Ú
function gf_SetMyTaskByte(nTask,nStart,nEnd,nValue,nAccess)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	nAccess = nAccess or 0;
	local	nCount = (2^((nEnd - nStart + 1) * 8)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskByte(%d,%d,%d) nValue %d < %d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskByte(nTask,i,mod(nValue,256),nAccess);
		nValue = floor(nValue / 256);
	end
end
--================================================================
--»ñÈ¡ÈÎÎñ±äÁ¿ÈÎÈÎÒâÁ¬ÐøÎ»µÄÖµ
function gf_GetMyTaskBit(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskBit(nTask,i) * (2^(i-nStart));
	end
	return nCount;
end
--Áé»îÊ¹ÓÃÈÎÎñ±äÁ¿ÈÎÒâÁ¬ÐøÎ»
function gf_SetMyTaskBit(nTask,nStart,nEnd,nValue,nAccess)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	nAccess = nAccess or 0;
	local	nCount = (2^(nEnd - nStart + 1)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskBit(%d,%d,%d) nValue %d < %d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskBit(nTask,i,mod(nValue,2),nAccess);
		nValue = floor(nValue / 2);
	end
end
--============================================================
--ÁÙÊ±ÈÎÎñ±äÁ¿´¦Àí
--»ñÈ¡ÈÎÎñ±äÁ¿ÈÎÒâÁ¬Ðø×Ö½ÚµÄÖµ
function gf_GetMyTaskTempByte(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskTempByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskTempByte(nTask,i) * (256^(i-nStart));
	end
	return nCount;
end
--Áé»îÊ¹ÓÃÈÎÎñ±äÁ¿ÈÎÒâÁ¬Ðø×Ö½Ú
function gf_SetMyTaskTempByte(nTask,nStart,nEnd,nValue)
	if not nStart or not nEnd or nStart < 1 or nStart > 4 or nEnd < 1 or nEnd > 4 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskTempByte(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local	nCount = (2^((nEnd - nStart + 1) * 8)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskTempByte(%d,%d,%d) nValue %d < %d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskTempByte(nTask,i,mod(nValue,256));
		nValue = floor(nValue / 256);
	end
end
--================================================================
--»ñÈ¡ÈÎÎñ±äÁ¿ÈÎÈÎÒâÁ¬ÐøÎ»µÄÖµ
function gf_GetMyTaskTempBit(nTask,nStart,nEnd)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_GetMyTaskTempBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local nCount = 0;
	for i = nStart, nEnd do
		nCount = nCount + gf_GetTaskTempBit(nTask,i) * (2^(i-nStart));
	end
	return nCount;
end
--Áé»îÊ¹ÓÃÈÎÎñ±äÁ¿ÈÎÒâÁ¬ÐøÎ»
function gf_SetMyTaskTempBit(nTask,nStart,nEnd,nValue)
	if not nStart or not nEnd or nStart < 1 or nStart > 32 or nEnd < 1 or nEnd > 32 or nStart > nEnd then
		print(format("ERROR:gf_SetMyTaskTempBit(%d,%d,%d)",nTask,nStart,nEnd));
		return -1;
	end
	local	nCount = (2^(nEnd - nStart + 1)) - 1;
	if nCount < nValue then
		print(format("ERROR:gf_SetMyTaskTempBit(%d,%d,%d) nValue %d < %d",nTask,nStart,nEnd,nValue,nCount));
		return -2;
	end	
	for i = nStart, nEnd do
		gf_SetTaskTempBit(nTask,i,mod(nValue,2));
		nValue = floor(nValue / 2);
	end
end
-----------------------------------------------------------------------
function gf_GetExtPointByte(nEp, nByte)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	return GetByte(GetExtPoint(nEp), nByte)
end
function gf_SetExtPointByte(nEp, nByte, nValue)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	local nNum = SetByte(GetExtPoint(nEp), nByte, nValue) - GetExtPoint(nEp)
	if nNum >= 0 then
		if AddExtPoint(nEp, nNum) == 1 then
			return 1
		end
	else
		nNum = 0 - nNum
		if PayExtPoint(nEp, nNum) == 1 then
			return 1
		end
	end
	return 0
end
function gf_GetExtPointBit(nEp, nBit)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	return GetBit(GetExtPoint(nEp), nBit)
end
function gf_SetExtPointBit(nEp, nBit, nValue)
	if nEp < 0 or nEp > 6 then
		return 0
	end
	if nValue == 0 and gf_GetExtPointBit(nEp, nBit) == 1 then
		PayExtPoint(nEp, GetExtPoint(nEp) - SetBit(GetExtPoint(nEp), nBit, 0))
		return 1
	elseif nValue == 1 and gf_GetExtPointBit(nEp, nBit) == 0 then
		AddExtPoint(nEp, SetBit(GetExtPoint(nEp), nBit, 1) - GetExtPoint(nEp))
		return 1
	end
	return 0
end
-----------------------------------------------------------------------------
--gf_GetRandItemByTable()
--º¯ÊýËµÃ÷£ºÈ¡µÃËæ»úÎïÆ· by baiyun 2009.11.17
--²ÎÊý£ºITEM_PARAM¡¡Ò»¸ö¶þÎ¬Êý×é£¬Ã¿Ò»¸öÔªËØµÄµÚÒ»¸öÖµÊÇÎïÆ·Ãû£¬µÚ¶þ¸öÖµ
--			ÊÇÎïÆ·³öÏÖµÄ¸ÅÂÊ * ¸ÅÂÊµÄ»ùÊý
--²ÎÊý£ºnMax ¸ÅÂÊµÄ»ùÊý£¬Èç100¡¢1000µÈ
--²ÎÊý£ºnDefault¡¡Ä¬ÈÏ·µ»ØµÄÎïÆ·Ë³Ðò
--·µ»ØÖµ£º·µËæ»úµÃµ½µÄÎïÆ·ÔÚÊý×éÖÐµÄÎ»ÖÃ£¬Èç¹ûÃ»ÓÐµÃµ½ºÏÀí·¶Î§ÄÚµÄÎïÆ·Î»ÖÃ£¬
--				Ôò·µ»ØµÚÒ»¸öÎïÆ·
--¾ÙÀý£ºITEM_PARAM = {{"ÉñÅ©µ¤", 900}, {"°×¾ÔÍè", 100}}
--			nMax = 1000
------------------------------------------------------------------------------
function gf_GetRandItemByTable(ITEM_PARAM, nMax, nDefault)
	local nPos = 0;
	local nRand = random(1, nMax);
	for i = 1, getn(ITEM_PARAM) do
		if nRand > nPos and nRand <= nPos + ITEM_PARAM[i][2] then
			return i;
		end
		nPos = nPos + ITEM_PARAM[i][2];
	end
	return nDefault;
end

function GetRandByID(tClause)
	local nMax = 0;
	for i = 1, getn(tClause) do
		nMax = nMax + tClause[i][2];
	end
	
	local rnd = random(1, nMax);
	for i = 1, getn(tClause) do
		rnd = rnd - tClause[i][2];
		if rnd <= 0 then
			return i,tClause[i][1];
		end
	end
end

--Ô½ÄÏ°æ×¨ÓÃµÄÈÕÖ¾¼ÇÂ¼¸ñÊ½
function gf_WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
	local event_name = szevent_name or ""
	local action = szaction or ""
	local quantity = szquantity or ""
	local item_name = szitem_name or ""
	local item_code = szitem_code or ""
	local tong_name = sztong_name or ""
	local bug_desc = szbug_desc or ""
	local string_1 = szstring_1 or ""
	local string_2 = szstring_2 or ""
	local string_3 = szstring_3 or ""
	local reborn = gf_GetTaskByte(1538, 1) or ""
	local rolelevel = GetLevel() or ""
	local rank = GetTask(704) or ""
	local petlevel = 0
	if GetTask(TASK_VNG_PET) ~= nil then
		petlevel = mod(GetTask(TASK_VNG_PET), 100) or ""
	end
	local petid = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE)
	local pettype = ""
	if petlevel > 0 then
		if VET_201003_TONGBAN_STR_MODE_NAME[petlevel] then
			if VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] then
				pettype = VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] or ""
			end
		end
	end
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);

	local strLogs = "["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3.."\t"..reborn.."\t"..rolelevel.."\t"..rank.."\t"..petlevel.."\t"..pettype.."\t"..szCIP;

	if strLogs ~= "" then
		WriteLog(strLogs);
	else
		WriteLog("Error call WriteLogEx");
	end
end

function WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
	gf_WriteLogEx(szevent_name,szaction,szquantity,szitem_name,szitem_code,sztong_name,szbug_desc,szstring_1,szstring_2,szstring_3)
end
--Ô½ÄÏ°æ»î¶¯¾­³£ÓÃµ½µÄ×öÊ¦ÃÅÈÎÎñµÃµ½Ä³ÎïÆ·£¬Ã¿¸öµÈ¼¶Ã¿´Î»ñµÃµÄÊýÁ¿²»Í¬£¬¶øÇÒÃ¿ÌìÓÐÊýÁ¿ÏÞÖÆ£¬ÐèÒªÔÚµ÷ÓÃÖ®ÍâÅÐ¶Ï±³°üºÍ¸ºÖØ
--²ÎÊý£º
--tbItemIds ÎïÆ·µÄid = {id1, id2, id3}
--szItemName ÎïÆ·µÄÃû×Ö
--LevelAwardListTable£¬ÊÇµÚ¼¶¶ÔÓ¦ÄÜ¹»µÃµ½¶àÉÙ¸öÎïÆ·,Èç£º
--LevelAwardListTable = {
--	[1] = 10,
--	[2] = 10,
--	[3] = 10,
--nMaxCountÃ¿Ìì×î¶à»ñµÃ¶àÉÙ´Î
--nTaskGetDateÈÎÎñ±äÁ¿£ºµ±Ç°»ñµÃ½±ÀøµÄÈÕÆÚ
--nTaskGetCountÈÎÎñ±äÁ¿£ºµ±Ç°ÒÑ¾­»ñµÃ¶àÉÙ´Î
--szLogTitle
--nStartDate¿ªÊ¼Ê±¼ä tonumber(date("%y%m%d"))Èç¹ûÌî0»ò²»Ìî±íÊ¾Ã»ÓÐ¿ªÊ¼Ê±¼ä
--nEndDate½áÊøÊ±¼ä Èç¹ûÌî0»ò²»Ìî±íÊ¾Ã»ÓÐ½áÊøÊ±¼ä
function gf_EventFactionAward(tbItemIds, szItemName, LevelAwardListTable, nMaxCount, nTaskGetDate, nTaskGetCount, szLogTitle)
    local nDate = tonumber(date("%y%m%d"));
    local tbLogActions = {
        [1] = "NhiÖm vô s­ m«n".." 1x",
        [2] = "NhiÖm vô s­ m«n".." 2x",
        [3] = "NhiÖm vô s­ m«n".." 3x",
        [4] = "NhiÖm vô s­ m«n".." 4x",
        [5] = "NhiÖm vô s­ m«n".." 5x",
        [6] = "NhiÖm vô s­ m«n".." 6x",
        [7] = "NhiÖm vô s­ m«n".." 7x",
        [8] = "NhiÖm vô s­ m«n".." 8x",
        [9] = "NhiÖm vô s­ m«n".." 9x",
    }
    local nCount = LevelAwardListTable[floor(GetLevel() / 10)];
    if GetTask(nTaskGetDate) < nDate then
        SetTask(nTaskGetCount, 0);
    end
    if GetTask(nTaskGetCount) < nMaxCount then
        tinsert(tbItemIds, nCount);
        if gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1) == 1 then
            SetTask(nTaskGetDate, nDate);
	    SetTask(nTaskGetCount, GetTask(nTaskGetCount) + 1);
        end
    end
end

--»î¶¯¾­³£ÓÃµ½µÄ×öÉÌ»áÈÎÎñµÃµ½Ä³ÎïÆ·£¬Ã¿¸öµÈ¼¶Ã¿´Î»ñµÃµÄÊýÁ¿²»Í¬£¬¶øÇÒÃ¿ÌìÓÐÊýÁ¿ÏÞÖÆ£¬ÐèÒªÔÚµ÷ÓÃÖ®ÍâÅÐ¶Ï±³°üºÍ¸ºÖØ
--²ÎÊý£º
--tbItemIds ÎïÆ·µÄid = {id1, id2, id3}
--szItemName ÎïÆ·µÄÃû×Ö
--LevelAwardListTable£¬ÊÇµÚ¼¶¶ÔÓ¦ÄÜ¹»µÃµ½¶àÉÙ¸öÎïÆ·,Èç£º
--LevelAwardListTable = {
--	[1] = 10,
--	[2] = 10,
--	[3] = 10,
--nTaskGetDateÈÎÎñ±äÁ¿£ºµ±Ç°»ñµÃ½±ÀøµÄÈÕÆÚ
--nTaskGetCountÈÎÎñ±äÁ¿£ºµ±Ç°ÒÑ¾­»ñµÃ¶àÉÙ´Î
--szLogTitle
--nBeginTime ¿ªÊ¼¸ø½±ÀøµÄ´ÎÊý
--nEndTime ½áÊø¸ø½±ÀøµÄ´ÎÊý
function gf_EventCOFCAward(tbItemIds, szItemName, LevelAwardListTable, nBeginTime, nEndTime, nTaskGetDate, nTaskGetCount, szLogTitle)
    local nDate = tonumber(date("%y%m%d"));
    local tbLogActions = {
        [1] = "NhiÖm vô Th­¬ng héi".." 1x",
        [2] = "NhiÖm vô Th­¬ng héi".." 2x",
        [3] = "NhiÖm vô Th­¬ng héi".." 3x",
        [4] = "NhiÖm vô Th­¬ng héi".." 4x",
        [5] = "NhiÖm vô Th­¬ng héi".." 5x",
        [6] = "NhiÖm vô Th­¬ng héi".." 6x",
        [7] = "NhiÖm vô Th­¬ng héi".." 7x",
        [8] = "NhiÖm vô Th­¬ng héi".." 8x",
        [9] = "NhiÖm vô Th­¬ng héi".." 9x",
    }
    local nCount = LevelAwardListTable[floor(GetLevel() / 10)];
    if GetTask(nTaskGetDate) < nDate then   --ÄÜ½øÈë¸Ãº¯Êý±ØÈ»ÊÇÒ»´ÎÉÌ»áÈÎÎñÒÑ¾­Íê³É£¬ÐÂµÄÒ»ÌìÇåÁã
        SetTask(nTaskGetDate, nDate);
        SetTask(nTaskGetCount, 0);
    end
	SetTask(nTaskGetCount, GetTask(nTaskGetCount) + 1); --¼ÇÂ¼ÉÌ»áÈÎÎñÍê³ÉµÄ´ÎÊý
	if nBeginTime < 0 or nEndTime < 0 then          --·Ç·¨Öµ
	    return 0;
	end
	if nBeginTime == 0 and nEndTime == 0 then       --ÎÞÏÞ¸ø
	    tinsert(tbItemIds, nCount);
        gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
        return 1;
    end
    if nBeginTime == 0 and nEndTime ~= 0 then       --´ÓµÚÒ»´Îµ½µÚnEndTime´Î
        if GetTask(nTaskGetCount) <= nEndTime then
	        tinsert(tbItemIds, nCount);
            gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
            return 1;
        end
    end
    if nBeginTime ~= 0 and nEndTime == 0 then       --´ÓµÚnBeginTime´Îµ½ÎÞÏÞ´Î
        if GetTask(nTaskGetCount) >= nBeginTime then
            tinsert(tbItemIds, nCount);
            gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
            return 1;
        end
    end                                             --´ÓµÚnBeginTime´Îµ½nEndTime´Î
    if GetTask(nTaskGetCount) <= nEndTime and GetTask(nTaskGetCount)>= nBeginTime then
        tinsert(tbItemIds, nCount);
        gf_AddItemEx2(tbItemIds, szItemName, szLogTitle, tbLogActions[GetLevel() / 10], 0, 1);
    end
    return 1;
end


--Ô½ÄÏ°æ³£ÓÃµ½µÄÍ¨¹ý²Ø½£É½×¯Ä³¹Ø¸øÄ³ÖÖÎïÆ·, ±£Ö¤ÔÚÍâ²¿ÅÐ¶ÏÊ±¼ä²ÅÐÐ
--²ÎÊý£º
--StageAwardListTable¹ýÃ¿¹Ø¸øÎïÆ·µÄÊýÁ¿StageAwardListTable = {[0] = 20, [1] = 20, [4] = 40};
--nTaskRecordChance¼ÇÂ¼µÚ¼¸´Î½øÈë²Ø½£µÄÈÎÎñ±äÁ¿
--nStageµ±Ç°ÊÇµÚ¼¸¹Ø
function gf_EventCangJiangAward(tbItemIds, szItemName, StageAwardListTable, nStage, szLogTitle)
    local tbMap = {
        [1] = 0,
        [2] = 1,
        [3] = 2,
        [4] = 3,
        [5] = 4,
        [8] = 5,
        [9] = 6,
        [10] = 7,
    };
    local strFullLogTitle = szLogTitle;
    local szLogAction = format("V­ît ¶i %d tµng kiÕm nhËn ®­îc %s", tbMap[nStage], szItemName); --Í¨¹ýµÚ0¹Ø¼´¸Õ¸Õ½øÈëµÚÒ»¹Ø
    local nOldPlayer = PlayerIndex;
    for i = 1, GetTeamSize() do
        PlayerIndex = GetTeamMember(i);
	if PlayerIndex > 0 and StageAwardListTable[tbMap[nStage]] then
    		if GetTask(nTaskRecordChance) > 1 then---ÊÕ·Ñ½øÈë
  	    gf_AddItemEx2({tbItemIds[1], tbItemIds[2], tbItemIds[3], StageAwardListTable[tbMap[nStage]]}, szItemName, strFullLogTitle, szLogAction, 0, 1);
		end
	end
    end
    PlayerIndex = nOldPlayer;
end

--¼ÆËãRand½±Àø±í»ùÊýÖµ
function gf_SumRandBase(tRandList)
	if not tRandList or getn(tRandList) <= 0 then
		return 0;
	end
	local nRandBase = 0;
	for i = 1, getn(tRandList) do
		nRandBase = nRandBase + tRandList[i][2];
	end
	return nRandBase;
end

--¿ªÏä×Ó¸øËæ»ú½±Àø,µ÷ÓÃ´Ëº¯ÊýÇ°ÇëÏÈÅÐ¶Ï±³°üºÍ¸ºÖØ
--²ÎÊý£ºRandAwardList =
--{ÀàÐÍ=1(ÎïÆ·), ¸ÅÂÊ, Ãû×Ö, {id1,id2,id3,count}, ´æÔÚÊ±¼ä(ÎÞÏÞÖÆÌî0), £¨ÌØÊâ´¦Àí0ÎªÎÞÌØÊâ´¦Àí1Îª°´ÌåÐÍ¸ø2Îª°´Á÷ÅÉ¸ø£©}
--µ±µÚÁù¸ö²ÎÊýÊÇ1Ê±£¬ÊÇ°´ÌåÐÍ¸ø£¬ËùÒÔ²ÎÊý4µÄÊÇ¸ötable£¬ÆäÄÚÈÝÊÇ
--                                                     {
--                                                      {"ÎïÆ·Ãû×Ö", {id1,id2,id3,count}}, --ÌåÐÍ1
--                                                      {"ÎïÆ·Ãû×Ö", {id1,id2,id3,count}}, --ÌåÐÍ2
--                                                      {"ÎïÆ·Ãû×Ö", {id1,id2,id3,count}}, --ÌåÐÍ3
--                                                      {"ÎïÆ·Ãû×Ö", {id1,id2,id3,count}}, --ÌåÐÍ4
--                                                     }
--µ±µÚÁù¸ö²ÎÊýÊÇ2Ê±£¬ÊÇ°´Á÷ÅÉ¸ø£¬ËùÒÔ²ÎÊý4Ò²ÊÇ¸ötable£¬µ«ÊÇ´ËÊ±ÒªÉèÒ»ÏÂµÚ7¸ö²ÎÊý£¬ÓÃÀ´±íÊ¾Èç¹ûÍæ¼ÒÃ»ÓÐÈëÁ÷ÅÉ¸øÒ»¸ö±ðµÄÎïÆ·µÄË÷Òý£¬ÆäÄÚÈÝÊÇ
--                                                     {
--                                                      --Á÷ÅÉ¶ÔÓ¦ÎïÆ·µÄÁÐ±í
--                                                        [1] = {
--                                                        {"Ãû×Ö"£¬ ¸ÅÂÊ, {id1,id2,id3,ÊýÁ¿...}},--ÓÉÓÚÄ³Ð©Á÷ÅÉÓÐ¶àÖÖ¶«Î÷£¬ËùÒÔÕâÀï»¹ÊÇÒªËæ»úÒ»ÏÂ
--                                                        {"Ãû×Ö"£¬ ¸ÅÂÊ, {id1,id2,id3,ÊýÁ¿...}},
--                                                        {"Ãû×Ö"£¬ ¸ÅÂÊ, {id1,id2,id3,ÊýÁ¿...}},
--                                                      },
--                                                      {--Èç¹ûÖ»ÓÐÒ»¸öÎïÆ·£¬¸ÅÂÊ¾ÍÌî100
--                                                        [2] = {"Ãû×Ö", 100¸ÅÂÊ, {id1,id2,id3,ÊýÁ¿...}},
--                                                      },
--                                                     }
-- ËÄÖÖÌåÐÍµÄÎïÆ·¼¯ºÏÁÐ±í
--{ÀàÐÍ=2(¾­Ñé), ¸ÅÂÊ, ÊýÁ¿, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»Ðè}
--{ÀàÐÍ=3(½ðÇ®), ¸ÅÂÊ, ÊýÁ¿£¨µ¥ÊÇÍ­£©}
--{ÀàÐÍ=4(ÉùÍû), ¸ÅÂÊ, ÊýÁ¿, 1=ÒªMsg2Player£¬0²»ÐèÒª}
--{ÀàÐÍ=5(Ê¦ÃÅ¹±Ï×¶È), ¸ÅÂÊ, ÊýÁ¿, Èç¹ûÍæ¼ÒÃ»ÈëÃÅÅÉÑ¡Ôñ´úÌæµÄË÷Òý, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»ÐèÒª}
--...²Î¼ûgf_EventGiveCustomAwardÖÐµÄË÷ÒýÖµ£¬´Ë´¦Ë÷Òý±ÈÆäË÷ÒýÖµ´ó1
--{ÀàÐÍ=31(×Ô¶¨ÒåÃüÁî), ¸ÅÂÊ, "×Ô¶¨µÄÃüÁî£¨ÐèÒªdostringµÄ´úÂë£©", "×Ô¶¨ÒåµÄMsg2Player£¬Èç¹û²»Ìî±íÊ¾²»ÐèÒª"}
--²ÎÊý£ºnMaxPE ÊÇ¸ÅÂÊµÄ×î´óÖµ
--²ÎÊý£ºnDefault Èç¹ûÃ»ÓÐËæ»úµ½£¬ÔòÊ¹ÓÃ´ËÄ¬ÈÏÖµ
--²ÎÊý£ºszLogTitle ÈÕÖ¾¼ÇÂ¼±êÌâ
--²ÎÊý£ºszLogAction ÈÕ¼ÇÖÐ¼ÇÂ¼µÄÐÐÎª
function gf_EventGiveRandAward(RandAwardList, nMaxPE, nDefault, szLogTitle, szLogAction, nRand, bZhenQiTag)
	if RandAwardList == nil or getn(RandAwardList) == 0 or nMaxPE ==0 or nMaxPE == nil then
		return 0;
	end
	if nRand == nil or nRand < 1 then
  	nRand = gf_GetRandItemByTable(RandAwardList, nMaxPE, nDefault);
  end
  local nPlayerRoute = GetPlayerRoute();
  local tbSelected = RandAwardList[nRand];
  if tbSelected[1] == 5 and nPlayerRoute == 0 then
    nRand = tbSelected[4];
    tbSelected = RandAwardList[nRand];--Èç¹ûËæ»úµ½µÄÊÇ¸øÊ¦ÃÅ¹±Ï×¶ÈÇÒÍæ¼ÒÃ»ÈëÃÅÅÉ£¬Ôò»»Ò»¸öÔ¤¶¨ºÃµÄÑ¡Ïî
  end
  if tbSelected[1] == 1 and (tbSelected[7] ~= 0 and tbSelected[7] ~= nil) then
    if gf_CheckPlayerRoute(nPlayerRoute) == 0 then--Ã»ÈëÁ÷ÅÉ
      nRand = tbSelected[7];
      tbSelected = RandAwardList[nRand];--Èç¹ûËæ»úµ½°´Á÷ÅÉ¸ø¶«Î÷µ«ÊÇÍæ¼ÒÃ»ÈëÁ÷ÅÉ£¬Ôò»»Ò»¸öÔ¤¶¨ºÃµÄÑ¡Ïî
    end
  end
  --È«·þ¹ã²¥
  if tbSelected[8] ~= nil and tbSelected[8] == 1 then
  	Msg2Global(format("Chóc mõng ng­êi ch¬i %s trong %s nhËn ®­îc %s*%d",GetName(),szLogAction,tbSelected[3],tbSelected[4][4]));
  end
  local nType = tbSelected[1];
  if nType == 1 then
   	 local nSpecial = tbSelected[6];
  	 if not nSpecial or nSpecial == 0 then --¸øÎïÆ·²»ÐèÌØÊâ´¦Àí
    	 	gf_AddItemEx2(tbSelected[4], tbSelected[3], szLogTitle, szLogAction, tbSelected[5], 1);
    	 	return nRand;
 	   elseif nSpecial == 1 then --°´ÌåÐÍ¸øµÄ
				local nBody = GetBody();
				local sItem = tbSelected[4]; -- ÌåÐÍ¼¯ºÏµÄÁÐ±í
				local nSize = getn(sItem) or 1
				for i = 1, nSize do
					gf_AddItemEx2(sItem[i][nBody][2], sItem[i][nBody][1], szLogAction, szLogAction, tbSelected[5], 1)
				end
				return nRand;
     elseif nSpecial == 2 then --°´Á÷ÅÉ¸øµÄ
				local sItem = tbSelected[4][nPlayerRoute];
				local tbRandRouteTable = {
				      [1] = {2, 3, 4},
				      [5] = {6},
				      [7] = {8, 9},
				      [10] = {11, 12},
				      [13] = {14, 15},
				      [16] = {17, 18},
				      [19] = {20, 21},
				      [22] = {23},
					  [24] = {25,26,27},
				      [28] = {29, 30},
				  };
				local tbRouteTable = {2, 3, 4, 6, 8, 9, 11, 12, 14, 15, 17, 18, 20, 21, 23, 25, 26 , 27, 29, 30};
				--Èç¹ûÍæ¼ÒÃ»ÈëÁ÷ÅÉ£¬ÒªÓÐÒ»¸öËã·¨£¬Èç¹ûÈëÁËÃÅÅÉ£¬¾ÍÔÚÃÅÅÉÀïÃæËæ»ú£¬Èç¹ûÃÅÅÉ¶¼Ã»Èë£¬¾ÍËùÓÐµÄËæ»úÒ»¸ö
				if nPlayerRoute == 0 then
				  local nRandRoute = tbRouteTable[random(1, getn(tbRouteTable))];
				  sItem = tbSelected[4][nRandRoute];
				else
				  if tbRandRouteTable[nPlayerRoute] ~= nil then --ÈëÁËÃÅÅÉÃ»ÈëÁ÷ÅÉ
				      local nRandRoute = tbRandRouteTable[nPlayerRoute][random(1, getn(tbRandRouteTable[nPlayerRoute]))];
				      sItem = tbSelected[4][nRandRoute];
				  end
				end
				local nMaxRoutePE = 0;   --¸ÅÂÊ»ùÊý
				local nRouteDefault = 0; --Ä¬ÈÏË÷Òý
				for i = 1, getn(sItem) do
				  nMaxRoutePE = nMaxRoutePE + sItem[i][2];
				  if sItem[i][2] > nRouteDefault then
				      nRouteDefault = sItem[i][2];
				  end
				end
				local nRouteRand = gf_GetRandItemByTable(sItem, nMaxRoutePE, nMaxRoutePE);
				--È«¶¼´¦ÀíÍêÁË£¬¿ÉÒÔ¸ø¶«Î÷ÁË
				gf_AddItemEx2(sItem[nRouteRand][3], sItem[nRouteRand][1], szLogAction, szLogAction, tbSelected[5], 1);
				return nRand;
      end
  else
    gf_EventGiveCustomAward(nType - 1, tbSelected[3], tbSelected[4] or 1, szLogTitle, szLogAction, bZhenQiTag);
    return nRand;
  end
end

--Ô½ÄÏ°æ³£ÓÃµ½µÄÌí¼Ó¾­Ñé¡¢½ðÇ®¡¢Ê¦ÃÅ¹±Ï×¶È¡¢ÉùÍûµÄ²Ù×÷·â×°£¬×¢Òâµ±Ìí¼ÓÊ¦ÃÅ¹±Ï×¶ÈÖ®Ç°±ØÐëÔÚÍâ²¿±£Ö¤Íæ¼ÒÒÑ¾­ÈëÃÅÅÉ
--²ÎÊý nType = 1¾­Ñé¡¢2½ðÇ®¡¢3ÉùÍû¡¢4Ê¦ÃÅ¹±Ï×¶È¡¢5Ð¡°×¾ÔÍè¡¢6´ó°×¾ÔÍè¡¢7°×¾ÔÏÉµ¤¡¢8ÉñÅ©µ¤¡¢9ÁùÉñÍè¡¢10Ç¿Ð§ÁùÉñÍè¡¢11ÁùÉñÏÉµ¤¡¢12ÈýÇåÍè¡¢13Ç¿Ð§ÈýÇåÍè¡¢14ÈýÇåÏÉµ¤¡¢15ÅîÀ³ÏÉË®¡¢16ÅîÀ³ÏÉÂ¶¡¢17ÅîÀ³ÏÉµ¤¡¢18ÅîÀ³Â¶Ë®¡¢19-25 1¼¶ÁéÊ¯£­7¼¶ÁéÊ¯
--30×Ô¶¨ÒåÃüÁî, nValueÊÇÒªÖ´ÐÐÃüÁîµÄ×Ö·û´®¡¢nMsg2PlayerÊÇÒªÌáÊ¾¸øÍæ¼ÒµÄ×Ö·û´®£¬Èç¹ûÎª¿Õ£¬Ôò²»ÌáÊ¾
--²ÎÊý nValue Ìí¼ÓµÄÖµ£¨½ðÇ®µ¥Î»ÊÇÍ­¡£°×¾ÔÍè£¬ÉñÅ©µ¤£¬ÁùÉñÍè£¬Ê±¼äÊÇ·ÖÖÓ£©
--²ÎÊý nMsgPlayer »ñµÃÊ¦ÃÅ¹±Ï×¶ÈºÍÉùÍûÊÇ·ñÐèÒªÍ¨ÐÐÍæ¼Ò
--²ÎÊýszLogTitle ¼ÇÂ¼logµÄ±êÌâ
--²ÎÊýszLogAction ¼ÇÂ¼logÖÐµÄaction²ÎÊý£¬Èç¹û²»Ìî»òÌînil£¬ÔòÓÃº¯ÊýÖÐ¶¨ºÃµÄÀ´Ìæ»»
--tAddRate = {nExpAddRate=1.5, nJunGongAddRate = 1.2,}
function gf_EventGiveCustomAward(nType, nValue, nMsg2Player, szLogTitle, szLogAction, bZhenQiTag,tAddRate)
    nMsg2Player = nMsg2Player or 0;
    --szLogAction = szLogAction or "";
    local szMsg2Player = "";
    local szItemName = "";
    local szLogDefAction = "";
    if nType == 1 then
    	local nExp = nValue
    	if tAddRate and tAddRate.nExpAddRate and type(tAddRate.nExpAddRate) == "number" then
    		nExp = nExp * tAddRate.nExpAddRate
    	end
        ModifyExp(nExp);
        szMsg2Player = format("Thu ®­îc %d ®iÓm kinh nghiÖm", nExp);
        szItemName = "Kinh nghiÖm";
        szLogDefAction = "NhËn ®iÓm";
    elseif nType == 2 then
        Earn(nValue);
        --szMsg2Player = format("Äã»ñµÃÁË%d¸öÍ­Ç®", nValue);
        szMsg2Player = "";
        szItemName = " Kim ";
        szLogDefAction = "NhËn ®­îc tiÒn";
    elseif nType == 3 then
        ModifyReputation(nValue, 1);
        szMsg2Player = format("Thu ®­îc %d ®iÓm danh väng", nValue);
        szItemName = "Danh väng";
        szLogDefAction = "Thu ®­îc danh väng";
        nMsg2Player = 0;--Ôö¼ÓÉùÍûµÄÖ¸Áî±¾ÉíµÄÌáÊ¾ÏûÏ¢£¬ËùÒÔÕâÀï²»ÌáÊ¾
    elseif nType == 4 then
        SetTask(336, GetTask(336) + nValue);
        szMsg2Player = format("Thu ®­îc %d ®iÓm cèng hiÕn s­ m«n", nValue);
        szItemName = "§iÓm s­ m«n";
        szLogDefAction = "Thu ®­îc ®iÓm cèng hiÕn s­ m«n";
    elseif nType == 5 then
        SetTask(GLB_TASK_BAIJUWAN_SMALL, GetTask(GLB_TASK_BAIJUWAN_SMALL) + nValue);
        szMsg2Player = format("NhËn ®­îc %d phót b¹ch c©u hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c b¹ch c©u hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c b¹ch c©u hoµn";
    elseif nType == 6 then
        SetTask(GLB_TASK_BAIJUWAN_LARGE, GetTask(GLB_TASK_BAIJUWAN_LARGE) + nValue);
        szMsg2Player = format("NhËn ®­îc %d phót ®¹i b¹ch c©u hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c ®¹i b¹ch c©u hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c ®¹i b¹ch c©u hoµn";
    elseif nType == 7 then
        SetTask(GLB_TASK_BAIJUXIANDAN, GetTask(GLB_TASK_BAIJUXIANDAN) + nValue);
        szMsg2Player = format("NhËn ®­îc %d phót b¹ch c©u tiªn ®¬n", nValue);
        szItemName = "Thêi gian ñy th¸c b¹ch c©u tiªn ®¬n";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c b¹ch c©u tiªn ®¬n";
    elseif nType == 8 then
        SetTask(GLB_TASK_SHENGNONGDAN, GetTask(GLB_TASK_SHENGNONGDAN) + nValue);
        szMsg2Player = format("NhËn ®­îc %d phót thÇn n«ng ®¬n", nValue);
        szItemName = "Thêi gian ñy th¸c thÇn n«ng ®¬n";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c thÇn n«ng ®¬n";
    elseif nType == 9 then
        EatLiushen(1, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót lôc thÇn hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c lôc thÇn hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian lôc thÇn hoµn";
    elseif nType == 10 then
        EatLiushen(2, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót c­êng lôc thÇn hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c c­êng lôc thÇn hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c c­êng lôc thÇn hoµn";
    elseif nType == 11 then
        EatLiushen(3, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót lôc thÇn tiªn ®¬n", nValue);
        szItemName = "Thêi gian ñy th¸c lôc thÇn tiªn ®¬n";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c lôc thÇn tiªn ®¬n";
    elseif nType == 12 then
        EatSanqin(1, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót tam thanh hoµn", nValue);
        szItemName = "Thêi gian ñy th¸c tam thanh hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c tam thanh hoµn";
    elseif nType == 13 then
        EatSanqin(2, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót c­êng tam thanh hoµn", nValue);
        szItemName = "Thêi gian c­êng tam thanh hoµn";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c c­êng tam thanh hoµn";
    elseif nType == 14 then
        EatSanqin(3, nValue);
        szMsg2Player = format("NhËn ®­îc %d phót tam thanh tiªn ®¬n", nValue);
        szItemName = "Thêi gian ñy th¸c tam thanh tiªn ®¬n";
        szLogDefAction = "NhËn ®­îc thêi gian ñy th¸c tam thanh tiªn ®¬n";
    elseif nType == 15 then
        EatXcl(1, nValue);
        szMsg2Player = format("§¹i hiÖp ®· nhËn ®­îc %d phót Bång Lai Tiªn Thñy", nValue/60);
        szItemName = "Thêi gian Bång Lai Tiªn Thñy";
        szLogDefAction = "NhËn ®­îc thêi gian Bång Lai Tiªn Thñy";
    elseif nType == 16 then
        EatXcl(2, nValue);
        szMsg2Player = format("§¹i hiÖp ®· nhËn ®­îc %d phót Bång Lai Tiªn Lé", nValue/60);
        szItemName = "Thêi gian Bång Lai Tiªn Lé";
        szLogDefAction = "NhËn ®­îc thêi gian Bång Lai Tiªn Lé";
    elseif nType == 17 then
        EatXcl(3, nValue);
        szMsg2Player = format("§¹i hiÖp ®· nhËn ®­îc %d phót Bång Lai Tiªn §¬n", nValue/60);
        szItemName = "Thêi gian Bång Lai Tiªn §¬n";
        szLogDefAction = "NhËn ®­îc thêi gian Bång Lai Tiªn §¬n";
    elseif nType == 18 then
        EatXcl(4, nValue);
        szMsg2Player = format("§¹i hiÖp ®· nhËn ®­îc %d phót Bång Lai Lé Thñy", nValue/60);
        szItemName = "Thêi gian Bång Lai Lé Thñy";
        szLogDefAction = "NhËn ®­îc thêi gian Bång Lai Lé Thñy";
    elseif nType >= 19 and nType <= 25 then
        lspf_AddLingShiInBottle(nType-18,nValue)
        szMsg2Player = format("Chóc mõng b¹n ®· nhËn ®­îc %d linh th¹ch cÊp %d, linh th¹ch nµy ®­îc ch­a trong tô linh ®Ønh", nType-18, nValue);
        szItemName = format("Linh th¹ch cÊp %d",nType-18);
        szLogDefAction = format("NhËn ®­îc linh th¹ch cÊp %d",nType-18);
		elseif nType == 26 then
        ModifyPopur(nValue)
        szMsg2Player = format("C¸c h¹ ®· nhËn ®­îc %d ®iÓm tu luyÖn", nValue);
        szItemName = "LuyÖn";
        szLogDefAction = "NhËn ®­îc tu luyÖn";
    elseif nType == 27 then
    		nMsg2Player = 0;
    		if bZhenQiTag == 1 then
    			AwardGenuineQi(nValue);
    		else
	    		if ActivityAwardGenuineQiDaily(nValue) ~= 0 then
	        	szMsg2Player = format("C¸c h¹ nhËn ®­îc %d ®iÓm ch©n khÝ", nValue);
	        	szItemName = "Ch©n khÝ";
	        	szLogDefAction = "NhËn ch©n khÝ";
	        	nMsg2Player = 0; 
	        end
	      end   
    elseif nType == 30 then
        dostring(nValue);
        nMsg2Player = 0;
    elseif nType == 31 then
    	    local nJunGong = nValue
    		if tAddRate and tAddRate.nJunGongAddRate and type(tAddRate.nJunGongAddRate) == "number" then
    			nJunGong = nJunGong * tAddRate.nJunGongAddRate
    		end
    	
    	  if GetTask(701) >= 0 then
    	  	SetTask(701, GetTask(701) + nJunGong)
    	  else
    	  	SetTask(701, GetTask(701) - nJunGong)
    	  end
    	  szMsg2Player = format("C¸c h¹ nhËn ®­îc %d ®iÓm qu©n c«ng", nJunGong)
        szItemName = "C«ng tr¹ng"
        szLogDefAction = "NhËn ®­îc qu©n c«ng"
    elseif nType == 32 then
    	  SetTask(707, GetTask(707) + nValue)
    	  szMsg2Player = format("C¸c h¹ nhËn ®­îc %d tÝch lòy chiÕn tr­êng", nValue)
        szItemName = " ®iÓm tÝch lòy chiÕn tr­êng"
        szLogDefAction = "NhËn ®­îc ®iÓm tÝch lòy chiÕn tr­êng"
    elseif nType == 33 then
    		SetTask(3105, GetTask(3105) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C¸c h¹ ®· nhËn ®­îc %d phót Tô Linh Hoµn", nValue)
        szItemName = "Thêi gian Tô Linh Hoµn"
        szLogDefAction = "NhËn ®­îc thêi gian Tô Linh Hoµn"   
    elseif nType == 34 then
    		SetTask(3106, GetTask(3106) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C¸c h¹ nhËn ®­îc %d phót §¹i Tô Linh Hoµn", nValue)
        szItemName = "Thêi gian §¹i Tô Linh Hoµn"
        szLogDefAction = "NhËn ®­îc thêi gian §¹i Tô Linh Hoµn"  
    elseif nType == 35 then
    		SetTask(3107, GetTask(3107) + nValue, TASK_ACCESS_CODE_OFFLINELIVE);
    		szMsg2Player = format("C¸c h¹ nhËn ®­îc %d phót Tô Linh Tiªn §¬n", nValue)
        szItemName = "Thêi gian Tô Linh Tiªn §¬n"
        szLogDefAction = "NhËn ®­îc thêi gian Tô Linh Tiªn §¬n"   		
    elseif nType == 36 then
    		ModifyJinJuan(nValue, 1);
    		nMsg2Player = 0;
        szItemName = "PhiÕu Vµng";
        szLogDefAction = "NhËn ®­îc PhiÕu Vµng";
    elseif nType == 37 then
    		local nCurr, nMax = ModifyEnergy(0, 1);
    		local nLast = nMax - nCurr;
    		if nLast < 0 then
    			return
    		end
    		if nValue > nLast then
    			nValue = nLast
    		end
    		ModifyEnergy(nValue, 1);
        nMsg2Player = 0;
        szItemName = "Tinh Lùc";
        szLogDefAction = "NhËn ®­îc Tinh lùc";    
    end

    if nMsg2Player ~= 0 then
        Msg2Player(szMsg2Player);
    end
    if szLogTitle then
        szLogAction = szLogAction or szLogDefAction;
        gf_WriteLogEx(szLogTitle, szLogAction, nValue, szItemName, nil, GetTongName())
    end
end

--¸ù¾ÝÌí¼ÓÎïÆ·ÐÂ·â×°£¬ÔÚµ÷ÓÃÇ°ÇëÅÐ¶ÏÍæ¼Ò±³°üºÍ¸ºÖØ
--²ÎÊý£ºtbItemIdsÌí¼ÓÎïÆ·µÄIDtable£¬strNameÎïÆ·Ãû×Ö,szLogTitleÈÕ¼ÇÍ·,nExpireTime´æÔÚÊ±¼ä
--      szNpcName½»»¥µÄNPCµÄÃû×Ö£¬nNoticeMsgÊÇ·ñÌáÊ¾Íæ¼Ò¿Õ¼ä»ò¸ºÖØ²»×ã
--      nMsg2Player ÊÇ·ñÌáÊ¾Íæ¼ÒÒÑ¾­»ñµÃÁËÎïÆ·
--·µ»ØÖµ£º0´íÎóµ÷ÓÃ,1³É¹¦,-1¿Õ¼ä»ò¸ºÖØ²»¹»
function gf_AddItemEx2(tbItemIds, strName, szLogTitle, szLogAction, nExpireTime, nMsg2Player)
	nExpireTime = nExpireTime or 0;
	szLogTitle = szLogTitle or "";
	nMsg2Player = nMsg2Player or 0;
	
	if type(tbItemIds) ~= "table" or getn(tbItemIds) < 4 then
		WriteLog("["..szLogTitle.."]\tgf_AddItemEx2:\t tham sè lçi!");
		return 0;
	end
	
	local nCount = tbItemIds[4];
	if nCount == 0 then
		return
	end
	local nRet = 0;
	local nItemIdx = 0;
	local nFailedCount = 0;
	local nOkCount = 0;
	local nDropCount = 0;
	
	--Ä¬ÈÏÖµÓ¦¸ÃÎª1(ÒÑ¼ø¶¨)
	local nStatus = tbItemIds[5] or 1
	if nStatus < 0 then
		nStatus = 99
	end
	nStatus = nExpireTime * 100 + nStatus
	
	if tbItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus,tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
	else
		nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],nCount,nStatus);
	end
	
	if nRet == 0 then
		nFailedCount = nFailedCount + nCount;
	elseif nRet == 2 then
		nDropCount = nDropCount + nCount;
	else
		nOkCount = nOkCount + nCount;
	end
	
--	if tbItemIds[5] ~= nil then
--		for i = 1, nCount do
--			nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3],1,tbItemIds[5],tbItemIds[6],tbItemIds[7],tbItemIds[8],tbItemIds[9],tbItemIds[10],tbItemIds[11],tbItemIds[12],tbItemIds[13], tbItemIds[14]);
--			if nRet == 0 then
--				nFailedCount = nFailedCount + 1;
--			elseif nRet == 2 then
--				nDropCount = nDropCount + 1;
--			else
--				nOkCount = nOkCount + 1;
--				if nExpireTime > 0 then
--					SetItemExpireTime(nItemIdx, nExpireTime);
--				end
--			end
--		end
--	else
--		for i = 1, nCount do
--			nRet, nItemIdx = AddItem(tbItemIds[1],tbItemIds[2],tbItemIds[3], 1);
--			if nRet == 0 then
--				nFailedCount = nFailedCount + 1;
--			elseif nRet == 2 then
--				nDropCount = nDropCount + 1;
--			else
--				nOkCount = nOkCount + 1;
--				if nExpireTime > 0 then
--				SetItemExpireTime(nItemIdx, nExpireTime);
--				end
--			end
--		end
--	end
	
	local szMsg1 = format("Thªm thµnh c«ng %d c¸i, thªm thÊt b¹i %d c¸i, r¬i ®Êt %d c¸i", nOkCount, nFailedCount, nDropCount);--±¸×¢Ò»
	local szMsg2 = "Thêi gian tån t¹i vËt phÈm ®­îc ®Æt thµnh %d gi©y";--±¸×¢¶þ
	if nExpireTime <= 0 then
		szMsg2 = "";
	else
		szMsg2 = format(szMsg2, nExpireTime);
	end
	local szMsg3 = "";--±¸×¢Èý
	local szTongName = GetTongName() or "";
	
	if nMsg2Player ~= 0 then
		Msg2Player("B¹n nhËn ®­îc "..strName.."x"..nOkCount);
	end
	
	--²ÉÓÃÐÂÈÕÖ¾¼ÇÂ¼¸ñÊ½
	gf_WriteLogEx(szLogTitle, szLogAction, nCount, strName, nil, szTongName, nil, szMsg1, szMsg2, szMsg3);
	if nCount > 1 then
		return 1;
	else
		return nRet, nItemIdx
	end
end

--¼ì²éÊÇ·ñÔÚÄ³»î¶¯ÆÚ¼ä
--²ÎÊý£ºnEventId±íÊ¾»î¶¯µÄID
--·µ»ØÖµ£º1±íÊ¾ÔÚ»î¶¯ÆÚ¼ä£¬0±íÊ¾²»ÔÚ
function gf_CheckEventDateEx(nEventId)
    if GetEventOpen(nEventId) == 0 then--ÏÈÅÐ¶Ï»î¶¯ÊÇ·ñ¿ª·Å£¬ÔÙÅÐ¶ÏÊ±¼ä
        return 0;
    end
    local nDate = tonumber(date("%Y%m%d%H"));
    local nStartDate = GetEventStartDate(nEventId);
    local nEndDate = GetEventEndDate(nEventId);
    if not nStartDate or not nEndDate then
        return 0;
    end
    if nEndDate == 0 then
        if nDate >= nStartDate then
            return 1;
        else
            return 0;
        end
    else
        if nDate >= nStartDate and nDate < nEndDate then
            return 1;
        else
            return 0;
        end
    end
    return 0;
end

--¼ì²éÊÇ·ñÔÚÄ³»î¶¯ÆÚ¼ä
--²ÎÊý£¬[¿ªÊ¼Ê±¼ä£¬½áÊøÊ±¼ä), 0±íÊ¾Ã»ÓÐ¿ªÊ¼»ò½áÊøÈÕÆÚ
--·µ»ØÖµ£º1±íÊ¾ÔÚ»î¶¯ÆÚ¼ä£¬0±íÊ¾²»ÔÚ
function gf_CheckEventDateEx2(nStartDate, nEndDate)
    local nDate = tonumber(date("%Y%m%d%H"));
    if nEndDate == 0 then
        if nDate >= nStartDate then
            return 1;
        else
            return 0;
        end
    else
        if nDate >= nStartDate and nDate < nEndDate then
            return 1;
        else
            return 0;
        end
    end
end
--¼ì²âÒ»¸ö»î¶¯ÊÇ·ñ½áÊø
function gf_CheckEventDateEnd(nActivityId)
	local nDate = tonumber(date("%Y%m%d%H"))
    local nEndDate = GetEventEndDate(nActivityId);
	if not(nEndDate) and nEndDate ~= 0 and nDate > nEndDate then
		return 1
	else
		return 0
	end
end
--ÅÐ¶ÏÊÇ·ñÑ§Âú55¼¶¼¼ÄÜ
function gf_Check55FullSkill()

    local TB_55_SKILL_INFO = {
        [2] = {21, 31},
	[3] = {45, 56},
	[4] = {33, 43},
	[6] = {58, 73},
	[8] = {75, 88},
	[9] = {90, 101},
	[11] = {103, 112},
	[12] = {114, 123},
	[14] = {125, 145},
	[15] = {147, 158},
	[17] = {720, 731},
	[18] = {733, 744},
	[20] = {364, 377},
	[21] = {347, 363},
	[23] = {1017, 1031},
	[25] = {1053, 1065},
	[26] = {1083, 1095},
	[27] = {1131, 1143},
	[29] = {1165, 1176},
	[30] = {1217, 1229},
    };
    local nPlayerRoute = GetPlayerRoute()
    if not TB_55_SKILL_INFO[nPlayerRoute]then
	return 0
    end
    for i = TB_55_SKILL_INFO[nPlayerRoute][1], TB_55_SKILL_INFO[nPlayerRoute][2] do
	if GetSkillLevel(i) == 0 then
	    return 0;
	end
    end
    return 1;
end

function gf_Check55MaxSkill()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 7 then
			return 1
		else
			return 0
		end;
	end;
end
function gf_Check55HaveSkill()
	local nRoute = GetPlayerRoute();
	local nSkillID = tRouteSkillInfo[nRoute];
	if nSkillID == 0 then
		return 0;
	else
		if GetSkillLevel(nSkillID) >= 1 then
			return 1
		else
			return 0
		end;
	end;
end
--³£ÓÃµÄºÏ³ÉÎïÆ·µÄº¯Êý£¬µ÷ÓÃÇ°ÐèÒªÏÈÅÐ¶Ï±³°üºÍ¸ºÖØ
--Õû¸ö±íÓÐ3¸ö²ÎÊý£¬²ÎÊý1Ô­ÁÏ±í£¬²ÎÊý2²úÎï±í£¬
--tbExchangeItemList = {
--  {
--      {"Ô­ÁÏ1Ãû×Ö", id1, id2, id3, count},
--      {"Ô­ÁÏ2Ãû×Ö", id1, id2, id3, count},
--      ....
--  }, --Ô­ÁÏ±í
--  --²úÎï±íÀïÃæÓÐ¶àÏî£¬¸ù¾Ý¸ÅÂÊ³öÏÖÄ³Ò»Ïî£¬Ä³Ò»ÏîÀïÃæ¿ÉÒÔÓÐ¶àÏî
--  {
--      {
--              "µÚÒ»×é²úÎï×Ü³Æ",
--              µÚÒ»×é²úÎïµÄ¸ÅÂÊ,
--              {"²úÎï1Ãû×Ö", {id1, id2, id3, count}, nExpireTime},
--              {"²úÎï2Ãû×Ö", {id1, id2, id3, count}, nExpireTime}
--      }, --µÚÒ»×é²úÎï
--      {
--              "µÚ¶þ×é²úÎï×Ü³Æ",
--              µÚ¶þ×é²úÎïµÄ¸ÅÂÊ,
--              {"²úÎï1Ãû×Ö", {id1, id2, id3, count}, nExpireTime},
--              {"²úÎï2Ãû×Ö", {id1, id2, id3, count}, nExpireTime}
--      }, --µÚ¶þ×é²úÎï
--      ...
--  },
--}
--·µ»Ø0ÊÇÔ­ÁÏ²»×ã£¬1Îª³É¹¦
function gf_ExchangeItemEx(tbExchangeItemList, szLogTitle, szLogAction)
    local tbSourceItem = tbExchangeItemList[1]; --Ô­ÁÏ±í
    local tbDestItem = tbExchangeItemList[2];   --²úÎï±í

    local nCanExchange = 1; --²ÄÁÏÊÇ·ñ¹»£¬ÊÇ·ñ¿ÉÒÔºÏ³É
    for i = 1, getn(tbSourceItem) do
        local tbSelectSourceItem = tbSourceItem[i];
        if GetItemCount(tbSelectSourceItem[2], tbSelectSourceItem[3], tbSelectSourceItem[4]) < tbSelectSourceItem[5] then
            nCanExchange = 0;
        end
    end
    if nCanExchange == 0 then
        return 0;
    end

    local nMaxPE = 0;          --¸ÅÂÊ»ùÊý
    local nDefault = 0;        --Ä¬ÈÏÑ¡Ôñ

    for i = 1, getn(tbExchangeItemList[2]) do --´Ë¶ÎÎªÁËÕÒ³ö¸ÅÂÊ»ùÊýºÍÄ¬ÈÏËæ»úË÷Òý
        local tbItem = tbExchangeItemList[2][i];
        nMaxPE = nMaxPE + tbItem[2];
        if tbItem[2] >= nDefault then
            nDefault = tbItem[2];
        end
    end

    local nRand = gf_GetRandItemByTable(tbDestItem, nMaxPE, nDefault);
    local tbSelectDestItem = tbDestItem[nRand];

    local nCanGive = 1; --²ÄÁÏÊÇ·ñÒÑ¾­¶¼É¾³ýµô£¬¿ÉÒÔ¸øÎïÆ·
    for i = 1, getn(tbSourceItem) do
        local tbSelectSourceItem = tbSourceItem[i];
        if DelItem(tbSelectSourceItem[2], tbSelectSourceItem[3], tbSelectSourceItem[4], tbSelectSourceItem[5]) ~= 1 then
            nCanGive = 0;--ÓÐÎïÆ·É¾³ýÊ§°ÜÁË£¬¾Í²»ÄÜ¸øºÏ³ÉºóµÄÎïÆ·ÁË
        end
    end

    if nCanGive == 1 then
        --ÕÒ³öºÏ³ÉµÄ¶«Î÷ÁË£¬ÏÂÃæ¸øËû¾ÍºÃÁË
        for i = 3, getn(tbSelectDestItem) do-- ´ÓµÚÈýÏî¿ªÊ¼²ÅÊÇÎïÆ·±í
            gf_AddItemEx2(tbSelectDestItem[i][2], tbSelectDestItem[i][1], szLogTitle, szLogAction, tbSelectDestItem[i][3], 1);
        end
        return 1;
    end
    return 0;
end

function gf_Add2XUAward(sItem, szItemName, szLogTitle, szLogAction)
	if GetFreeItemRoom() > 0 then
	gf_AddItemEx2(sItem, szItemName, szLogTitle, szLogAction, 0, 1);
	end
end

--¸ø×Ö·û´®¼ÓÉÏÑÕÉ«(×¢ÒâSayÖÐµÄÑ¡ÏîÀïÃæ²»ÄÜ¼ÓÑÕÉ«)
--szColor=1 ÊÇºìÉ«
--szColor=2 ÊÇÂÌÉ«
--szColor=3 ÊÇÀ¶É«
--szColor=4 ÊÇ»ÆÉ«
--´ýÌí¼Ó
--nNpcName ~= nil ±íÊ¾ÊÇNPCÃû×Ö£¬×Ô¶¯²¹ÉÏ¡°Ã°ºÅ¡±
function gf_FixColor(szString, nColor, nIsNpcSay)
    local tbColor = {
        [1] = "red",
        [2] = "green",
        [3] = "blue",
        [4] = "yellow",
    };
    if nIsNpcSay == nil or nIsNpcSay == 0 then
        szString = format("<color=%s>%s<color>", tbColor[nColor], szString);
    else
        szString = format("<color=%s>%s:<color>", tbColor[nColor], szString);
    end
    return szString;
end

--º¯ÊýÃû³Æ£º¶Ô»°¿Õº¯Êý
--¹¦    ÄÜ£º¶Ô»°¿Õº¯Êý,¿ì½Ý½áÊø
function gf_DoNothing()
end
-- ******************************************* Comment by Vilh *****************************************************

-- Name			: 	gf_ResetNumOfUsing_Day
-- Content			: 	Keep rate of the sequance of month!
-- Return value	:	None
-- Parameter		:
--		+ nTask	(value)		:  The Task_id
-- Example		:	gf_ResetNumOfUsing_Day ( 2530 )
-- Function created 11-12-2010
-- ******************************************* Comment by Vilh *****************************************************

function gf_ResetNumOfUsing_Day ( nTask )

	local nDate = tonumber( date( "%y%m%d" ) ) --101116

	-- Get the month sequance from the player's data.
	local nCurDate = floor ( GetTask( nTask ) / 100 )

	--Keep rate the data
	if nCurDate ~= nDate then
		SetTask ( nTask, nDate * 100 )   	-- reset so ngay su dung
	end
end


--°ÑÒ»¸öÁÐ±íÖÐµÄËùÓÐÎïÆ·¸øÍæ¼Ò
--±í½á¹¹ = {
--      {ÀàÐÍ=1(ÎïÆ·), Ãû×Ö, {id1,id2,id3,count}, ´æÔÚÊ±¼ä(ÎÞÏÞÖÆÌî0), ÊÇ·ñMsg2Player},
--      {ÀàÐÍ=2(¾­Ñé), ÊýÁ¿, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»Ðè},
--}
--{ÀàÐÍ=3(½ðÇ®), ÊýÁ¿£¨µ¥ÊÇÍ­£©}
--{ÀàÐÍ=4(ÉùÍû), ÊýÁ¿, 1=ÒªMsg2Player£¬0²»ÐèÒª}
--{ÀàÐÍ=5(Ê¦ÃÅ¹±Ï×¶È), ÊýÁ¿, 1=ÒªMsg2Player£¬0»ò²»Ìî±íÊ¾²»ÐèÒª}
--...²Î¼ûgf_EventGiveCustomAwardÖÐµÄË÷ÒýÖµ£¬´Ë´¦Ë÷Òý±ÈÆäË÷ÒýÖµ´ó1
--{ÀàÐÍ=31(×Ô¶¨ÒåÃüÁî), "×Ô¶¨µÄÃüÁî£¨ÐèÒªdostringµÄ´úÂë£©", "×Ô¶¨ÒåµÄMsg2Player£¬Èç¹û²»Ìî±íÊ¾²»ÐèÒª"}
--²ÎÊý£ºszLogTitle ÈÕÖ¾¼ÇÂ¼±êÌâ
--²ÎÊý£ºszLogAction ÈÕ¼ÇÖÐ¼ÇÂ¼µÄÐÐÎª
function gf_EventGiveAllAward(AllAwardList, szLogTitle, szLogAction,tAddRate)
    for i = 1, getn(AllAwardList) do
        local tbSubAward = AllAwardList[i];
        local nType = tbSubAward[1];
        if nType == 1 then--ÎïÆ·
            gf_AddItemEx2(tbSubAward[3], tbSubAward[2], szLogTitle, szLogAction, tbSubAward[4], tbSubAward[5]);
        else
            gf_EventGiveCustomAward(nType - 1, tbSubAward[2], tbSubAward[3], szLogTitle, szLogAction, 0, tAddRate);
        end
    end
end

function gf_MsgToServer(sz, szItem, nForce)
	if nForce == 1 then
		Msg2SubWorld(sz)
		return
	end

	local nOldPlayer = PlayerIndex
	local szName = GetName()
	PlayerIndex = GetTeamMember(0)
	if PlayerIndex > 0 then
		if szName == GetName() then
			Msg2SubWorld(sz)
		end
	end
end
function gf_WriteCustomLog(szTitle, szAction, nType)
	local date_time = "["..date("%Y").."-"..date("%m").."-"..date("%d").." "..date("%H")..":"..date("%M")..":"..date("%S").."]"
	local event_name = szTitle or ""
	local action = szAction or ""
	local quantity = szquantity or ""
	local item_name = szitem_name or ""
	local item_code = szitem_code or ""
	local tong_name = sztong_name or ""
	local bug_desc = szbug_desc or ""
	local string_1 = szstring_1 or ""
	local string_2 = szstring_2 or ""
	local string_3 = szstring_3 or ""
	local reborn = gf_GetTaskByte(1538, 1) or ""
	local rolelevel = GetLevel() or ""
	local rank = GetTask(704) or ""
	local petlevel = 0
	if GetTask(TASK_VNG_PET) ~= nil then
		petlevel = mod(GetTask(TASK_VNG_PET), 100) or ""
	end
	local petid = gf_GetTaskByte(TASK_VNG_PET_INFO, BYTE_PET_INFO_TYPE)
	local pettype = ""
	if petlevel > 0 then
		if VET_201003_TONGBAN_STR_MODE_NAME[petlevel] then
			if VET_201003_TONGBAN_STR_MODE_NAME[petid] then
				pettype = VET_201003_TONGBAN_STR_MODE_NAME[petlevel][petid] or ""
			end
		end
	end
	local nLastLoginIp,nCurrentLoginIp = GetLoginIP();
	local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
	local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
	local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
	local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
	local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
	local strLogs = date_time.."\t".."INFO".."\t".."COMMON".."\t".."["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3.."\t"..reborn.."\t"..rolelevel.."\t"..rank.."\t"..petlevel.."\t"..pettype.."\t"..szCIP;
	if nType == 1 then
		local szDate = date("%Y%m%d")
		local szFileName = "logs/Ipbonus/"..szDate.."_ipbonus.log"
		local hFile = openfile(szFileName, "a+");
		if (hFile == nil) then
			execute(format("mkdir \"%s\"", "logs/Ipbonus/"));
			hFile = openfile(szFileName, "a+");
		end
		if (hFile ~= nil) then
			write (hFile, strLogs .. "\n");
			closefile (hFile);
		end
	else
		return
	end
end
-- Create By PhucBDB -20110316
function gf_SetTaskByDec(nTaskId  , nStart , nEnd , nValue)
	local  nLenValue = strlen(tostring(nValue))
	if  (nEnd - nStart +1)  < nLenValue then
		return 0
	end
	if nStart > nEnd then
		return 0
	end
	SetTask(nTaskId , nValue * (10^(nStart-1)))
	return 1
end
-- Create By PhucBDB -20110316
function  gf_GetTaskByDec(nTaskId  , nStart , nEnd)
	if nStart > nEnd then
		return 0
	end
	local nValue = GetTask(nTaskId)
	local nTmp1 = floor(nValue / (10^(nStart - 1)))
	local  nRange = nEnd - nStart + 2
	return mod(nTmp1 , (10^nRange))
end

--Ô½ÄÏ°æ±¾»î¶¯Ïà¹Ø¹«¹²º¯Êý£¨´å³¤£º2011-3-29Ìí¼Ó£©
SINI_CHG_INI_FILE = "\\script\\online_activites\\ini\\VnChangeMain.ini"
g_objOnlineChgRule = ff_GetIniFileObj(SINI_CHG_INI_FILE)
if g_objOnlineChgRule:Open() ~= 1 then
	gf_WriteLog("SystemError","load ini file error! file path:"..SINI_CHG_INI_FILE)
end
SkeyChangeMain="VNChangeMain"
SkeyPrizeNum = "nPrizeCount"
SkeyConsumptionNum = "nConsumptionCount"
SkeyPrizeElement="PrizeElement"
SkeyConsumptionElement="ConsumptionElement"
SKeyProbability="nProbability"

--ÎïÆ·¶Ò»»¶Ô»°Éú³É
function gf_VnGetChangeSaySel(sInfoKey)
	return "§æi "..gf_VnGetItemChgPrizeInfo(sInfoKey,SkeyPrizeNum,SkeyPrizeElement).."(cÇn"..gf_VnGetItemChgInfo(sInfoKey,SkeyConsumptionNum,SkeyConsumptionElement)..")"
end

--»ñÈ¡½±ÀøµÄ¶Ò»»¸ñÊ½
function gf_VnGetItemChgPrizeInfo(sInfoKey,sKeyElementCount,SkeyElement)
	local sElenmentInfo = ""
	local nElementCount = g_objOnlineChgRule:GetNum(sInfoKey,sKeyElementCount)
	for nElemenSeq = 1,nElementCount do
		if nElemenSeq > 1 then
			--¶à¸öÔªËØÐèÒªÔÚÇ°Ãæ¼ÓÉÏ+ºÅ
			sElenmentInfo = sElenmentInfo.." hoÆc "
		end
		local tElementInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyElement..nElemenSeq)
		if tElementInfo == nil then
			return 0;
		end
		--¸ù¾Ý²»Í¬µÄÎïÆ·ÀàÐÍÉú³É²»Í¬µÄ¶Ò»»¸ñÊ½¶Ô»°
		if tElementInfo[1] == "item" then
			sElenmentInfo = sElenmentInfo..tElementInfo[5]..tElementInfo[6]..tElementInfo[7]
		end
	end
	return sElenmentInfo
end

--»ñÈ¡ÎïÆ·µÄ¶Ò»»¸ñÊ½
function gf_VnGetItemChgInfo(sInfoKey,sKeyElementCount,SkeyElement)
	local sElenmentInfo = ""
	local nElementCount = g_objOnlineChgRule:GetNum(sInfoKey,sKeyElementCount)
	for nElemenSeq = 1,nElementCount do
		if nElemenSeq > 1 then
			--¶à¸öÔªËØÐèÒªÔÚÇ°Ãæ¼ÓÉÏ+ºÅ
			sElenmentInfo = sElenmentInfo.."+"
		end
		local tElementInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyElement..nElemenSeq)
		--¸ù¾Ý²»Í¬µÄÎïÆ·ÀàÐÍÉú³É²»Í¬µÄ¶Ò»»¸ñÊ½¶Ô»°
		if tElementInfo[1] == "item" then
			sElenmentInfo = sElenmentInfo..tElementInfo[5]..tElementInfo[6]..tElementInfo[7]
		end
		if tElementInfo[1] == "money" then
			sElenmentInfo = sElenmentInfo..tostring(ceil(tElementInfo[2]/10000)).." Kim "
		end
	end
	return sElenmentInfo
end
--ÎïÆ·¶Ô»°´¦Àí
function gf_VnItemChgDeal(sInfoKey)
	--ÏûºÄÆ·¼ì²â
	local nConsumptionCount=g_objOnlineChgRule:GetNum(sInfoKey,SkeyConsumptionNum)
	local nChkFlag = 1
	local sChgClew = "<color=green>Nh¾c nhë<color>:"
	for nCounsumptionSeq = 1,nConsumptionCount do
		local tConsumptionInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyConsumptionElement..nCounsumptionSeq)
		--ÎïÆ·µÄ´¦Àí
		if tConsumptionInfo[1] == "item" and GetItemCount(tConsumptionInfo[2],tConsumptionInfo[3],tConsumptionInfo[4]) < tConsumptionInfo[5] then
			nChkFlag = 0
			sChgClew = sChgClew.."\n    <color=green>"..tConsumptionInfo[7].." <color>kh«ng ®ñ<color=red>"..tConsumptionInfo[5].."<color>"..tConsumptionInfo[6]
		end
		if tConsumptionInfo[1] == "money" and GetCash() < tonumber(tConsumptionInfo[2]) then
			nChkFlag = 0
			sChgClew = sChgClew.."\n    <color=green>vµng trong tói <color> kh«ng ®ñ <color=red>"..ceil(tonumber(tConsumptionInfo[2]) / 10000).."<color>"
		end
	end
	if nChkFlag ~= 1 then
		sChgClew = sChgClew.."\n kh«ng thÓ ®æi!"
		Talk(1,"",sChgClew)
		return
	end
	--¿Õ¼ä¼ì²â
	local nPrizeCount = g_objOnlineChgRule:GetNum(sInfoKey,SkeyPrizeNum)
	local nFreeRoomNeedCount = 0
	for nPrizeSeq = 1,nPrizeCount do
		local tPrizeInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyPrizeElement..nPrizeSeq)
		if tPrizeInfo[1] == "item" and tPrizeInfo[8] ~= nil and tPrizeInfo[8] ~= 0 then
			nFreeRoomNeedCount = nFreeRoomNeedCount + tPrizeInfo[8]
		end
	end
	if GetFreeItemRoom() < nFreeRoomNeedCount then
		Talk(1,"","<color=green>th«ng b¸o<color>#\n    <color=green>kh«ng gian hµnh trang <color>kh«ng ®ñ<color=red>"..nFreeRoomNeedCount.."<color> \n kh«ng thÓ ®æi !")
		return
	end
	--¶Ò»»´¦Àí
		--É¾³ýÏûºÄÆ·
	local bDelFlag = 1
	local sDelClew = ""
	for nCounsumptionSeq = 1,nConsumptionCount do
		if bDelFlag == 0 then
			break
		end
		bDelFlag,sDelClew = gf_VnConsumptionDelMain(g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyConsumptionElement..nCounsumptionSeq))
	end
	if bDelFlag ~= 1 then
		Talk(1,"","<color=green>Nh¾c nhë<color>:"..sDelClew.."\n kh«ng thÓ ®æi!")
		return
	end
		--Ôö¼Ó½±ÀøÎïÆ·
	local nPrizeCount = g_objOnlineChgRule:GetNum(sInfoKey,SkeyPrizeNum)
	gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
end
--ÎïÆ·Ê¹ÓÃ¶Ò»»½±ÀøÍ¨ÓÃ´¦Àí
SkeyItemInfo = "ItemInfo"
function gf_VnItemUsePrize(nItemIndex,sKeyInfo)
	--ÎïÆ·ÐÅÏ¢»ñÈ¡ºÍÐ£Ñé
	local tItemInfo = g_objOnlineChgRule:GetMixTable(sKeyInfo,SkeyItemInfo)
	local nItemGId,nItemDId,nItemPId = GetItemInfoByIndex(nItemIndex)
	if tItemInfo[1] ~= nItemGId or nItemDId ~= tItemInfo[2] or nItemPId ~= tItemInfo[2] then
		return
	end
	--ÎïÆ·É¾³ý
	if DelItemByIndex(nItemIndex,1) ~= 1 then
		return
	else
		local nPrizeCount = g_objOnlineChgRule:GetMixTable(sKeyInfo,SkeyItemInfo) or 1
		gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
	end
end
--½±Àø¸øÓè
function gf_VnPrizeAddMain(sInfoKey,nPrizeCount)
	local nProbability = 0
	local nTempProbability = random(100)
	for nTbCount = 1,nPrizeCount do
		local tPrizeInfo = g_objOnlineChgRule:GetMixTable(sInfoKey,SkeyPrizeElement..nTbCount)
		nProbability = nProbability + (g_objOnlineChgRule:GetNum(sInfoKey,SKeyProbability..nTbCount) or 0)
		if tPrizeInfo == nil then
			return
		else
			if nTempProbability <= nProbability*100 or nProbability == 0 then
				if tPrizeInfo[1] == "item" then
					local bAddFlag = AddItem(tPrizeInfo[2],tPrizeInfo[3],tPrizeInfo[4],tPrizeInfo[5])
					if bAddFlag == 1 then	--test:¿ÉÄÜÔö¼Ó¸öÈË»òÊÀ½çÏûÏ¢¡¢¿ÉÄÜ¼ÇÈÕÖ¾

					else	--test
						WriteLog()
					end
				elseif tPrizeInfo[1] == "exp" then
					ModifyExp(tPrizeInfo[2])
					Msg2Player(format("C¸c h¹ nhËn ®­îc %d ®iÓm kinh nghiÖm!",tPrizeInfo[2]))
				end
				return
			end
		end
	end
end
--ÏûºÄ¿Û³ý
function gf_VnConsumptionDelMain(tConsumptionInfo)
	local bDelFlag = 1
	local sDelClew = ""
	if tConsumptionInfo[1] == "item" then
		if DelItem(tConsumptionInfo[2],tConsumptionInfo[3],tConsumptionInfo[4],tConsumptionInfo[5]) ~= 1 then
			bDelFlag = 0
			sDelClew = nDelClew.."\n    <color=green>"..tConsumptionInfo[7].." <color>kh«ng ®ñ<color=red>"..tConsumptionInfo[5].."<color>"..tConsumptionInfo[6]
		end
	end
	if tConsumptionInfo[1] == "money" then
		if Pay(tonumber(tConsumptionInfo[2])) ~= 1 then
			bDelFlag = 0
			sDelClew = sDelClew.."\n    <color=green>vµng trong tói <color> kh«ng ®ñ <color=red>"..ceil(tonumber(tConsumptionInfo[2]) / 10000).."<color>"
		end
	end
	return bDelFlag,sDelClew
end
--¼Ì³Ð
function gf_Inherit(base)	--¶¨ÒåÒ»¸ö¼Ì³Ðº¯Êý
	local derive = {};
	local foo = function(t,i)	--¶¨Òå"index"·½·¨
		return %base[i];
	end;
	settag(derive,newtag());
	settagmethod(tag(derive),"index",foo);
	for i,v in base do
		if type(v) == "table" then
			derive[i] = gf_Inherit(v);
		end;
	end;
	return derive;
end;
--·­Ò³ÏÔÊ¾µÄSay
--nPage:µÚ¼¸Ò³¿ªÊ¼
--tbInfo:¶Ô»°ÄÚÈÝtable
function gf_SayEx(nPage,tbInfo)
	if not tbInfo then
		tbInfo = g_tbTempArg[GetName()]["gf_SayEx_Table"];
	else
		if not g_tbTempArg[GetName()] then
			g_tbTempArg[GetName()] = {};
		end;
		g_tbTempArg[GetName()]["gf_SayEx_Table"] = tbInfo;
	end;
	local nTotalPage = getn(tbInfo);
	local selTab = {};
	local szSayString = "";
	szSayString = tbInfo[nPage];
	if nPage ~= 1 then	--Èç¹û²»ÊÇµÚ1Ò³ÔòÓÐ¡°ÉÏÒ»Ò³¡±
		tinsert(selTab,format("Trang tr­íc/#gf_SayEx(%d)",nPage-1));
	end;
	if nPage ~= nTotalPage then	--Èç¹û²»ÊÇ×îºóÒ»Ò³ÔòÓÐ¡°ÏÂÒ»Ò³¡±
		tinsert(selTab,format("Trang kÕ/#gf_SayEx(%d)",nPage+1));
	end;
	tinsert(selTab,"KÕt thóc ®èi tho¹i/nothing");
	Say(format(szSayString.."\n (hiÖn t¹i trang %d, tæng %d trang)",nPage,nTotalPage),getn(selTab),selTab);
end;

function gf_ListSay(nCurPage,szCaption,tbString,nMaxRecordNumPerPage)
	nMaxRecordNumPerPage = nMaxRecordNumPerPage or 5;
	local tbInfo = {};
	local nTotalRecordNum = getn(tbString);
	local nMaxPage = ceil(nTotalRecordNum/nMaxRecordNumPerPage);
	for i=1,nMaxPage do
		local szString = "";
		for j=nMaxRecordNumPerPage*(i-1)+1,nMaxRecordNumPerPage*i do
			if tbString[j] then
				szString = szString..tbString[j].."\n"
			else
				szString = strsub(szString,1,strlen(szString)-2);
			end;
		end;
		szString = szCaption.."\n"..szString;
		tinsert(tbInfo,szString);
	end;
	gf_SayEx(1,tbInfo)
end;

function gf_ConfirmSay(szCaption,szFunction)
	local selTab = {
				"§ång ý/#"..szFunction,
				"Hñy bá/nothing",
				}
	Say(szCaption,getn(selTab),selTab);
end;

--»ñµÃ¶ÓÎéÀïÃæ¶ÓÔ±µÄË÷Òý
function gf_GetAllTeamMember()
	local tbPlayer	= GetTeamMemberIndex(GetTeamID());
	local nTeamSize = GetTeamSize();
	tbPlayer	= tbPlayer	or {};
	nTeamSize	= nTeamSize	or 0;
	return tbPlayer,nTeamSize;
end;

function gf_StartTimeGuage(szCaption,nTime,bRepeate,nID,tbPlayer)
	if not tbPlayer then
		StartTimeGuage(szCaption,nTime,bRepeate,nID);
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		StartTimeGuage(szCaption,nTime,bRepeate,nID);
	end;
	PlayerIndex = nOldPIdx;
end;

function gf_StopTimeGuage(nID,tbPlayer)
	if not tbPlayer then
		StopTimeGuage(nID);
		return 0;
	end;
	local nOldPIdx = PlayerIndex;
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		StopTimeGuage(nID);
	end;
	PlayerIndex = nOldPIdx;
end;
function gf_GetWorldPos(nPIdx)
	local nOldPIdx = PlayerIndex;
	PlayerIndex = nPIdx or PlayerIndex;
	local nMapID,nMapX,nMapY = GetWorldPos();
	PlayerIndex = nOldPIdx;
	return nMapID,nMapX,nMapY;
end;
--»ñµÃÄ³ÕÅµØÍ¼µÄ¶¯Ì¬µØÍ¼ID table
function gf_GetMapIDTable(nMapID)
	local tbMapID = gf_GetDataTable(GetSameMaps(nMapID));
	return tbMapID;
end;
--ÅÐ¶ÏÒ»×éÍæ¼ÒÓëÄ³¸ö×ø±êµÄ¾àÀë
--tbPlayer:ÐèÒª×÷ÅÐ¶ÏµÄÍæ¼ÒË÷Òýtable
--nMapID,nMapX,nMapY:Èý¸ö×ø±ê
--nScale:°ë¾¶£¨·¶Î§£©
--·µ»ØÖµ1£ºÊÇ·ñÈ«²¿Íæ¼Ò¶¼ÔÚ·¶Î§ÄÚ
--·µ»ØÖµ2£º·¶Î§ÍâµÄÍæ¼ÒË÷Òýtable
function gf_CheckPlayersDistance(tbPlayer,nMapID,nMapX,nMapY,nScale)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nMapID1,nMapX1,nMapY1 = GetWorldPos();
		if nMapID1 ~= nMapID then
			tinsert(tbRetPlayer,PlayerIndex);
		else
			if gf_GetDistance(nMapX,nMapY,nMapX1,nMapY1) > nScale then
				tinsert(tbRetPlayer,PlayerIndex);
			end
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--ÅÐ¶Ï¶ÓÎéÃæÆäËüÍæ¼ÒÓë×Ô¼ºµÄ¾àÀë
function gf_CheckTeamMemberDistance(nScale)
	local tbPlayer = gf_GetAllTeamMember();
	local nMapID,nMapX,nMapY = GetWorldPos();
	local nRetCode,tbRetPlayer = gf_CheckPlayersDistance(tbPlayer,nMapID,nMapX,nMapY,nScale);
	return nRetCode,tbRetPlayer;
end;
--¼ì²é¼¯ºÏÀïÃæµÄÍæ¼ÒµÈ¼¶ÊÇ·ñ·ûºÏÒªÇó¡£
--nMinLevel:ÒªÇóµÄ×îÐ¡µÈ¼¶£¨Ä¬ÈÏÎª1£©
--nMaxLevel:ÒªÇóµÄ×î´óµÈ¼¶£¨Ä¬ÈÏÎª99£©
function gf_CheckPlayersLevel(tbPlayer,nMinLevel,nMaxLevel)
	nMinLevel = nMinLevel or 1;
	nMaxLevel = nMaxLevel or MAX_PLAYER_LEVEL;
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nLevel = GetLevel();
		if nLevel < nMinLevel or nLevel > nMaxLevel then
			tinsert(tbRetPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--¼ì²é¶ÓÎéÀïÃæµÄÍæ¼ÒµÈ¼¶ÊÇ·ñ·ûºÏÒªÇó¡£
function gf_CheckTeamMemberLevel(nMinLevel,nMaxLevel)
	local tbPlayer = gf_GetAllTeamMember();
	local nRetCode,tbRetPlayer = gf_CheckPlayersLevel(tbPlayer,nMinLevel,nMaxLevel);
	return nRetCode,tbRetPlayer;
end;
--»ñµÃÍæ¼ÒÃû×Ö×Ö·û´®£¬Èç£º "Íæ¼ÒA,Íæ¼ÒB,Íæ¼ÒC,Íæ¼ÒD"
function gf_GetPlayersName(tbPlayer)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	local szRetString = "";
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local szName = GetName();
		szRetString = szRetString..szName..",";
	end;
	if szRetString ~= "" then
		szRetString = strsub(szRetString,1,strlen(szRetString)-1);
	end;
	PlayerIndex = nOldPIdx;
	return szRetString;
end;

function gf_CheckPlayersTaskValue(tbPlayer,nTaskID,tbRule)
	local nOldPIdx = PlayerIndex;
	local tbRetPlayer = {};
	for i=1,getn(tbPlayer) do
		PlayerIndex = tbPlayer[i];
		local nTaskValue = GetTask(nTaskID);
		if tbRule.Rule == "==" and tbRule.Value ~= nTaskValue then
			tinsert(tbRetPlayer,PlayerIndex);
		elseif tbRule.Rule == "<" and nTaskValue >= tbRule.Value then
			tinsert(tbRetPlayer,PlayerIndex);
		elseif tbRule.Rule == ">" and nTaskValue <= tbRule.Value then
			tinsert(tbRetPlayer,PlayerIndex);
		end;
	end;
	PlayerIndex = nOldPIdx;
	if getn(tbRetPlayer) == 0 then
		return 1,{};
	else
		return 0,tbRetPlayer;
	end;
end;
--¼ì²é¶ÓÎéÀïÃæµÄÍæ¼ÒÈÎÎñ±äÁ¿ÊÇ·ñ·ûºÏÒªÇó¡£
function gf_CheckTeamMemberTaskValue(nTaskID,tbRule)
	local tbPlayer = gf_GetAllTeamMember();
	local nRetCode,tbRetPlayer = gf_CheckPlayersTaskValue(tbPlayer,nTaskID,tbRule);
	return nRetCode,tbRetPlayer;
end;
--¶ÔÒÔ×Ö·û´®×÷ÎªË÷ÒýµÄtableÅÅÐò£¬ÅÐ¶ÏµÄÊý¾ÝÓÉnDataIdx¸ø³ö£¬·µ»ØÒ»¸öÐÂµÄÊý¾Ý¸ñÊ½µÄtable
--Èçtable:
--table =
--{
--	name1 = {1,2,3},
--	name2 = {32,2,12},
--	name3 = {-1,5,3},
--}
--gf_SortKeyTable(table,1)±íÊ¾¶ÔµÚ1ÁÐµÄÊý¾Ý½øÐÐÅÅÐò£¬½µÐòÅÅÐòºóµÄtableÎªÈçÏÂ£º
--new_table
--{
--	[1] = {32,3,12,Key=name2},
--	[2] = {1,2,3,Key=name1},
--	[3] = {-1,5,3,Key=name3},
--}
function gf_SortKeyTable(tbOrg,nDataIdx,nSortType)
	nSortType = nSortType or 1;	--Ä¬ÈÏÎª½µÐò
	local tbRet ={};
	for k,v in tbOrg do
		local tb = gf_UnPack(v);
		for i=1,getn(v) do
			tbRet[i] = v[i];
		end;
		tbRet.Key = k
	end;
	local funSort1 = function(tb1,tb2)	--½µÐò
		if tb1[%nDataIdx] > tb2[%nDataIdx] then
			return 1;
		else
			return nil;
		end;
	end;
	local funSort2 = function(tb1,tb2)	--ÉýÐò
		if tb1[%nDataIdx] < tb2[%nDataIdx] then
			return 1;
		else
			return nil;
		end;
	end;
	local funSort = nil;
	if nSortType == 1 then
		funSort = funSort1;
	else
		funSort = funSort2;
	end;
	sort(tbRet,funSort);
	return tbRet;
end;
--´úÌæ×Ö·û´®ÖÐµÄÒ»Ð©·Ç·¨×Ö·û
function gf_FormatString(szName)
	local tbIllegal = {"/","|",":"};
	for i=1,getn(tbIllegal) do
		szName = sf_Replace(szName,tbIllegal[i],"-");
	end;
	return szName;
end;

function gf_CopyInherit(...)
	local base = gf_Merge2(gf_UnPack(arg));
	local derive = new(base);
	return derive
end

function gf_Merge2(...)
	local base = {}
	for i = 1, arg.n do
		for k,v in arg[i] do
			base[k] = arg[i][k];
		end
	end
	return base;
end

function nothing()

end;

function gf_RandRate(tRate, nMax, nLine)
	nLine = nLine or 1;
	if not nMax then
		nMax = 0;
		for i = 1, getn(tRate) do
			nMax = nMax + tRate[i][nLine];
		end
	end
	local nRand = random(nMax)
	for i = 1, getn(tRate) do
		if nRand <= tRate[i][nLine] then
			return tRate[i];
		else
			nRand = nRand - tRate[i][nLine];
		end
	end
end
function gf_TeamOperate(func, ...)
	local nSize = GetTeamSize()
	if nSize < 1 then
		func(gf_UnPack(arg));
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nSize do
			PlayerIndex = GetTeamMember(i)
			func(gf_UnPack(arg));
		end
		PlayerIndex = oldPlayerIndex;
	end
end
function gf_TeamOperateEX(func, ...)
	local tPlayer = GetTeamMemberIndex(GetTeamID()) or {};
	local nSize = getn(tPlayer);
	if nSize < 1 then
		func(gf_UnPack(arg));
	else
		local oldPlayerIndex = PlayerIndex;
		for i = 1, nSize do
			PlayerIndex = tPlayer[i]
			func(gf_UnPack(arg));
		end
		PlayerIndex = oldPlayerIndex;
	end
end
function gf_RandomSelected(tData, nRndIdx)
	if not tData or 0 == getn(tData) then
		return 0;
	end

	local nMax = 0;
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nMax = nMax + tInfo[nRndIdx];
		end
	end

	local nRand = random(1, nMax);
	for idx, tInfo in tData do
		if type(tInfo) == "table" then
			nRand = nRand - tInfo[nRndIdx];
			if nRand <= 0 then
				return idx;
			end
		end
	end

	return 0;
end
function gf_CallBack(...)
	if arg.n == 1 then
		arg = gf_UnPack(arg);
	end
	local func = arg[1];
	func(gf_UnPack(arg, 2));
end

function callout(f, ...)
	if type(f) ~= "function" then
		debug("[Error] [callout] [func=%s, type=%s]",Val2Str(f), type(f));
	end
	local targ = arg;
	return function (...)
		local p = gf_MergeTable(%targ, arg);
		%f(gf_UnPack(p))
	end
end

function rcallout(f, ...)
	local targ = arg;
	return function (...)
		local p = {};
		for k,v in %targ do
			p[k] = v;
		end
		for k,v in arg do
			p[k] = v;
		end
		p.n = nil
		%f(gf_UnPack(p))
	end
end

function gf_GetRealmName(strTongName)
	local aa,bb,strGbGroup,strGbName = strfind(strTongName,"(.-)*(.*)");
	if strGbName == nil then
		strGbGroup = "";
		strGbName = strTongName;
	end
	return strGbGroup,strGbName;
end

--ÐÂµÄLogDB£¬ÓÃ·¨£º
--gf_StartLog(type,name)
--gf_Log(str)
--¡­¡­
--gf_EndLog()
--StartºÍEndÖ®¼äµÄËùÓÐLog½«»áºÏ³ÉÒ»Ìõ¼ÇÂ¼£¬ÒÔ\t·Ö¸ô¿ª

function gf_StartLog(strType, strName)
	strLogType = strType
	strLogName = strName
	strLogContent = nil
end

function gf_EndLog()
	local ret = 0
	if strLogType and strLogName and strLogContent then
		ret = WriteLogDB(strLogType, strLogName, strLogContent)
	end
	strLogType, strLogName = nil, nil
	return ret
end

function gf_Log(strLog)
	if strLogType and strLogName then
		if strLogContent then
			strLogContent = strLogContent .. "\t" .. strLog
		else
			strLogContent = strLog
		end
		WriteLog(format("[%s] [%d] [Role:%s (acc:%s)] %s",
				strLogName, strLogType, GetName(), GetAccount(), strLog))
	end
end

function gf_AddItems(sItemIds, strName, nCount)
	if type(sItemIds) ~= "table" then
		WriteLog(format("[%s] [AddItemEx Tham sè sai!] [Role:%s (acc:%s)] [Item:%s]",--´íÎóÐÅÏ¢Êä³öµ½ÀÏµÄÈÕÖ¾
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end
	nCount = nCount or sItemIds[4];
	local nAmg = (nCount and 3) or 4;
	if getn(sItemIds) < nAmg then
		WriteLog(format("[%s] [AddItemEx Tham sè sai!] [Role:%s (acc:%s)] [Item:%s]",--´íÎóÐÅÏ¢Êä³öµ½ÀÏµÄÈÕÖ¾
			strLog, GetName(), GetAccount(), strName));
		return 0;
	end

	local nRet, nItemIdx = 0;
	if sItemIds[5] ~= nil then
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount,sItemIds[5],sItemIds[6],sItemIds[7],sItemIds[8],sItemIds[9],sItemIds[10],sItemIds[11],sItemIds[12],sItemIds[13],sItemIds[14]);
	else
		nRet, nItemIdx = AddItem(sItemIds[1],sItemIds[2],sItemIds[3],nCount);
	end
	if nRet == 0 then
		WriteLog(format("[%s] [AddItemEx: ThÊt b¹i] [Role:%s (acc:%s)] [Item:%s (%d,%d,%d,%d)]",--Ê§°Ü¼ÇÂ¼µ½ÀÏµÄÈÕÖ¾
			strLog, GetName(),GetAccount(),strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
	elseif nRet == 1 then
		Msg2Player("C¸c h¹ nhËn ®­îc ["..strName.."]x"..nCount);
		gf_Log(format("%s(%d,%d,%d)\t%d",
				strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount))
	elseif nRet == 2 then
		Msg2Player("C¸c h¹ ®· r¬i["..strName.."]x"..nCount);
		gf_Log(format("%s(%d,%d,%d)\t%d",
			strName,sItemIds[1],sItemIds[2],sItemIds[3],nCount));
	end
	return nRet, nItemIdx;
end

function gf_PrintTable(t, n)
	if "table" ~= type(t) then
		return 0;
	end

	n = n or 0;

	local str_space = "";
	for i = 0, n do
		str_space = str_space.."  ";
	end
	print(str_space.."{");

	for k, v in pairs(t) do
		local str_k_v = str_space.."  ["..tostring(k).."] = ";
		if "table" == type(v) then
			print(str_k_v);
			gf_PrintTable(v, n + 1);
		else
			str_k_v = str_k_v..tostring(v);
			print(str_k_v);
		end
	end

	print(str_space.."}");
end

function gf_CreateTraps(tTraps)
	for _, t in tTraps do
		local tPoint = gf_Line(t[2][1], t[2][2], t[3][1], t[3][2]);
		if tPoint then
			for i = 1, getn(tPoint) do
				AddMapTrap(t[1], tPoint[i][1] * 32, tPoint[i][2] * 32, t[4]);
			end
		end
	end
end

function gf_Line(x1, y1, x2, y2)
	local t, dx, dy = 0;
	local tPoint = {};
	if x2 == x1 then
		dx, dy = 0, 1;
	else
		local d = abs((y2 - y1) / (x2 - x1));
		if abs(d) > 1 then
			dx, dy = 1/d, 1;
		else
			dx, dy = 1 , d;
		end
	end
	if x2 < x1 then dx = -dx end
	if y2 < y1 then dy = -dy end

	while 1 do
		local x = x1 + t * dx;
		local y = y1 + t * dy;
		t = t + 1;
		tinsert(tPoint, {floor(x+0.1), floor(y+0.1)});
		if t > 1000 or (x == x2 and y == y2) then break end
	end
	if t >= 1000 then
		print(format("[ERROR] [autoexec:Line] [(%d, %d) -> (%d, %d)] [t >= 1000]", x1, y1, x2, y2));
		return
	end
	return tPoint;
end

function gf_get_table_count(tTable)
	if not tTable or 'table' ~= type(tTable) then return 0 end

	local nCount	= 0;
	for _, _ in tTable do
		nCount		= nCount + 1;
	end

	return nCount;
end

function gf_GetSafeStr(str)
	str = replace(str, "\\", "\\\\");
	str = replace(str, "'", "\\'");
	str = replace(str, '"', '\\"');
	str = replace(str, "\t", "\\t");
	str = replace(str, "\10", "\\010");
	str = replace(str, "\13", "\\013");
	str = replace(str, "\0", "\\000");
	str = replace(str, " ", "\032");
	str = replace(str, "%", "\%");
	str = replace(str, "|", "_");
	return str;
end

function gf_GetSafeName()
	return gf_GetSafeStr(GetName());
end

--»ñµÃ¶ÓÎéÖÐÁ÷ÅÉÖÖÊý£¨55¼¼ÄÜÅÐ¶ÏÎªÇ°Ìá£©
function gf_GetRouteCount()
	local RouteTable = {}
	local nCount = 1
	local nRoute = 0
	local flagInTable = 0
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		nRoute = GetPlayerRoute()
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
	return nCount - 1
end

--»ñÈ¡¶ÓÔ±ËùÔÚÖ¸¶¨°ï»áµÄÈËÊý
function gf_GetTeamSameTongNum(strTongName)
	if strTongName == nil or strTongName == "" then
		return -1;
	end
	local nCount = 0;
	local OldPlayerIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetTongName() == strTongName then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = OldPlayerIndex;
	return nCount;
end

--µÈ¼¶¼°¼¼ÄÜÅÐ¶Ï
function gf_CheckBaseCondition(nBaseLevel, bNotMsg)
	local nLevel = GetLevel();
	if nLevel < nBaseLevel or gf_Check55FullSkill() == 0 or GetPlayerFaction() == 0 then
		if not bNotMsg or bNotMsg ~= 1 then
			Talk(1,"",format("Ng­êi ch¬i cÊp <color=green>%d<color> trë lªn ®· gia nhËp hÖ ph¸i häc ®­îc <color=green>1<color> kü n¨ng cÊp <color=green>55<color> míi cã thÓ tham gia ho¹t ®éng.",nBaseLevel));
		end
		return 0;
	end
	return 1;
end

--µØÍ¼ÊÇ·ñÈÝÐí
function gf_MapIsAllow(tbMapID,nMapID)
	for i = 1, getn(tbMapID) do
		if nMapID == tbMapID[i] then
			return 1;
		end
	end
	return 0;	
end

--Í¨ÓÃ×°±¸Ëæ»ú------------------------------------------------
--ÐÇ¿Ì
function gf_RandXingKe()
	local tbTemp = {
		_XINGKE_WEAPON_TABLE,
		_XINGKE_CAP_TABLE,
		_XINGKE_CLOTH_TABLE,
		_XINGKE_SHOE_TABLE,
		_XINGKE_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandXingKe_Weapon()
	return gf_EventGiveRandAward(_XINGKE_WEAPON_TABLE, 10000, 1);
end

function gf_RandXingKe_Cap()
	return gf_EventGiveRandAward(_XINGKE_CAP_TABLE, 10000, 1);
end

function gf_RandXingKe_Cloth()
	return gf_EventGiveRandAward(_XINGKE_CLOTH_TABLE, 10000, 1);
end

function gf_RandXingKe_Shoe()
	return gf_EventGiveRandAward(_XINGKE_SHOE_TABLE, 10000, 1);
end

function gf_RandXingKe_Ring()
	return gf_EventGiveRandAward(_XINGKE_RING_TABLE, 10000, 1);
end

--ÌìÒÇ
function gf_RandTianYi()
	local tbTemp = {
		_TIANYI_WEAPON_TABLE,
		_TIANYI_CAP_TABLE,
		_TIANYI_CLOTH_TABLE,
		_TIANYI_SHOE_TABLE,
		_TIANYI_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandTianYi_Weapon()
	return gf_EventGiveRandAward(_TIANYI_WEAPON_TABLE, 10000, 1);
end

function gf_RandTianYi_Cap()
	return gf_EventGiveRandAward(_TIANYI_CAP_TABLE, 10000, 1);
end

function gf_RandTianYi_Cloth()
	return gf_EventGiveRandAward(_TIANYI_CLOTH_TABLE, 10000, 1);
end

function gf_RandTianYi_Shoe()
	return gf_EventGiveRandAward(_TIANYI_SHOE_TABLE, 10000, 1);
end

function gf_RandTianYi_Ring()
	return gf_EventGiveRandAward(_TIANYI_RING_TABLE, 10000, 1);
end

--ð©ÔÂ
function gf_RandHaoYue()
	local tbTemp = {
		_HAOYUE_WEAPON_TABLE,
		_HAOYUE_CAP_TABLE,
		_HAOYUE_CLOTH_TABLE,
		_HAOYUE_SHOE_TABLE,
		_HAOYUE_RING_TABLE,
	}
	local nIndex = random(getn(tbTemp));
	return gf_EventGiveRandAward(tbTemp[nIndex], 10000, 1), tbTemp[nIndex];
end

function gf_RandHaoYue_Weapon()
	return gf_EventGiveRandAward(_HAOYUE_WEAPON_TABLE, 10000, 1);
end

function gf_RandHaoYue_Cap()
	return gf_EventGiveRandAward(_HAOYUE_CAP_TABLE, 10000, 1);
end

function gf_RandHaoYue_Cloth()
	return gf_EventGiveRandAward(_HAOYUE_CLOTH_TABLE, 10000, 1);
end

function gf_RandHaoYue_Shoe()
	return gf_EventGiveRandAward(_HAOYUE_SHOE_TABLE, 10000, 1);
end

function gf_RandHaoYue_Ring()
	return gf_EventGiveRandAward(_HAOYUE_RING_TABLE, 10000, 1);
end

--1¼¶ÔÌÁé
function gf_Rand1YunLing()
	return gf_EventGiveRandAward(_YUNLING_1_TABLE, 10000, 1);
end

--2¼¶ÔÌÁé
function gf_Rand2YunLing()
	return gf_EventGiveRandAward(_YUNLING_2_TABLE, 10000, 1);
end

--3¼¶ÔÌÁé
function gf_Rand3YunLing()
	return gf_EventGiveRandAward(_YUNLING_3_TABLE, 10000, 1);
end

--ÁéÍ½×°±¸
function gf_RandLingTu(nType, bIsBody)
	local tEquip = {
			[1] = _LINGTU_CAP_TABLE_, --Í·
			[2] = _LINGTU_CLOTH_TABLE_, --ÒÂ
			[3] = _LINGTU_SHOE_TABLE_,	--¿ã
	}
	local tAward = tEquip[nType];
	if not tAward then return 0; end
	local nBody = GetBody();
	if not bIsBody or bIsBody ~= 1 then
		nBody = random(1, 4); --ÊÇ·ñ°´ÌåÐÍ
	end
	local tCell = tAward[nBody];
	if not tCell then return 0; end
	local nIndex = random(getn(tCell));
	gf_AddItemEx2(tCell[nIndex], GetItemName(tCell[nIndex][1], tCell[nIndex][2], tCell[nIndex][3]), "Trang bÞ Linh §å (NgÉu nhiªn)", tostring(nBody), 0, 1);
	return tCell[nIndex][1], tCell[nIndex][2], tCell[nIndex][3], tCell[nIndex][4];
end
-----------------------------------------------------------------

--Í¨ÓÃÍ¶µãROLLº¯Êý
--roll½çÃæ
--±ØÐëÒª´«ÈëNPCIndex
function gf_ThrowDice(tbItem, sFilePath, cbFunc, nMax, nTime, targetNpc)
	if type(tbItem) ~= "table" then return end
	if not targetNpc or targetNpc == 0 then
		print("Error:gf_ThrowDice(tbItem, sFilePath, cbFunc, nMax, nTime, targetNpc) targetNpc invalid");
		return 0;
	end 
	sFilePath = sFilePath or "\\script\\lib\\globalfunctions.lua";
	cbFunc = cbFunc or "gf_ThrowDiceCallBack";
	local diceId = ApplyItemDice(1, nMax or 100, nTime or 150, sFilePath, cbFunc, GetTeamSize() or 1, targetNpc);
	AddDiceItemInfo(diceId, gf_UnPack(tbItem))
	if GetTeamSize() > 1 then
		local nPlayerOld = PlayerIndex
		for i=1, GetTeamSize() do
			PlayerIndex = GetTeamMember(i);
			RollItem(diceId);
		end
		PlayerIndex = nPlayerOld;
	else
		RollItem(diceId);
	end
end

--roll»Øµ÷
function gf_ThrowDiceCallBack(dwID)
	local t, nSize, szItem = GetItemDiceRollInfo(dwID)
	local bAllGiveUp = 1;
	if type(t) ~= "table" then return end
	for index, value in t do
		local str = value[1].."NÐm"..value[2].." ®iÓm"
		if value[3] == 0 then
			str = value[1].."Phãng"
		elseif value[3] == 1 then
			str = str.." (TuyÕt cÇu)"
			if value[4] == 1 then
				str = str.." -§· nhÆt ®­îc"..szItem
				gf_WriteLogEx("gf_ThrowDice", "gf_ThrowDiceCallBack", nil, szItem, nil, GetTongName());
			end
			bAllGiveUp = 0
		elseif value[3] == 2 then
			str = str.." (Tham lam)"
			if value[4] == 1 then
				str = str.." -§· nhÆt ®­îc"..szItem
				gf_WriteLogEx("gf_ThrowDice", "gf_ThrowDiceCallBack", nil, szItem, nil, GetTongName());
			end
			bAllGiveUp = 0
		end
		Msg2Player(str)
	end
	if bAllGiveUp == 1 then
		Msg2Player("TÊt c¶ ng­êi ch¬i ®· bá cuéc")
	elseif nSize ~= getn(t) then
		Msg2Player("Nh÷ng ng­êi ch¬i kh¸c ®· v­ît qu¸ thêi gian, xem nh­ bá cuéc")
	end
end

--¶ÓÎé²Ù×÷¼æÈÝÃ»ÓÐ¶ÓÎéµÄÇé¿ö
function gf_GetTeamSize()
	local nTeamSize = GetTeamSize();
	if nTeamSize <= 0 then
		return 1;
	else
		return nTeamSize;
	end
end

function gf_GetCaptainName()
	if GetTeamSize() <= 0 then
		return GetName();
	else
		return GetCaptainName();
	end
end

function gf_GetTeamMember(nIndex)
	if nIndex < 0 then 
		return PlayerIndex; 
	end
	local nPlayerIndex = GetTeamMember(nIndex);
	if nPlayerIndex <= 0 then
		return PlayerIndex;
	else
		return nPlayerIndex;
	end
end

--Ëæ»únNum¸ö²»ÖØ¸´µÄÊý
--nNum ·µ»ØµÄË÷ÒýÊýÄ¿
--nStart ÆðÊ¼Ë÷Òý
--nEnd ½áÊøË÷Òý
function gf_Random(nStart, nEnd, nNum)
	local tRezult = {};
	if not nStart or not nEnd or not nNum then
		print("UDERROR:gf_Random nStart or nEnd or nNum is nil");
		return tRezult;
	end
	if nStart > nEnd then
		print("UDERROE:gf_Random nStart > nEnd");
		return tRezult;
	end
	if nNum > nEnd then
		print("UDERROR:gf_Random nNum > nEnd");
		return tRezult;
	end
	if nNum < 1 then
		print("UDERROR: gf_Random nNum < 1");
		return tRezult;
	end
	local nInc = floor(nEnd / nNum);
	local nTemp1 = nStart;
	local nTemp2 = nInc;
	for i = 1, nNum do
		if nNum == i then
			nTemp2 = nEnd;
		end
		tinsert(tRezult, random(nTemp1, nTemp2));
		nTemp1 = nTemp2 + 1;
		nTemp2 = nTemp2 + nInc;
	end
	if nNum ~= getn(tRezult) then
		print("UDERROR: gf_Random nNum ~= getn(tRezult)")
	end
	return tRezult;
end

--»ñµÃ¶ÓÎéÖ¸¶¨µÈ¼¶µÄÈËÊý
--Ç°±Õºó¿ªÇø¼ä
function gf_GetTeamPlayerCountByLevel(nMinLevel, nMaxLevel)
	local nCount = 0;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		local nLevel = GetLevel();
		if nLevel >= nMinLevel and nLevel < nMaxLevel then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	return nCount;
end

--·µ»Ø×ªÉúµÈ¼¶
function gf_GetPlayerRebornCount()
	local nAddvanceTrans = GetPlayerRebornParam(0)
	if nAddvanceTrans > 0 then
		--Ô½ÄÏ×ªÉú±äÁ¿×î¶à½øÐÐ5×ª£¬6×ªÒÔÉÏÖÐ·½ÏµÍ³¼ÇÂ¼
		return nAddvanceTrans + 5
	end
	
	return GetByte(GetTask(1538), 1)
end

--»ñµÃ¶ÓÎé×ªÉúÈËÊý
function gf_GetTeamRebornPlayerCount()
	local nCount = 0;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, gf_GetTeamSize() do
		PlayerIndex = gf_GetTeamMember(i);
		if gf_GetPlayerRebornCount() > 0 then
			nCount = nCount + 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	return nCount;
end

function gf_TodayDate()
	return tonumber(date("%Y%m%d"));
end

function callout(f, ...)
	if type(f) ~= "function" then
		debug("[Error] [callout] [func=%s, type=%s]",Val2Str(f), type(f));
	end
	local targ = arg;
	return function (...)
		local p = gf_MergeTable(%targ, arg);
		%f(gf_UnPack(p))
	end
end

function rcallout(f, ...)
	local targ = arg;
	return function (...)
		local p = {};
		for k,v in %targ do
			p[k] = v;
		end
		for k,v in arg do
			p[k] = v;
		end
		p.n = nil
		%f(gf_UnPack(p))
	end
end

function StatLog(...)
	local key, n1, n2 = arg[1] or 0, arg[2] or 0, arg[3] or 0;
	WriteLog(format("[StatLog] [%s] [%d, %d]", key, n1, n2));
end

function totable(...)
	arg.n = nil;
	return arg;
end

--Ô½ÄÏÀÛ¼ÆµÇÂ¼Ê±¼ä½Ó¿Ú
function gf_GetAccTime()
	return GetTask(2536) --ÀÛ¼ÆµÇÂ½·ÖÖÓmin
end

--Ô½ÄÏÀÛ¼ÆµÇÂ¼Ê±¼ä½Ó¿Ú
function gf_SetAccTime(nMinute)
	local nCurrAccTime = GetTask(2536)
	SetTask(2536, nMinute) --ÉèÖÃÀÛ¼ÆÊ±¼ämin
	WriteLog(format("[gf_SetAccTime] Set Accumulative Time %d To %d", nCurrAccTime, GetTask(2536)))
end

--¼ì²éµ±Ç°Ê±¼äÊÇ·ñÔÚÈÕÆÚÖ®ÄÚ
--tStart, tEnd = {year,month,day,hour,min,sec}
--³É¹¦·µ»Ø1£¬·ñÔÚ·µ»Ø0
function gf_CheckDuration(tStart, tEnd)
	local nCurTime = GetTime();
	local nStaTime = MkTime(tStart[1],tStart[2],tStart[3],tStart[4],tStart[5],tStart[6]);
	local nEndTime = MkTime(tEnd[1],tEnd[2],tEnd[3],tEnd[4],tEnd[5],tEnd[6]);
	if nCurTime >= nStaTime and nCurTime <= nEndTime then
		return 1;
	end
	return 0;
end

--¶ÓÎé¼ì²é
--Ê§°Ü·µ»Ø0£¬³É¹¦·µ»Ø1
--f£º·µ»Ø0»ò1
--msg£ºsayÌ§Í·
function gf_CheckTeam(f, msg)
	if type(f) ~= "function" then
		debug("[Error] [gf_CheckTeam] [func=%s, type=%s]", Val2Str(f), type(f));
	end
	local bCheck = nil;
	local oldPlayerIndex = PlayerIndex;
	for i = 1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if f() ~= 1 then
			msg = msg..format("<color=red>%s<color>\n", GetName());
			bCheck = 1;
		end
	end
	PlayerIndex = oldPlayerIndex;
	if bCheck then
		Say(msg, 0)
		return 0;
	end
	return 1;
end

--ÅÐ¶Ïµ±Ç°ÊÇ¶¼ÓÐ³öÕ½³èÎï
function gf_IsWorkingPet()
	local nNum, tPet = GetPetList();
	if nNum <= 0 then
		return 0;
	end
	for k, v in tPet do
		if v["nStatus"] ~= 0 then
			return 1;
		end
	end
	return 0;
end

--³èÎïÁéÁ¦Öµ
function gf_ModifyPetLingli(nValue)
	local nTaskValue = GetTask(1535);
	nTaskValue = nTaskValue + (nValue * 100);
	SetTask(1535, nTaskValue);
	Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm linh lùc thó c­ng", nValue));
end

--»ñµÃ½µÁéÊõµÈ¼¶£¨Ñ±ÊÞµÈ¼¶£©
function gf_GetPetSkillLevel()
	return GetSkillLevel(30149)--mod(GetTask(2560), 100);
end

--ÐÞ¸Ä½µÁéÊõµÈ¼¶£¨Ñ±ÊÞµÈ¼¶£©
function gf_SetPetSkillLevel(nValue)
--	local nTaskValue = GetTask(2560);
--	nTaskValue = nTaskValue - mod(nTaskValue, 100);
--	nTaskValue = nTaskValue + nValue;
--	SetTask(2560, nTaskValue);
	local nSkillId = 30149
	if gf_GetPetSkillLevel() < nValue then
    	while gf_GetPetSkillLevel() < nValue do
    		if gf_GetPetSkillLevel()==0 then
    			LearnSkill(nSkillId)
    		else
    			LevelUpSkill(nSkillId)
    		end
    	end
    	Msg2Player(format("Gi¸ng Linh ThuËt t¨ng lªn cÊp %d", nValue));
	end
end

--º¯ÊýÃû³Æ£ºÍæ¼ÒÃû³Æ¹ýÂËº¯Êý
--º¯Êý¹¦ÄÜ£ºÌæ»»Íæ¼ÒÃû³ÆÖÐµÄ·Ç·¨×Ö·û
function gf_FilterName(str,pattern,s)
	local startS, endS = strfind(str, pattern)
	while(startS) do
		str = strsub(str, 1, startS-1)..s..strsub(str, endS+1, strlen(str))
		startS, endS = strfind(str, pattern)
	end
	return str
end

--º¯ÊýÃû³Æ£º×é¶Ó¼ì²âº¯Êý
--º¯Êý¹¦ÄÜ£º¼ì²â´«ÈëµÄplayer_indexÊÇ·ñºÍµ±Ç°µÄPlayerIdexÔÚÍ¬Ò»¸ö¶ÓÎéÖÐ
function gf_IsInTeam(player_index)
	local team_member_num = GetTeamSize()
	local chk_flag = 0
	if team_member_num ~= 0 then
		for i = 1, team_member_num do
			if GetTeamMember(i) == player_index then
				chk_flag = 1
			end
		end
	end	
	return chk_flag
end

--ÊÇ·ñ´ïµ½nReborn×ªnlevel¼¶
function gf_CheckLevel(nReborn, nLevel)
	local nReb = gf_GetPlayerRebornCount();
	if (nReb >= nReborn and GetLevel() >= nLevel) or
			nReb >= nReborn + 1 
	then
		return 1;
	end
	return 0;
end

--ÅÐ¶ÏÔ½ÄÏ»ï°é¸´ÉúÈÎÎñÊÇ·ñÍê³É
function gf_CheckVeitPetTaskFinish()
--	local nGetQuest = mod(GetTask(TSK_PET_PS_GIAIDOAN_B),10)
--	if nGetQuest <= 2 then
--		Talk(1, "", "C¸c h¹ ch­a hoµn thµnh giai ®o¹n 1 phôc sinh b¹n ®ång hµnh.")
--		return 0
--	end
	local nIsPS = mod(floor(GetTask(TSK_PET_PS_GIAIDOAN_B)/10),10)
	if nIsPS < 1 then
		Talk(1,"", "§¹i hiÖp ch­a cã phôc sinh §ång Hµnh !!!!")
		return 0
	end
	return 1
end

function gf_CheckVeitPetTaskFinish_wrong()
	local TSK_PHUCSINH2 = 2175;
	local nMISSION_QTY = 50;
	if gf_GetTaskByte(TSK_PHUCSINH2, 2) == nMISSION_QTY and gf_GetTaskByte(TSK_PHUCSINH2, 3) == 127 then
		return 1;
	end
	return 0;
end