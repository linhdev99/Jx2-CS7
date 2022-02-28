Include("\\script\\lib\\globalfunctions.lua");
Include("\\settings\\static_script\\cheat\\event\\event_list.lua");
Include("\\settings\\static_script\\cheat\\list_gm.lua");

function CheckDate()
	return tonumber(date("%m"))
end

function CheckDay()
	return tonumber(date("%d"))
end

function EventMain()
	local nDate = CheckDate();
	local nName = GetAccount();
	
	local tSay = {
		"��i 10 Nguy�n Li�u m�i lo�i + 2 Ti�u Dao Ng�c l�y v�t ph�m s� ki�n/EventCount",
	}
	
	local ItemFinal = Event_List[nDate]["final_item"];
	for k, v in pairs(ItemFinal) do
		tinsert(tSay, format("Nh�n th��ng s� d�ng t�i �a "..Max_Event.." "..v[1].." ("..ShowTaskCount(v[5])..")/#EventFinal("..v[3][3]..")"));
	end
	
	if CheckName(nName) == 1 then
		tinsert(tSay, "Nh�n h� tr� nguy�n li�u Event (GM test ch�c n�ng)/EventSupport");
		tinsert(tSay, "Nh�n h� tr� ho�n th�nh Event (GM test ch�c n�ng)/EventSupport2");
	end
	
	tinsert(tSay, "Tho�t/nothing");
	Say("<color=green>S� Ki�n Th�ng "..nDate..":<color> "..Event_List[nDate]["name"], getn(tSay), tSay);
end

function ShowTaskCount(nTask)
	if GetTask(nTask) > Max_Event then return "�� ho�n th�nh"
	else return TASK_MOD:GetTask(nTask).."/"..Max_Event end
end

function EventCount()
	local nDate = CheckDate();
	local var_1 = Event_List[nDate]["item"][1][2];
	local var_2 = Event_List[nDate]["item"][2][2];
	local NeedItem = 0;
	
	if GetItemCount(var_1[1], var_1[2], var_1[3]) < 10 or  GetItemCount(var_2[1], var_2[2], var_2[3]) < 10 then
		Talk(1,"","Hi�n t�i b�n ch�a �� nguy�n li�u �� h�p th�nh")
		return
	end
	
	if GetItemCount(var_1[1], var_1[2], var_1[3]) >= GetItemCount(var_2[1], var_2[2], var_2[3]) then
		NeedItem = GetItemCount(var_2[1], var_2[2], var_2[3]) /10
	else
		NeedItem = GetItemCount(var_1[1], var_1[2], var_1[3]) / 10
	end
	
	--print(NeedItem)
	
	if NeedItem > 0 then
		AskClientForNumber("EventExchange", 1, NeedItem, "Nh�p S� L��ng");
		return
	end
	
	Talk(1,"","Hi�n t�i b�n ch�a �� nguy�n li�u �� h�p th�nh")
end

function EventExchange(nVar)
	local nDate = CheckDate();
	
	--B��c 1: Check s� l��ng nh�p v�o
	if not nVar or nVar == 0 then
		Talk(1,"","Tham s� nh�p v�o kh�ng ��ng, vui l�ng nh�p l�i")
		return
	end
	
	--B��c 2: Check s� l��ng Item
	local ListItem = Event_List[nDate]["item"];
	local NeedCountItemEvent = 10 * nVar;
	local NeedCountItemTieuDao = 2 * nVar;
	for k, v in pairs(ListItem) do
		if GetItemCount(v[2][1], v[2][2], v[2][3]) < NeedCountItemEvent then
			Talk(1,"","Hmm, b�n kh�ng c� �� <color=red>"..NeedCountItemEvent.."<color> "..v[1])
			return
		end
	end
	
	if GetItemCount(2,1,30603) < NeedCountItemTieuDao then
		Talk(1,"","Hmm, b�n kh�ng c� �� <color=red>"..NeedCountItemTieuDao.."<color> Ti�u Dao Ng�c")
		return
	end

	--B��c 3: Nh�n Item
	local ListItemFinal = Event_List[nDate]["final_item"];
	for i = 1, nVar do
		local nRand = gf_GetRandItemByTable(ListItemFinal,100,1);
		local nRet, nItemIdx = gf_AddItemEx2(ListItemFinal[nRand][3],ListItemFinal[nRand][1],"S� Ki�n","Th�ng",ListItemFinal[nRand][4]);
	end
	
	--B��c 4: X�a Item
	for k, v in pairs(ListItem) do
		DelItem(v[2][1], v[2][2], v[2][3], NeedCountItemEvent);
	end
	DelItem(2,1,30603, NeedCountItemTieuDao);
	
	Talk(1,"","Trao ��i th�nh c�ng <color=green>"..nVar.."<color> lo�i nguy�n li�u")
	Msg2Player("Trao ��i th�nh c�ng "..nVar.." lo�i nguy�n li�u");
