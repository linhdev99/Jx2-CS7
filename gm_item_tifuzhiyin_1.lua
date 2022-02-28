--Ìå·þÖ¸Òý
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
        g_szTitle.."H·y lùa chän thuéc tÝnh:",
"MÆc ®Þnh/#Mod_NTGetOutfits(0)", 
  "Bá qua tû lÖ gi·n c¸ch chiªu, néi lùc, phßng thñ ®èi ph­¬ng 100%/#Mod_NTGetOutfits(14636)",	
  "Tr¸nh mäi tr¹ng th¸i phô, néi ngo¹i phßng t¨ng 5000/#Mod_NTGetOutfits(14637)",	
  "MiÔn dÞch hçn lo¹n, ngñ, ®¸nh ng· 100%/#Mod_NTGetOutfits(14638)",	
  "MiÔn dÞch ®øng yªn, cho¸ng, ®¸nh lui 100%/#Mod_NTGetOutfits(14639)",	
  "Kh¸ng tÊt c¶ 3000, tèc ®é xuÊt chiªu t¨ng 500%, Gi¶m nöa mäi s¸t th­¬ng/#Mod_NTGetOutfits(14640)",	
  "Ngo¹i, néi phßng t¨ng 100%, sinh lùc v« ®Þch/#Mod_NTGetOutfits(14641)",	
  "Tèc ®é di chuyÓn t¨ng 100%, x¸c suÊt xuÊt chiªu t¨ng 100%, ®é bÒn vò khÝ 600s håi 100/#Mod_NTGetOutfits(14642)",	
  "Néi, ngo¹i c«ng t¨ng 9000%, hç trî mËt tÞch t¨ng 300%/#Mod_NTGetOutfits(14643)",
"Håi phôc sinh lùc mçi nöa gi©y 10%, Gi¶m thä th­¬ng 100%, Hç trî mËt tÞch 300%/#Mod_NTGetOutfits(14644)",
"Tèc ®é xuÊt chiªu t¨ng 1000%, thêi gian hç trî tÊn c«ng phßng thñ t¨ng 1000%/#Mod_NTGetOutfits(14645)",	
         "T¨ng tèc ®é xuÊt chiªu 85%, Kh¸ng tÊt c¶ 4xx/#Mod_NTGetOutfits(14487)",
         "T¨ng tèc ®é thi triÓn vâ c«ng 92%, kh¸ng tÊt c¶ 280, t¨ng tû lÖ chÞu ®ßn 55%/#Mod_NTGetOutfits(14524)",
        "Tèc ®é di chuyÓn t¨ng 140%/#Mod_NTGetOutfits(403)",
        "Gi¶m thä th­¬ng 165%, sinh lùc t¨ng 44000/#Mod_NTGetOutfits(14523)",
        "Gi·n c¸ch liªn hoa t©m kinh vÒ 0, Thêi gian hç trî tÊn c«ng phßng thñ t¨ng 140%/#Mod_NTGetOutfits(852)",
        "Néi lùc tiªu hao gi¶m 98%/#Mod_NTGetOutfits(14611)", 
        "Phßng ngù néi ngo¹i c«ng t¨ng 8%/#Mod_NTGetOutfits(495)",
        "Nãn, Y phôc, H¹ Y mçi 600s phôc håi ®é bÒn 7/#Mod_NTGetOutfits(405)",
        "§é bÒn vò khÝ mçi 600s phôc håi 7/#Mod_NTGetOutfits(43)",
        "Tr¸nh mäi tr¹ng th¸i phô 70%/#Mod_NTGetOutfits(406)",
        "MiÔn dÞch Lo¹n, Ngñ, §¸nh ng· 50%/#Mod_NTGetOutfits(13066)",
        "MiÔn dÞch §øng yªn, Cho¸ng, §¸nh lui 50%/#Mod_NTGetOutfits(13067)",
        "Mçi n÷a gi©y phôc håi sinh lùc ®ång ®éi 7%/#Mod_NTGetOutfits(416)",
        "Néi c«ng t¨ng 140%/#Mod_NTGetOutfits(14526)",
        "Ngo¹i c«ng t¨ng 140%/#Mod_NTGetOutfits(14525)",
        "Bá qua phßng ngù 35%/#Mod_NTGetOutfits(252)",
        "Kh¸ng tÊt c¶ 240, Néi ngo¹i phßng t¨ng 900 ®iÓm/#Mod_NTGetOutfits(13355)",
        "Phßng thñ néi c«ng ®èi ph­¬ng gi¶m 43%/#Mod_NTGetOutfits(846)",
        "Phßng thñ ngo¹i c«ng ®èi ph­¬ng gi¶m 43%/#Mod_NTGetOutfits(845)",
        "Sinh lùc t¨ng 45%/#Mod_NTGetOutfits(843)",
        "T¨ng tèc ®é xuÊt chiªu 24%, Hç trî mËt tÞch 20%, Kh¸ng tÊt c¶ 55/#Mod_NTGetOutfits(14118)",
        "Thêi gian hç trî t¨ng 140%, kh¸ng tÊt c¶ 30/#Mod_NTGetOutfits(838)",
        "Phßng ngù ngo¹i c«ng t¨ng 8%/#Mod_NTGetOutfits(493)",
        "Phßng ngù néi c«ng t¨ng 8%/#Mod_NTGetOutfits(494)",
        "X¸c suÊt xuÊt chiªu t¨ng 8%/#Mod_NTGetOutfits(491)",
        "Phßng ngù ngo¹i c«ng ®èi ph­¬ng gi¶m 15%/#Mod_NTGetOutfits(63)",
        "Phßng ngù néi c«ng ®èi ph­¬ng gi¶m 15%/#Mod_NTGetOutfits(64)",
        "Gi¶m phßng ngù néi ngo¹i c«ng ®èi ph­¬ng 14%/#Mod_NTGetOutfits(90)",    
        "Ra khái/nothing",
    };

