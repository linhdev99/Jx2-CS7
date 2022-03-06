-- ===================================================================
-- Name		:	business_link_head.lua
-- Desc		:	���̻�����ű���������������ʽ�ͽ���ģʽ
-- Date		:	Sep 1st, 2006
-- Creator	:	Tony(Jizheng)
-- ===================================================================
-- ����ļ����֧���Լ���ͼ��ת��֧��
Include("\\script\\task\\random\\task_gotoworld.lua");
-- �Ի�֮ҹͷ�ļ�
Include("\\script\\shinynight_head.lua");
--2006��ʥ���ڻ����֧��
Include("\\script\\online\\zgc_temp_fun.lua")
Include("\\script\\online_activites\\award.lua")
Include("\\script\\lib\\globalfunctions.lua")
Include("\\script\\online_activites\\ipbonus\\ipbonus.lua")
Include("\\script\\vng\\nhiemvulamgiau\\nhiemvulamgiau.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")	

-- �������ID�Ķ���
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
-- Ĭ����ں���
function business_entrance()
	--�ȼ����	
	local nDate = tonumber(date("%Y%m%d"))
--====================== Nhiem Vu Thuong Hoi ==================	
	if CFG_NhiemVuThuongHoi == 1 then
		-- ��ȡ�Ƿ�������һ������
		local nTaskState = GetChainTaskStatus(11)
		-- ��ȡ��ǰ�������������
		local nTaskCurType = GetTaskType(11)
		local strTalkTab = {}
		tinsert(strTalkTab,"<color=yellow>.Peter Meow Cute.<color> v�a ban chi�u: Nh�n s� n�o gi�p s�c <color=yellow>Meo Cute<color> s� ���c tr�ng th��ng! M�i ng�y c� th� nh�n t�i �a <color=yellow>10.000 l�n<color> nhi�m v�!")
		tinsert(strTalkTab,"Nhi�m v� l�n tr��c �� ho�n th�nh ch�a? Nh� l� trong ng�y ph�i ho�n th�nh <color=green>10.000 nhi�m v�<color> nh�! N�u <color=green> h�y 1 l�n s� b� tr� �i 1 l�n<color> tr�n t�ng s� nhi�m v�!")
		if nDate >= 20110913 and nDate <= 20110922 then
			tinsert(strTalkTab,"V� tri�u ��nh c�ng hi�n s�c l�c/no_accept_new_task")
		else
			tinsert(strTalkTab,"V� tri�u ��nh c�ng hi�n s�c l�c/accept_new_task")
		end
		tinsert(strTalkTab,"Kh�ng c� h�ng th� l�m nhi�m v� n�y/exit_dialog") -- 4
		tinsert(strTalkTab,"Nhi�m v� �� ho�n th�nh!/hand_up_task") -- 5
		tinsert(strTalkTab,"Nhi�m v� v�n ch�a ho�n th�nh/exit_dialog") -- 6
		tinsert(strTalkTab,"Ta mu�n h�y b� nhi�m v� �ang l�m/cancel_cur_task") -- 7
		tinsert(strTalkTab,"Gi�i thi�u t� m� nhi�m v� th��ng h�i/intro_new_task") -- 8 
		tinsert(strTalkTab,"Xem t�nh h�nh nhi�m v� th��ng h�i �� ho�n th�nh/query_cur_week_info") -- 9
		tinsert(strTalkTab,"��a ta ��n n�i l�m nhi�m v�/goto_mission_pos") -- 10
		tinsert(strTalkTab,"Mua �� nhi�m v� th��ng h�i/mua_do_nv") -- 11
		-- ����������
		if (nTaskState == 1) then
			if (nTaskCurType == 2) then
				Say(strTalkTab[2], 6, strTalkTab[5], strTalkTab[10], strTalkTab[7], strTalkTab[9], strTalkTab[11], strTalkTab[6])
			else
				Say(strTalkTab[2], 5, strTalkTab[5], strTalkTab[9], strTalkTab[6],strTalkTab[11], strTalkTab[7])
			end
		-- û�п�ʼ�������Ѿ���������һ����
		else
			Say(strTalkTab[1], 5, strTalkTab[3], strTalkTab[9], strTalkTab[8], strTalkTab[11], strTalkTab[4])
		end
	end

