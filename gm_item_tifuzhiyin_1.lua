--���ָ��
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua");
Include("\\script\\system_switch_config.lua");
Include("\\settings\\static_script\\cheat\\list_gm.lua");

g_szTitle = "<color=green>GM: <color>"

nD1 = 0;
nD2 = 0;
nD3 = 0;
nIDOutfit = 0;
nIDOutfitType = 0;
IsTBPHP = 0;
nTBCT_ATT_A = 0;
nTBCT_ATT_TP = 0;
nTBCT_ATT_NB = 0;
nTBCT_ATT_VK = 0;

outfitSzSay = {
        g_szTitle.."H�y l�a ch�n thu�c t�nh:",
"M�c ��nh/#Mod_NTGetOutfits(0)", 
  "B� qua t� l� gi�n c�ch chi�u, n�i l�c, ph�ng th� ��i ph��ng 100%/#Mod_NTGetOutfits(14636)",	
  "Tr�nh m�i tr�ng th�i ph�, n�i ngo�i ph�ng t�ng 5000/#Mod_NTGetOutfits(14637)",	
  "Mi�n d�ch h�n lo�n, ng�, ��nh ng� 100%/#Mod_NTGetOutfits(14638)",	
  "Mi�n d�ch ��ng y�n, cho�ng, ��nh lui 100%/#Mod_NTGetOutfits(14639)",	
  "Kh�ng t�t c� 3000, t�c �� xu�t chi�u t�ng 500%, Gi�m n�a m�i s�t th��ng/#Mod_NTGetOutfits(14640)",	
  "Ngo�i, n�i ph�ng t�ng 100%, sinh l�c v� ��ch/#Mod_NTGetOutfits(14641)",	
  "T�c �� di chuy�n t�ng 100%, x�c su�t xu�t chi�u t�ng 100%, �� b�n v� kh� 600s h�i 100/#Mod_NTGetOutfits(14642)",	
  "N�i, ngo�i c�ng t�ng 9000%, h� tr� m�t t�ch t�ng 300%/#Mod_NTGetOutfits(14643)",
"H�i ph�c sinh l�c m�i n�a gi�y 10%, Gi�m th� th��ng 100%, H� tr� m�t t�ch 300%/#Mod_NTGetOutfits(14644)",
"T�c �� xu�t chi�u t�ng 1000%, th�i gian h� tr� t�n c�ng ph�ng th� t�ng 1000%/#Mod_NTGetOutfits(14645)",	
         "T�ng t�c �� xu�t chi�u 85%, Kh�ng t�t c� 4xx/#Mod_NTGetOutfits(14487)",
         "T�ng t�c �� thi tri�n v� c�ng 92%, kh�ng t�t c� 280, t�ng t� l� ch�u ��n 55%/#Mod_NTGetOutfits(14524)",
        "T�c �� di chuy�n t�ng 140%/#Mod_NTGetOutfits(403)",
        "Gi�m th� th��ng 165%, sinh l�c t�ng 44000/#Mod_NTGetOutfits(14523)",
        "Gi�n c�ch li�n hoa t�m kinh v� 0, Th�i gian h� tr� t�n c�ng ph�ng th� t�ng 140%/#Mod_NTGetOutfits(852)",
        "N�i l�c ti�u hao gi�m 98%/#Mod_NTGetOutfits(14611)", 
        "Ph�ng ng� n�i ngo�i c�ng t�ng 8%/#Mod_NTGetOutfits(495)",
        "N�n, Y ph�c, H� Y m�i 600s ph�c h�i �� b�n 7/#Mod_NTGetOutfits(405)",
        "�� b�n v� kh� m�i 600s ph�c h�i 7/#Mod_NTGetOutfits(43)",
        "Tr�nh m�i tr�ng th�i ph� 70%/#Mod_NTGetOutfits(406)",
        "Mi�n d�ch Lo�n, Ng�, ��nh ng� 50%/#Mod_NTGetOutfits(13066)",
        "Mi�n d�ch ��ng y�n, Cho�ng, ��nh lui 50%/#Mod_NTGetOutfits(13067)",
        "M�i n�a gi�y ph�c h�i sinh l�c ��ng ��i 7%/#Mod_NTGetOutfits(416)",
        "N�i c�ng t�ng 140%/#Mod_NTGetOutfits(14526)",
        "Ngo�i c�ng t�ng 140%/#Mod_NTGetOutfits(14525)",
        "B� qua ph�ng ng� 35%/#Mod_NTGetOutfits(252)",
        "Kh�ng t�t c� 240, N�i ngo�i ph�ng t�ng 900 �i�m/#Mod_NTGetOutfits(13355)",
        "Ph�ng th� n�i c�ng ��i ph��ng gi�m 43%/#Mod_NTGetOutfits(846)",
        "Ph�ng th� ngo�i c�ng ��i ph��ng gi�m 43%/#Mod_NTGetOutfits(845)",
        "Sinh l�c t�ng 45%/#Mod_NTGetOutfits(843)",
        "T�ng t�c �� xu�t chi�u 24%, H� tr� m�t t�ch 20%, Kh�ng t�t c� 55/#Mod_NTGetOutfits(14118)",
        "Th�i gian h� tr� t�ng 140%, kh�ng t�t c� 30/#Mod_NTGetOutfits(838)",
        "Ph�ng ng� ngo�i c�ng t�ng 8%/#Mod_NTGetOutfits(493)",
        "Ph�ng ng� n�i c�ng t�ng 8%/#Mod_NTGetOutfits(494)",
        "X�c su�t xu�t chi�u t�ng 8%/#Mod_NTGetOutfits(491)",
        "Ph�ng ng� ngo�i c�ng ��i ph��ng gi�m 15%/#Mod_NTGetOutfits(63)",
        "Ph�ng ng� n�i c�ng ��i ph��ng gi�m 15%/#Mod_NTGetOutfits(64)",
        "Gi�m ph�ng ng� n�i ngo�i c�ng ��i ph��ng 14%/#Mod_NTGetOutfits(90)",    
        "Ra kh�i/nothing",
    };

function OnUse(nItem)	
	--print(GetPlayerRebornParam(0))
	--print(GetTranslifeCount())
	-------Ch�c N�ng Set Qu�n Tr� Vi�n
	local nName = GetAccount();
	if CheckName(nName) == 0 then
		Talk(1,"","B�n kh�ng ph�i Qu�n Tr� Vi�n");
	else
		Open();
	end
end

function Open()
	if 1 ~= IsExpSvrSystemOpen() then
		return
	end
	
	local tSay = {}
	local nRoute = GetPlayerRoute();
	if nRoute <= 0 then
		tSay = {
			"Gia nh�p m�n ph�i/JoinRoute_UpdateLevel",
		}
	else
		tSay = {
			--"\nT�o Boss/AddNPC",
			"G�i Boss /BossTongHop",
			"Nh�n ngo�i trang /Mod_GetNgoaiTrang",
			"Nh�n trang b� /GetTB",
			"Nh�n th� c��i /Mod_GetThuCuoi",
			"Nh�n v�t ph�m kh�c/Get_TieuDung",
			"Ch�c n�ng m� r�ng/Get_Orther",
			"Qu�n l� tr� ch�i/Mod_GMActions",
			format("%s/getTiLi", "\nH�i ph�c th� l�c"),
		}
	end
	tinsert(tSay, "X�a kho ��/ClearBagAllItem");
	tinsert(tSay, "Tho�t/nothing");
	Say(g_szTitle.."L�a ch�n ch�c n�ng", getn(tSay), tSay);
end
function Mod_GetThuCuoi()
	local szSay = {
        		g_szTitle.."Ch�n th� c��i:",
		"B�ch M�/#Mod_GetThuCoi(34)",
		"Phi�u V�/#Mod_GetThuCoi(15)",
		"B�n Ti�u/#Mod_GetThuCoi(16)",
		"Si�u Quang/#Mod_GetThuCoi(19)",
		"��ng V�/#Mod_GetThuCoi(20)",
		"Thi�u D��ng Th�t Tinh Ki�m/#Mod_GetThuCoi(10107)",
		"V�n S� Th�t Qu�n Ki�m/#Mod_GetThuCoi(10108)",
		"Ng�c K� L�n/#Mod_GetThuCoi(30003)",
		"H�a K� L�n/#Mod_GetThuCoi(30004)",
		"B�ch H�/#Mod_GetThuCoi(30009)",
		"Ho�ng H�/#Mod_GetThuCoi(30010)",
		"B�o Tr�ng/#Mod_GetThuCoi(30012)",
		"B�o �en/#Mod_GetThuCoi(30013)",
		"Th� �en/#Mod_GetThuCoi(30039)",
		"Th� b�ng/#Mod_GetThuCoi(30040)",
        		"Ra kh�i/nothing",
    	};
    	SelectSay(szSay); 