function OnUse(nItem)	
	--print(GetPlayerRebornParam(0))
	--print(GetTranslifeCount())
	-------Chøc N¨ng Set Qu¶n TrÞ Viªn
	local nName = GetAccount();
	if CheckName(nName) == 0 then
		Talk(1,"","B¹n kh«ng ph¶i Qu¶n TrÞ Viªn");
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
			"Gia nhËp m«n ph¸i/JoinRoute_UpdateLevel",
		}
	else
		tSay = {
			--"\nT¹o Boss/AddNPC",
			"Gäi Boss /BossTongHop",
			"NhËn ngo¹i trang /Mod_GetNgoaiTrang",
			"NhËn trang bÞ /GetTB",
			"NhËn thó c­ìi /Mod_GetThuCuoi",
			"NhËn vËt phÈm kh¸c/Get_TieuDung",
			"Chøc n¨ng më réng/Get_Orther",
			"Qu¶n lý trß ch¬i/Mod_GMActions",
			format("%s/getTiLi", "\nHåi phôc thÓ lùc"),
		}
	end
	tinsert(tSay, "Xãa kho ®å/ClearBagAllItem");
	tinsert(tSay, "Tho¸t/nothing");
	Say(g_szTitle.."Lùa chän chøc n¨ng", getn(tSay), tSay);
end
function Mod_GetThuCuoi()
	local szSay = {
        		g_szTitle.."Chän thó c­ìi:",
		"B¹ch M·/#Mod_GetThuCoi(34)",
		"Phiªu Vò/#Mod_GetThuCoi(15)",
		"B«n Tiªu/#Mod_GetThuCoi(16)",
		"Siªu Quang/#Mod_GetThuCoi(19)",
		"§»ng Vô/#Mod_GetThuCoi(20)",
		"ThiÕu D­¬ng ThÊt Tinh KiÕm/#Mod_GetThuCoi(10107)",
		"V¨n Sö ThÊt Qu©n KiÕm/#Mod_GetThuCoi(10108)",
		"Ngäc Kú L©n/#Mod_GetThuCoi(30003)",
		"Háa Kú L©n/#Mod_GetThuCoi(30004)",
		"B¹ch Hæ/#Mod_GetThuCoi(30009)",
		"Hoµng Hæ/#Mod_GetThuCoi(30010)",
		"B¸o Tr¾ng/#Mod_GetThuCoi(30012)",
		"B¸o §en/#Mod_GetThuCoi(30013)",
		"Thá ®en/#Mod_GetThuCoi(30039)",
		"Thá b«ng/#Mod_GetThuCoi(30040)",
        		"Ra khái/nothing",
    	};
    	SelectSay(szSay); 
end
function Mod_GetThuCoi(horseId)
	AddItem(0,105,horseId,1,1,-1,-1,-1,-1,-1,-1,-1,0)
end
function Mod_GMActions()
	local szSay = {
        		g_szTitle.."Chän chøc n¨ng:",
        		"Di chuyÓn tíi vÞ ttrÝ ng­êi ch¬i/teleportToPlayer",
		"TriÖu håi ng­êi ch¬i tíi vÞ trÝ cña m×nh/summonPlayer",
		"NhËn ph¸o chiÕn th¾ng (60 c¸i)/Mod_GetPhaoChienThang",
		"NhËn kim phiÕu/Mod_GetKimPhieu",
        		"Ra khái/nothing",
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


	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
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


	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
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
        		g_szTitle.."Chän ngo¹i trang",
        		"ChuyÓn sinh y/#Mod_NTSetID(514)",
		"Tø Linh ViÖt Phôc Y (Vµng)/#Mod_NTSetID(30001)",
		"Tø Linh ViÖt Phôc Y (TÝm)/#Mod_NTSetID(30005)",
		"Tø Linh ViÖt Phôc Y (Xanh)/#Mod_NTSetID(30009)",
		"Tuong Duong ngo¹i trang/#Mod_NTSetID(213)",
		"TuyÒn Ch©u ngo¹i trang/#Mod_NTSetID(217)",
		"Thµnh §« ngo¹i trang/#Mod_NTSetID(221)",
		"Ng¹o nghÔ ngo¹i trang/#Mod_NTSetID(1041)",
		"Song §¸n ngo¹i trang/#Mod_NTSetID(901)",
		"Khæng T­íc Minhn V­¬ng ngo¹i trang/#Mod_NTSetID(929)",
		"Tö D¹ ngo¹i trang/#Mod_NTSetID(825)",
		"C«ng Th­¬ng ngo¹i trang/#Mod_NTSetID(937)",
		"Thiªn Vò Cµ Sa ngo¹i trang/#Mod_NTSetID(713)",
		"DiÖp Th­îng Thu Phong ngo¹i trang/#Mod_NTSetID(953)",
		"TiÒn Long ngo¹i trang/#Mod_NTSetID(837)",
		"ChØ Thñy ngo¹i trang/#Mod_NTSetID(833)",
		"XÝch Viªn Léng H¹c ngo¹i trang/#Mod_NTSetID(985)",

        		"Ra khái/nothing",
    	};
    	SelectSay(szSay); 
end
function Mod_GetTBDC()
	 local szSay = {
        		g_szTitle.."Chän trang bÞ",
		"Thiªn Chi Viªm §Õ/#Mod_TestGetAll1(8051)",
		"B¹ch Kim Viªm §Õ/#Mod_TBSetID(30013)",
		"Tèng Ngù Long T­íng Qu©n/#Mod_TBSetID(30017)",
		"Liªu Ngù Long T­íng Qu©n/#Mod_TBSetID(30021)",
		"Long §»ng Tø H¶i Trang/#Mod_TBSetID(3056)",
		"Phông Vò Cöu Thiªn Trang/#Mod_TBSetID(3060)",
		"Ngù Long Nguyªn So¸i ChiÕn Phôc/#Mod_TBSetID(3000)",
		"ThiÖu Th¸nh Nguyªn So¸i ChiÕn Phôc/#Mod_TBSetID(3004)",
		"Tèng §« Thèng ChiÕn/#Mod_TBSetID(2231)",
		"Liªu §« Thèng ChiÕn/#Mod_TBSetID(2235)",
		"Tµng kiÕm 8x/#Mod_TBSetID(95)",
		"Tæng Qu¶n 7x/#Mod_TBSetID(91)",
        		"Ra khái/nothing",
    	};
    	SelectSay(szSay); 

end
function Mod_NTSetID(nidOutfits)
        	nIDOutfit = nidOutfits;
	 local szSay = {
        		g_szTitle.."Chän lo¹i:",
        		"Nãn/#Mod_NTGetOutfitType(108)",
		"Trang phôc/#Mod_NTGetOutfitType(109)",
		"H¹ y/#Mod_NTGetOutfitType(110)",
        		"Ra khái/nothing",
    	};
    	SelectSay(szSay); 