--================ Nhiem Vu Lam Giau =========================
	if CFG_NhiemVuLamGiau == 1 then
		local szSay = "Ch� c�n c� m�t �t b�n l�nh ho�n th�nh c�c th� th�ch c�a ta, ng��i s� nh�n ���c v� v�n t�i l�c, s� kh�ng kh� �� tr� th�nh ph� h�. Ng��i c� mu�n th� kh�ng?"
		local tbSay = {}
		tinsert(tbSay, "Nh�n nhi�m v� l�m gi�u m�i ng�y (ti�u hao 99 xu v�t ph�m)./NhiemVuLamGiau_Nhan")
		tinsert(tbSay, "Xem ti�n �� th�c hi�n nhi�m v�./NhiemVuLamGiau_Xem")
		tinsert(tbSay, "Nh�n t�i l�c./NhiemVuLamGiau_Thuong")
		tinsert(tbSay, "Ta ch�a mu�n gi�u c�./gf_DoNothing")
		Say(szSay, getn(tbSay), tbSay)
	end
end;

-- �˳��Ի���Ĭ�϶Ի�
function exit_dialog()
	Say("Ng��i v� n��c x� th�n, v� d�n c�u n�n th�t l� ��i �n ��i ��c!", 0)
end;
function mua_do_nv()
	Sale(88)
end;
-- �����µ��̻�����ĶԻ�
function intro_new_task()
--	Say("����ʥ��Ӣ�������ڿ�ս֮ǰ���ռ����㹻���ս�����ʣ������˼�����ʤ�ı��ϰ���Ϊ�˸�л������ʿ�ǵĴ���Э����ʥ��������͢�ó�ս��Ʒ���ʹ�ң�ֻҪ���һЩ���ź��������Σ�����յ����޻��߷˰���ܵõ����ı����������������ޣ�ÿ��ÿ��ֻ��һ�ٴλ��ᣬ��ҿ�Ҫץס���ᰡ�����ǽ����޷���ɣ��ڶ���Ҳ�����ٱ���ǰ�չ������������¿�ʼ������", 0)
	Say("Ho�ng th��ng v�a ban chi�u: Nh�n s� n�o gi�p s�c Tri�u ��nh s� ���c tr�ng th��ng! M�i ng�y c� th� nh�n t�i �a 60 l�n nhi�m v�. N�u trong ng�y kh�ng ho�n th�nh th� h�m sau s� ���c t�nh l�i t� ��u!", 0)
end;
--���Խ������ʱ���
--13��00-14��30
--16��00-17��00
--21��00-22��00
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

-- ��ȡһ��������
function accept_new_task()

--	if check_accept_task_time() == 0 then
--		Talk(1,"","<color=green>�̻��ϰ�<color>�����������Ϊ��æ������ʵ���ǲ�����æ��������������ֻ��ÿ�յ�<color=red>13��00-14��30��16��00-17��00��21��00-22��00<color>�����������λ�����⣬Ҫ���뿴��ʱ�䰡��");
--		return 0;
--	end;
	local nReput, nFaction = 0,0