end
function Mod_GetThuCoi(horseId)
	AddItem(0,105,horseId,1,1,-1,-1,-1,-1,-1,-1,-1,0)
end
function Mod_GMActions()
	local szSay = {
        		g_szTitle.."Ch�n ch�c n�ng:",
        		"Di chuy�n t�i v� ttr� ng��i ch�i/teleportToPlayer",
		"Tri�u h�i ng��i ch�i t�i v� tr� c�a m�nh/summonPlayer",
		"Nh�n ph�o chi�n th�ng (60 c�i)/Mod_GetPhaoChienThang",
		"Nh�n kim phi�u/Mod_GetKimPhieu",
        		"Ra kh�i/nothing",
    	};
    	SelectSay(szSay); 
end
function Mod_GetKimPhieu()
	ModifyJinJuan(9999999,0)
end
function Mod_GetPhaoChienThang()
	AddItem(2,1,30297,60)
end
function teleportToPlayer()
	local tSay = {}
	local oldPlayerIndex = PlayerIndex;
	local totalOnlinePlayers = 0;
	local player = FirstPlayer()
	while (player > 0) do
	  if player ~= oldPlayerIndex then 
			totalOnlinePlayers = totalOnlinePlayers + 1;
			PlayerIndex = player;
			tinsert(tSay,""..GetName().."/#reallyTeleportToPlayer("..player..")");
		end
		player = NextPlayer(player)
	end
	PlayerIndex = oldPlayerIndex;


	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(g_szTitle.."Found ".. totalOnlinePlayers .." players online. Who do you want to get to?", getn(tSay), tSay);
end


function reallyTeleportToPlayer(playerIndex)
	local mapId, nX, nY = gf_GetWorldPos(playerIndex);
	NewWorld(mapId, nX, nY);
end


function summonPlayer()
	local tSay = {}
	local oldPlayerIndex = PlayerIndex;
	local totalOnlinePlayers = 0;
	local player = FirstPlayer()
	while (player > 0) do
	  if player ~= oldPlayerIndex then 
			totalOnlinePlayers = totalOnlinePlayers + 1;
			PlayerIndex = player;
			tinsert(tSay,""..GetName().."/#reallySummonPlayer("..player..")");
			-- tinsert(tSay, format("%s/reallySummonPlayer", GetName()))
		end
		player = NextPlayer(player)
	end
	PlayerIndex = oldPlayerIndex;


	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(g_szTitle.."Found ".. totalOnlinePlayers .." players online. Who do you want to summon?", getn(tSay), tSay);
end


function reallySummonPlayer(playerIndex)
	-- Msg2Player(playerIndex);
	local mapId, nX, nY = GetWorldPos();
	local oldPlayerIndex = PlayerIndex;
	PlayerIndex = playerIndex or PlayerIndex;
	NewWorld(mapId, nX, nY);
	PlayerIndex = oldPlayerIndex;
end
function Mod_GetNgoaiTrang()
	 local szSay = {
        		g_szTitle.."Ch�n ngo�i trang",
        		"Chuy�n sinh y/#Mod_NTSetID(514)",
		"T� Linh Vi�t Ph�c Y (V�ng)/#Mod_NTSetID(30001)",
		"T� Linh Vi�t Ph�c Y (T�m)/#Mod_NTSetID(30005)",
		"T� Linh Vi�t Ph�c Y (Xanh)/#Mod_NTSetID(30009)",
		"Tuong Duong ngo�i trang/#Mod_NTSetID(213)",
		"Tuy�n Ch�u ngo�i trang/#Mod_NTSetID(217)",
		"Th�nh �� ngo�i trang/#Mod_NTSetID(221)",
		"Ng�o ngh� ngo�i trang/#Mod_NTSetID(1041)",
		"Song ��n ngo�i trang/#Mod_NTSetID(901)",
		"Kh�ng T��c Minhn V��ng ngo�i trang/#Mod_NTSetID(929)",
		"T� D� ngo�i trang/#Mod_NTSetID(825)",
		"C�ng Th��ng ngo�i trang/#Mod_NTSetID(937)",
		"Thi�n V� C� Sa ngo�i trang/#Mod_NTSetID(713)",
		"Di�p Th��ng Thu Phong ngo�i trang/#Mod_NTSetID(953)",
		"Ti�n Long ngo�i trang/#Mod_NTSetID(837)",
		"Ch� Th�y ngo�i trang/#Mod_NTSetID(833)",
		"X�ch Vi�n L�ng H�c ngo�i trang/#Mod_NTSetID(985)",

        		"Ra kh�i/nothing",
    	};
    	SelectSay(szSay); 
end
function Mod_GetTBDC()
	 local szSay = {
        		g_szTitle.."Ch�n trang b�",
		"Thi�n Chi Vi�m ��/#Mod_TestGetAll1(8051)",
		"B�ch Kim Vi�m ��/#Mod_TBSetID(30013)",
		"T�ng Ng� Long T��ng Qu�n/#Mod_TBSetID(30017)",
		"Li�u Ng� Long T��ng Qu�n/#Mod_TBSetID(30021)",
		"Long ��ng T� H�i Trang/#Mod_TBSetID(3056)",
		"Ph�ng V� C�u Thi�n Trang/#Mod_TBSetID(3060)",
		"Ng� Long Nguy�n So�i Chi�n Ph�c/#Mod_TBSetID(3000)",
		"Thi�u Th�nh Nguy�n So�i Chi�n Ph�c/#Mod_TBSetID(3004)",
		"T�ng �� Th�ng Chi�n/#Mod_TBSetID(2231)",
		"Li�u �� Th�ng Chi�n/#Mod_TBSetID(2235)",
		"T�ng ki�m 8x/#Mod_TBSetID(95)",
		"T�ng Qu�n 7x/#Mod_TBSetID(91)",
        		"Ra kh�i/nothing",
    	};
    	SelectSay(szSay); 

end
function Mod_NTSetID(nidOutfits)
        	nIDOutfit = nidOutfits;
	 local szSay = {
        		g_szTitle.."Ch�n lo�i:",
        		"N�n/#Mod_NTGetOutfitType(108)",
		"Trang ph�c/#Mod_NTGetOutfitType(109)",
		"H� y/#Mod_NTGetOutfitType(110)",
        		"Ra kh�i/nothing",
    	};
    	SelectSay(szSay); 
end

function Mod_TBSetID(nidOutfits)
	nIDOutfit = nidOutfits;
	local szSay = {
        		g_szTitle.."Ch�n lo�i:",
        		"N�n/#Mod_NTGetOutfitType(103)",
		"Trang ph�c/#Mod_NTGetOutfitType(100)",
		"H� y/#Mod_NTGetOutfitType(101)",
		"Trang s�c/#Mod_NTGetOutfitType(102)",
		"V� kh�/Mod_TBGetWaeponTypeList",
        		"Ra kh�i/nothing",
    	};
    	SelectSay(szSay); 
end
function Mod_TBGetWaeponTypeList()
	local szSay = {
        		g_szTitle.."Ch�n lo�i:",
        		"G�ng tay/#Mod_NTGetOutfitType(0)",
		"�m kh�/#Mod_NTGetOutfitType(1)",
		"Ki�m/#Mod_NTGetOutfitType(2)",
		"�ao/#Mod_NTGetOutfitType(3)",
		"Cung/#Mod_NTGetOutfitType(4)",
		"C�n/#Mod_NTGetOutfitType(5)",
		"Th��ng/#Mod_NTGetOutfitType(6)",
		"Song �ao/#Mod_NTGetOutfitType(7)",
		"T�ch tr��ng/#Mod_NTGetOutfitType(8)",
		"B�t/#Mod_NTGetOutfitType(9)",
		"C�m/#Mod_NTGetOutfitType(10)",
		"Tr�o/#Mod_NTGetOutfitType(11)",
        		"Ra kh�i/nothing",
    	};
    	SelectSay(szSay); 

end
function Mod_TestGetAll1(nidOutfits)
	-- Vu khi
	nIDOutfit = nidOutfits;
	Mod_TBGetWaeponTypeList();
	-- Non
	nIDOutfit = nidOutfits;
	nIDOutfitType = 103;
	Mod_NTGetOutfits(0);
	-- Ao
	nIDOutfit = nidOutfits;
	nIDOutfitType = 100;
	Mod_NTGetOutfits(0);
	-- Quan
	nIDOutfit = nidOutfits;
	nIDOutfitType = 101;
	Mod_NTGetOutfits(0);
	-- Trang Suc
	nIDOutfit = nidOutfits;
	nIDOutfitType = 102;
	Mod_NTGetOutfits(0);
end
function Mod_NTGetOutfitType(nIdType)
	nIDOutfitType = nIdType
	IsTBPHP = 0
	nD1 = 0;
	nD2 = 0;
	nD3 = 0;
	SelectSay(outfitSzSay);  