end

function Mod_TBSetID(nidOutfits)
	nIDOutfit = nidOutfits;
	local szSay = {
        		g_szTitle.."Chän lo¹i:",
        		"Nãn/#Mod_NTGetOutfitType(103)",
		"Trang phôc/#Mod_NTGetOutfitType(100)",
		"H¹ y/#Mod_NTGetOutfitType(101)",
		"Trang søc/#Mod_NTGetOutfitType(102)",
		"Vò khÝ/Mod_TBGetWaeponTypeList",
        		"Ra khái/nothing",
    	};
    	SelectSay(szSay); 
end
function Mod_TBGetWaeponTypeList()
	local szSay = {
        		g_szTitle.."Chän lo¹i:",
        		"G¨ng tay/#Mod_NTGetOutfitType(0)",
		"¸m khÝ/#Mod_NTGetOutfitType(1)",
		"KiÕm/#Mod_NTGetOutfitType(2)",
		"§ao/#Mod_NTGetOutfitType(3)",
		"Cung/#Mod_NTGetOutfitType(4)",
		"C«n/#Mod_NTGetOutfitType(5)",
		"Th­¬ng/#Mod_NTGetOutfitType(6)",
		"Song ®ao/#Mod_NTGetOutfitType(7)",
		"TÝch tr­îng/#Mod_NTGetOutfitType(8)",
		"Bót/#Mod_NTGetOutfitType(9)",
		"CÇm/#Mod_NTGetOutfitType(10)",
		"Tr¶o/#Mod_NTGetOutfitType(11)",
        		"Ra khái/nothing",
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

	tinsert(tSay, format("%s/Boss_LucLam", "B¾c Lôc L©m Minh Chñ"))
	tinsert(tSay, format("%s/Boss_ThuongThan", "Th­¬ng ThÇn Doanh Thiªn"))
	tinsert(tSay, format("%s/Boss_HuongLang", "L·nh H­¬ng L¨ng"))
	tinsert(tSay, format("%s/Boss_LanHoa", "Lan Hoa"))
	tinsert(tSay, format("%s/Boss_AnhTu", "Anh Tö"))
	tinsert(tSay, format("%s/Boss_PhuThuy", "Phï thñy b¨ng gi¸"))
	tinsert(tSay, format("%s/Boss_LuongSon", "H¶o h¸n L­¬ng S¬n"))
	tinsert(tSay, format("%s/Boss_W1", "§µo Hoa §¶o Chñ Hoµng Long"))
	tinsert(tSay, format("%s/Boss_W2", "T©y Vùc Th­¬ng Lang B¸ V­¬ng"))
	tinsert(tSay, format("%s/Boss_W3", "Ngäc S¬n Chi Linh Thiªn Cöu"))
	tinsert(tSay, format("%s/Boss_W4", "U Tr¹ch Chi ¶nh Minh Vâ"))
	tinsert(tSay, format("%s/Boss_TuLinh", "Tø Linh"))
	tinsert(tSay, format("%s/Boss_NienThu", "§¹i Niªn Thó"))
	tinsert(tSay, format("%s/Boss_ThitNuong", "YÕn tiÖc ThÞt N­íng"))
	tinsert(tSay, "T¹i h¹ chØ xem qua th«i/nothing");
	Say(g_szTitle.."Ng­¬i cÇn gäi boss g×?", getn(tSay), tSay);
end
function Boss_LucLam()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("S¬n TÆc §Çu Môc","B¾c Lôc L©m Minh Chñ", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe nãi minh chñ lôc l©m ®ang ë t©y TuyÒn Ch©u 191/192, ch¾c ®ang cã ©m m­u!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_ThuongThan()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("HuyÒn Vâ Th­ong","Th­¬ng ThÇn Doanh Thiªn", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe nãi thÞ vÖ th©n tÝn cña TÇn Thñy Hoµng ®ang ë t©y TuyÒn Ch©u 189/192, vâ l©m s¾p cã mét trËn hµo kiÕp!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_HuongLang()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("NghiÖt Hån","L·nh H­¬ng L¨ng", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Nghe nãi L·nh H­¬ng L¨ng  ®ang ë t©y TuyÒn Ch©u 186/194, mau ®Õn ®ã xem thö dung nhan kiÒu diÔm cña nµng!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\task\\boss\\boss_ondeath.lua")

end

function Boss_LanHoa()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("lanhua_viet","Lan Hoa", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Cã ng­êi nh×n thÊy Lan Hoa ®ang ë t©y TuyÒn Ch©u 181/190, mau ®Õn ®ã xem!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")

end

function Boss_AnhTu()

	local nMap,nX,nY = GetWorldPos();
	local npcIndex = 0
	npcIndex = CreateNpc("yingzi_viet","Anh Tö", nMap, nX + 2, nY + 2,-1,1,1,30)
	--Msg2Global("Cã ng­êi nh×n thÊy Anh Tö  ®ang ë t©y TuyÒn Ch©u 179/192, mau ®Õn ®ã xem!")
	SetNpcLifeTime(npcIndex, 7200)
	SetNpcScript(npcIndex, "\\script\\online\\viet_event\\lanhua_boss\\lanhua_boss.lua")

end


function Boss_ThitNuong()

	--Msg2Global("Cã ng­êi nh×n thÊy YÕn tiÖc ThÞt N­íng ®ang ë t©y TuyÒn Ch©u 181/188, mau ®Õn tham dù!")
	local nAddX = 0
	local nAddY = 0
	local nTargetNpc = 0
	local nMap,nX,nY = GetWorldPos();			
	for i = 1, 20 do
		nAddX = random(-70, 70)
		nAddY = random(-70, 70)		
		nTargetNpc = CreateNpc("M©m cç", "ThÞt N­íng", nMap, nX + nAddX,  nY + nAddY)
		SetNpcLifeTime(nTargetNpc, 130)
		SetNpcScript(nTargetNpc, "\\script\\online\\viet_event\\200909\\2\\pangtuzi_baoguo.lua")
end

end

function Boss_PhuThuy()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIndex = 0
	local nNpcIndex = CreateNpc("Phï thñy b¨ng gi¸", "Phï thñy b¨ng gi¸", nMap, nX + 2, nY + 2);
	SetNpcLifeTime(nNpcIndex, 7200);
	SetNpcDeathScript(nNpcIndex, "\\script\\online\\viet_event\\200912\\3\\death_binglengwushi.lua");
	--Msg2Global("Cã ng­êi nh×n thÊy Phï thñy b¨ng gi¸  ®ang ë t©y TuyÒn Ch©u 192/188, mau ®Õn ®ã xem!")


end

function Boss_LuongSon()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local n = gf_GetRandItemByTable(LSB_NPC_GOLD_BOSS, 1000, 1) or 1;
	local nNpcIndex = CreateNpc(LSB_NPC_GOLD_BOSS[n][1],LSB_NPC_GOLD_BOSS[n][3],  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcDeathScript(nNpcIndex,"\\script\\online\\liangshanboss\\npc\\gld_boos_death.lua");
		SetNpcRemoveScript(nNpcIndex,"\\script\\online\\liangshanboss\\npc\\gld_boss_remove.lua");
	--Msg2Global("Cã ng­êi ph¸t hiÖn H¶o h¸n L­¬ng S¬n  ®ang ë t©y TuyÒn Ch©u 191/187, mau ®Õn ®ã xem!")

end

LSB_NPC_GOLD_BOSS = {
	--{"yangxiong", 165, "BÖnh Quan S¸c D­¬ng Hïng", 30 * 60},
	--{"linchong", 167, "B¸o Tö §Çu L©m Xung", 30 * 60},
	--{"luzhishen", 167, "Hoa Hßa Th­îng Lç TrÝ Th©m", 30 * 60},
	--{"likui", 167, "H¾c Toµn Phong Lý Quú", 30 * 60},
	--{"husanliang", 167, "NhÊt Tr­îng Thanh Hæ Tam N­¬ng", 30 * 60},
	--{"shixiu", 167, "Phanh MÖnh Tam Lang Th¹ch Tó", 30 * 60},
	{"CËp Thêi Vò Tèng Giang", 167, "CËp Thêi Vò Tèng Giang", 30 * 60},
	{"Tri §a Tinh Ng« Dông", 167, "Tri §a Tinh Ng« Dông", 30 * 60},
	{"Cöu V¨n Long Sö TiÕn", 167, "Cöu V¨n Long Sö TiÕn", 30 * 60},
	{"TiÓu TuyÒn Phong Sµi TiÕn", 167, "TiÓu TuyÒn Phong Sµi TiÕn", 30 * 60},
	{"§¹i §ao Quan Th¾ng", 167, "§¹i §ao Quan Th¾ng", 30 * 60},
	{"NhËp V©n Long C«ng T«n Th¾ng", 167, "NhËp V©n Long C«ng T«n Th¾ng", 30 * 60},
	{"B¸o Tö §Çu L©m Xung", 167, "B¸o Tö §Çu L©m Xung", 30 * 60},
	{"Hoa Hßa Th­îng Lç TrÝ Th©m", 167, "Hoa Hßa Th­îng Lç TrÝ Th©m", 30 * 60},
	{"Hµnh Gi¶ Vâ Tßng", 167, "Hµnh Gi¶ Vâ Tßng", 30 * 60},
	{"Tóy B¸n Tiªn Phong NhÊt Phµm", 167, "Tóy B¸n Tiªn Phong NhÊt Phµm", 30 * 60},
	{"BÖnh Quan S¸c D­¬ng Hïng", 167, "BÖnh Quan S¸c D­¬ng Hïng", 30 * 60},
	{"Phanh MÖnh Tam Lang Th¹ch Tó", 167, "Phanh MÖnh Tam Lang Th¹ch Tó", 30 * 60},
	{"NhÊt Tr­îng Thanh Hæ Tam N­¬ng", 167, "NhÊt Tr­îng Thanh Hæ Tam N­¬ng", 30 * 60},
	{"Song Th­¬ng T­íng §æng B×nh", 167, "Song Th­¬ng T­íng §æng B×nh", 30 * 60},
	{"Thanh DiÖn Thó D­¬ng TrÝ", 167, "Thanh DiÖn Thó D­¬ng TrÝ", 30 * 60},
	{"TÝch LÞch Háa TÇn Minh", 167, "TÝch LÞch Háa TÇn Minh", 30 * 60},
	{"Song Tiªn H« Diªn Ch­íc", 167, "Song Tiªn H« Diªn Ch­íc", 30 * 60},
	{"H¾c Toµn Phong Lý Quú", 167, "H¾c Toµn Phong Lý Quú", 30 * 60},
};

function Boss_W1()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_HL", "§µo Hoa §¶o Chñ Hoµng Long", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W2()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_CLBZ", "T©y Vùc Th­¬ng Lang B¸ V­¬ng", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W3()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_TJ", "Ngäc S¬n Chi Linh Thiªn Cöu", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end
function Boss_W4()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
		local npcIndex = CreateNpc("WorldBoss_MW", "U Tr¹ch Chi ¶nh Minh Vâ", nMap, nX + 2, nY + 2);
		SetNpcLifeTime(npcIndex, 20 * 60);
		SetNpcDeathScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_death.lua");
		SetNpcRemoveScript(npcIndex, "\\script\\function\\world_boss\\wb_boss_remove.lua");

end

function Thuong_LuongSon()

	local nMap,nX,nY = GetWorldPos();
	local nNpcIdx = 0
			local nNpcIdx = CreateNpc(IBbaoxiang, "R­¬ng H¶o H¸n", nMap, nX + 2, nY + 2);
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
	{"Long Tö", 165, "Long ThÇn Hãa Th©n", 30 * 60},
	{"Phông Tö", 167, "Phông ThÇn Hãa Th©n", 30 * 60},
	{"Hæ Tö", 165, "Hæ ThÇn Hãa Th©n", 30 * 60},
	{"¦ng Tö", 167, "¦ng ThÇn Hãa Th©n", 30 * 60},
}

function Boss_NienThu()

	local nNpcIndex = 0
	local nMap,nX,nY = GetWorldPos();
	local nNpcIndex = CreateNpc("§¹i Niªn Thó","ThÇn thó ngh×n n¨m",  nMap, nX + 2, nY + 2);
		SetNpcLifeTime(nNpcIndex,7200);
		SetNpcScript(nNpcIndex,"\\script\\online_activites\\2011_03\\boss\\npc\\bigboss.lua");

end


function AddNPC(nVar1)
	local map_ID,att_X,att_Y = GetWorldPos();
	
	local nNpcIndex = CreateNpc("WorldBoss_rwx", "BOSS ThÕ Giíi", map_ID, att_X, att_Y);
	SetNpcLifeTime(nNpcIndex,1000);
	--SetNpcDeathScript(nNpcIndex, );
end


--TRANG BI THONG THUONG
function GetTB()
	local szSay = {
		g_szTitle.."Lùa chän",
		"Trang bÞ dïng chung/Mod_GetTBDC",
		"Trang bÞ Kim Xµ 6/Get_KimXa",
		"Trang bÞ V« Song ChiÕn ThÇn/Get_VSCT",
		"Trang bÞ H¾c B¹ch V« Song/Get_HBVS",
		"Trang bÞ V« H¹ Hµo HiÖp/Get_HHVH",
		"Trang bÞ ¢m HuyÕt/Get_AH",
		"Trang bÞ S¸t Tinh/Get_ST",
		"Trang bÞ ChiÕn Tr­êng/GetCT",
		"Trang bÞ Minh Tinh V« Cùc/Get_NgocBoi",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);	
end

function Get_KimXa()
	local szSay = {
		g_szTitle.."Lùa chän trang b?",
		"Trang bÞ Kim Xµ Phi Phong Hoan L¨ng/Get_KXDH",
		"Trang bÞ Kim Xµ Phi Phong §»ng Giao/Get_KXTH",
		"Trang bÞ Kim Xµ Phi Phong Khëi Ph­îng/Get_KXVD",
		"Ra khái/nothing",
	};
	SelectSay(szSay);
end
function Get_KXDH()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	--kx6 hoan l¨ng
        local pifeng,pIndex	=AddItem(0,154,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2608,2612))
		local huizhang,hIndex	=AddItem(0,153,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2583,2585))
		local xie,xIndex	=AddItem(0,152,32,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2514,2515),random(2527,2531),random(2543,2547),random(2561,2566),random(2572,2573),random(2583,2586))
	-- end kx6 hoan l¨ng
end

function Get_KXTH()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	 -- kx6 ®»ng giao
	    local pifeng,pIndex	=AddItem(0,154,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2703,2706))
		local huizhang,hIndex	=AddItem(0,153,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2690,2693))
		local xie,xIndex	=AddItem(0,152,33,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2618,2619),random(2631,2635),random(2647,2651),random(2665,2670),random(2678,2680),random(2690,2693))

	-- end kx6 ®»ng giao