--	if GetCreateTime() < 1306861186 then --ch�nh l�i th�i gian l� done
--		Say("Nh�n v�t ���c t�o sau ng�y 01/06/2011 m�i tham gia ���c.", 0)
--		return
--	end
	nReput = 3000
	nFaction = 4000	

	--if GetLevel() < 73 or GetReputation() < nReput or GetTask(336) < nFaction or GetPlayerRoute() == 0 then
	--	Say("N�ng l�c c�a ng��i c�n k�m l�m, ��i ��n <color=yellow>c�p 73, gia nh�p h� ph�i, c� �� �i�m danh v�ng v� s� m�n <color>h�y quay l�i c�ng hi�n s�c l�c c�ng ch�a mu�n.", 0)
	--	return
	--end
	local nDate = tonumber(date("%y%m%d"))
	local nLastGetDate = floor(GetTask(TSK_CHECK_BAOHAP) / 100)	
	if nLastGetDate ~= nDate then
	   SetTask(TSK_CHECK_BAOHAP, nDate * 100)
    end

	local nType = check_type()
	--if GetItemCount(2,1,30154) < tbCheck_Award[nType][1] and mod(GetTask(TSK_CHECK_BAOHAP),100) == 0 then
	--    Talk(1,"","��i hi�p kh�ng mang theo �� s� l��ng N� Oa B�o H�p �� nh�n nhi�m v� !!!")
	--    	return
	--end
    
	local bCanAccept = can_accept_task()
	if (bCanAccept == 1) then		-- �ж��Ƿ��ܹ�������
		SelectRandomTask(11)
		-------------------------------------
		DelItem(2,1,30154,tbCheck_Award[nType][1])
		SetTask(TSK_CHECK_BAOHAP, GetTask(TSK_CHECK_BAOHAP) + 1)
		
		-- ��ʾ����
		--local myText1,myText2,myText3,myText4 = "","","",""
		--myText1 = GetInfo(11, 1)
		--myText2 = GetInfo(11, 2)
		--myText3 = GetInfo(11, 3)
		--myText4 = GetInfo(11, 4)
		local myText = ""
		myText = GetInfo(11, 2)

		-- ��ȡ��ǰ�������������
		local nTaskCurType = GetTaskType(11)
		gf_WriteLogEx("Nhiem vu Thuong Hoi", "tham gia")
		if (nTaskCurType == 2) then
			Say("<color=green>Ch� th��ng h�i<color>:"..myText.."\n C� c�n ta ��a ��n n�i l�m nhi�m v� kh�ng?",
				2,
				"Phi�n ��a ta �i m�t chuy�n/goto_mission_pos",
				"Kh�ng c�n ��u/exit_dialog")
		else
			Say("<color=green>Ch� th��ng h�i<color>:"..myText.."\n", 0)
		end
	else
		Say("H�m nay ng��i �� l�m �� nhi�m v� r�i, ng�y mai l�i ��n nh�!", 0)
	end
end;


-- �����ȥ����ص�
function goto_mission_pos()
	-- ��ȡ������ĵ�ͼ ID
	local nMapIndex = tonumber(GetCurTaskLinkMapIndex(11))
	if (nMapIndex ~= 0 and nMapIndex ~= nil) then
		gotoWorld(nMapIndex)
	end
end;


-- �ж��Ƿ��ܹ�������
-- ���ڸ�Ϊ��ÿ������100�Σ�û���ۼӣ���һ������һ������� - Oct 28, 2006 Jeep tag
function can_accept_task()
	local nRet = 0
	-- ����������Ϣ
	refresh_time_records()
	
	--local nWeekDay = tonumber(date("%w"))
	--if (nWeekDay == 0) then
	--	nWeekDay = 7
	--end
	
	-- ���ܻ��������ٴ�
	--local nWeekCanDoTimes = nWeekDay * 20
	--local nHaveDoneCurWeek = GetTask(CURWEEK_DONE_TIMES)
	--nWeekCanDoTimes = nWeekCanDoTimes - nHaveDoneCurWeek
	
	-- ���컹�������ٴ�
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
	
	-- �����ص���ǰ�ķ����������������̻�����
	if (nCurDay < GetTask(LAST_DAY_DATE)) then
		nRet = 0
	end
	
	return nRet
end;

