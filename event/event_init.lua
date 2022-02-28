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
		"§æi 10 Nguyªn LiÖu mçi lo¹i + 2 Tiªu Dao Ngäc lÊy vËt phÈm sù kiÖn/EventCount",
	}
	
	local ItemFinal = Event_List[nDate]["final_item"];
	for k, v in pairs(ItemFinal) do
		tinsert(tSay, format("NhËn th­ëng sö dông tèi ®a "..Max_Event.." "..v[1].." ("..ShowTaskCount(v[5])..")/#EventFinal("..v[3][3]..")"));
	end
	
	if CheckName(nName) == 1 then
		tinsert(tSay, "NhËn hç trî nguyªn liÖu Event (GM test chøc n¨ng)/EventSupport");
		tinsert(tSay, "NhËn hç trî hoµn thµnh Event (GM test chøc n¨ng)/EventSupport2");
	end
	
	tinsert(tSay, "Tho¸t/nothing");
	Say("<color=green>Sù KiÖn Th¸ng "..nDate..":<color> "..Event_List[nDate]["name"], getn(tSay), tSay);
end

function ShowTaskCount(nTask)
	if GetTask(nTask) > Max_Event then return "§· hoµn thµnh"
	else return TASK_MOD:GetTask(nTask).."/"..Max_Event end
end

function EventCount()
	local nDate = CheckDate();
	local var_1 = Event_List[nDate]["item"][1][2];
	local var_2 = Event_List[nDate]["item"][2][2];
	local NeedItem = 0;
	
	if GetItemCount(var_1[1], var_1[2], var_1[3]) < 10 or  GetItemCount(var_2[1], var_2[2], var_2[3]) < 10 then
		Talk(1,"","HiÖn t¹i b¹n ch­a ®ñ nguyªn liÖu ®Ó hîp thµnh")
		return
	end
	
	if GetItemCount(var_1[1], var_1[2], var_1[3]) >= GetItemCount(var_2[1], var_2[2], var_2[3]) then
		NeedItem = GetItemCount(var_2[1], var_2[2], var_2[3]) /10
	else
		NeedItem = GetItemCount(var_1[1], var_1[2], var_1[3]) / 10
	end
	
	--print(NeedItem)
	
	if NeedItem > 0 then
		AskClientForNumber("EventExchange", 1, NeedItem, "NhËp Sè L­îng");
		return
	end
	
	Talk(1,"","HiÖn t¹i b¹n ch­a ®ñ nguyªn liÖu ®Ó hîp thµnh")
end

function EventExchange(nVar)
	local nDate = CheckDate();
	
	--B­íc 1: Check sè l­îng nhËp vµo
	if not nVar or nVar == 0 then
		Talk(1,"","Tham sè nhËp vµo kh«ng ®óng, vui lßng nhËp l¹i")
		return
	end
	
	--B­íc 2: Check sè l­îng Item
	local ListItem = Event_List[nDate]["item"];
	local NeedCountItemEvent = 10 * nVar;
	local NeedCountItemTieuDao = 2 * nVar;
	for k, v in pairs(ListItem) do
		if GetItemCount(v[2][1], v[2][2], v[2][3]) < NeedCountItemEvent then
			Talk(1,"","Hmm, b¹n kh«ng cã ®ñ <color=red>"..NeedCountItemEvent.."<color> "..v[1])
			return
		end
	end
	
	if GetItemCount(2,1,30603) < NeedCountItemTieuDao then
		Talk(1,"","Hmm, b¹n kh«ng cã ®ñ <color=red>"..NeedCountItemTieuDao.."<color> Tiªu Dao Ngäc")
		return
	end

	--B­íc 3: NhËn Item
	local ListItemFinal = Event_List[nDate]["final_item"];
	for i = 1, nVar do
		local nRand = gf_GetRandItemByTable(ListItemFinal,100,1);
		local nRet, nItemIdx = gf_AddItemEx2(ListItemFinal[nRand][3],ListItemFinal[nRand][1],"Sù KiÖn","Th¸ng",ListItemFinal[nRand][4]);
	end
	
	--B­íc 4: Xãa Item
	for k, v in pairs(ListItem) do
		DelItem(v[2][1], v[2][2], v[2][3], NeedCountItemEvent);
	end
	DelItem(2,1,30603, NeedCountItemTieuDao);
	
	Talk(1,"","Trao ®æi thµnh c«ng <color=green>"..nVar.."<color> lo¹i nguyªn liÖu")
	Msg2Player("Trao ®æi thµnh c«ng "..nVar.." lo¹i nguyªn liÖu");
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
		Talk(1,"","B¹n ®· nhËn phÇn th­ëng nµy råi !")
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
		Talk(1,"","HiÖn t¹i b¹n ch­a sö dông ®ñ sè l­îng "..Max_Event.." vËt phÈm !")
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
			AddLocalNews("Sù kiªn th¸ng "..nDate..": "..Event_List[nDate]["name"].." ®· b¾t dÇu");
			Msg2SubWorld("Sù kiªn th¸ng "..nDate..": "..Event_List[nDate]["name"].." ®· b¾t dÇu");
		end
	end
end