end

function Get_KXVD()
	if 1 ~= gf_Judge_Room_Weight(3, 1, g_szTitle) then
		return 0;
	end

	-- kx6 khëi ph­îng
		local pifeng,pIndex	=AddItem(0,154,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
        FeedItem(pIndex,1000000)
		SetItemFeedUpAttrs(pIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2799,2803))
		local huizhang,hIndex	=AddItem(0,153,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(hIndex,1000000)
		SetItemFeedUpAttrs(hIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2784,2787))
		local xie,xIndex	=AddItem(0,152,34,1,4,-1,-1,-1,-1,-1,-1,0,15)
		FeedItem(xIndex,1000000)
		SetItemFeedUpAttrs(xIndex,random(2712,2713),random(2725,2729),random(2741,2745),random(2759,2764),random(2772,2774),random(2784,2787))
	-- end kx6 khëi ph­îng	)
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
		g_szTitle.."Lùa chän",
		"NhËn trang bÞ Háa Phông/Get_CT_HP",
		"NhËn trang bÞ Thanh Long/Get_CT_TL",
		"NhËn trang bÞ Uy Hæ/Get_CT_UH",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);	
end

--Trang bi UY HO
function Get_CT_UH()
	local szSay = {
		g_szTitle.."Lùa chän trang bÞ",
		"Trang phôc Uy Hæ T­íng Phe Tèng/#Get_TP_CT_UH(1,1)",
		"Trang phôc Uy Hæ So¸i Phe Tèng/#Get_TP_CT_UH(1,2)",
		"Trang phôc Uy Hæ T­íng Phe Liªu/#Get_TP_CT_UH(2,1)",
		"Trang phôc Uy Hæ So¸i Phe Liªu/#Get_TP_CT_UH(2,2)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

--Trang bi THANH LONG
function Get_CT_TL()
	local szSay = {
		g_szTitle.."Lùa chän trang bÞ",
		"Trang phôc Thanh Long T­íng Phe Tèng/#Get_TP_CT_TL(1,1)",
		"Trang phôc Thanh Long So¸i Phe Tèng/#Get_TP_CT_TL(1,2)",
		"Trang phôc Thanh Long T­íng Phe Liªu/#Get_TP_CT_TL(2,1)",
		"Trang phôc Thanh Long So¸i Phe Liªu/#Get_TP_CT_TL(2,2)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

--Trang bi Hoa Phung
function Get_CT_HP()
	local szSay = {
		g_szTitle.."Lùa chän trang bÞ",
		"Trang phôc Háa Phông T­íng Phe Tèng/#Get_TP_CT_HP(1,1)",
		"Trang phôc Háa Phông So¸i Phe Tèng/#Get_TP_CT_HP(1,2)",
		"Trang phôc Háa Phông T­íng Phe Liªu/#Get_TP_CT_HP(2,1)",
		"Trang phôc Háa Phông So¸i Phe Liªu/#Get_TP_CT_HP(2,2)",
		"\nRa khái/nothing",
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
        			g_szTitle.."Chän lo¹i:",
        			"Nãn/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_TP,103)",
			"Trang phôc/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_TP, 100)",
			"H¹ y/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_TP, 101)",
			"Trang søc 1/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_NB,102)",
			"Trang søc 2/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_NB + 64,102)",
			"Trang søc 3/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_NB + 64 * 2,102)",
    		};
	if nQH == 2 then
		tinsert(szSay, "Trang søc 4/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_NB + 64 * 3,102)")
	end
	tinsert(szSay, "Vò khÝ/#Mod_GetTBCT_GetAttribute(nTBCT_ATT_VK,nTBCT_ATT_A)")
	tinsert(szSay, "Ra khái/nothing")
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
		"NhËn Lac/GetLac",
		"NhËn 10000 vµng/Get_Money",
		"NhËn §¸ Quý/Get_Gem",
		"NhËn vËt phÈm Shop/Get_VPSHOP",
		"NhËn TMKL vµ TCL/Get_TMKL",
		"NhËn Thiªn Kiªu LÖnh/getTianJiaoLing",
		--"NhËn Nguyªn LiÖu ChÕ T¹o ChiÕn Tr­êng/Get_CTItem",
		"NhËn Th¸i DÞch Hçn Nguyªn C«ng Phæ/Mod_HCS_GetThaiDich",
		"NhËn ThiÖp mêi dù tiÖc Long M«n TrÊn/Mod_HCS_GetThiepDuTiecLongMon",

	};
	if 3 == nRoute then
		tinsert(tSay, "NhËn Thiªn PhËt Ch©u vµ Ph¸ Ma Chó/Give_ZhuzhuZhouzhou")
	end
	if 6 == nRoute then
		tinsert(tSay, "NhËn ¸m KhÝ vµ C¬ Quan/Give_JiguanAnqi")
	end
	if 8 == nRoute then
		tinsert(tSay, "NhËn X¸ Lîi Kim §¬n/Give_Dandan")
	end		
	if 17 == nRoute then
		tinsert(tSay, "NhËn ChiÕn M·/Give_ZhanMa")
	end
	if 18 == nRoute then
		tinsert(tSay, "NhËn ChiÕn M· vµ Tô TiÔn/Give_Jiancu")
	end
	if 20 == nRoute then
		tinsert(tSay, "NhËn Phong Thi Phï/Give_Fengshifu")
	end
	if 21 == nRoute then
		tinsert(tSay, "NhËn Cæ/Give_GuGu")
	end
	if 30 == nRoute then
		tinsert(tSay, "NhËn §iªu/ling_nv_xiaodiao")
	end
	if 32 == nRoute then
		tinsert(tSay, "NhËn Linh KiÕm/ling_nv_xiaodiao)")
	end
	
	tinsert(tSay, "\nRa khái/nothing");
	Say(g_szTitle.."Lùa chän", getn(tSay), tSay);	
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
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "HuyÕtTrÝchTh¹ch Lv7");
	AddItem(2, 22, 201, 100);
	AddItem(2, 22, 202, 100);
	AddItem(2, 22, 203, 100);
	AddItem(2, 22, 204, 100);
	AddItem(2, 22, 207, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "NguyÖtB¹chTh¹ch Lv7");
	AddItem(2, 22, 301, 100);
	AddItem(2, 22, 302, 100);
	AddItem(2, 22, 303, 100);
	AddItem(2, 22, 304, 100);
	AddItem(2, 22, 307, 100);
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "Hæ Ph¸ch Th¹ch Lv7");
	AddItem(2, 22, 401, 100);	
	AddItem(2, 22, 402, 100);	
	AddItem(2, 22, 403, 100);	
	AddItem(2, 22, 404, 100);
	AddItem(2, 22, 407, 100);	
	WriteLogEx("Get_Gem","NhËn ®¸ quý", 100, "H¾c DiÖu Th¹ch Lv7");