-- �ύ����˵�����
function hand_up_task()
	local nTaskFinish = QueryTaskFinish(11)
	-- ����������Ϣ
	refresh_time_records()
	local nType = check_type()	
	-- ��������
	--local nCount = prize_muti_by_time()
	--local multiple = 1		-- ��ʱ����Ի�֮ҹ��Ӱ��
	local nCount = 100		-- Ҳû��ÿ���˫��������
	local multiple = get_reward_multiple(SYS_COC)
	-- ��������
	local nPrizeType = 1	-- ��Ǯ

	-- �Ѿ����������
	if (nTaskFinish == 1) then

		-- ֪ͨ�������������
		FinishTaskStep(11, nPrizeType, nCount * multiple) 
		--if GetTask(CURDAY_DONE_TIMES) < 40 then
		--	ModifyReputation(5, 0)
		--else
		--	ModifyReputation(10, 0)
		--end
		ModifyReputation(10, 0)
		Msg2Player("B�n nh�n ���c 10 �i�m danh v�ng")
		--- Modify �i�m danh v�ng
		if GetTask(CURDAY_DONE_TIMES)  <= 24 then
			if  GetLevel() >= 73 and GetLevel() <= 79  then
				--ModifyReputation(- 1, 0)
				--Msg2Player("B�n �� b� tr� 1 �i�m danh v�ng")
			end
			if GetLevel() >= 80 and GetLevel() <= 89  then
				--ModifyReputation(- 2, 0)
				--Msg2Player("B�n �� b� tr� 2 �i�m danh v�ng")
			end 
		end
		----------------------------------------------- ph�t th��ng theo m�c lev
		--ModifyReputation(- 3, 0)		
		Earn(tbCheck_Award[nType][2])	
		-- ���µ���ͱ����Ѿ���ɵ�����
		local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
		local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
		SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
		SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)
		--ʥ���ڻ--
			--Xmas_prize_get(3)
		--����
		-- �call back
		-- Th�m b�c IPBonus
		--AddMoneyForIPBonus()
		-- Kh�ng s� d�ng h�m c�a Kingsoft  vi�t (H�m n�y s� d�ng theo d�ng event 
--		Give_Business_Award();
		local nLastLoginIp,nCurrentLoginIp = GetLoginIP();	
		local nLIP1,nCIP1 = floor(nLastLoginIp/2^24),floor(nCurrentLoginIp/2^24);
		local nLIP2,nCIP2 = floor((nLastLoginIp-nLIP1*2^24)/2^16),floor((nCurrentLoginIp-(nCIP1*2^24))/2^16);
		local nLIP3,nCIP3 = floor((nLastLoginIp-nLIP1*2^24-nLIP2*2^16)/2^8),floor((nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16)/2^8);
		local nLIP4,nCIP4 = nLastLoginIp-nLIP1*2^24-nLIP2*2^16-nLIP3*2^8,nCurrentLoginIp-nCIP1*2^24-nCIP2*2^16-nCIP3*2^8;
		local szLIP = tostring(nLIP1.."."..nLIP2.."."..nLIP3.."."..nLIP4);
		local szCIP = tostring(nCIP1.."."..nCIP2.."."..nCIP3.."."..nCIP4);
		
--		WriteLogEx("Nhiem vu Thuong Hoi", "ho�n th�nh", tBonus[nLevel], "��ng")
		gf_WriteLogEx("Nhiem Vu Thuong Hoi", "ho�n th�nh 1 nhi�m v�", 1, "Th��ng h�i lo�i "..tbCheck_Award[nType][3])
		if GetTask(CURDAY_DONE_TIMES)  == 60 then
			gf_WriteLogEx("Nhiem Vu Thuong Hoi", "ho�n th�nh 60 nhi�m v�", 1, "Ho�n th�nh 60 nhi�m v�")
		end
		-----------------------Chu�i nhi�m v� ��ng H�nh
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
		-- ʦ������ ���̻ᣩ
		local nChance, nMaxChance = CustomDataRead("mp_shanghui")
		if nChance ~= nil then
			nChance = nChance + 1
			if nChance < nMaxChance then
				CustomDataSave("mp_shanghui", "dd", nChance, nMaxChance)
				Msg2Player("Nhi�m v� S� ��-T�nh h�nh ho�n th�nh Th��ng h�i-:"..nChance.."/"..nMaxChance)
			else
				PrenticeCompleteTask()
			end
		end
	else
		Say("Ng��i ch�a ho�n th�nh nhi�m v� ta giao! Ti�p t�c c� g�ng nh�!", 0)
	end
end;

function prize_muti_by_time()
	local nRet = 100
	local nCurrTime = {date("%w"), date("%H")}
	local nWeekday = tonumber(nCurrTime[1])
	local nHours = tonumber(nCurrTime[2])
	
	if (nWeekday == 0 or nWeekday == 6) then	-- ��ĩ
		if (nHours == 18 or nHours == 19 or nHours == 20 or nHours == 21) then
			nRet = 200
		end
	else										-- ƽʱ
		if (nHours == 20 or nHours == 21) then	
			nRet = 200
		end									
	end
	
	return nRet
end;

-- ȡ��������������
function cancel_cur_task()
--	Say("<color=green>�̻��ϰ�<color>��<color=yellow>ȡ������<color>���ķ�һ����ȡ�������Ļ��ᣬ��ȷ��Ҫȡ���˴�������",
	Say("<color=yellow>Kh�ng th�ch l�m th� h�y<color> ! C� g� ��u m� lo... Oh yeahhh!",
		2,
		"H�y b� nhi�m v�/confirm_cancel_task",
		"�� ta suy ngh� l�i/exit_dialog")
end;

-- ȷ��ȡ��������������
--function confirm_cancel_task()
--	-- ֪ͨ����ȡ����ǰ����
--	CleanTask(11)
--	-- ����������Ϣ
--	refresh_time_records()
--	
--	-- ���µ���ͱ����Ѿ���ɵ�����
--	local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
--	local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
--	SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
--	SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)
--	
--	-- ��ʾ���
--	Say("<color=green>�̻��ϰ�<color>�����Ѿ��ɹ���ȡ���˱������񣬵���Ҳ�ķ���һ����ȡ�������Ļ��ᣡ", 0)
--end;

-- ���ȷ��ȡ������
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

		do_cancel_task();  -- �������

		Say("Xong r�i! b�y gi� b�ng h�u c� th� nh�n nhi�m v� m�i!",0);
		Msg2Player("H�y xong r�i �� !!! Meow Meow");
		TaskTip("H�y xong r�i �� !!! Meow Meow!");
	else
		Say("<color=yellow>�i�m danh v�ng hi�n t�i<color> c�a ng��i qu� th�p, kh�ng th� h�y nhi�m v� l�n n�y!",0);
		Msg2Player("�i�m danh v�ng qu� th�p, kh�ng th� h�y nhi�m v�!");
		TaskTip("�i�m danh v�ng qu� th�p, kh�ng th� h�y nhi�m v�!");
		return
	end;
	return
end

-- ȷ��ȡ��������������
function do_cancel_task()
	-- ֪ͨ����ȡ����ǰ����
	CleanTask(11);
	-- ����������Ϣ
	refresh_time_records()
	
	-- ���µ���ͱ����Ѿ���ɵ�����
	local nCurDayDoneTimes = GetTask(CURDAY_DONE_TIMES)
	local nCurWeekDoneTimes = GetTask(CURWEEK_DONE_TIMES)
	SetTask(CURDAY_DONE_TIMES, nCurDayDoneTimes + 1)
	SetTask(CURWEEK_DONE_TIMES, nCurWeekDoneTimes + 1)
	
end;

-- �鿴����������̻���������
function query_cur_week_info()
	--local strDayDesc = {"һ", "��", "��", "��", "��", "��", "��"}
	
	-- �ȸ�������
	refresh_time_records()
	
	--local nWeekDay = tonumber(date("%w"))
	--if (nWeekDay == 0) then
	--	nWeekDay = 7
	--end
	
	-- ���ܻ��������ٴ�
	--local nWeekCanDoTimes = nWeekDay * 20
	--local nHaveDoneCurWeek = GetTask(CURWEEK_DONE_TIMES)
	--nWeekCanDoTimes = nWeekCanDoTimes - nHaveDoneCurWeek
	
	-- ���컹�������ٴ�
	--local nDayCanDoTimes = 3 * 20
--	local nDayCanDoTimes = 100
	local nDayCanDoTimes = 10000
	local nHaveDoneCurDay = GetTask(CURDAY_DONE_TIMES)
	nDayCanDoTimes = nDayCanDoTimes - nHaveDoneCurDay
	--if (nWeekCanDoTimes < nDayCanDoTimes) then
	--	nDayCanDoTimes = nWeekCanDoTimes
	--end
	
	Say("H�m nay �� ho�n th�nh <color=yellow>"..nHaveDoneCurDay.."<color> l�n nhi�m v�. C�n c� th� nh�n <color=yellow>"..nDayCanDoTimes.."<color> l�n! ", 0)
end;

-- ˢ��������Ϣ
function refresh_time_records()
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%w")}
	local nCurDay = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])
	--local nCurWeekDay = tonumber(nCurrTime[4])
	
	-- ���µ��������
	if (nCurDay > GetTask(LAST_DAY_DATE)) then
		SetTask(LAST_DAY_DATE, nCurDay)		-- �������������
		SetTask(CURDAY_DONE_TIMES, 0)		-- ���±������˵��������
	end
	
	-- ���±��ܵ���Ϣ
	--if (nCurDay > GetTask(LAST_WEEKEND_DATE)) then
	--	local nNextWeekEnd = refresh_last_week_end()
	--	SetTask(LAST_WEEKEND_DATE, nNextWeekEnd)		-- �����¸���ĩ��ʱ��
	--	SetTask(CURWEEK_DONE_TIMES, 0)					-- ���±������˵��������
	--end