end
function Mod_NTGetOutfits(nD)
	local att_type = 7
	if nD == 0 then
		nD1 = -1
		nD2 = -1
		nD = -1
		att_type = -1
	end

	if nD1 == 0 then
		nD1 = nD;
		SelectSay(outfitSzSay);  
    	else
		if nD2 == 0 then
			nD2 = nD;
			SelectSay(outfitSzSay);  
		else
			local nID = nIDOutfit + GetBody() - 1;
			if IsTBPHP == 1 then
				nID = tonumber(nIDOutfit);
			end
			
			if nIDOutfitType == 102 or nIDOutfitType == 108 or nIDOutfitType == 109 or nIDOutfitType == 110 then
				AddItem(0, nIDOutfitType, nID, 1, 1,att_type,nD1,att_type,nD2,att_type,nD,-1,0);
			else
				AddItem(0, nIDOutfitType, nID, 1, 1,att_type,nD1,att_type,nD2,att_type,nD,-1,15);
			end
		end
	end     
end
function BossTongHop()
	local tSay = {}

	tinsert(tSay, format("%s/Boss_LucLam", "B�c L�c L�m Minh Ch�"))
	tinsert(tSay, format("%s/Boss_ThuongThan", "Th��ng Th�n Doanh Thi�n"))
	tinsert(tSay, format("%s/Boss_HuongLang", "L�nh H��ng L�ng"))
	tinsert(tSay, format("%s/Boss_LanHoa", "Lan Hoa"))
	tinsert(tSay, format("%s/Boss_AnhTu", "Anh T�"))
	tinsert(tSay, format("%s/Boss_PhuThuy", "Ph� th�y b�ng gi�"))
	tinsert(tSay, format("%s/Boss_LuongSon", "H�o h�n L��ng S�n"))
	tinsert(tSay, format("%s/Boss_W1", "��o Hoa ��o Ch� Ho�ng Long"))
	tinsert(tSay, format("%s/Boss_W2", "T�y V�c Th��ng Lang B� V��ng"))
	tinsert(tSay, format("%s/Boss_W3", "Ng�c S�n Chi Linh Thi�n C�u"))
	tinsert(tSay, format("%s/Boss_W4", "U Tr�ch Chi �nh Minh V�"))
	tinsert(tSay, format("%s/Boss_TuLinh", "T� Linh"))
	tinsert(tSay, format("%s/Boss_NienThu", "��i Ni�n Th�"))
	tinsert(tSay, format("%s/Boss_ThitNuong", "Y�n ti�c Th�t N��ng"))
	tinsert(tSay, "T�i h� ch� xem qua th�i/nothing");
	Say(g_szTitle.."Ng��i c�n g�i boss g�?", getn(tSay), tSay);
end
function Boss_LucLam()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("S�n T�c ��u M�c","B�c L�c L�m Minh Ch�", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe n�i minh ch� l�c l�m �ang � t�y Tuy�n Ch�u 191/192, ch�c �ang c� �m m�u!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_ThuongThan()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("Huy�n V� Th�ong","Th��ng Th�n Doanh Thi�n", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe n�i th� v� th�n t�n c�a T�n Th�y Ho�ng �ang � t�y Tuy�n Ch�u 189/192, v� l�m s�p c� m�t tr�n h�o ki�p!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_HuongLang()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("Nghi�t H�n","L�nh H��ng L�ng", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe n�i L�nh H��ng L�ng  �ang � t�y Tuy�n Ch�u 186/194, mau ��n �� xem th� dung nhan ki�u di�m c�a n�ng!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_LanHoa()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("lanhua_viet","Lan Hoa", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("C� ng��i nh�n th�y Lan Hoa �ang � t�y Tuy�n Ch�u 181/190, mau ��n �� xem!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")

end

function Boss_AnhTu()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("yingzi_viet","Anh T�", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("C� ng��i nh�n th�y Anh T�  �ang � t�y Tuy�n Ch�u 179/192, mau ��n �� xem!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")

end


function Boss_ThitNuong()

	--Msg2Global("C� ng��i nh�n th�y Y�n ti�c Th�t N��ng �ang � t�y Tuy�n Ch�u 181/188, mau ��n tham d�!")
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	local nMap,nX,nY = GetWorldPos();			
	for i = 1, 20 do
		nAddX = random(-70, 70)
		nAddY = random(-70, 70)		
		nTargetNpc = CreateNpc("M�m c�", "Th�t N��ng", nMap, nX + nAddX,  nY + nAddY)
		SetNpcLifeTime(nTargetNpc, 130)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\pangtuzi_baoguo.lua")
end

end

function Boss_PhuThuy()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIndex = 0
	local nNpcIndex = CreateNpc("Ph� th�y b�ng gi�", "Ph� th�y b�ng gi�", nMap, nX + 2, nY + 2);
	SetNpcLifeTime(nNpcIndex, 7200);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
	--Msg2Global("C� ng��i nh�n th�y Ph� th�y b�ng gi�  �ang � t�y Tuy�n Ch�u 192/188, mau ��n �� xem!")


end

function Boss_LuongSon()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local n = gf_GetRandItemByTable(LSB_NPC_GOLD_BOSS, 1000, 1) or 1;
	local nNpcIndex = CreateNpc(LSB_NPC_GOLD_BOSS[n][1],LSB_NPC_GOLD_BOSS[n][3],  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcDeathScript(nNpcIndex,"\\script\\online\\liangshanboss\\npc\\gld_boos_death.lua");
		SetNpcRemoveScript(nNpcIndex,"\\script\\online\\liangshanboss\\npc\\gld_boss_remove.lua");
	--Msg2Global("C� ng��i ph�t hi�n H�o h�n L��ng S�n  �ang � t�y Tuy�n Ch�u 191/187, mau ��n �� xem!")

end

LSB_NPC_GOLD_BOSS = {
	--{"yangxiong", 165, "B�nh Quan S�c D��ng H�ng", 30 * 60},
	--{"linchong", 167, "B�o T� ��u L�m Xung", 30 * 60},
	--{"luzhishen", 167, "Hoa H�a Th��ng L� Tr� Th�m", 30 * 60},
	--{"likui", 167, "H�c To�n Phong L� Qu�", 30 * 60},
	--{"husanliang", 167, "Nh�t Tr��ng Thanh H� Tam N��ng", 30 * 60},
	--{"shixiu", 167, "Phanh M�nh Tam Lang Th�ch T�", 30 * 60},
	{"C�p Th�i V� T�ng Giang", 167, "C�p Th�i V� T�ng Giang", 30 * 60},
	{"Tri �a Tinh Ng� D�ng", 167, "Tri �a Tinh Ng� D�ng", 30 * 60},
	{"C�u V�n Long S� Ti�n", 167, "C�u V�n Long S� Ti�n", 30 * 60},
	{"Ti�u Tuy�n Phong S�i Ti�n", 167, "Ti�u Tuy�n Phong S�i Ti�n", 30 * 60},
	{"��i �ao Quan Th�ng", 167, "��i �ao Quan Th�ng", 30 * 60},
	{"Nh�p V�n Long C�ng T�n Th�ng", 167, "Nh�p V�n Long C�ng T�n Th�ng", 30 * 60},
	{"B�o T� ��u L�m Xung", 167, "B�o T� ��u L�m Xung", 30 * 60},
	{"Hoa H�a Th��ng L� Tr� Th�m", 167, "Hoa H�a Th��ng L� Tr� Th�m", 30 * 60},
	{"H�nh Gi� V� T�ng", 167, "H�nh Gi� V� T�ng", 30 * 60},
	{"T�y B�n Ti�n Phong Nh�t Ph�m", 167, "T�y B�n Ti�n Phong Nh�t Ph�m", 30 * 60},
	{"B�nh Quan S�c D��ng H�ng", 167, "B�nh Quan S�c D��ng H�ng", 30 * 60},
	{"Phanh M�nh Tam Lang Th�ch T�", 167, "Phanh M�nh Tam Lang Th�ch T�", 30 * 60},
	{"Nh�t Tr��ng Thanh H� Tam N��ng", 167, "Nh�t Tr��ng Thanh H� Tam N��ng", 30 * 60},
	{"Song Th��ng T��ng ��ng B�nh", 167, "Song Th��ng T��ng ��ng B�nh", 30 * 60},
	{"Thanh Di�n Th� D��ng Tr�", 167, "Thanh Di�n Th� D��ng Tr�", 30 * 60},
	{"T�ch L�ch H�a T�n Minh", 167, "T�ch L�ch H�a T�n Minh", 30 * 60},
	{"Song Ti�n H� Di�n Ch��c", 167, "Song Ti�n H� Di�n Ch��c", 30 * 60},
	{"H�c To�n Phong L� Qu�", 167, "H�c To�n Phong L� Qu�", 30 * 60},
};

function Boss_W1()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_HL", "��o Hoa ��o Ch� Ho�ng Long", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W2()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_CLBZ", "T�y V�c Th��ng Lang B� V��ng", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W3()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_TJ", "Ng�c S�n Chi Linh Thi�n C�u", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W4()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_MW", "U Tr�ch Chi �nh Minh V�", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end

function Thuong_LuongSon()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
			local nNpcIdx = CreateNpc(IBbaoxiang, "R��ng H�o H�n", nMap, nX + 2, nY + 2);
			SetNpcLifeTime(nNpcIdx, 3 * 60);
			SetNpcScript(nNpcIdx,"\\script\\online\\liangshanboss\\npc\\box\\box_e.lua");

end

function Boss_TuLinh()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local n = gf_GetRandItemByTable(TuLinh_BOSS_LIST, 1000, 1) or 1;
	local nNpcIndex = CreateNpc(TuLinh_BOSS_LIST[n][1],TuLinh_BOSS_LIST[n][3],  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcDeathScript(nNpcIndex,"\\script\\online_activites\\tiaozhansilingboss\\boss\\boss_death.lua");

end

TuLinh_BOSS_LIST = {
	{"Long T�", 165, "Long Th�n H�a Th�n", 30 * 60},
	{"Ph�ng T�", 167, "Ph�ng Th�n H�a Th�n", 30 * 60},
	{"H� T�", 165, "H� Th�n H�a Th�n", 30 * 60},
	{"�ng T�", 167, "�ng Th�n H�a Th�n", 30 * 60},
}

function Boss_NienThu()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local nNpcIndex = CreateNpc("��i Ni�n Th�","Th�n th� ngh�n n�m",  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_03\\boss\\npc\\bigboss.lua");

end


function AddNPC(nVar1)
	local map_ID,att_X,att_Y = GetWorldPos();
	
	local nNpcIndex = CreateNpc("WorldBoss_rwx", "BOSS Th� Gi�i", map_ID, att_X, att_Y);
	SetNpcLifeTime(nNpcIndex,1000);
	--SetNpcDeathScript(nNpcIndex, );
end


--TRANG BI THONG THUONG
function GetTB()
	local szSay = {
		g_szTitle.."L�a ch�n",
		"Trang b� d�ng chung/Mod_GetTBDC",
		"Trang b� Kim X� 6/Get_KimXa",
		"Trang b� V� Song Chi�n Th�n/Get_VSCT",
		"Trang b� H�c B�ch V� Song/Get_HBVS",
		"Trang b� V� H� H�o Hi�p/Get_HHVH",
		"Trang b� �m Huy�t/Get_AH",
		"Trang b� S�t Tinh/Get_ST",
		"Trang b� Chi�n Tr��ng/GetCT",
		"Trang b� Minh Tinh V� C�c/Get_NgocBoi",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);	
end

function Get_KimXa()
	local szSay = {
		g_szTitle.."L�a ch�n trang b?",
		"Trang b� Kim X� Phi Phong Hoan L�ng/Get_KXDH",
		"Trang b� Kim X� Phi Phong ��ng Giao/Get_KXTH",
		"Trang b� Kim X� Phi Phong Kh�i Ph��ng/Get_KXVD",
		"Ra kh�i/nothing",
	};
	SelectSay(szSay);
end
function Get_KXDH()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	--kx6 hoan l�ng
        local pifeng,pIndex	=AddItem(0,154,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2608,2612))
		local huizhang,hIndex	=AddItem(0,153,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2583,2585))
		local xie,xIndex	=AddItem(0,152,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2583,2586))
	-- end kx6 hoan l�ng
end

function Get_KXTH()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	 -- kx6 ��ng giao
	    local pifeng,pIndex	=AddItem(0,154,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2703,2706))
		local huizhang,hIndex	=AddItem(0,153,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2690,2693))
		local xie,xIndex	=AddItem(0,152,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2690,2693))

	-- end kx6 ��ng giao
end

function Get_KXVD()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	-- kx6 kh�i ph��ng
		local pifeng,pIndex	=AddItem(0,154,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2799,2803))
		local huizhang,hIndex	=AddItem(0,153,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2784,2787))
		local xie,xIndex	=AddItem(0,152,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2784,2787))
	-- end kx6 kh�i ph��ng	)