end

function Get_Money()
	Earn(100000000);
end

---Thiªn Khiªu LÖnh
function getTianJiaoLing()
	AddItem(2,97,236,999)
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

---Håi thÓ lùc
function getTiLi()
	RestoreStamina()
	PlaySound("\\sound\\sound_i016.wav");
	SetCurrentNpcSFX(PIdx2NpcIdx(),905,0,0)
end

--Ên chuyÓn sinh
function Get_An()
	if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
		return 0;
	end
    AddItem(2, 0, 30002, 1 ,1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Long tö Ên");
	AddItem(2, 0, 30005, 1, 1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Phông tö Ên");
	AddItem(2, 0, 30003, 1, 1);
	WriteLogEx("Get_An","NhËn Ên:", 100, "Hæ tö Ên");
	AddItem(2, 0, 30006, 1, 1);	
	WriteLogEx("Get_An","NhËn Ên:", 100, "¦ng tö Ên");
    AddItem(2, 0, 30001, 1, 1);	
	WriteLogEx("Get_An","NhËn Ên:", 100, "Tö Ên");
end

--CHUC NANG KHAC
function Get_Orther()
	local szSay = {
		g_szTitle.."Lùa chän",
		"Th¨ng ChuyÓn Sinh 7 cÊp 99/UpSuper",
		"Thao t¸c MËt TÞch/Get_Book",
		"Thao t¸c Kinh M¹ch/GetJingMai",
		"Thao t¸c Thó C­ng/Pet_OP",
		"Thao t¸c Bang Héi/TongOperation",
		"Thao t¸c Vò KhÝ/PS_VK",
		"LuyÖn max skill trÊn ph¸i/maxtranphai",
		"Thay ®æi hÖ ph¸i kh¸c/JoinRoute_UpdateLevel",
		"\nRa khái/nothing",
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
		g_szTitle.."H·y lùa chän hiÖu øng vò khÝ!",
		"ThiÕt Cèt/PS_1",
		"B¸ch ChiÕn/PS_2",
		"Ch­íc NhËt/PS_3",
		"TuÊn DËt/PS_4",
		"§µo Lý/PS_5",
		"Danh Tóc/PS_6",
		"L¹c Hµ/PS_7",
		"L¨ng Tiªu/PS_8",
		"PhÇn V©n/PS_9",
		"§o¹n Giao/PS_10",
		"C¸i ThÕ/PS_11",
		"Ph¸ Qu©n/PS_12",
		"Hµo m«n/PS_13",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

function PS_1()
	BindWeaponEffect("ThiÕt Cèt",1)	
end
function PS_2()
	BindWeaponEffect("B¸ch ChiÕn",1)	
end
function PS_3()
	BindWeaponEffect("Ch­íc NhËt",1)	
end
function PS_4()
	BindWeaponEffect("TuÊn DËt",1)	
end
function PS_5()
	BindWeaponEffect("§µo Lý",1)	
end
function PS_6()
	BindWeaponEffect("Danh Tóc",1)	
end
function PS_7()
	BindWeaponEffect("L¹c Hµ",1)	
end
function PS_8()
	BindWeaponEffect("L¨ng Tiªu",1)	
end
function PS_9()
	BindWeaponEffect("PhÇn V©n",1)	
end
function PS_10()
	BindWeaponEffect("§o¹n Giao",1)	
end
function PS_11()
	BindWeaponEffect("C¸i ThÕ",1)	
end
function PS_12()
	BindWeaponEffect("Ph¸ Qu©n",1)	
end
function PS_13()
	BindWeaponEffect("Hµo m«n",1)	
end

--Pet
function Pet_OP()
	local tSay = {}
	if GetSkillLevel(30149) == 0 then
		tinsert(tSay, format("%s/activePet", "KÝch ho¹t phôc sinh thó c­ng"))
	end
	tinsert(tSay, format("%s/getPetEgg", "NhËn Trøng Thó C­ng"))
	tinsert(tSay, format("%s/getLingLi", "NhËn ®iÓm linh lùc"))
	tinsert(tSay, "\nRa khái/nothing");
	Say(g_szTitle.."Ng­¬i cÇn gióp ®ì g×?", getn(tSay), tSay);
end

function activePet()
	local nId = 30149
	if GetSkillLevel(nId) == 0 then
		LearnSkill(nId)
		for i = 1,4 do
			LevelUpSkill(nId)
		end
		
		Msg2Player("§· häc Gi¸ng Linh ThuËt cÊp 5");
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
		Msg2Player(format("NhËn thµnh c«ng %d linh lùc", nAdd))
	end
end

--Gia nhËp Ph¸i
function JoinRoute_UpdateLevel()
	local tMenu = {
		"ThiÕu L©m/join_sl",
		"Vâ §ang/join_wd",
		"Nga My/join_em",
		"C¸i Bang/join_gb",
		"§­êng M«n/join_tm",
		"D­¬ng M«n/join_ym",
		"Ngò §éc/join_wdu",
		"C«n L«n/join_kl",
		"Thóy Yªn/join_cy",
		"Minh Gi¸o/join_mgb",
		"\nRa khái/nothing",
	};
	Say("Ng­¬i muèn gia nhËp l­u ph¸i g×?", getn(tMenu), tMenu);
end

function join_mgb()
	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"Minh Gi¸o Th¸nh ChiÕn/#enter_mp(25)",
		"Minh Gi¸o TrËn Binh/#enter_mp(26)",
		"Minh Gi¸o HuyÕt Nh©n/#enter_mp(27)",
		"\nRa khái/nothing",
	};

	SelectSay(szSay);
end;

function join_sl()
	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"ThiÕu L©m vâ t«ng/#enter_mp(4)",
		"ThiÕu L©m thiÒn t«ng/#enter_mp(3)",
		"ThiÕu L©m tôc gia/#enter_mp(2)",
		"\nRa khái/nothing",
	};

	SelectSay(szSay);
end;

function join_wd()

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"Vâ §ang ®¹o gia/#enter_mp(14)",
		"Vâ §ang tôc gia/#enter_mp(15)",
		"\nRa khái/nothing",
	};

	SelectSay(szSay);