end

function EventSupport()
	local nDate = CheckDate();
	
	local ListItem = Event_List[nDate]["item"];
	for k, v in pairs(ListItem) do
		AddItem(v[2][1], v[2][2], v[2][3], 25000)
	end
	AddItem(2,1,30603,8000)
end

function EventSupport2()
	local nDate = CheckDate();

	local ItemFinal = Event_List[nDate]["final_item"];
	for k, v in pairs(ItemFinal) do
		TASK_MOD:SetTask(v[5], Max_Event)
	end
end

function EventFinal(nItem)
	local nDate = CheckDate();
	local ItemFinal = Event_List[nDate]["final_item"];
	
	for k, v in pairs(ItemFinal) do
		if nItem == v[3][3] then
			CheckEventFinal(v[5], k);
			return
		end
	end
end

function CheckEventFinal(nTask, i)
	if TASK_MOD:GetTask(nTask) > Max_Event then
		Talk(1,"","B�n �� nh�n ph�n th��ng n�y r�i !")
		return
	end
	
	if TASK_MOD:GetTask(nTask) == Max_Event then
		if i == 1 then
			ModifyExp(1500000000);
			AddItem(2,1,30370,5);
			AddItem(2,95,204,5);
			AddItem(2,1,30499,400);
			
			AddItem(2,1,30557,1);
			
			
			SetTask(nTask, Max_Event + 1);
			TASK_MOD:SetTask(nTask, Max_Event + 1);
		elseif i == 2 then
			ModifyExp(3000000000);
			AddItem(2,1,30370,15);
			AddItem(2,95,204,15);
			AddItem(2,1,30499,599);
			
			
			
			AddItem(2,1,30559,1);
			
			
			TASK_MOD:SetTask(nTask, Max_Event + 1);
		end
		
		return
	end
	
	if TASK_MOD:GetTask(nTask) < Max_Event then
		Talk(1,"","Hi�n t�i b�n ch�a s� d�ng �� s� l��ng "..Max_Event.." v�t ph�m !")
	end
end

function EventAddPhoBan(nVar)
	local nDate = CheckDate();
	local ListItem = Event_List[nDate]["item"];
	
	for k, v in pairs(ListItem) do
		local Item = v[2];
		AddItem(Item[1],Item[2],Item[3],nVar);
	end
end

function ResetOldEvent(nType)
	local nDate = CheckDate();
	local nDay = CheckDay();
	local nDateOld = 0;
	
	if nDay ~= 1 then
		return 0
	end
	
	--Get Date Old
	if nDate == 1 then
		nDateOld = 12
	else
		nDateOld = nDate - 1
	end

	--Reset
	if nDay == 1 then
		local ItemFinalOld = Event_List[nDateOld]["final_item"];
	
		for k, v in pairs(ItemFinalOld) do
			TASK_MOD:SetTask(v[5], 0);
		end
		
		if nType == 1 then
			AddLocalNews("S� ki�n th�ng "..nDate..": "..Event_List[nDate]["name"].." �� b�t d�u");
			Msg2SubWorld("S� ki�n th�ng "..nDate..": "..Event_List[nDate]["name"].." �� b�t d�u");
		end
	end
end