end
function Get_VSCT()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 30651 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
end

function Get_HBVS()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 20020 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
end

function Get_HHVH()
	AddItem(2, 1, 30947 ,1);
	AddItem(2, 1, 30948 ,1);
	AddItem(2, 1, 30949 ,1);
	AddItem(2, 1, 30977 ,2);
	AddItem(2, 1, 30976 ,1);
end

function Get_ST()
	AddItem(2, 1, 50000 ,1);
	AddItem(2, 1, 50001 ,1);
	AddItem(2, 1, 50002 ,1);
	AddItem(2, 1, 50004 ,2);
	AddItem(2, 1, 50003 ,1);
end

function Get_AH()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	local nRoute	= GetPlayerRoute();
	local nBody 	= 20012 + GetBody() - 1;
	
	AddItem(0, 103, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 101, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	AddItem(0, 100, nBody, 1,1, -1,-1,-1,-1,-1,-1,1,15);
	
	AddItem(0, 102, 31414, 1,1, -1,-1,-1,-1,-1,-1,1,0);
	AddItem(0, 102, 31415, 1,1, -1,-1,-1,-1,-1,-1,1,0);
	
	local nVK = 30884;
	local ID = {
		[2] = 	{3, nVK},
		[3] = 	{8,nVK + 2},
		[4] = 	{0,nVK + 1},
		[6] = 	{1,nVK + 3},
		[8]= 	{2,nVK + 4},
		[9]= 	{10,nVK + 5},
		[11]=	{0,nVK + 6},
		[12]=	{5,nVK + 7},
		[14]=	{2,nVK + 8},
		[15]=	{9,nVK + 9},
		[17]=	{6,nVK + 10},
		[18]=	{4,nVK + 11},
		[20]=	{7,nVK + 12},
		[21]=	{11,nVK + 13},
		[23]=	{2,nVK + 14},
		[25]=	{3,nVK + 15},
		[26]=	{9,nVK + 16},
		[27]=	{11,nVK + 17},
		[29]=	{13,nVK + 18},
		[30]=	{12,nVK + 19},
	};
	
	for k, v in pairs(ID) do
		if nRoute == k then				
			AddItem(0, v[1], v[2], 1,1,-1,-1,-1,-1,-1,-1,1,15); 
		end
	end
end

function Get_NgocBoi()
	if 1 ~= gf_Judge_Room_Weight(2, 1, g_szTitle) then
		return 0;
	end

	AddItem(0,102,31130,1,1,-1,-1,-1,-1,-1,-1,1,0)
	AddItem(0,102,31131,1,1,-1,-1,-1,-1,-1,-1,1,0)
end


--TRANG BI CHIEN TRUONG
function GetCT()
	local szSay = {
		g_szTitle.."L�a ch�n",
		"Nh�n trang b� H�a Ph�ng/Get_CT_HP",
		"Nh�n trang b� Thanh Long/Get_CT_TL",
		"Nh�n trang b� Uy H�/Get_CT_UH",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);	
end

--Trang bi UY HO
function Get_CT_UH()
	local szSay = {
		g_szTitle.."L�a ch�n trang b�",
		"Trang ph�c Uy H� T��ng Phe T�ng/#Get_TP_CT_UH(1,1)",
		"Trang ph�c Uy H� So�i Phe T�ng/#Get_TP_CT_UH(1,2)",
		"Trang ph�c Uy H� T��ng Phe Li�u/#Get_TP_CT_UH(2,1)",
		"Trang ph�c Uy H� So�i Phe Li�u/#Get_TP_CT_UH(2,2)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end

--Trang bi THANH LONG
function Get_CT_TL()
	local szSay = {
		g_szTitle.."L�a ch�n trang b�",
		"Trang ph�c Thanh Long T��ng Phe T�ng/#Get_TP_CT_TL(1,1)",
		"Trang ph�c Thanh Long So�i Phe T�ng/#Get_TP_CT_TL(1,2)",
		"Trang ph�c Thanh Long T��ng Phe Li�u/#Get_TP_CT_TL(2,1)",
		"Trang ph�c Thanh Long So�i Phe Li�u/#Get_TP_CT_TL(2,2)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end

--Trang bi Hoa Phung
function Get_CT_HP()
	local szSay = {
		g_szTitle.."L�a ch�n trang b�",
		"Trang ph�c H�a Ph�ng T��ng Phe T�ng/#Get_TP_CT_HP(1,1)",
		"Trang ph�c H�a Ph�ng So�i Phe T�ng/#Get_TP_CT_HP(1,2)",
		"Trang ph�c H�a Ph�ng T��ng Phe Li�u/#Get_TP_CT_HP(2,1)",
		"Trang ph�c H�a Ph�ng So�i Phe Li�u/#Get_TP_CT_HP(2,2)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end

--GET
function Get_TP_CT_UH(nPhe, nQH)
		if nPhe == 1 and nQH == 1 then
			local ID1 = 20556 --TP
			local ID2 = 10196 --NB
			local ID3 = 20556 --VK
			GetCTEnd(ID1, ID2, ID3, nQH);
		elseif nPhe == 1 and nQH == 2 then
			local ID1 = 20620 --TP
			local ID2 = 10388 --NB
			local ID3 = 20620 --VK
			GetCTEnd(ID1, ID2, ID3, nQH);
		elseif nPhe == 2 and nQH == 1 then
			local ID1 = 20684 --TP
			local ID2 = 10644 --NB
			local ID3 = 20684 --VK
			GetCTEnd(ID1, ID2, ID3, nQH);
		elseif nPhe == 2 and nQH == 2 then
			local ID1 = 20748 --TP
			local ID2 = 10836 --NB
			local ID3 = 20748 --VK
			GetCTEnd(ID1, ID2, ID3, nQH);
		end
end

function Get_TP_CT_TL(nPhe, nQH)
	if nPhe == 1 and nQH == 1 then
		local ID1 = 20300 --TP
		local ID2 = 9300 --NB
		local ID3 = 20300 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 1 and nQH == 2 then
		local ID1 = 20364 --TP
		local ID2 = 9492 --NB
		local ID3 = 20364 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe ==2  and nQH == 1 then
		local ID1 = 20428 --TP
		local ID2 = 9748 --NB
		local ID3 = 20428 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 2 and nQH == 2 then
		local ID1 = 20492 --TP
		local ID2 = 9940 --NB
		local ID3 = 20492 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	end
end

function Get_TP_CT_HP(nPhe, nQH)
	if nPhe == 1 and nQH == 1 then
		local ID1 = 30311 --TP
		local ID2 = 30228 --NB
		local ID3 = 30328 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 1 and nQH == 2 then
		local ID1 = 30375 --TP
		local ID2 = 30420 --NB
		local ID3 = 30432 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 2 and nQH == 1 then
		local ID1 = 30439 --TP
		local ID2 = 30676 --NB
		local ID3 = 30536 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	elseif nPhe == 2 and nQH == 2 then
		local ID1 = 30503 --TP
		local ID2 = 30868 --NB
		local ID3 = 30640 --VK
		GetCTEnd(ID1, ID2, ID3, nQH);
	end
end

function GetCTEnd(ID1, ID2, ID3, nQH)
	local ID = {
		[2] = 	{3, ID1, ID2, ID3},
		[3] = 	{8,ID1 + 2,ID2 + 2,ID3 +2},
		[4] = 	{0,ID1 + 4,ID2 + 4,ID3 +4},
		[6] = 	{1,ID1 + 6,ID2 + 6,ID3 +6},
		[8]= 	{2,ID1 + 10,ID2 + 10,ID3 +10},
		[9]= 	{10,ID1 + 12,ID2 + 12,ID3 +12},
		[11]=	{0,ID1 + 14,ID2 + 14,ID3 +14},
		[12]=	{5,ID1 + 18,ID2 + 18,ID3 +18},
		[14]=	{2,ID1 + 22,ID2 + 22,ID3 +22},
		[15]=	{9,ID1 + 26,ID2 + 26,ID3 +26},
		[17]=	{6,ID1 + 30,ID2 + 30,ID3 +30},
		[18]=	{4,ID1 + 34,ID2 + 34,ID3 +34},
		[20]=	{7,ID1 + 38,ID2 + 38,ID3 +38},
		[21]=	{11,ID1 + 42,ID2 + 42,ID3 +42},
		[23]=	{2,ID1 + 46,ID2 + 46,ID3 +46},
		[25]=	{3,ID1 + 48,ID2 + 48,ID3 +48},
		[26]=	{9,ID1 + 52,ID2 + 52,ID3 +52},
		[27]=	{11,ID1 + 56,ID2 + 56,ID3 +56},
		[29]=	{13,ID1 + 60,ID2 + 60,ID3 +60},
		[30]=	{12,ID1 + 62,ID2 + 62,ID3 +62},
	};
	
	local nRoute = GetPlayerRoute();
	if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
		nBody = GetBody() - 3;
	else
		nBody = GetBody() - 1;
	end
	
	--local nA = 0;
	--local nTP = 0;
	--local nNB = 0;
	--local nVK = 0;

	nTBCT_ATT_A = 0;
	nTBCT_ATT_TP = 0;
	nTBCT_ATT_NB = 0;
	nTBCT_ATT_VK = 0;


	for k, v in pairs(ID) do
		if nRoute == k then
			--nA = v[1];
			--nTP = v[2] + nBody;
			--nNB = v[3] + nBody;
			--nVK = v[4] + nBody;

			nTBCT_ATT_A = v[1];
			nTBCT_ATT_TP = v[2] + nBody;
			nTBCT_ATT_NB = v[3] + nBody;
			nTBCT_ATT_VK = v[4] + nBody;


			--AddItem(0, 103, nTP, 1,1,-1,-1,-1,-1,-1,-1,1,15); --TP
			--AddItem(0, 101, nTP, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			--AddItem(0, 100, nTP, 1,1,-1,-1,-1,-1,-1,-1,1,15);
			
			--AddItem(0, 102, nNB, 1,1,-1,-1,-1,-1,-1,-1,1,0); -- NB
			--AddItem(0, 102, nNB + 64, 1,1,-1,-1,-1,-1,-1,-1,1,0);
			--AddItem(0, 102, nNB + 64 * 2, 1,1,-1,-1,-1,-1,-1,-1,1,0);
			
			--if nQH == 2 then
			--	AddItem(0, 102, nNB + 64 * 3, 1,1,-1,-1,-1,-1,-1,-1,1,0); --NBS
			--end
					
			--AddItem(0, nA, nVK, 1,1,-1,-1,-1,-1,-1,-1,1,15); --VK
		end
	end

	local szSay = {
        			g_szTitle.."Ch�n lo�i:",
        			"N�n/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_TP,103)",
			"Trang ph�c/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_TP, 100)",
			"H� y/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_TP, 101)",
			"Trang s�c 1/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_NB,102)",
			"Trang s�c 2/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_NB + 64,102)",
			"Trang s�c 3/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_NB + 64 * 2,102)",
    		};
	if nQH == 2 then
		tinsert(szSay, "Trang s�c 4/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_NB + 64 * 3,102)")
	end
	tinsert(szSay, "V� kh�/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_VK,nTBCT_ATT_A)")
	tinsert(szSay, "Ra kh�i/nothing")
    	SelectSay(szSay); 
end

function Mod_GetTBCT_GetAttribute(nID, nTypeID)
	nIDOutfit = nID;
	nIDOutfitType = nTypeID;
	IsTBPHP = 1;
	nD1 = 0;
	nD2 = 0;
	nD3 = 0;
	SelectSay(outfitSzSay);  
end


--TRANG BI TIEU DUNG
function Mod_HCS_GetThaiDich()
	AddItem(2,0,1083,1)
end
function Mod_HCS_GetThiepDuTiecLongMon()
	AddItem(2,0,1037,1)
end

function Get_TieuDung()
	local nRoute = GetPlayerRoute();
	local tSay = {
		"Nh�n Lac/GetLac",
		"Nh�n 10000 v�ng/Get_Money",
		"Nh�n �� Qu�/Get_Gem",
		"Nh�n v�t ph�m Shop/Get_VPSHOP",
		"Nh�n TMKL v� TCL/Get_TMKL",
		"Nh�n Thi�n Ki�u L�nh/getTianJiaoLing",
		--"Nh�n Nguy�n Li�u Ch� T�o Chi�n Tr��ng/Get_CTItem",
		"Nh�n Th�i D�ch H�n Nguy�n C�ng Ph�/Mod_HCS_GetThaiDich",
		"Nh�n Thi�p m�i d� ti�c Long M�n Tr�n/Mod_HCS_GetThiepDuTiecLongMon",

	};
	if 3 == nRoute then
		tinsert(tSay, "Nh�n Thi�n Ph�t Ch�u v� Ph� Ma Ch�/Give_ZhuzhuZhouzhou")
	end
	if 6 == nRoute then
		tinsert(tSay, "Nh�n �m Kh� v� C� Quan/Give_JiguanAnqi")
	end
	if 8 == nRoute then
		tinsert(tSay, "Nh�n X� L�i Kim ��n/Give_Dandan")
	end		
	if 17 == nRoute then
		tinsert(tSay, "Nh�n Chi�n M�/Give_ZhanMa")
	end
	if 18 == nRoute then
		tinsert(tSay, "Nh�n Chi�n M� v� T� Ti�n/Give_Jiancu")
	end
	if 20 == nRoute then
		tinsert(tSay, "Nh�n Phong Thi Ph�/Give_Fengshifu")
	end
	if 21 == nRoute then
		tinsert(tSay, "Nh�n C�/Give_GuGu")
	end
	if 30 == nRoute then
		tinsert(tSay, "Nh�n �i�u/ling_nv_xiaodiao")
	end
	if 32 == nRoute then
		tinsert(tSay, "Nh�n Linh Ki�m/ling_nv_xiaodiao)")
	end
	
	tinsert(tSay, "\nRa kh�i/nothing");
	Say(g_szTitle.."L�a ch�n", getn(tSay), tSay);	
end

--TMKL + TCL + HCAH
function GetLac()
	for i = 30005,30011 do
		if i ~= 30008 then
			AddItem(1,0,i,999);
		end
	end
	for i = 261,265 do
		AddItem(1,0,i,999);
	end
end
function Get_TMKL()
	AddItem(2,1,30370,100);
	AddItem(2,95,204,100);
end
function Get_VPSHOP()
	AddItem(2,1,30499,1000);
	AddItem(2,1,30369,999);
	AddItem(2,1,30368,999);
end
function Get_CTItem()
	AddItem(2,1,30687,2000);
	AddItem(2,1,31324,50);
	AddItem(2,1,31325,500);
	AddItem(2,1,31223	,50);
	AddItem(2,1,31224	,500);
	AddItem(2,1,30769	,50);
	AddItem(2,1,30770	,500);
end

--DA Quy
function Get_Gem()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
	
	AddItem(2, 22, 101, 100);
	AddItem(2, 22, 102, 100);
	AddItem(2, 22, 103, 100);
	AddItem(2, 22, 104, 100);
	AddItem(2, 22, 107, 100);
	WriteLogEx("Get_Gem","Nh�n �� qu�", 100, "Huy�tTr�chTh�ch Lv7");
	AddItem(2, 22, 201, 100);
	AddItem(2, 22, 202, 100);
	AddItem(2, 22, 203, 100);
	AddItem(2, 22, 204, 100);
	AddItem(2, 22, 207, 100);
	WriteLogEx("Get_Gem","Nh�n �� qu�", 100, "Nguy�tB�chTh�ch Lv7");
	AddItem(2, 22, 301, 100);
	AddItem(2, 22, 302, 100);
	AddItem(2, 22, 303, 100);
	AddItem(2, 22, 304, 100);
	AddItem(2, 22, 307, 100);
	WriteLogEx("Get_Gem","Nh�n �� qu�", 100, "H� Ph�ch Th�ch Lv7");
	AddItem(2, 22, 401, 100);	
	AddItem(2, 22, 402, 100);	
	AddItem(2, 22, 403, 100);	
	AddItem(2, 22, 404, 100);
	AddItem(2, 22, 407, 100);	
	WriteLogEx("Get_Gem","Nh�n �� qu�", 100, "H�c Di�u Th�ch Lv7");
end

function Get_Money()
	Earn(100000000);
end

---Thi�n Khi�u L�nh
function getTianJiaoLing()
	AddItem(2,97,236,999)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

---H�i th� l�c
function getTiLi()
	RestoreStamina()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

--�n chuy�n sinh
function Get_An()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
    AddItem(2, 0, 30002, 1 ,1);
	WriteLogEx("Get_An","Nh�n �n:", 100, "Long t� �n");
	AddItem(2, 0, 30005, 1, 1);
	WriteLogEx("Get_An","Nh�n �n:", 100, "Ph�ng t� �n");
	AddItem(2, 0, 30003, 1, 1);
	WriteLogEx("Get_An","Nh�n �n:", 100, "H� t� �n");
	AddItem(2, 0, 30006, 1, 1);	
	WriteLogEx("Get_An","Nh�n �n:", 100, "�ng t� �n");
    AddItem(2, 0, 30001, 1, 1);	
	WriteLogEx("Get_An","Nh�n �n:", 100, "T� �n");
end

--CHUC NANG KHAC
function Get_Orther()
	local szSay = {
		g_szTitle.."L�a ch�n",
		"Th�ng Chuy�n Sinh 7 c�p 99/UpSuper",
		"Thao t�c M�t T�ch/Get_Book",
		"Thao t�c Kinh M�ch/GetJingMai",
		"Thao t�c Th� C�ng/Pet_OP",
		"Thao t�c Bang H�i/TongOperation",
		"Thao t�c V� Kh�/PS_VK",
		"Luy�n max skill tr�n ph�i/maxtranphai",
		"Thay ��i h� ph�i kh�c/JoinRoute_UpdateLevel",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);	
end
function maxtranphai()
	for i = 1,20 do

		while LevelUpSkill(1196) == 1 do

		end
		while LevelUpSkill(44) == 1 do

		end
		while LevelUpSkill(146) == 1 do

		end
		while LevelUpSkill(745) == 1 do

		end
		while LevelUpSkill(113) == 1 do

		end
		while LevelUpSkill(1032) == 1 do

		end
		while LevelUpSkill(74) == 1 do

		end
		while LevelUpSkill(774) == 1 do

		end
		while LevelUpSkill(775) == 1 do

		end
		while LevelUpSkill(732) == 1 do

		end
		while LevelUpSkill(159) == 1 do

		end
		while LevelUpSkill(89) == 1 do

		end
		while LevelUpSkill(102) == 1 do

		end
		while LevelUpSkill(1230) == 1 do

		end
		while LevelUpSkill(57) == 1 do

		end
		while LevelUpSkill(124) == 1 do

		end
		while LevelUpSkill(32) == 1 do

		end
	end;
end
--VK
function PS_VK()
	local szSay = {
		g_szTitle.."H�y l�a ch�n hi�u �ng v� kh�!",
		"Thi�t C�t/PS_1",
		"B�ch Chi�n/PS_2",
		"Ch��c Nh�t/PS_3",
		"Tu�n D�t/PS_4",
		"��o L�/PS_5",
		"Danh T�c/PS_6",
		"L�c H�/PS_7",
		"L�ng Ti�u/PS_8",
		"Ph�n V�n/PS_9",
		"�o�n Giao/PS_10",
		"C�i Th�/PS_11",
		"Ph� Qu�n/PS_12",
		"H�o m�n/PS_13",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end

function PS_1()
	BindWeaponEffect("Thi�t C�t",1)	
end
function PS_2()
	BindWeaponEffect("B�ch Chi�n",1)	
end
function PS_3()
	BindWeaponEffect("Ch��c Nh�t",1)	
end
function PS_4()
	BindWeaponEffect("Tu�n D�t",1)	
end
function PS_5()
	BindWeaponEffect("��o L�",1)	
end
function PS_6()
	BindWeaponEffect("Danh T�c",1)	
end
function PS_7()
	BindWeaponEffect("L�c H�",1)	
end
function PS_8()
	BindWeaponEffect("L�ng Ti�u",1)	
end
function PS_9()
	BindWeaponEffect("Ph�n V�n",1)	
end
function PS_10()
	BindWeaponEffect("�o�n Giao",1)	
end
function PS_11()
	BindWeaponEffect("C�i Th�",1)	
end
function PS_12()
	BindWeaponEffect("Ph� Qu�n",1)	
end
function PS_13()
	BindWeaponEffect("H�o m�n",1)	
end

--Pet
function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "K�ch ho�t ph�c sinh th� c�ng"))
	end
	tinsert(tSay, format("%s/getPetEgg", "Nh�n Tr�ng Th� C�ng"))
	tinsert(tSay, format("%s/getLingLi", "Nh�n �i�m linh l�c"))
	tinsert(tSay, "\nRa kh�i/nothing");
	Say(g_szTitle.."Ng��i c�n gi�p �� g�?", getn(tSay), tSay);
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end
		
		Msg2Player("�� h�c Gi�ng Linh Thu�t c�p 5");
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end

function getPetEgg()
	AddItem(2,1,30601,10)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getLingLi()
	local nAdd = 10000
	local nTask = 1535
	local nCur = GetTask(nTask) / 100
	if nCur < 1000000 then
		nCur = nCur + nAdd
		SetTask(nTask, nCur*100)
		Msg2Player(format("Nh�n th�nh c�ng %d linh l�c", nAdd))
	end
end

--Gia nh�p Ph�i
function JoinRoute_UpdateLevel()
	local tMenu = {
		"Thi�u L�m/join_sl",
		"V� �ang/join_wd",
		"Nga My/join_em",
		"C�i Bang/join_gb",
		"���ng M�n/join_tm",
		"D��ng M�n/join_ym",
		"Ng� ��c/join_wdu",
		"C�n L�n/join_kl",
		"Th�y Y�n/join_cy",
		"Minh Gi�o/join_mgb",
		"\nRa kh�i/nothing",
	};
	Say("Ng��i mu�n gia nh�p l�u ph�i g�?", getn(tMenu), tMenu);
end

function join_mgb()
	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Minh Gi�o Th�nh Chi�n/#enter_mp(25)",
		"Minh Gi�o Tr�n Binh/#enter_mp(26)",
		"Minh Gi�o Huy�t Nh�n/#enter_mp(27)",
		"\nRa kh�i/nothing",
	};

	SelectSay(szSay);
end;

function join_sl()
	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Thi�u L�m v� t�ng/#enter_mp(4)",
		"Thi�u L�m thi�n t�ng/#enter_mp(3)",
		"Thi�u L�m t�c gia/#enter_mp(2)",
		"\nRa kh�i/nothing",
	};

	SelectSay(szSay);
end;

function join_wd()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"V� �ang ��o gia/#enter_mp(14)",
		"V� �ang t�c gia/#enter_mp(15)",
		"\nRa kh�i/nothing",
	};

	SelectSay(szSay);
end;

function join_em()
	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Nga My ph�t gia/#enter_mp(8)",
		"Nga My t�c gia/#enter_mp(9)",
		"\nRa kh�i/nothing",
	};

	SelectSay(szSay);