end;

function join_em()
	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"Nga My phËt gia/#enter_mp(8)",
		"Nga My tôc gia/#enter_mp(9)",
		"\nRa khái/nothing",
	};

	SelectSay(szSay);
end;

function join_gb()

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"C¸i Bang TÜnh y/#enter_mp(11)",
		"C¸i Bang ¤ Y/#enter_mp(12)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end;

function join_tm()

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"§­êng M«n Ch©m/#enter_mp(6)",
		"§­êng M«n NhËm HiÖp/#enter_mp(31)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end;

function join_ym()

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"D­¬ng M«n th­¬ng Kþ/#enter_mp(17)",
		"D­¬ng M«n Cung Kþ/#enter_mp(18)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end;

function join_wdu()

	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"HiÖp §éc/#enter_mp(20)",
		"Tµ §éc/#enter_mp(21)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end;

function join_kl()
	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"C«n L«n Thiªn S­/#enter_mp(23)",
		"C«n L«n KiÕm T«n/#enter_mp(32)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end;

function join_cy()
	local szSay = {
		g_szTitle.."Ng­¬i muèn gia nhËp l­u ph¸i g×?",
		"Thóy Yªn Vò Tiªn/#enter_mp(29)",
		"Thóy Yªn Linh N÷/#enter_mp(30)",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end;

function enter_mp(nRoute)
	local nBegin = 0;
	local nEnd = 0;
	local nBody = GetBody(); --1=Õý³£ÄÐ£¬2=¿ýÎàÄÐ£¬3=ÐÔ¸ÐÅ®£¬4=½¿Ð¡Å®

	SetPlayerRoute(nRoute);						--ÉèÖÃÁ÷ÅÉ

	if nRoute == 2 then						--ÉÙÁÖË×¼Ò
		LearnSkill(3);
		LearnSkill(5);
		LearnSkill(32);
		nBegin = 21;
		nEnd = 31;
	elseif nRoute == 3 then					--ÉÙÁÖìøÉ®
		LearnSkill(6);
		LearnSkill(57);
		nBegin = 45;
		nEnd = 56;
	elseif nRoute == 4 then					--ÉÙÁÖÎäÉ®
		LearnSkill(2);
		LearnSkill(44);
		nBegin = 33;
		nEnd = 43;
	elseif nRoute == 14 then					--Îäµ±µÀ¼Ò
		LearnSkill(4);
		LearnSkill(146);
		nBegin = 125;
		nEnd = 145;
	elseif nRoute == 15 then					--Îäµ±Ë×¼Ò
		LearnSkill(5);
		LearnSkill(159);
		nBegin = 147;
		nEnd = 158;
	elseif nRoute == 8 then					--¶ëáÒ·ð¼Ò
		LearnSkill(4);
		LearnSkill(89);
		nBegin = 75
		nEnd = 88;
	elseif nRoute == 9 then					--¶ëáÒË×¼Ò
		LearnSkill(10);
		LearnSkill(102);
		nBegin = 90
		nEnd = 101;
	elseif nRoute == 11 then					--Ø¤°ï¾»ÒÂ
		LearnSkill(2);
		LearnSkill(113);
		nBegin = 103
		nEnd = 112;
	elseif nRoute == 12 then					--Ø¤°ïÎÛÒÂ
		LearnSkill(5);
		LearnSkill(124);
		nBegin = 114
		nEnd = 123;
	elseif nRoute == 6 then					--ÌÆÃÅ
		LearnSkill(7);
		LearnSkill(74);
		nBegin = 58
		nEnd = 73;
	elseif nRoute == 17 then					--ÑîÃÅÇ¹Æï
		LearnSkill(11);
		LearnSkill(732);
		nBegin = 720;
		nEnd = 731;
	elseif nRoute == 18 then					--ÑîÃÅ¹­Æï
		LearnSkill(12);
		LearnSkill(745);
		nBegin = 733;
		nEnd = 744;
	elseif nRoute == 20 then					--Îå¶¾Ð°ÏÀ
		LearnSkill(13);
		LearnSkill(775);
		nBegin = 364;
		nEnd = 377;
	elseif nRoute == 21 then					--Îå¶¾¹ÆÊ¦
		LearnSkill(14);
		LearnSkill(774);
		nBegin = 347;
		nEnd = 363;
	elseif nRoute == 23 then					--À¥ÂØÌìÊ¦
		LearnSkill(4);
		LearnSkill(1032);
		nBegin = 1017 ;
		nEnd = 1031;
	elseif nRoute == 25 then					--Ã÷½ÌÊ¥Õ½
		LearnSkill(3);
		LearnSkill(1066);
		nBegin = 1053 ;
		nEnd = 1065;
	elseif nRoute == 26 then					--Ã÷½ÌÕó±ø
		LearnSkill(8);
		LearnSkill(1096);
		nBegin = 1083 ;
		nEnd = 1095;
	elseif nRoute == 27 then					--Ã÷½ÌÑªÈË
		LearnSkill(14);
		LearnSkill(1213);
		nBegin = 1131 ;
		nEnd = 1143;
	elseif nRoute == 29 then					--´äÑÌÎèÏÉ
		LearnSkill(15);
		LearnSkill(1196);
		nBegin = 1165 ;
		nEnd = 1176;
	elseif nRoute == 30 then					--´äÑÌÁéÅ®
		LearnSkill(16);
		LearnSkill(1230);
		nBegin = 1217 ;
		nEnd = 1229;
	elseif nRoute == 31 then					--´äÑÌÎèÏÉ
		LearnSkill(17);
		LearnSkill(1883);
		nBegin = 1872 ;
		nEnd = 1882;
	elseif nRoute == 32 then					--´äÑÌÁéÅ®
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
	Msg2Player("Gia nhËp m«n ph¸i thµnh c«ng")
	Msg2Player("B¹n nhËn ®­îc 9,999,999 Kim PhiÕu hç trî phiªu l­u !!! Loli iz da bezt")
	Talk(1,"","Gia nhËp m«n ph¸i thµnh c«ng")
end

function UpSuper()
	PlayerReborn(2, random(4));			--ChuyÓn sinh
	SetLevel(99, 1);								--CÊp
	ModifyExp(2000000000);
	ModifyReputation(1000000,0);			--Danh väng
	SetTask(336, 1000000);  --S­ M«n
	SetTask(704, 6)  --Nguyªn So¸i
	SetTask(701, 5000000); --C«ng tr¹ng
	gf_SetTaskByte(1538, 1, 5);
	--ModifyJinJuan(9999999,1); --Kim PhiÕu
	
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
		g_szTitle.."NhËn L­u Ph¸i Ch©n QuyÓn vµ QuyÕt YÕu!",
		"NhËn Ch©n QuyÓn/Get_Book_ZhenJuan",
		"NhËn QuyÕt YÕu/Get_Book_JueYao",
		"Th¨ng cÊp mËt tÞch ®· trang bÞ/Get_Book_Update",
		"T¨ng chØ sè lªn 250%/Get_250book",
		"\nRa khái/nothing",
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
	
	gf_AddItemEx({0,112,158,1,4}, "L¨ng Ba Vi Bé toµn tËp");
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
		gf_AddItemEx({2, 6, i, 1, 4}, "QuyÕt YÕu");
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
	szSay[getn(szSay) + 1] = "NhËn TiÓu §iªu/Give_XiaoDiao";
	szSay[getn(szSay) + 1] = "Nu«i TiÓu §iªu/Give_XiaoDiaoFood";
	szSay[getn(szSay) + 1] = "HuÊn luyÖn TiÓu §iªu/Feed_XiaoDiao";
	szSay[getn(szSay) + 1] = "\nRa khái/nothing";
	Say(g_szTitle.."TiÓu §iªu thao t¸c.", getn(szSay), szSay)
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
		Msg2Player("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!");
		return
	end;
	local ItemGen, ItemDetail, ItemParticular = GetItemInfoByIndex(nPetItemIndex);
	if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil)
		or (ItemGen ~= 2 or ItemDetail ~= 20)
	then
		Msg2Player("C¸c h¹ ch­a cã thó c­ng, kh«ng thÓ tiÕn hµnh huÊn luyÖn!");
		return
	end

	for i = 1, 99 do
		LevelUpPet(nPetItemIndex)
	end