end;

-- �����¸���ĩ��ʱ��
function refresh_last_week_end()
	local nCurrTime = {date("%y"), date("%m"), date("%d"), date("%w")}
	local nCurDate = tonumber(nCurrTime[1]..nCurrTime[2]..nCurrTime[3])		-- ��ǰ������
	local nCurYear = tonumber(nCurrTime[1])			-- ��ǰ���
	local nCurMonth = tonumber(nCurrTime[2])		-- ��ǰ�·�
	local nCurDay = tonumber(nCurrTime[3])			-- ��ǰ��
	local nCurWeekDay = tonumber(nCurrTime[4])		-- ��ǰ�ܼ�
	
	-- ���վ�ֱ�ӷ��ص�������
	if (nCurWeekDay == 0) then
		return nCurDate
	end
	
	local nPassDay = 31									-- �����·�31��Ĵ���
	if (nCurMonth == 2) then							-- 2�·ݵĴ��� 28��Ĵ���
		nPassDay = 28
		if (nCurYear == 8 or nCurYear == 12) then		-- ����
			nPassDay = 29
		end
	elseif (nCurMonth == 4 or nCurMonth == 6 or
			nCurMonth == 9 or nCurMonth == 11) then		-- 4��6��9��11�µĴ���30��Ĵ���
		nPassDay = 30
	end
	
	-- ��Ҫ�ӵ�����
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

-- �i�u ki�n th�m b�c IPBonus ( tr��ng h�p 2 b�c v� 20 b�c )
function AddMoneyForIPBonus()
	if GetPlayerRoute() == 0 or VET_CheckIpBonus() == 0 then
		return
	end
	
	local tIpBonusReq =
	{
		[1] = {80, 10000, 10000, 2000},
		[2] = {73, 3000, 4000, 200},
	}
	
	-- T�m m�c thu�ng ph� h�p v�i �i�u ki�n c�a ng��i ch�i
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
	
	-- Th��ng ti�n v� ghi log trong nh�m IPBonus
	local nBonusMoney = tIpBonusReq[nCheck][4]
	Earn(nBonusMoney)
	nBonusMoney = nBonusMoney / 100
	Msg2Player("B�n nh�n ���c "..nBonusMoney.." b�c")
	gf_WriteCustomLog(VET_STR_IPBONUS_LOG_TITLE, "nh�n ���c "..nBonusMoney.." b�c")
end

	-- Kh�ng cho nh�n nv Th��ng h�i
function no_accept_new_task()
	Talk(1,"","B�n �� nh�n nhi�m v� r�i, h�y ho�n th�nh �� nh�n ph�n th��ng!!!")
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