end;

function join_gb()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"C�i Bang T�nh y/#enter_mp(11)",
		"C�i Bang � Y/#enter_mp(12)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_tm()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"���ng M�n Ch�m/#enter_mp(6)",
		"���ng M�n Nh�m Hi�p/#enter_mp(31)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_ym()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"D��ng M�n th��ng K�/#enter_mp(17)",
		"D��ng M�n Cung K�/#enter_mp(18)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_wdu()

	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Hi�p ��c/#enter_mp(20)",
		"T� ��c/#enter_mp(21)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_kl()
	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"C�n L�n Thi�n S�/#enter_mp(23)",
		"C�n L�n Ki�m T�n/#enter_mp(32)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end;

function join_cy()
	local szSay = {
		g_szTitle.."Ng��i mu�n gia nh�p l�u ph�i g�?",
		"Th�y Y�n V� Ti�n/#enter_mp(29)",
		"Th�y Y�n Linh N�/#enter_mp(30)",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end;

function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=�����У�2=�����У�3=�Ը�Ů��4=��СŮ

	SetPlayerRoute(nRoute);						--��������

	if nRoute == 2 then						--�����׼�
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(32);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then					--������ɮ
		LearnSkill(6);
		LearnSkill(57);
		nBegin = 45;
		nEnd = 56;
	elseif nRoute == 4 then					--������ɮ
		LearnSkill(2);
		LearnSkill(44);
		nBegin = 33;
		nEnd = 43;
	elseif nRoute == 14 then					--�䵱����
		LearnSkill(4);
		LearnSkill(146);
		nBegin = 125;
		nEnd = 145;
	elseif nRoute == 15 then					--�䵱�׼�
		LearnSkill(5);
		LearnSkill(159);
		nBegin = 147;
		nEnd = 158;
	elseif nRoute == 8 then					--���ҷ��
		LearnSkill(4);
		LearnSkill(89);
		nBegin = 75
		nEnd = 88;
	elseif nRoute == 9 then					--�����׼�
		LearnSkill(10);
		LearnSkill(102);
		nBegin = 90
		nEnd = 101;
	elseif nRoute == 11 then					--ؤ�ﾻ��
		LearnSkill(2);
		LearnSkill(113);
		nBegin = 103
		nEnd = 112;
	elseif nRoute == 12 then					--ؤ������
		LearnSkill(5);
		LearnSkill(124);
		nBegin = 114
		nEnd = 123;
	elseif nRoute == 6 then					--����
		LearnSkill(7);
		LearnSkill(74);
		nBegin = 58
		nEnd = 73;
	elseif nRoute == 17 then					--����ǹ��
		LearnSkill(11);
		LearnSkill(732);
		nBegin = 720;
		nEnd = 731;
	elseif nRoute == 18 then					--���Ź���
		LearnSkill(12);
		LearnSkill(745);
		nBegin = 733;
		nEnd = 744;
	elseif nRoute == 20 then					--�嶾а��
		LearnSkill(13);
		LearnSkill(775);
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then					--�嶾��ʦ
		LearnSkill(14);
		LearnSkill(774);
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then					--������ʦ
		LearnSkill(4);
		LearnSkill(1032);
		nBegin = 1017 ;
		nEnd = 1031;
	elseif nRoute == 25 then					--����ʥս
		LearnSkill(3);
		LearnSkill(1066);
		nBegin = 1053 ;
		nEnd = 1065;
	elseif nRoute == 26 then					--�������
		LearnSkill(8);
		LearnSkill(1096);
		nBegin = 1083 ;
		nEnd = 1095;
	elseif nRoute == 27 then					--����Ѫ��
		LearnSkill(14);
		LearnSkill(1213);
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then					--��������
		LearnSkill(15);
		LearnSkill(1196);
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then					--������Ů
		LearnSkill(16);
		LearnSkill(1230);
		nBegin = 1217 ;
		nEnd = 1229;
	elseif nRoute == 31 then					--��������
		LearnSkill(17);
		LearnSkill(1883);
		nBegin = 1872 ;
		nEnd = 1882;
	elseif nRoute == 32 then					--������Ů
		LearnSkill(4);
		LearnSkill(1897);
		nBegin = 1885 ;
		nEnd = 1896;
	else
		return
	end;

	LearnSkill(20);

	for i = nBegin, nEnd do
		LearnSkill(i);
		while LevelUpSkill(i) == 1 do
		end
	end;

	--FullSkill20()
	ModifyJinJuan(9999999,0)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	Msg2Player("Gia nh�p m�n ph�i th�nh c�ng")
	Msg2Player("B�n nh�n ���c 9,999,999 Kim Phi�u h� tr� phi�u l�u !!! Loli iz da bezt")
	Talk(1,"","Gia nh�p m�n ph�i th�nh c�ng")
end

function UpSuper()
	PlayerReborn(2, random(4));			--Chuy�n sinh
	SetLevel(99, 1);								--C�p
	ModifyExp(2000000000);
	ModifyReputation(1000000,0);			--Danh v�ng
	SetTask(336, 1000000);  --S� M�n
	SetTask(704, 6)  --Nguy�n So�i
	SetTask(701, 5000000); --C�ng tr�ng
	gf_SetTaskByte(1538, 1, 5);
	--ModifyJinJuan(9999999,1); --Kim Phi�u
	
	--Hieu Bang
	AddTitle(69,1);
	AddTitle(69,2);
	AddTitle(72,10);
	
	-- Hieu CS
	AddTitle(61,5);
	AddTitle(71,1);
	AddTitle(73,1);
	AddTitle(76,1);
	
	--Hieu New
	AddTitle(70,1);
	AddTitle(74,1);
	AddTitle(74,2);
	AddTitle(74,3);
	AddTitle(75,1);
	AddTitle(75,2);
end


--Mat Tich
function Get_Book()
	local szSay = {
		g_szTitle.."Nh�n L�u Ph�i Ch�n Quy�n v� Quy�t Y�u!",
		"Nh�n Ch�n Quy�n/Get_Book_ZhenJuan",
		"Nh�n Quy�t Y�u/Get_Book_JueYao",
		"Th�ng c�p m�t t�ch �� trang b�/Get_Book_Update",
		"T�ng ch� s� l�n 250%/Get_250book",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end

function Get_250book()
	CastState("state_add_book_attribute_value", 250, -1, -1);
	
end

function Get_Book_ZhenJuan()
	local nRoute	= GetPlayerRoute();
	
	if nRoute == 2 then
		AddItem(0, 107, 30001,2)
	end
	
	if nRoute == 3 then
		AddItem(0, 107, 30003,2)
	end
	
	if nRoute == 4 then
		AddItem(0, 107, 30002,2)
	end
	
	if nRoute == 6 then
		AddItem(0, 107, 30004,2)
	end
	
		if nRoute == 8 then
		AddItem(0, 107, 30005,2)
	end
	
		if nRoute == 9 then
		AddItem(0, 107, 30006,2)
	end
	
		if nRoute == 11 then
		AddItem(0, 107, 30007,2)
	end
	
		if nRoute == 12 then
		AddItem(0, 107, 30008,2)
	end
	
		if nRoute == 14 then
		AddItem(0, 107, 30009,2)
	end
	
		if nRoute == 15 then
		AddItem(0, 107, 30010,2)
	end
	
		if nRoute == 17 then
		AddItem(0, 107, 30011,2)
	end
	
		if nRoute == 18 then
		AddItem(0, 107, 30012,2)
	end
	
		if nRoute == 20 then
		AddItem(0, 107, 30013,2)
	end
	
		if nRoute == 21 then
		AddItem(0, 107, 30014,2)
	end
	
	if nRoute == 23 then
		AddItem(0, 107, 30015,2)
	end
	
	if nRoute == 25 then
		AddItem(0, 107, 30035,2)
	end
	
	if nRoute == 26 then
		AddItem(0, 107, 30036,2)
	end
	
	if nRoute == 27 then
		AddItem(0, 107, 30037,2)
	end
	
	if nRoute == 29 then
		AddItem(0, 107, 30016,2)
	end
	
	if nRoute == 30 then
		AddItem(0, 107, 30017,2)
	end

	if nRoute == 31 then
		AddItem(0, 107, 231,2)
	end

	if nRoute == 32 then
		AddItem(0, 107, 235,2)
	end
	
	gf_AddItemEx({0,112,158,1,4}, "L�ng Ba Vi B� to�n t�p");
end

function Get_Book_JueYao()
	local tJue ={
		[2]		={1,10},
		[3]		={21,31},
		[4]		={11,20},
		[6]		={32,46},
		[8]		={47,59},
		[9]		={60,70},
		[11]		={71,79},
		[12]		={80,88},
		[14]		={89,108},
		[15]		={109,119},
		[17]		={120,130},
		[18]		={131,141},
		[20]		={142,154},
		[21]		={155,168},
		[23]		={169,182},
		[25]		={183,194},
		[26]		={195,206},
		[27]		={207,218},
		[29]		={219,229},
		[30]		={230,240},
		[31]		={241,250},
		[32]		={251,260},
	};

	local nRoute = GetPlayerRoute();
	for i = tJue[nRoute][1],tJue[nRoute][2] do
		gf_AddItemEx({2, 6, i, 1, 4}, "Quy�t Y�u");
	end
end

function Get_Book_Update()
	for i=1,100 do LevelUpBook() end
	for i=1,100 do LevelUpBook(1) end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end


--Vat Dung Mon Phai
function Give_ZhuzhuZhouzhou()
	if gf_Judge_Room_Weight(2, 1) ~= 1 then
		return 0;
	end

	AddItem(2, 3, 4, 99);
	AddItem(2, 3, 12, 99);	
end

function Give_JiguanAnqi()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end
  for i = 1,9 do
		AddItem(2, 11, i, 2000, 4);
	end
	AddItem(2, 3, 6, 999, 4);	
end

function Give_Dandan()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 3, 7, 999);
end

function Give_ZhanMa()
	if gf_Judge_Room_Weight(1, 10) ~= 1 then
		return 0;
	end
	AddItem(0,105,38,1,1,7,101,7,101,7,101);
end

function Give_Jiancu()
	if gf_Judge_Room_Weight(2, 100) ~= 1 then
		return 0;
	end
	AddItem(2, 15, 10, 2000);
	AddItem(0,105,38,1,1,7,101,7,101,7,101);
end

function Give_Fengshifu()
	if gf_Judge_Room_Weight(5, 1) ~= 1 then
		return 0;
	end

	AddItem(1, 6, 34,	30, 4);
	AddItem(1, 6, 46, 30, 4);
	AddItem(1, 6, 84,	30, 4);
	AddItem(1, 6, 153,30, 4);
	AddItem(1, 6, 154,30, 4);
end

function Give_GuGu()
	if gf_Judge_Room_Weight(32, 1) ~= 1 then
		return 0;
	end
  for i = 1,31 do
		AddItem(2, 17, i, 99, 4);
	end

	if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
		AddItem(2, 0, 1063, 1);
	end
end


--Pet TYLN
function ling_nv_xiaodiao()
	local szSay = {};
	szSay[getn(szSay) + 1] = "Nh�n Ti�u �i�u/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "Nu�i Ti�u �i�u/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "Hu�n luy�n Ti�u �i�u/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "\nRa kh�i/nothing";
	Say(g_szTitle.."Ti�u �i�u thao t�c.", getn(szSay), szSay)
end

function Give_XiaoDiao()
	if gf_Judge_Room_Weight(1, 1) ~= 1 then
		return 0;
	end
	AddItem(2, 20, 24, 1, 4);
end

function Give_XiaoDiaoFood()
	if gf_Judge_Room_Weight(11, 1) ~= 1 then
		return 0;
	end

	for i = 6, 12 do
		if i == 11 then
			AddItem(2, 97, i, 1, 4);
		else
			AddItem(2, 97, i, 100, 4);
		end
	end
end

function Feed_XiaoDiao()
	local nPetItemIndex = GetPlayerEquipIndex(12);
	if (nPetItemIndex == nil or nPetItemIndex <=0) then
		Msg2Player("C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!");
		return
	end

	for i = 1, 99 do
		LevelUpPet(nPetItemIndex)
	end
end


--Xoa Kho Do
function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Ng��i mu�n thanh l� t�i?", 2, "��ng �/#ClearBagAllItem(1)", "Ra kh�i/nothing")
		return
	end
	ClearItemInPos();
	AddItem(2, 1, 50005, 1) -- The Tan Thu
	if GetItemCount(2,1,30644) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30644,1)
	end
	if GetItemCount(2,1,30045) < 1 and GetFreeItemRoom() > 0 then
		AddItem(2,1,30045,1)
	end