end


--Xoa Kho Do
function ClearBagAllItem(bTag)
	if not bTag or tonumber(bTag) ~= 1 then
		Say(g_szTitle.."Ng­¬i muèn thanh lý tói?", 2, "§ång ý/#ClearBagAllItem(1)", "Ra khái/nothing")
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
		g_szTitle.."Thao t¸c bang héi",
		"Ta muèn nhËn vËt phÈm bang héi/TongOperation_Create",
		"Ta muèn t¹o bang héi/CreateTongDialog",
		"Ta muèn th¨ng cÊp bang héi/TongOperation_update",
		"\nRa khái/nothing",
	};
	SelectSay(szSay);
end

function TongOperation_Create()
	if IsTongMember() ~= 0 then
		Talk(1,"","Ng­¬i ®· cã bang héi");
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
		g_szTitle.."Thao th¸c kinh m¹ch",
		"TÈy ®iÓm kinh m¹ch/GetJingMai_Reset",
		format("%s/getZhenqi", "NhËn ch©n khÝ"),
		format("%s/getJingMaiTongRen", "NhËn Kinh M¹ch §ång Nh©n"),
		"\nRa khái/nothing",
	};
	if MeridianGetLevel() < 6 then
		tinsert(szSay, 2, "Th¨ng cÊp c¶nh giíi Vâ Th¸nh/GetJingMai_Update")
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
		Say(g_szTitle.."Thao th¸c kinh m¹ch", 2,"§ång ý/#GetJingMai_Reset(1)", "Hñy bá/nothing")
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