end


--Bang Hoi
function TongOperation()
	local szSay = {
		g_szTitle.."Thao t�c bang h�i",
		"Ta mu�n nh�n v�t ph�m bang h�i/TongOperation_Create",
		"Ta mu�n t�o bang h�i/CreateTongDialog",
		"Ta mu�n th�ng c�p bang h�i/TongOperation_update",
		"\nRa kh�i/nothing",
	};
	SelectSay(szSay);
end

function TongOperation_Create()
	if IsTongMember() ~= 0 then
		Talk(1,"","Ng��i �� c� bang h�i");
		return
	end
	if GetItemCount(2,0,555) < 1 then
		AddItem(2,0,555,1)
	end
	if GetItemCount(2,0,125) < 1 then
		AddItem(2,0,125,1)
	 end
	if GetReputation() < 2000 then
		ModifyReputation(2000 - GetReputation(), 0)
	end
end

function TongOperation_update()
	if GetTongLevel() < 3 then
		AddTongLevel();
		PlaySound("\\sound\\sound_i016.wav");
		SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
	end
end


--Kinh Mach
function GetJingMai()
	local szSay = {
		g_szTitle.."Thao th�c kinh m�ch",
		"T�y �i�m kinh m�ch/GetJingMai_Reset",
		format("%s/getZhenqi", "Nh�n ch�n kh�"),
		format("%s/getJingMaiTongRen", "Nh�n Kinh M�ch ��ng Nh�n"),
		"\nRa kh�i/nothing",
	};
	if MeridianGetLevel() < 6 then
		tinsert(szSay, 2, "Th�ng c�p c�nh gi�i V� Th�nh/GetJingMai_Update")
	end
	SelectSay(szSay);
end

function getZhenqi()
	AwardGenuineQi(180000);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function getJingMaiTongRen()
	AddItem(2, 1,30730, 99)
	AddItem(2, 1,30731, 99)
	AddItem(2, 1,30732, 99)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Update()
	local nLevel = MeridianGetLevel()
	for i = nLevel + 1, 6 do
		MeridianUpdateLevel()
	end
	local nNum = 1200000 - (MeridianGetDanTian() + MeridianGetQiHai());
	if nNum > 0 then
		AwardGenuineQi(nNum);
	end
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function GetJingMai_Reset(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Thao th�c kinh m�ch", 2,"��ng �/#GetJingMai_Reset(1)", "H�y b�/nothing")
		return 0;
	end
	MeridianRestore(-1);
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

function FullSkill20()
	for i = 1,20 do

		while LevelUpSkill(1196) == 1 do
		end
		while LevelUpSkill(44) == 1 do
		end
		while LevelUpSkill(146) == 1 do
		end
		while LevelUpSkill(745) == 1 do
		end
		while LevelUpSkill(113) == 1 do
		end
		while LevelUpSkill(1032) == 1 do
		end
		while LevelUpSkill(74) == 1 do
		end
		while LevelUpSkill(774) == 1 do
		end
		while LevelUpSkill(775) == 1 do
		end
		while LevelUpSkill(732) == 1 do
		end
		while LevelUpSkill(159) == 1 do
		end
		while LevelUpSkill(89) == 1 do
		end
		while LevelUpSkill(102) == 1 do
		end
		while LevelUpSkill(1230) == 1 do
		end
		while LevelUpSkill(57) == 1 do
		end
		while LevelUpSkill(124) == 1 do
		end
		while LevelUpSkill(32) == 1 do
		end
		while LevelUpSkill(1066) == 1 do
		end
		while LevelUpSkill(1096) == 1 do
		end
		while LevelUpSkill(1213) == 1 do
		end
		while LevelUpSkill(1897) == 1 do
		end
		while LevelUpSkill(1883) == 1 do
		end
	end;
end
