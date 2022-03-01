-- The Tan Thu
-- Created by Peter Meow
Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\task\\world\\task_head.lua")
Include("\\script\\system_switch_config.lua")
Include("\\settings\\static_script\\cheat\\gm_item_tifuzhiyin.lua");
Include("\\settings\\static_script\\cheat\\task\\list.lua");
Include("\\script\\lib\\globalfunctions.lua");

g_szTitle = "<color=green>Peter Meow:<color>"

function OnUse(nItem)
    if 1 ~= IsExpSvrSystemOpen() then
        return
    end

    local tSay = {}
    local nRoute = GetPlayerRoute();
    if nRoute <= 0 then
        tSay = {
            "Gia Nh�p m�n ph�i (Chuy�n sinh 0 c�p 90)/JoinRoute_UpdateLevel",
            format("%s/UpdateLevel_55", "\nT�ng Chuy�n sinh 0 c�p 55"),
            format("%s/Get_DuoiTho", "\nNh�n �u�i Th�")
        }
    else
        tSay = {
            ----------------------------------------
            "++ Nh�p Giftcode\n/Enter_Giftcode",
            ----------------------------------------
            "Chuy�n sinh/player_chuyen_sinh",
            ----------------------------------------
            "\nNh�n M�t t�ch v� y�u quy�t/Get_Book",
            ----------------------------------------
            format("%s/Get_TB", "Nh�n trang b�"), -- trang bi
            format("%s/Get_HoTroDauGame", "Nh�n h� tr� ��u game"), -- ho tro nhan vat
            format("%s/GetJingMai", "Thao t�c kinh m�ch"), -- kinh mach
            format("%s/Get_VP", "Nh�n v�t ph�m"), -- vat pham
            format("%s/Get_NL", "Nh�n nguy�n li�u"), -- nguyen lieu 
            format("%s/Get_VPNV", "Nh�n v�t ph�m nhi�m v�"), -- vat pham nhiem vu   
            format("%s/Get_QuanHam", "Nh�n Qu�n h�m"), -- Qu�n h�m
            format("%s/Get_Danh_Hieu", "Nh�n danh hi�u"), -- danh hieu
            format("%s/TongOperation", "Bang h�i"), -- bang hoi
            format("%s/Pet_OP", "Ph�c sinh Th� C�ng") -- thu nuoi
        }
        if 3 == nRoute then
            tinsert(tSay,
                "Nh�n Thi�n Ph�t Ch�u v� Ph�c Ma Ch�/Give_ZhuzhuZhouzhou")
        end
        if 6 == nRoute then
            tinsert(tSay, "Nh�n �m kh� v� c� quan/Give_JiguanAnqi")
        end
        if 8 == nRoute then
            tinsert(tSay, "Nh�n X� l�i kim ��n/Give_Dandan")
        end
        if 17 == nRoute then
            tinsert(tSay, "Nh�n chi�n m�/Give_ZhanMa")
        end
        if 18 == nRoute then
            tinsert(tSay, "Nh�n chi�n m� v� t�n/Give_Jiancu")
        end
        if 20 == nRoute then
            tinsert(tSay, "Nh�n Phong Thi Ph�/Give_Fengshifu")
        end
        if 21 == nRoute then
            tinsert(tSay, "Nh�n h� tr� ph�i/Give_GuGu")
        end
        if 30 == nRoute then
            tinsert(tSay, "Nh�n �i�u/ling_nv_xiaodiao")
        end
    end
    tinsert(tSay, "\nThanh l� t�i/ClearBagAllItem");
    tinsert(tSay, "\nExit/nothing");
    Say(g_szTitle .. "What do you want?", getn(tSay), tSay);
end
function Enter_Giftcode()
    AskClientForString("CODECHECK1", "", 1, 9999, "Nh�p GiftCode")
end
function CODECHECK1(nVar)
    -- local danhan = GetTask(3005)
    -- local danhan = 0
    if nVar == 'linhdeptrai' then
        Msg2Player("999 Tr�i Cam")
        if gf_Judge_Room_Weight(28, 100, " ") ~= 1 then
            return 0;
        end
        AddItem(2, 1, 30166, 999)
        SetTask(3005, 1)
    elseif nVar == "maxtp" then
        Maxtranphai()
    else
        Talk(1, "", "Giftcode sai!")
    end

    -- elseif danhan == 1 then
    --     Talk(1, "",
    --         "B¹n �� nhËn GiftCode nµy råi. Vui lßng kh«ng nhËn l¹i")
    -- else
    --     Talk(1, "",
    --         "B¹n �� nhËn GiftCode nµy råi hoÆc GiftCode kh«ng tån t¹i trªn hÖ thèng")
    -- end
end
function UpdateLevel_55()
    SetLevel(55, 0)
    Say("T�ng c�p th�nh c�ng, ��ng nh�p l�i!", 1, "Exit!/go_exit")
end
-- Chuy�n sinh ----------------------------------------------------------------------------------------------------
function player_chuyen_sinh()
    local tSay = {
        "\nChuy�n sinh 7 c�p 90/player_reborn", -- chuyen sinh 7 cap 90
        "\nThay ��i h��ng Ph�c Sinh (Level 90)/change_PhucSinh", -- thay doi huong phuc sinh
        "\nNh�n l�i �n/confirm_get_translife_item" -- Nh�n l�i��n 
    }
    tinsert(tSay, "\nExit/nothing")
    Say(g_szTitle .. "Chuy�n sinh", getn(tSay), tSay)
end
-- Trang b� ----------------------------------------------------------------------------------------------------
function Get_TB()
    local tSay = {
        "Trang b� Di�u d��ng +15/Get_YaoYang_10", -------
        "Trang b� �m ch� +15/Get_JinShe", ---------
        format("%s/GetCT", "Nh�n Trang b� chi�n tr��ng +15"),
        format("%s/Process_Equip_LingTu", "Nh�n Linh �� +15"),
        format("%s/Process_SanJianTao", "Nh�n trang Kim x� ng�u nhi�n 4 sao")
    }
    tinsert(tSay, "\nExit/nothing")
    Say(g_szTitle .. "Ch�n trang b�", getn(tSay), tSay)
end
-- Hç tr� ----------------------------------------------------------------------------------------------------
function Get_HoTroDauGame()
    local tSay = {
        "Nh�n 4000 v�ng/Get_Money", --- Vang
        "Nh�n 100.000 kim phi�u/Get_Kimphieu", -- kim phieu
        "Nh�n 10.000 v�t ph�m xu/Get_VPXu", -- VP Xu
        "Nh�n 1.000.000.000 kinh nghi�m/Get_exp", -- kim nghiem
        "Nh�n DV + SM/Get_SMDV", -- su mon, danh vong
        "Nh�n CT + TLCT/Get_DiemCT", -- CT, TL
        "Nh�n tinh l�c/Get_Energy", ------ tinh luc
        format("%s/getTiLi", "Nh�n th� l�c") -- the luc        
    }
    tinsert(tSay, "\nExit/nothing")
    Say(g_szTitle .. "Nh�n h� tr� ��u game", getn(tSay), tSay)
end
--- VËt ph�m ----------------------------------------------------------------------------------------------------
function Get_VP()
    local tSay = {
        "Nh�n Th�nh h�nh b�o �i�n/Get_Thanhanh", -- than hanh 
        "Nh�n D��c ph�m th��ng/Get_DuocPham", -- duoc pham  
        "Nh�n D��c ph�m x�n/Get_DuocPham2", -- duoc pham xÞn 
        "Nh�n QCVD/Get_QCVD", -- QCVD
        "Nh�n ��u h�n/Get_DauHon", -- dau hon 
        "Nh�n Th� c��i/Get_ThuCuoi" -- thu cuoi
    }
    tinsert(tSay, "\nExit/nothing")
    Say(g_szTitle .. "Ch�n v�t ph�m", getn(tSay), tSay)
end
-- danh hi�u ----------------------------------------------------------------------------------------------------
function Get_Danh_Hieu()
    local tSay = {
        "Nh�n danh hi�u Du Hiep/Get_DuHiep", -- du hiep  
        "Nh�n danh hi�u Ung Duong/Get_UngDuong", -- ung duong
        "Nh�n danh hi�u Chien Cuong/Get_ChienCuong", -- chien cuong
        "Nh�n danh hi�u VLBHS/Get_VLBHS", -- vo lam bach hieu sinh
        "Nh�n danh hi�u Ngao the vo song/Get_NgaoTheVoSong", -- ngao the vo song
        "Nh�n danh hi�u Ba Vuong/Get_BaVuong", -- ba vuong
        "Nh�n danh hi�u Dai Hiep/Get_DaiHiep", -- dai hiep 
        "Nh�n danh hi�u Tinh Anh DoGet_TinhAnhDo", -- tinh anh do
        "Nh�n danh hi�u Tinh Anh Tim/Get_TinhAnhTim", -- tinh anh tim
        "Nh�n danh hi�u bang/Get_DHB", -- danh hieu bang    
        "Nh�n danh hi�u NEW/Get_DHNew", -- danh hieu moi   
        "------------------------------/nothing", -- danh hieu moi   
        "\nNh�n tat ca danh hieu/Get_AllDH" -- nhan het danh hieu
    };
    tinsert(tSay, "\nExit/nothing")
    Say(g_szTitle .. "Ch�n danh hi�u", getn(tSay), tSay)
end
function Get_AllDH()
    Get_DHNew()
    Get_DHB()
    Get_TinhAnhDo()
    Get_TinhAnhTim()
    Get_DuHiep()
    Get_UngDuong()
    Get_ChienCuong()
    Get_VLBHS()
    Get_NgaoTheVoSong()
    Get_BaVuong()
    Get_DaiHiep()
end
function Get_DHB()
    AddTitle(69, 1)
    AddTitle(69, 2)
    AddTitle(72, 10)
    SetCurTitle(69, 2)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u bang h�i");
    PlaySound("\\sound\\sound_i017.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 912, 0, 0)
end
function Get_DHNew()
    AddTitle(70, 1)
    AddTitle(74, 1)
    AddTitle(74, 2)
    AddTitle(74, 3)
    AddTitle(75, 1)
    AddTitle(75, 2)
    SetCurTitle(75, 2)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u NEW");
    PlaySound("\\sound\\sound_i017.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 912, 0, 0)
end
function Get_DuHiep()
    AddTitle(65, 1)
    SetCurTitle(65, 1)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u Du Hiep");
    PlaySound("\\sound\\sound_i017.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 912, 0, 0)
end
function Get_UngDuong()
    AddTitle(65, 2)
    SetCurTitle(65, 2)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u Ung Duong");
    PlaySound("\\sound\\sound_i017.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 912, 0, 0)
end
function Get_ChienCuong()
    AddTitle(65, 3)
    SetCurTitle(65, 3)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u Chien Cuong");
    PlaySound("\\sound\\sound_i017.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 912, 0, 0)
end
function Get_VLBHS()
    AddTitle(63, 1)
    SetCurTitle(63, 1)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u VLBHS");
    PlaySound("\\sound\\sound_i017.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 912, 0, 0)
end
function Get_BaVuong()
    AddTitle(66, 1)
    SetCurTitle(66, 1)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u Ba Vuong");
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 913, 0, 0)
end
function Get_DaiHiep()
    AddTitle(66, 2)
    SetCurTitle(66, 2)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u Dai Hiep");
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 913, 0, 0)
end
function Get_TinhAnhDo()
    AddTitle(66, 3)
    SetCurTitle(66, 3)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u TAD");
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 913, 0, 0)
end
function Get_TinhAnhTim()
    AddTitle(66, 4)
    SetCurTitle(66, 4)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u TAT");
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 913, 0, 0)
end
function Get_NgaoTheVoSong()
    AddTitle(61, 7)
    SetCurTitle(61, 7)
    Msg2SubWorld("Ch�c m�ng b�n nh�n ���c danh hi�u NTVS");
    PlaySound("\\sound\\sound_i017.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 912, 0, 0)
end
function Get_NL()
    local tSay = {
        "Nh�n nguy�n li�u c��ng ho�/Get_Enhance", -- nguyen lieu cuong hoa
        "Nh�n �� qu�/Get_Gem", -- nhan da quy
        "Nh�n TCL + TMKL/Get_TCL_TMKL", --- TCL TMKL
        "Nh�n TKL/getTianJiaoLing", --- TKL
        "Ky nang s�ng/Life_Skill" -- lifeskill
    }
    tinsert(tSay, "\nExit/nothing")
    Say(g_szTitle .. "Ch�n nguy�n li�u", getn(tSay), tSay)
end
function Get_TCL_TMKL()
    AddItem(2, 95, 204, 99) -- TCL
    AddItem(2, 1, 30370, 99) -- TMKL
end
function Get_VPNV()
    local tSay = {
        "10 �u�i Th�/Get_DuoiTho" -- Duoi tho
    }
    tinsert(tSay, "\nExit/nothing")
    Say(g_szTitle .. "Ch�n v�t ph�m nhi�m v�", getn(tSay), tSay)
end
function Get_DuoiTho()
    AddItem(2, 1, 2, 10)
end
function Get_QuanHam()
    local tSay = {
        "\nT�ng Nguy�n So�i/Get_QuanHamTongNS", -- tong nguyen soai
        "\nT�ng ��i T��ng/Get_QuanHamTongTQ", -- tong tuong quan
        "\nLi�u Nguy�n So�i/Get_QuanHamLieuNS", -- lieu nguyen soai
        "\nLi�u ��i T��ng/Get_QuanHamLieuTQ" -- lieu tuong quan
    }
    tinsert(tSay, "\nExit/nothing")
    Say(g_szTitle .. "Nh�n Qu�n h�m", getn(tSay), tSay)
end
function Get_QuanHamTongNS()
    SetTask(701, 250000)
    SetTask(702, 250000)
    SetTask(704, 6)
    SetTask(745, 6)
    Msg2SubWorld("Qu�n h�m T�ng Nguy�n So�i")
end
function Get_QuanHamLieuNS()
    SetTask(701, -250000)
    SetTask(703, 250000)
    SetTask(704, -6)
    SetTask(746, -6)
    Msg2SubWorld("Qu�n h�m Li�u Nguy�n So�i")
end
function Get_QuanHamTongTQ()
    SetTask(701, 200000)
    SetTask(702, 200000)
    SetTask(704, 5)
    SetTask(745, 5)
    Msg2SubWorld("Qu�n h�m T�ng ��i T��ng")
end
function Get_QuanHamLieuTQ()
    SetTask(701, -200000)
    SetTask(703, 200000)
    SetTask(704, -5)
    SetTask(746, -5)
    Msg2SubWorld("Qu�n h�m Li�u ��i T��ng")
end
function getTianJiaoLing()
    AddItem(2, 97, 236, 100)
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end
function getTiLi()
    RestoreStamina()
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end
function Pet_OP()
    local tSay = {}
    if GetSkillLevel(30149) == 0 then
        tinsert(tSay, format("%s/activePet", "Ph�c sinh Ph�c sinh Th� C�ng"))
    end
    tinsert(tSay, format("%s/getPetEgg", "Nh�n Tr�ng Th� C�ng"))
    tinsert(tSay, format("%s/getLingLi", "Nh�n �i�m linh l�c"))
    tinsert(tSay, "Exit/nothing");
    Say(g_szTitle .. "What do you want?", getn(tSay), tSay);
end

function activePet()
    local nId = 30149
    if GetSkillLevel(nId) == 0 then
        LearnSkill(nId)
        for i = 1, 4 do
            LevelUpSkill(nId)
        end

        Msg2Player("Th� c�ng c�p 5");
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    end
end

function Process_SanJianTao()
    if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
        return 0;
    end
    for i = 26, 28 do
        local pifeng, pIndex = AddItem(0, 154, i, 1, 1, -1, -1, -1, -1, -1, -1,
            0, 15)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, i, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, 15)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 152, i, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            15)
        FeedItem(xIndex, 1000000)
    end
end

function getPetEgg()
    AddItem(2, 1, 30601, 10)
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function getLingLi()
    local nAdd = 10000
    local nTask = 1535
    local nCur = GetTask(nTask) / 100
    if nCur < 1000000 then
        nCur = nCur + nAdd
        SetTask(nTask, nCur * 100)
        Msg2Player(format("Nh�n %d linh l�c", nAdd))
    end
end

function Process_Equip_LingTu()
    if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
        return 0;
    end
    for i = 30221, 30222 do
        AddItem(0, 102, i, 1, 1, -1, -1, -1, -1, -1, -1, 1)
    end
    local nRoute = GetPlayerRoute();
    local nBody = GetBody();
    if nRoute == 2 then
        AddItem(0, 3, 30207, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 3 then
        AddItem(0, 8, 30208, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 4 then
        AddItem(0, 0, 30209, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 6 then
        AddItem(0, 1, 30210, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 8 then
        AddItem(0, 2, 30211, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 9 then
        AddItem(0, 10, 30212, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 11 then
        AddItem(0, 0, 30213, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 12 then
        AddItem(0, 5, 30214, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 14 then
        AddItem(0, 2, 30215, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 15 then
        AddItem(0, 9, 30216, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 17 then
        AddItem(0, 6, 30217, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 18 then
        AddItem(0, 4, 30218, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 20 then
        AddItem(0, 7, 30219, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 21 then
        AddItem(0, 11, 30220, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 23 then
        AddItem(0, 2, 30221, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 29 then
        AddItem(0, 13, 30222, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nRoute == 30 then
        AddItem(0, 12, 30223, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nBody == 1 then
        AddItem(0, 101, 30235, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 101, 30239, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 101, 30243, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 100, 30235, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 103, 30235, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nBody == 2 then
        AddItem(0, 101, 30236, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 101, 30240, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 101, 30244, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 100, 30236, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 103, 30236, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nBody == 3 then
        AddItem(0, 101, 30237, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 101, 30241, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 101, 30245, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 100, 30237, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 103, 30237, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
    if nBody == 4 then
        AddItem(0, 101, 30238, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 101, 30242, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 101, 30246, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 100, 30238, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
        AddItem(0, 103, 30238, 1, 1, -1, -1, -1, -1, -1, -1, -1, 15)
    end
end

function JoinRoute_UpdateLevel()
    if GetPlayerFaction() ~= 0 then
        Talk(1, "", format("�� gia Nh�p m�n ph�i"));
        return 0;
    end
    local tMenu = {
        "Thieu lam/join_sl", --
        "Vo dang/join_wd", --
        "Nga my/join_em", --
        "Cai bang/join_gb", --
        "���ng M�n/join_tm", --
        "D��ng Gia/join_ym", --
        "Ngu doc/join_wdu", --
        "Con lon/join_kl", --
        "Thuy yen/join_cy", --
        "Exit/nothing"
    };
    Say("Ch�n ph�i?", getn(tMenu), tMenu);
end

--------------------------------------------------Ñ¡ÔñÃÅÅÉ¿ªÊ¼--------------------------------------
function join_sl()
    if GetSex() == 2 then
        Say(g_szTitle .. "Nam", 0);
        return
    end

    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "Thieu lam vo tong/#enter_mp(4)",
        "Thieu lam thien tong/#enter_mp(3)", "Thieu lam tuc gia/#enter_mp(2)", --
        "Exit/nothing"
    };

    SelectSay(szSay);
end

function join_wd()
    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "Vo dang kiem/#enter_mp(14)",
        "Vo dang but/#enter_mp(15)", --
        "Exit/nothing"
    };

    SelectSay(szSay);
end

function join_em()
    if GetSex() == 1 then
        Say(g_szTitle .. "Nu", 0);
        return
    end

    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "Nga My ki�m/#enter_mp(8)",
        "Nga My ��n/#enter_mp(9)", "Exit/nothing"
    };

    SelectSay(szSay);
end

function join_gb()
    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "C�i bang quy�n/#enter_mp(11)",
        "C�i bang O Y/#enter_mp(12)", --
        "Exit/nothing"
    };
    SelectSay(szSay);
end

function join_tm()
    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "���ng M�n/#enter_mp(6)", "Exit/nothing"
    };
    SelectSay(szSay);
end

function join_ym()
    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "Duong Gia Thuong/#enter_mp(17)",
        "Duong Gia Cung/#enter_mp(18)", "Exit/nothing"
    };
    SelectSay(szSay);
end

function join_wdu()
    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "Hiep doc/#enter_mp(20)", "Ta doc/#enter_mp(21)",
        "Exit/nothing"
    };
    SelectSay(szSay);
end

function join_kl()
    if GetSex() == 2 then
        Talk(1, "", "Nam");
        return 0
    end

    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "Con lon thien su/#enter_mp(23)", "Exit/nothing"
    };
    SelectSay(szSay);
end

function join_cy()
    if GetSex() == 1 then
        Talk(1, "", "Nu");
        return 0
    end

    if GetPlayerFaction() ~= 0 then
        return
    end

    local szSay = {
        g_szTitle .. "Ch�n", "Thuy yen vu tien/#enter_mp(29)",
        "Thuy yen linh nu/#enter_mp(30)", "Exit/nothing"
    };
    SelectSay(szSay);
end

-----------------------------------------ÈëÃÅÅÉ----------------------------------------
function enter_mp(nRoute)
    local nBegin = 0;
    local nEnd = 0;
    local nBody = GetBody(); -- nam hay nu

    SetPlayerRoute(nRoute); -- ÉèÖÃÝ÷ÅÉ

    if nRoute == 2 then -- ÉÙÝÖË×¼Ò
        LearnSkill(3);
        LearnSkill(5);
        LearnSkill(32);
        nBegin = 21;
        nEnd = 31;
    elseif nRoute == 3 then -- ÉÙÝÖìøÉ®
        LearnSkill(6);
        LearnSkill(57);
        nBegin = 45;
        nEnd = 56;
    elseif nRoute == 4 then -- ÉÙÝÖÎäÉ®
        LearnSkill(2);
        LearnSkill(44);
        nBegin = 33;
        nEnd = 43;
    elseif nRoute == 14 then -- Îäµ±µÀ¼Ò
        LearnSkill(4);
        LearnSkill(146);
        nBegin = 125;
        nEnd = 145;
    elseif nRoute == 15 then -- Îäµ±Ë×¼Ò
        LearnSkill(5);
        LearnSkill(159);
        nBegin = 147;
        nEnd = 158;
    elseif nRoute == 8 then -- ¶ëáÒ·ð¼Ò
        LearnSkill(4);
        LearnSkill(89);
        nBegin = 75
        nEnd = 88;
    elseif nRoute == 9 then -- ¶ëáÒË×¼Ò
        LearnSkill(10);
        LearnSkill(102);
        nBegin = 90
        nEnd = 101;
    elseif nRoute == 11 then -- Ø¤°ï¾»ÒÂ
        LearnSkill(2);
        LearnSkill(113);
        nBegin = 103
        nEnd = 112;
    elseif nRoute == 12 then -- Ø¤°ïÎÛÒÂ
        LearnSkill(5);
        LearnSkill(124);
        nBegin = 114
        nEnd = 123;
    elseif nRoute == 6 then -- ÌÆÃÅ
        LearnSkill(7);
        LearnSkill(74);
        nBegin = 58
        nEnd = 73;
    elseif nRoute == 17 then -- ÑîÃÅÇ¹Æï
        LearnSkill(11);
        LearnSkill(732);
        nBegin = 720;
        nEnd = 731;
    elseif nRoute == 18 then -- ÑîÃÅ¹­Æï
        LearnSkill(12);
        LearnSkill(745);
        nBegin = 733;
        nEnd = 744;
    elseif nRoute == 20 then -- Îå¶¾Ý°ÝÀ
        LearnSkill(13);
        LearnSkill(775);
        nBegin = 364;
        nEnd = 377;
    elseif nRoute == 21 then -- Îå¶¾¹ÆÊ¦
        LearnSkill(14);
        LearnSkill(774);
        nBegin = 347;
        nEnd = 363;
    elseif nRoute == 23 then -- À¥ÂØÌìÊ¦
        LearnSkill(4);
        LearnSkill(1032);
        nBegin = 1017;
        nEnd = 1031;
    elseif nRoute == 25 then -- Ã÷½ÌÊ¥Õ½
        LearnSkill(3);
        LearnSkill(1066);
        nBegin = 1053;
        nEnd = 1065;
    elseif nRoute == 26 then -- Ã÷½ÌÕó±ø
        LearnSkill(8);
        LearnSkill(1096);
        nBegin = 1083;
        nEnd = 1095;
    elseif nRoute == 27 then -- Ã÷½ÌÑªÈË
        LearnSkill(14);
        LearnSkill(1213);
        nBegin = 1131;
        nEnd = 1143;
    elseif nRoute == 29 then -- ´äÑÌÎèÝÉ
        LearnSkill(15);
        LearnSkill(1196);
        nBegin = 1165;
        nEnd = 1176;
    elseif nRoute == 30 then -- ´äÑÌÝéÅ®
        LearnSkill(16);
        LearnSkill(1230);
        nBegin = 1217;
        nEnd = 1229;
    else
        return
    end

    LearnSkill(20);

    for i = nBegin, nEnd do
        LearnSkill(i);
        while LevelUpSkill(i) == 1 do
        end
    end

    ----------------------------ÉèÖÃÊýÖµ------------
    -- SetTask(336, 20000);				--ÉèÖÃÊ¦ÃÅ¹±Ý×¶È
    -- ModifyReputation(2000, 0);			--ÉèÖÃÉùÝû
    -- PlayerReborn(1, random(4));			-- chuyÓn sinh
    -- gf_SetTaskByte(1538, 1, 5) 			--5×ª
    ResetProperty()
    SetLevel(90, 1) -- ÉèÖÃµÈ¼¶
    Maxtranphai()
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    Say("Thoat", 1, "Exit!/go_exit")
end
function Maxtranphai()
    for i = 1, 20 do

        while LevelUpSkill(1196) == 1 do

        end
        while LevelUpSkill(1096) == 1 do

        end
        while LevelUpSkill(1213) == 1 do

        end
        while LevelUpSkill(44) == 1 do

        end
        while LevelUpSkill(1066) == 1 do

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
    end
end
function Get_YaoYang_10()
    if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
        return 0;
    end
    for i = 3190, 3194 do
        AddItem(0, 102, i, 1, 1, -1, -1, -1, -1, -1, -1)
    end
    local nRoute = GetPlayerRoute();
    local nBody = GetBody();
    local nLevel = 15;
    if nRoute == 2 and nBody == 1 then
        AddItem(0, 100, 3128, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3128, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3128, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 3, 8992, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 2 and nBody == 2 then
        AddItem(0, 100, 3129, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3129, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3129, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 3, 8992, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 3 and nBody == 1 then
        AddItem(0, 100, 3132, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3132, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3132, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 8, 8994, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 3 and nBody == 2 then
        AddItem(0, 100, 3133, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3133, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3133, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 8, 8994, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 4 and nBody == 1 then
        AddItem(0, 100, 3130, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3130, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3130, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 0, 8993, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 4 and nBody == 2 then
        AddItem(0, 100, 3131, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3131, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3131, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 0, 8993, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 6 and nBody == 1 then
        AddItem(0, 100, 3134, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3134, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3134, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 1, 8995, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 6 and nBody == 2 then
        AddItem(0, 100, 3135, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3135, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3135, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 1, 8995, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 6 and nBody == 3 then
        AddItem(0, 100, 3136, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3136, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3136, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 1, 8995, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 6 and nBody == 4 then
        AddItem(0, 100, 3137, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3137, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3137, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 1, 8995, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 8 and nBody == 3 then
        AddItem(0, 100, 3138, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3138, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3138, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 2, 8996, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 8 and nBody == 4 then
        AddItem(0, 100, 3139, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3139, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3139, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 2, 8996, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 9 and nBody == 3 then
        AddItem(0, 100, 3140, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3140, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3140, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 10, 8997, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 9 and nBody == 4 then
        AddItem(0, 100, 3141, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3141, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3141, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 10, 8997, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 11 and nBody == 1 then
        AddItem(0, 100, 3142, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3142, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3142, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 0, 8998, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 11 and nBody == 2 then
        AddItem(0, 100, 3143, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3143, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3143, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 0, 8998, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 11 and nBody == 3 then
        AddItem(0, 100, 3144, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3144, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3144, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 0, 8998, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 11 and nBody == 4 then
        AddItem(0, 100, 3145, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3145, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3145, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 0, 8998, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 12 and nBody == 1 then
        AddItem(0, 100, 3146, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3146, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3146, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 5, 8999, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 12 and nBody == 2 then
        AddItem(0, 100, 3147, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3147, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3147, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 5, 8999, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 12 and nBody == 3 then
        AddItem(0, 100, 3148, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3148, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3148, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 5, 8999, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 12 and nBody == 4 then
        AddItem(0, 100, 3149, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3149, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3149, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 5, 8999, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 14 and nBody == 1 then
        AddItem(0, 100, 3150, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3150, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3150, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 2, 9000, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 14 and nBody == 2 then
        AddItem(0, 100, 3151, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3151, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3151, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 2, 9000, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 14 and nBody == 3 then
        AddItem(0, 100, 3152, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3152, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3152, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 2, 9000, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 14 and nBody == 4 then
        AddItem(0, 100, 3153, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3153, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3153, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 2, 9000, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 15 and nBody == 1 then
        AddItem(0, 100, 3154, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3154, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3154, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 9, 9001, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 15 and nBody == 2 then
        AddItem(0, 100, 3155, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3155, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3155, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 9, 9001, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 15 and nBody == 3 then
        AddItem(0, 100, 3156, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3156, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3156, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 9, 9001, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 15 and nBody == 4 then
        AddItem(0, 100, 3157, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3157, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3157, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 9, 9001, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 17 and nBody == 1 then
        AddItem(0, 100, 3158, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3158, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3158, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 6, 9002, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 17 and nBody == 2 then
        AddItem(0, 100, 3159, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3159, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3159, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 6, 9002, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 17 and nBody == 3 then
        AddItem(0, 100, 3160, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3160, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3160, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 6, 9002, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 17 and nBody == 4 then
        AddItem(0, 100, 3161, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3161, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3161, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 6, 9002, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 18 and nBody == 1 then
        AddItem(0, 100, 3162, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3162, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3162, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 4, 9003, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 18 and nBody == 2 then
        AddItem(0, 100, 3163, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3163, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3163, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 4, 9003, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 18 and nBody == 3 then
        AddItem(0, 100, 3164, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3164, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3164, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 4, 9003, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 18 and nBody == 4 then
        AddItem(0, 100, 3165, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3165, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3165, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 4, 9003, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 20 and nBody == 1 then
        AddItem(0, 100, 3166, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3166, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3166, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 7, 9004, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 20 and nBody == 2 then
        AddItem(0, 100, 3167, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3167, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3167, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 7, 9004, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 20 and nBody == 3 then
        AddItem(0, 100, 3168, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3168, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3168, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 7, 9004, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 20 and nBody == 4 then
        AddItem(0, 100, 3169, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3169, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3169, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 7, 9004, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 21 and nBody == 1 then
        AddItem(0, 100, 3170, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3170, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3170, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 11, 9005, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 21 and nBody == 2 then
        AddItem(0, 100, 3171, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3171, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3171, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 11, 9005, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 21 and nBody == 3 then
        AddItem(0, 100, 3172, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3172, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3172, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 11, 9005, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end
    if nRoute == 21 and nBody == 4 then
        AddItem(0, 100, 3173, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 101, 3173, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 103, 3173, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
        AddItem(0, 11, 9005, 1, 1, -1, -1, -1, -1, -1, -1, 1, nLevel)
    end

    if nRoute == 23 and nBody == 1 then
        AddItem(0, 100, 3174, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 101, 3174, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 103, 3174, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 2, 9006, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
    end
    if nRoute == 23 and nBody == 2 then
        AddItem(0, 100, 3175, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 101, 3175, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 103, 3175, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 2, 9006, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
    end

    if nRoute == 29 and nBody == 3 then
        AddItem(0, 100, 3188, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 101, 3188, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 103, 3188, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 13, 9010, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
    end
    if nRoute == 29 and nBody == 4 then
        AddItem(0, 100, 3189, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 101, 3189, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 103, 3189, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 13, 9010, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
    end
    if nRoute == 30 and nBody == 3 then
        AddItem(0, 100, 3190, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 101, 3190, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 103, 3190, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 12, 9011, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
    end
    if nRoute == 30 and nBody == 4 then
        AddItem(0, 100, 3191, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 101, 3191, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 103, 3191, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
        AddItem(0, 12, 9011, 1, 1, -1, -1, -1, -1, -1, -1, 0, nLevel)
    end
end

function Get_JinShe()
    if 1 ~= gf_Judge_Room_Weight(10, 1, g_szTitle) then
        return 0;
    end
    local nRoute = GetPlayerRoute();
    local nBody = GetBody();
    local nLevel = 15;
    if nRoute == 2 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 186, 164, 182, 759, 771, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 186, 164, 182, 759, 771, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 186, 164, 182, 759, 771, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 3 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 165, 182, 759, 771, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 165, 182, 759, 771, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 165, 182, 759, 771, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 4 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 165, 182, 759, 771, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 165, 182, 759, 771, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 165, 182, 759, 771, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 6 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 162, 178, 757, 754, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 162, 178, 757, 754, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 162, 178, 757, 754, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 8 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 165, 182, 759, 771, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 165, 182, 759, 771, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 165, 182, 759, 771, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 9 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 165, 182, 759, 771, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 165, 182, 759, 771, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 165, 182, 759, 771, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 11 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 183, 181, 757, 770, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 183, 181, 757, 770, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 183, 181, 757, 770, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 12 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 163, 178, 758, 754, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 163, 178, 758, 754, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 163, 178, 758, 754, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 14 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 165, 182, 759, 771, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 165, 182, 759, 771, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 165, 182, 759, 771, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 15 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 164, 178, 760, 754, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 164, 178, 760, 754, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 164, 178, 760, 754, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 17 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 183, 181, 757, 770, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 183, 181, 757, 770, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 183, 181, 757, 770, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 18 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 162, 178, 757, 754, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 162, 178, 757, 754, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 162, 178, 757, 754, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 20 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 163, 179, 758, 755, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 163, 179, 758, 755, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 163, 179, 758, 755, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 21 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 165, 180, 760, 756, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 165, 180, 760, 756, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 165, 180, 760, 756, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 23 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 165, 182, 759, 771, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 165, 182, 759, 771, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 165, 182, 759, 771, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 29 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 162, 178, 757, 754, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 162, 178, 757, 754, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 162, 178, 757, 754, 1004)
        FeedItem(xIndex, 1000000)
    end

    if nRoute == 30 then
        local pifeng, pIndex = AddItem(0, 152, 9, 1, 1, -1, -1, -1, -1, -1, -1,
            0, nLevel)
        SetItemFeedUpAttrs(pIndex, 188, 164, 178, 760, 754, 825)
        FeedItem(pIndex, 1000000)
        local huizhang, hIndex = AddItem(0, 153, 9, 1, 1, -1, -1, -1, -1, -1,
            -1, 0, nLevel)
        SetItemFeedUpAttrs(hIndex, 188, 164, 178, 760, 754, 630)
        FeedItem(hIndex, 1000000)
        local xie, xIndex = AddItem(0, 154, 9, 1, 1, -1, -1, -1, -1, -1, -1, 0,
            nLevel)
        SetItemFeedUpAttrs(xIndex, 188, 164, 178, 760, 754, 1004)
        FeedItem(xIndex, 1000000)
    end

end

function Get_Book()
    local tSay = {
        "Nh�n M�t t�ch/Get_Book_ZhenJuan",
        "Nh�n Y�u Quy�t/Get_Book_JueYao",
        "----------------------------------/nothing",
        "\nLuy�n m�t t�ch nhanh/Get_Book_Update"
    };
    tinsert(tSay, "\nExit/nothing");
    Say(g_szTitle .. "M�t t�ch v� y�u quy�t", getn(tSay), tSay);
    -- local szSay = {
    --     g_szTitle .. "Nh�n M�t t�ch v� Y�u Quy�t!",
    --     "Th�ng c�p M�t t�ch �� trang b�/Get_Book_Update",
    --     "Nh�n M�t t�chGet_Book_ZhenJuan",
    --     "Nh�n Y�u Quy�t/Get_Book_JueYao", "Exit/nothing"
    -- };
    -- SelectSay(szSay);
end

function Get_Book_ZhenJuan()
    if gf_Judge_Room_Weight(7, 1, g_szTitle) ~= 1 then
        return 0;
    end

    local nRoute = GetPlayerRoute();

    if nRoute == 2 then
        AddItem(0, 107, 204, 1)
        AddItem(0, 107, 204 - 38, 1)
    end

    if nRoute == 3 then
        AddItem(0, 107, 206, 1)
        AddItem(0, 107, 206 - 38, 1)
    end

    if nRoute == 4 then
        AddItem(0, 107, 205, 1)
        AddItem(0, 107, 205 - 38, 1)
    end

    if nRoute == 6 then
        AddItem(0, 107, 207, 1)
        AddItem(0, 107, 207 - 38, 1)
    end

    if nRoute == 8 then
        AddItem(0, 107, 208, 1)
        AddItem(0, 107, 208 - 38, 1)
    end

    if nRoute == 9 then
        AddItem(0, 107, 209, 1)
        AddItem(0, 107, 209 - 38, 1)
    end

    if nRoute == 11 then
        AddItem(0, 107, 210, 1)
        AddItem(0, 107, 210 - 38, 1)
    end

    if nRoute == 12 then
        AddItem(0, 107, 211, 1)
        AddItem(0, 107, 211 - 38, 1)
    end

    if nRoute == 14 then
        AddItem(0, 107, 212, 1)
        AddItem(0, 107, 212 - 38, 1)
    end

    if nRoute == 15 then
        AddItem(0, 107, 213, 1)
        AddItem(0, 107, 213 - 38, 1)
    end

    if nRoute == 17 then
        AddItem(0, 107, 214, 1)
        AddItem(0, 107, 214 - 38, 1)
    end

    if nRoute == 18 then
        AddItem(0, 107, 215, 1)
        AddItem(0, 107, 215 - 38, 1)
    end

    if nRoute == 20 then
        AddItem(0, 107, 216, 1)
        AddItem(0, 107, 216 - 38, 1)
    end

    if nRoute == 21 then
        AddItem(0, 107, 217, 1)
        AddItem(0, 107, 217 - 38, 1)
    end

    if nRoute == 23 then -- À¥ÂØÌìÊ¦
        AddItem(0, 107, 218, 1)
        AddItem(0, 107, 218 - 20, 1)
    end

    if nRoute == 29 then -- ÎèÝÉ
        AddItem(0, 107, 222, 1)
        AddItem(0, 107, 222 - 20, 1)
    end

    if nRoute == 30 then -- ÝéÅ®
        AddItem(0, 107, 223, 1)
        AddItem(0, 107, 223 - 20, 1)
    end

    gf_AddItemEx({0, 112, 158, 1, 3}, "L�ng ba vi b� to�n t�p");
    gf_AddItemEx({0, 112, 224, 1, 3}, "Ti�u dao m�t t�ch");
end

function Get_Book_JueYao()
    local tJue = {
        [2] = {1, 10},
        [3] = {21, 31},
        [4] = {11, 20},
        [6] = {32, 46},
        [8] = {47, 59},
        [9] = {60, 70},
        [11] = {71, 79},
        [12] = {80, 88},
        [14] = {89, 108},
        [15] = {109, 119},
        [17] = {120, 130},
        [18] = {131, 141},
        [20] = {142, 154},
        [21] = {155, 168},
        [23] = {169, 182},
        [25] = {183, 194},
        [26] = {195, 206},
        [27] = {207, 218},
        [29] = {219, 229},
        [30] = {230, 240}
    };

    local nRoute = GetPlayerRoute()
    if 1 ~= gf_CheckPlayerRoute() then
        return 0;
    end

    if 1 ~=
        gf_Judge_Room_Weight((tJue[nRoute][2] - tJue[nRoute][1] + 1), 1,
            g_szTitle) then
        return 0;
    end

    for i = tJue[nRoute][1], tJue[nRoute][2] do
        gf_AddItemEx({2, 6, i, 1, 4}, " YQ");
    end
end

function Get_Book_Update()
    for i = 1, 100 do
        LevelUpBook()
    end
    for i = 1, 100 do
        LevelUpBook(1)
    end
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function Get_Money()
    local local_gold = 40000000
    if GetCash() < local_gold then
        Earn(local_gold - GetCash());
    end
    AddItem(2, 1, 30229, 10)
    Msg2SubWorld("Nh�n 10 Bao 4k Gold")
end
function Get_Kimphieu()
    -- AddItem(2, 1, 30882, 100)
    ModifyJinJuan(100000, 1);
    Msg2SubWorld("Nh�n 100.000 kim phieu")
end
function Get_VPXu()
    AddItem(2, 1, 30230, 10000)
    Msg2SubWorld("Nh�n 10.000 v�t ph�m xu")
end
function Get_exp()
    ModifyExp(1000000000)
    Msg2SubWorld("Nh�n 1.000.000.000 (exp)")
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end
function Get_SMDV()
    ModifyReputation(10000, 0) -- DV
    SetTask(336, GetTask(336) + 10000) -- SM
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end
function Get_DiemCT()
    SetTask(707, GetTask(707) + 500000) -- tich luy ct
    SetTask(701, GetTask(701) + 500000) -- cong trang 
    Msg2SubWorld("Nh�n 500k CT + 500k TLCT")
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end
function Get_Thanhanh()
    AddItem(0, 200, 40, 1)
    Msg2SubWorld("Nh�n 1 than hanh bao dien")
end
function Get_DuocPham()
    AddItem(1, 0, 32, 100) -- cuu chuyen 
    AddItem(1, 0, 6, 100) -- red 
    AddItem(1, 0, 11, 100) -- blue 
    AddItem(1, 0, 16, 100) -- yellow
    Msg2SubWorld("Nh�n duoc pham")
end
function Get_DuocPham2()
    AddItem(1, 0, 32, 100)
    for i = 30005, 30011 do
        if i ~= 30008 then
            AddItem(1, 0, i, 100);
        end
    end
    for i = 261, 265 do
        AddItem(1, 0, i, 100);
    end
    Msg2SubWorld("Nh�n duoc pham xin")
end
function Get_QCVD()
    AddItem(2, 1, 30642, 100)
    Msg2SubWorld("Nh�n QCVD")
end
function Get_DauHon()
    AddItem(2, 1, 1157, 100) -- yellow
    Msg2SubWorld("Nh�n Dau hon")
end
function Get_ThuCuoi()
    AddItem(0, 105, 10110, 1, 3, -1, -1, -1, -1, -1, -1, -1)
    AddItem(0, 105, 10111, 1, 3, -1, -1, -1, -1, -1, -1, -1)
    Msg2SubWorld("Nh�n Thu cuoi")
end
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
    for i = 1, 9 do
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
    AddItem(0, 105, 38, 1, 1, 7, 101, 7, 101, 7, 101) -- ngua 70% 70% 70%
end

function Give_Jiancu()
    if gf_Judge_Room_Weight(2, 100) ~= 1 then
        return 0;
    end
    AddItem(2, 15, 10, 2000);
    AddItem(0, 105, 38, 1, 1, 7, 101, 7, 101, 7, 101) -- ngua 70% 70% 70%
end

function Give_Fengshifu()
    if gf_Judge_Room_Weight(5, 1) ~= 1 then
        return 0;
    end

    AddItem(1, 6, 34, 30, 4);
    AddItem(1, 6, 46, 30, 4);
    AddItem(1, 6, 84, 30, 4);
    AddItem(1, 6, 153, 30, 4);
    AddItem(1, 6, 154, 30, 4);
end

function Give_GuGu()
    if gf_Judge_Room_Weight(32, 1) ~= 1 then
        return 0;
    end
    for i = 1, 31 do
        AddItem(2, 17, i, 99, 4);
    end

    if 0 >= GetItemCount(2, 0, 1063) and 1 == gf_Judge_Room_Weight(1, 1) then
        AddItem(2, 0, 1063, 1);
    end
end

function ling_nv_xiaodiao()
    local szSay = {};
    szSay[getn(szSay) + 1] = "Nh�n Ti�u �i�u/Give_XiaoDiao";
    szSay[getn(szSay) + 1] = "Nu�i Ti�u �i�u/Give_XiaoDiaoFood";
    szSay[getn(szSay) + 1] = "Hu�n luy�n Ti�u �i�u/Feed_XiaoDiao";
    szSay[getn(szSay) + 1] = "\nRa kh�i/nothing";
    Say(g_szTitle .. "Ti�u �i�u thao t�c.", getn(szSay), szSay)
end

function Give_XiaoDiao()
    if gf_Judge_Room_Weight(1, 1) ~= 1 then
        return 0;
    end
    AddItem(2, 20, random(1, 5), 1, 4);
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
    if (nPetItemIndex == nil or nPetItemIndex <= 0) then
        Msg2Player(
            "C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!");
        return
    end
    local ItemGen, ItemDetail, ItemParticular =
        GetItemInfoByIndex(nPetItemIndex);
    if (ItemGen == nil or ItemDetail == nil or ItemParticular == nil) or
        (ItemGen ~= 2 or ItemDetail ~= 20) then
        Msg2Player(
            "C�c h� ch�a c� th� c�ng, kh�ng th� ti�n h�nh hu�n luy�n!");
        return
    end

    for i = 1, 99 do
        LevelUpPet(nPetItemIndex)
    end
end

function ClearBagAllItem(bTag)
    if not bTag or tonumber(bTag) ~= 1 then
        Say(g_szTitle .. "Ng��i mu�n thanh l� t�i?", 2,
            "��ng �/#ClearBagAllItem(1)", "Ra kh�i/nothing")
        return
    end
    ClearItemInPos();
    if GetItemCount(2, 1, 30644) < 1 and GetFreeItemRoom() > 0 then
        -- AddItem(2, 1, 30644, 1) GM
        AddItem(2, 1, 50005, 1) -- The Tan Thu
    end
end

function TongOperation()
    local szSay = {
        g_szTitle .. "Thao t�c bang h�i",
        "Ta mu�n nh�n v�t ph�m bang h�i/TongOperation_Create",
        "Ta mu�n t�o bang h�i/CreateTongDialog",
        "Ta mu�n th�ng c�p bang h�i/TongOperation_update",
        "\nRa kh�i/nothing"
    };
    SelectSay(szSay);
end

function TongOperation_Create()
    if IsTongMember() ~= 0 then
        Talk(1, "", "Ng��i �� c� bang h�i");
        return
    end
    if gf_Judge_Room_Weight(2, 100, " ") ~= 1 then
        return 0;
    end
    if GetItemCount(2, 0, 555) < 1 then
        AddItem(2, 0, 555, 1)
    end
    if GetItemCount(2, 0, 125) < 1 then
        AddItem(2, 0, 125, 1)
    end
    if GetReputation() < 2000 then
        ModifyReputation(2000 - GetReputation(), 0)
    end
    if GetCash() < 5000000 then
        Earn(5000000 - GetCash())
    end
    CreateTongDialog()
end

function TongOperation_update()
    if GetTongLevel() < 3 then
        AddTongLevel();
        PlaySound("\\sound\\sound_i016.wav");
        SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
    end
end

function GetJingMai()
    local szSay = {
        g_szTitle .. "Thao th�c kinh m�ch",
        "T�y �i�m kinh m�ch/GetJingMai_Reset",
        format("%s/getZhenqi", "Nh�n ch�n kh�"),
        format("%s/getJingMaiTongRen", "Nh�n Kinh M�ch ��ng Nh�n"),
        "\nRa kh�i/nothing"
    };
    if MeridianGetLevel() < 6 then
        tinsert(szSay, 2, "Th�ng c�p c�nh gi�i V� Th�nh/GetJingMai_Update")
    end
    SelectSay(szSay);
end

function getZhenqi()
    AwardGenuineQi(180000);
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end
function getJingMaiTongRen()
    AddItem(2, 1, 30730, 10)
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function GetJingMai_Update()
    local nLevel = MeridianGetLevel()
    for i = nLevel + 1, 4 do
        MeridianUpdateLevel()
    end
    local nNum = 600000 - (MeridianGetDanTian() + MeridianGetQiHai());
    if nNum > 0 then
        AwardGenuineQi(nNum);
    end
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end

function GetJingMai_Reset(bTag)
    if not bTag or tonumber(bTag) ~= 1 then
        Say(g_szTitle .. "Thao th�c kinh m�ch", 2,
            "��ng �/#GetJingMai_Reset(1)", "H�y b�/nothing")
        return 0;
    end
    MeridianRestore(-1);
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0)
end
function player_reborn()
    tSay = {"Chuy�n sinh/active_player_reborn", "\nExit/nothing"}
    Say(g_szTitle .. "Chuy�n sinh 7 c�p 90", getn(tSay), tSay);
end
function active_player_reborn()
    PlayerReborn(2, random(4)); -- chuyen sinh 7, random --> huong chuyen sinh
    gf_SetTaskByte(1538, 1, 5) -- 
    SetLevel(90, 1); -- level 90
    SetTask(336, 10000)
    -- Danh hieu
    AddTitle(61, 5);
    AddTitle(71, 1);
    AddTitle(73, 1);
    AddTitle(76, 1);

    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
    Say("Tho�t", 1, "Exit!/go_exit")
end
function change_PhucSinh()
    local tSay = {}
    local tHeader = "Ch�n"
    tinsert(tSay, "Long/#confirm_change_chuyensinh(1)")
    tinsert(tSay, "Ho/#confirm_change_chuyensinh( 2)")
    tinsert(tSay, "Ung/#confirm_change_chuyensinh(3)")
    tinsert(tSay, "Phung/#confirm_change_chuyensinh(4)")
    tinsert(tSay, "\nExit/nothing")
    Say(tHeader, getn(tSay), tSay)
end
function confirm_change_chuyensinh(nWay)
    local nNum_cs6 = GetPlayerRebornParam(0)
    -- local nNum_level = GetPlayerLevelParam(0)
    PlayerReborn(nNum_cs6, nWay) -- Thay ®�i h��ng chuyÓn Sinh 6 th�nh c�ng		
    SetLevel(90, 1)
    NewWorld(200, 1353, 2876)
    Say("Exut", 1, "Exit!/go_exit")
end
-- function Get_An()
-- if gf_Judge_Room_Weight(4, 100, " ") ~= 1 then
--     return 0;
-- end
-- AddItem(2, 1, 30160, 1);
-- WriteLogEx("Get_An", "Nh�n ��n:", 100, "Long �n");
-- AddItem(2, 1, 30161, 1);
-- WriteLogEx("Get_An", "Nh�n ��n:", 100, "Ph�ng �n");
-- AddItem(2, 1, 30162, 1);
-- WriteLogEx("Get_An", "Nh�n ��n:", 100, "H� �n");
-- AddItem(2, 1, 30163, 1);
-- WriteLogEx("Get_An", "Nh�n ��n:", 100, "�ng �n");
-- end

function Get_Energy()
    local nCur, nMax = ModifyEnergy(0, 1);
    ModifyEnergy(nMax - nCur, 1);
end

function Life_Skill()
    local tSay = {
        "Mu�n t�ng c�p k� n�ng thu th�p/upgrade_gather_skill",
        "Mu�n t�ng c�p k� n�ng s�n xu�t/upgrade_compose_skill",
        "Nh�n nguy�n li�u ch� trang b� Linh ��/get_lingtu_equip_material",
        "T�i h� ch� xem qua th�i/nothing"
    }
    Say(g_szTitle .. "T�ng c�p k� n�ng s�ng", getn(tSay), tSay);
end

function upgrade_gather_skill()
    local tGather = {1, 2, 5, 6};
    local tName = {"��n c�y", "L�m da", "��o kho�ng", "K�o t�"};
    local str = ""
    for k, v in tName do
        str = str .. "<color=gold>" .. v .. "<color>,"
    end
    for k, v in tGather do
        local nCur = GetLifeSkillLevel(0, v)
        local nMax = GetLifeSkillMaxLevel(0, v);
        if nMax > nCur then
            local msg = g_szTitle .. format(
                "Hi�n t�i ch� c� th� th�ng c�p k� n�ng %s, <color=gold>%s<color> �ang ��t c�p <color=green>%d<color>, mu�n th�ng c�p <color=gold>%s<color> ��n c�p <color=green>%d<color> kh�ng?",
                str, tName[k], nCur, tName[k], nMax);
            Say(msg, 2,
                format("��ng �/#upgrade_gather_skill_do(%d, %d)", v, nMax),
                "H�y b�/nothing")
            return 0;
        end
    end
    Talk(1, "",
        "Kh�ng c� k� n�ng s�ng c� th� th�ng c�p, h�y �i t�m NPC �� h�c v� th�ng c�p gi�i h�n k� n�ng ��n c�p 99")
end

function upgrade_gather_skill_do(nSkill, nMax)
    for i = GetLifeSkillLevel(0, nSkill), nMax do
        AddLifeSkillExp(0, nSkill, 9999999);
    end
    if 79 == nMax then
        Talk(1, "",
            "Hi�n �� ho�n th�nh th�ng c�p k� n�ng, h�y �i t�m NPC �� t�ng c�p gi�i h�n ��n 99 n�o!")
    end
    Msg2Player(format("Th�nh c�ng t�ng c�p k� n�ng ��n c�p %d", nMax));
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function upgrade_compose_skill()
    local tGather = {2, 3, 4, 5, 9, 10};
    local tName = {
        "Ch� t�o binh kh� d�i", "Ch� t�o binh kh� ng�n",
        "Ch� t�o k� m�n binh kh�", "L�m h� gi�p", "H� trang",
        "��u qu�n"
    };
    local str = ""
    for k, v in tName do
        str = str .. "<color=gold>" .. v .. "<color>,"
    end
    for k, v in tGather do
        local nCur = GetLifeSkillLevel(1, v)
        local nMax = GetLifeSkillMaxLevel(1, v);
        if nMax > nCur then
            local msg = g_szTitle .. format(
                "Hi�n t�i ch� c� th� th�ng c�p k� n�ng %s, <color=gold>%s<color> �ang ��t c�p <color=green>%d<color>, mu�n th�ng c�p <color=gold>%s<color> ��n c�p <color=green>%d<color> kh�ng?",
                str, tName[k], nCur, tName[k], nMax);
            Say(msg, 2,
                format("��ng �/#upgrade_compose_skill_do(%d, %d)", v, nMax),
                "H�y b�/nothing")
            return 0;
        end
    end
    Talk(1, "",
        "Kh�ng c� k� n�ng s�ng c� th� th�ng c�p, h�y �i t�m NPC �� h�c v� th�ng c�p gi�i h�n k� n�ng ��n c�p 99")
end

function upgrade_compose_skill_do(nSkill, nMax)
    for i = GetLifeSkillLevel(1, nSkill), nMax do
        AddLifeSkillExp(1, nSkill, 9999999);
    end
    if 79 == nMax then
        Talk(1, "",
            "Hi�n �� ho�n th�nh th�ng c�p k� n�ng, h�y �i t�m NPC �� t�ng c�p gi�i h�n ��n 99 n�o!")
    end
    Msg2Player(format("Th�nh c�ng t�ng c�p k� n�ng ��n c�p %d", nMax));
    PlaySound("\\sound\\sound_i016.wav");
    SetCurrentNpcSFX(PIdx2NpcIdx(), 905, 0, 0);
end

function get_lingtu_equip_material()
    if gf_Judge_Room_Weight(18, 100) ~= 1 then
        Talk(1, "", format("Tói kh«ng ®ñ %d « trèng", 18));
        return 0;
    end
    AddItem(2, 1, 30670, 999);
    AddItem(2, 1, 30671, 999);
    AddItem(2, 1, 30672, 999);
    AddItem(2, 1, 30673, 999);
    AddItem(2, 1, 30674, 999);
    AddItem(2, 2, 38, 999);
    AddItem(2, 2, 12, 999);
    AddItem(2, 2, 39, 999);
    AddItem(2, 2, 13, 999);
    AddItem(2, 2, 49, 999);
    AddItem(2, 2, 56, 999);
    AddItem(2, 2, 50, 999);
    AddItem(2, 2, 100, 999);
    AddItem(2, 1, 30680, 999);
    AddItem(2, 1, 30681, 999);
    AddItem(2, 1, 30682, 999);
    AddItem(2, 1, 30683, 999);
    AddItem(2, 1, 30684, 999);
end

function Get_Enhance()
    local tSay = {
        "Nh�n Th�n Th�ch ��nh H�n/Get_Enhance_1",
        "Nh�n Tinh th�ch Thi�n Th�ch/Get_Enhance_2",
        "T�i h� ch� xem qua th�i/nothing"
    }
    Say(g_szTitle .. "T�ng c�p k� n�ng s�ng", getn(tSay), tSay);
end

function Get_Enhance_1()
    if gf_Judge_Room_Weight(2, 10, " ") ~= 1 then
        return 0;
    end
    gf_AddItemEx2({2, 1, 1068, 1}, "Thi�n Th�ch linh th�ch", "Get_Enhance_1",
        "Nh�n Th�n Th�ch ��nh H�n", 0, 1);
    gf_AddItemEx2({2, 1, 1067, 1}, "Thi�n Th�ch linh th�ch", "Get_Enhance_1",
        "Nh�n Th�n Th�ch ��nh H�n", 0, 1);
end

function Get_Enhance_2()
    if gf_Judge_Room_Weight(1, 10, " ") ~= 1 then
        return 0;
    end
    AddItem(2, 1, 1009, 999);
    WriteLogEx("Get_Enhance_2", "Nh�n Tinh th�ch Thi�n Th�ch", 100,
        "Thi�n Th�ch Tinh Th�ch");
end
function Get_Gem()
    if gf_Judge_Room_Weight(24, 100, " ") ~= 1 then
        return 0;
    end
    AddItem(2, 22, 101, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Huy�tTr�chTh�ch 1");
    AddItem(2, 22, 201, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Nguy�tB�chTh�ch 1");
    AddItem(2, 22, 301, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H� Ph�ch Th�ch 1");
    AddItem(2, 22, 401, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H�c Di�u Th�ch 1");

    AddItem(2, 22, 102, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Huy�tTr�chTh�ch 2");
    AddItem(2, 22, 202, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Nguy�tB�chTh�ch 2");
    AddItem(2, 22, 302, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H� Ph�ch Th�ch 2");
    AddItem(2, 22, 402, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H�c Di�u Th�ch 2");

    AddItem(2, 22, 103, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Huy�tTr�chTh�ch 3");
    AddItem(2, 22, 203, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Nguy�tB�chTh�ch 3");
    AddItem(2, 22, 303, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H� Ph�ch Th�ch 3");
    AddItem(2, 22, 403, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H�c Di�u Th�ch 3");

    AddItem(2, 22, 104, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Huy�tTr�chTh�ch 4");
    AddItem(2, 22, 204, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Nguy�tB�chTh�ch 4");
    AddItem(2, 22, 304, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H� Ph�ch Th�ch 4");
    AddItem(2, 22, 404, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H�c Di�u Th�ch 4");

    AddItem(2, 22, 105, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Huy�tTr�chTh�ch 5");
    AddItem(2, 22, 205, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Nguy�tB�chTh�ch 5");
    AddItem(2, 22, 305, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H� Ph�ch Th�ch 5");
    AddItem(2, 22, 405, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H�c Di�u Th�ch 5");

    AddItem(2, 22, 106, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Huy�tTr�chTh�ch 6");
    AddItem(2, 22, 206, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Nguy�tB�chTh�ch 6");
    AddItem(2, 22, 306, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H� Ph�ch Th�ch 6");
    AddItem(2, 22, 406, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H�c Di�u Th�ch 6");

    AddItem(2, 22, 107, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Huy�tTr�chTh�ch 7");
    AddItem(2, 22, 207, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "Nguy�tB�chTh�ch 7");
    AddItem(2, 22, 307, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H� Ph�ch Th�ch 7");
    AddItem(2, 22, 407, 100);
    WriteLogEx("Get_Gem", "Nhan da quy", 100, "H�c Di�u Th�ch 7");

    -- AddItem(2, 22, 108, 100);
    -- WriteLogEx("Get_Gem", "Nhan da quy", 100, "Huy�tTr�chTh�ch 8");
    -- AddItem(2, 22, 208, 100);
    -- WriteLogEx("Get_Gem", "Nhan da quy", 100, "Nguy�tB�chTh�ch 8");
    -- AddItem(2, 22, 308, 100);
    -- WriteLogEx("Get_Gem", "Nhan da quy", 100, "H� Ph�ch Th�ch 8");
    -- AddItem(2, 22, 408, 100);
    -- WriteLogEx("Get_Gem", "Nhan da quy", 100, "H�c Di�u Th�ch 8");
end
-- function Get_TB_NguyenSoai()
--     GetCT()
-- end
-- TRANG BI CHIEN TRUONG
function GetCT()
    local szSay = {
        g_szTitle .. "Ch�n", "Nh�n trang b� Ho� Ph�ng/Get_CT_HP",
        "Nh�n trang b� Thanh Long/Get_CT_TL",
        "Nh�n trang b� Uy H�/Get_CT_UH", "\nExit/nothing"
    };
    SelectSay(szSay);
end

-- Trang bi UY HO
function Get_CT_UH()
    local szSay = {
        g_szTitle .. "Ch�n trang b�",
        "Trang Ph�c Uy H� T��ng Phe T�ng/#Get_TP_CT_UH(1,1)",
        "Trang Ph�c Uy H� So�i Phe T�ng/#Get_TP_CT_UH(1,2)",
        "Trang Ph�c Uy H� T��ng Phe Li�u/#Get_TP_CT_UH(2,1)",
        "Trang Ph�c Uy H� So�i Phe Li�u/#Get_TP_CT_UH(2,2)",
        "\nExit/nothing"
    };
    SelectSay(szSay);
end

-- Trang bi THANH LONG
function Get_CT_TL()
    local szSay = {
        g_szTitle .. "Ch�n trang b�",
        "Trang Ph�c Thanh Long T��ng Phe T�ng/#Get_TP_CT_TL(1,1)",
        "Trang Ph�c Thanh Long So�i Phe T�ng/#Get_TP_CT_TL(1,2)",
        "Trang Ph�c Thanh Long T��ng Phe Li�u/#Get_TP_CT_TL(2,1)",
        "Trang Ph�c Thanh Long So�i Phe Li�u/#Get_TP_CT_TL(2,2)",
        "\nExit/nothing"
    };
    SelectSay(szSay);
end

-- Trang bi Hoa Phung
function Get_CT_HP()
    local szSay = {
        g_szTitle .. "Ch�n trang b�",
        "Trang Ph�c Ho� Ph�ng T��ng Phe T�ng/#Get_TP_CT_HP(1,1)",
        "Trang Ph�c Ho� Ph�ng So�i Phe T�ng/#Get_TP_CT_HP(1,2)",
        "Trang Ph�c Ho� Ph�ng T��ng Phe Li�u/#Get_TP_CT_HP(2,1)",
        "Trang Ph�c Ho� Ph�ng So�i Phe Li�u/#Get_TP_CT_HP(2,2)",
        "\nExit/nothing"
    };
    SelectSay(szSay);
end

-- GET
function Get_TP_CT_UH(nPhe, nQH)
    if nPhe == 1 and nQH == 1 then
        local ID1 = 20556 -- TP
        local ID2 = 10196 -- NB
        local ID3 = 20556 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 1 and nQH == 2 then
        local ID1 = 20620 -- TP
        local ID2 = 10388 -- NB
        local ID3 = 20620 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 2 and nQH == 1 then
        local ID1 = 20684 -- TP
        local ID2 = 10644 -- NB
        local ID3 = 20684 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 2 and nQH == 2 then
        local ID1 = 20748 -- TP
        local ID2 = 10836 -- NB
        local ID3 = 20748 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    end
end

function Get_TP_CT_TL(nPhe, nQH)
    if nPhe == 1 and nQH == 1 then
        local ID1 = 20300 -- TP
        local ID2 = 9300 -- NB
        local ID3 = 20300 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 1 and nQH == 2 then
        local ID1 = 20364 -- TP
        local ID2 = 9492 -- NB
        local ID3 = 20364 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 2 and nQH == 1 then
        local ID1 = 20428 -- TP
        local ID2 = 9748 -- NB
        local ID3 = 20428 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 2 and nQH == 2 then
        local ID1 = 20492 -- TP
        local ID2 = 9940 -- NB
        local ID3 = 20492 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    end
end

function Get_TP_CT_HP(nPhe, nQH)
    if nPhe == 1 and nQH == 1 then
        local ID1 = 30311 -- TP
        local ID2 = 30228 -- NB
        local ID3 = 30328 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 1 and nQH == 2 then
        local ID1 = 30375 -- TP
        local ID2 = 30420 -- NB
        local ID3 = 30432 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 2 and nQH == 1 then
        local ID1 = 30439 -- TP
        local ID2 = 30676 -- NB
        local ID3 = 30536 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    elseif nPhe == 2 and nQH == 2 then
        local ID1 = 30503 -- TP
        local ID2 = 30868 -- NB
        local ID3 = 30640 -- VK
        GetCTEnd(ID1, ID2, ID3, nQH);
    end
end

function GetCTEnd(ID1, ID2, ID3, nQH)
    local ID = {
        [2] = {3, ID1, ID2, ID3},
        [3] = {8, ID1 + 2, ID2 + 2, ID3 + 2},
        [4] = {0, ID1 + 4, ID2 + 4, ID3 + 4},
        [6] = {1, ID1 + 6, ID2 + 6, ID3 + 6},
        [8] = {2, ID1 + 10, ID2 + 10, ID3 + 10},
        [9] = {10, ID1 + 12, ID2 + 12, ID3 + 12},
        [11] = {0, ID1 + 14, ID2 + 14, ID3 + 14},
        [12] = {5, ID1 + 18, ID2 + 18, ID3 + 18},
        [14] = {2, ID1 + 22, ID2 + 22, ID3 + 22},
        [15] = {9, ID1 + 26, ID2 + 26, ID3 + 26},
        [17] = {6, ID1 + 30, ID2 + 30, ID3 + 30},
        [18] = {4, ID1 + 34, ID2 + 34, ID3 + 34},
        [20] = {7, ID1 + 38, ID2 + 38, ID3 + 38},
        [21] = {11, ID1 + 42, ID2 + 42, ID3 + 42},
        [23] = {2, ID1 + 46, ID2 + 46, ID3 + 46},
        [25] = {3, ID1 + 48, ID2 + 48, ID3 + 48},
        [26] = {9, ID1 + 52, ID2 + 52, ID3 + 52},
        [27] = {11, ID1 + 56, ID2 + 56, ID3 + 56},
        [29] = {13, ID1 + 60, ID2 + 60, ID3 + 60},
        [30] = {12, ID1 + 62, ID2 + 62, ID3 + 62}
    };

    local nRoute = GetPlayerRoute();
    if nRoute == 8 or nRoute == 9 or nRoute == 29 or nRoute == 30 then
        nBody = GetBody() - 3;
    else
        nBody = GetBody() - 1;
    end

    for k, v in pairs(ID) do
        if nRoute == k then
            local nA = v[1];
            local nTP = v[2] + nBody;
            local nNB = v[3] + nBody;
            local nVK = v[4] + nBody;

            AddItem(0, 103, nTP, 1, 1, -1, -1, -1, -1, -1, -1, 1, 15); -- TP
            AddItem(0, 101, nTP, 1, 1, -1, -1, -1, -1, -1, -1, 1, 15);
            AddItem(0, 100, nTP, 1, 1, -1, -1, -1, -1, -1, -1, 1, 15);

            AddItem(0, 102, nNB, 1, 1, -1, -1, -1, -1, -1, -1, 1, 0); -- NB
            AddItem(0, 102, nNB + 64, 1, 1, -1, -1, -1, -1, -1, -1, 1, 0);
            AddItem(0, 102, nNB + 64 * 2, 1, 1, -1, -1, -1, -1, -1, -1, 1, 0);

            if nQH == 2 then
                AddItem(0, 102, nNB + 64 * 3, 1, 1, -1, -1, -1, -1, -1, -1, 1, 0); -- NBS
            end

            AddItem(0, nA, nVK, 1, 1, -1, -1, -1, -1, -1, -1, 1, 15); -- VK
        end
    end
end

----------------- chuyen sinh an ----------------------------------
function GetTranslifeCount()
    return GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_COUNT)
end

function GetTranslifeFaction()
    return GetByte(GetTask(TRANSLIFE_TASK_ID), TRANSLIFE_BYTE_FACTION)
end

function CheckSeal()
    if BigGetItemCount(2, 0, 30002) < 1 and BigGetItemCount(2, 0, 30003) < 1 and
        BigGetItemCount(2, 0, 30005) < 1 and BigGetItemCount(2, 0, 30006) < 1 then
        return 0
    end
    return 1
end
-- Thùc hiÖn xong nhi�m v� gäi h�m ®Ó set task lªn 1
function SetTaskTrans()
    SetTask(TRANSLIFE_MISSION_ID, GetTask(TRANSLIFE_MISSION_ID) + 1)
end
-- Gäi h�m ®Ó lÊy tr¹ng th¸i nhi�m v� 
function GetTaskTrans()
    return GetTask(TRANSLIFE_MISSION_ID)
end
function confirm_get_translife_item()
    -- local variables --------------
    local TRANSLIFE_MISSION_ID = 1537
    local TRANSLIFE_TASK_ID = 1538

    local TRANSLIFE_BYTE_COUNT = 1
    local TRANSLIFE_BYTE_FACTION = 2
    local TRANSLIFE_LEVEL = 99
    local TRANSLIFE_EXP = 2000000000
    local TRANSLIFE_BOX_COUNT = 4

    tb_translife_seal = {
        {"Long T� �n", {2, 0, 30002, 1, 1}, "Long T�"},
        {"H� T� �n", {2, 0, 30003, 1, 1}, "H� T�"},
        {"�ng T� �n", {2, 0, 30006, 1, 1}, "�ng T�"},
        {"Ph�ng T� �n", {2, 0, 30005, 1, 1}, "Ph�ng T�"}
    }
    tb_translife_seal_cs6 = {
        {"Long T� �n", {2, 0, 30002, 1, 1}, "Long T�"},
        {"H� T� �n", {2, 0, 30003, 1, 1}, "H� T�"},
        {"�ng T� �n", {2, 0, 30006, 1, 1}, "�ng T�"},
        {"Ph�ng T� �n", {2, 0, 30005, 1, 1}, "Ph�ng T�"}
    }
    tb_translife_tittle = {
        [1] = {
            [2] = {"H�n Nguy�n T�ng", 24, 1},
            [4] = {"��u T�ng", 24, 2},
            [3] = {"Thi�n Tu T�ng", 24, 3},
            [6] = {"H� V�", 24, 4},
            [8] = {"V� Y S�", 24, 5},
            [9] = {"Ph�n �m S�", 24, 6},
            [11] = {"Tr� Gian �� T�", 24, 7},
            [12] = {"Tr�ng �c �� T�", 24, 8},
            [14] = {"Nh�p Quan ��o nh�n", 24, 9},
            [15] = {"S�n D��ng ��o nh�n", 24, 10},
            [17] = {"Hi�u �y", 24, 11},
            [18] = {"�� �y", 24, 12},
            [20] = {"Th�i M�nh T�n Nh�n", 24, 13},
            [21] = {"Th�c T�m T�n Nh�n", 24, 14},
            [23] = {"Nh�p Quan ��o nh�n", 24, 9},
            [29] = {"V� Y S�", 24, 5},
            [30] = {"Ph�n �m S�", 24, 6}
        },

        [2] = {
            [2] = {"��t Ma Kim Cang", 25, 1},
            [4] = {"La H�n H� Ph�p", 25, 2},
            [3] = {"Truy�n kinh ph�p s�", 25, 3},
            [6] = {"B� ��c th�ch kh�ch", 25, 4},
            [8] = {"T� Tr�c s�", 25, 5},
            [9] = {"H�i Nguy�t s�", 25, 6},
            [11] = {"T� H�i hi�p", 25, 7},
            [12] = {"�� t� t�m t�i", 25, 8},
            [14] = {"V� ng� ��o nh�n", 25, 9},
            [15] = {"Nh�n V�n Hi�p ��o", 25, 10},
            [17] = {"Ph�n v� t��ng qu�n", 25, 11},
            [18] = {"Ph�n uy t��ng qu�n", 25, 12},
            [20] = {"H�c V� Th��ng", 25, 13},
            [21] = {"B�ch V� Th��ng", 25, 14},
            [23] = {"V� ng� ��o nh�n", 25, 9},
            [29] = {"T� Tr�c s�", 25, 5},
            [30] = {"H�i Nguy�t s�", 25, 6}
        },

        [3] = {
            [2] = {"B�t B� Thi�n Long", 26, 1},
            [4] = {"B�t B�o La H�n", 26, 2},
            [3] = {"V� L��ng Ph�p T�n", 26, 3},
            [6] = {"Thi�n C� S� Gi�", 26, 4},
            [8] = {"B�ch Li�n Ti�n T�", 26, 5},
            [9] = {"Ng�c V�n Ti�n T�", 26, 6},
            [11] = {"Long ��u Th�n C�i", 26, 7},
            [12] = {"Kh�t Thi�n Th�n C�i", 26, 8},
            [14] = {"Ch��ng Kinh ��o nh�n", 26, 9},
            [15] = {"Th�i �t T�n Nh�n", 26, 10},
            [17] = {"Long T��ng t��ng qu�n", 26, 11},
            [18] = {"H� D�c t��ng qu�n", 26, 12},
            [20] = {"U Minh Qu� S�t", 26, 13},
            [21] = {"V� ��ng La S�t", 26, 14},
            [23] = {"Ch��ng Kinh ��o nh�n", 26, 9},
            [29] = {"B�ch Li�n Ti�n T�", 26, 5},
            [30] = {"Ng�c V�n Ti�n T�", 26, 6}
        },

        [4] = {
            [2] = {"Tr��ng l�o ��t Ma ���ng", 27, 1},
            [4] = {"Tr��ng l�o La H�n ���ng", 27, 2},
            [3] = {"Tr��ng l�o T�ng Kinh C�c", 27, 3},
            [6] = {"Thi�n Th� S� Gi�", 27, 4},
            [8] = {"Kim Quang Ti�n T�", 27, 5},
            [9] = {"Thi�n �m Ti�n T�", 27, 6},
            [11] = {"Ch�p Ph�p Th�n C�i", 27, 7},
            [12] = {"Ch��ng B�ng Th�n C�i", 27, 8},
            [14] = {"Th��ng Thanh ��o Nh�n", 27, 9},
            [15] = {"T� H� T�n Nh�n", 27, 10},
            [17] = {"Tr�n Qu�n T��ng Qu�n", 27, 11},
            [18] = {"Chinh L� T��ng Qu�n", 27, 12},
            [20] = {"Di�m La Qu� S�t", 27, 13},
            [21] = {"C� ��c La S�t", 27, 14},
            [23] = {"Th��ng Thanh ��o Nh�n", 27, 9},
            [29] = {"Kim Quang Ti�n T�", 27, 5},
            [30] = {"Thi�n �m Ti�n T�", 27, 6}
        },

        [5] = {
            [2] = {"Th� t�a ��t Ma ���ng", 28, 1},
            [4] = {"Th� t�a La H�n ���ng", 28, 2},
            [3] = {"Th� t�a T�ng Kinh C�c", 28, 3},
            [6] = {"Thi�n Th� Th�n V�", 28, 4},
            [8] = {"Kim Quang th�nh n�", 28, 5},
            [9] = {"Thi�n �m th�nh n�", 28, 6},
            [11] = {"Ch�p Ph�p tr��ng l�o", 28, 7},
            [12] = {"Ch��ng B�ng tr��ng l�o", 28, 8},
            [14] = {"Th��ng Thanh ch�n nh�n", 28, 9},
            [15] = {"T� Ti�u th��ng nh�n", 28, 10},
            [17] = {"Tr�n Qu�n nguy�n so�i", 28, 11},
            [18] = {"Chinh L� nguy�n so�i", 28, 12},
            [20] = {"Di�m La t�n gi�", 28, 13},
            [21] = {"C� ��c t�n gi�", 28, 14},
            [23] = {"Th��ng Thanh ch�n nh�n", 28, 9},
            [29] = {"Kim Quang th�nh n�", 28, 5},
            [30] = {"Thi�n �m th�nh n�", 28, 6}
        }
    }
    tbMobsList_cs6 = {
        [1] = {"Ti�u Lam �ao Qu�", TSK_CS6_DaoQuy_XoaQuy, 1},
        [2] = {"Ti�u Lam Xoa Qu�", TSK_CS6_DaoQuy_XoaQuy, 2},
        [3] = {"Sa M�c H�nh Nh�n", TSK_CS6_SaMac_TamBao, 1},
        [4] = {"T�m B�o Nh�n", TSK_CS6_SaMac_TamBao, 2},
        [5] = {"Ki�m ti�n T�", TSK_CS6_KiemTien_DichTien, 1},
        [6] = {"��ch ti�n T�", TSK_CS6_KiemTien_DichTien, 2},
        [7] = {"Li�t Nhan Li Long", TSK_CS6_LiLong_HoaHo, 1},
        [8] = {"X�ch Luy�n H�a H�", TSK_CS6_LiLong_HoaHo, 2}
    }
    tb_translife_weapon_effect = {
        "H�o m�n", "Ph�n V�n", "�o�n Giao", "Ph� Qu�n"
    }
    tb_translife_cloth_cs6_nhanlai = {
        [1] = {
            [1] = {
                {0, 108, 30005, 1, 4, 5, 639, 6, 102},
                {0, 109, 30005, 1, 4, 5, 342, 6, 102},
                {0, 110, 30005, 1, 4, 6, 306, 6, 102}
            },
            [2] = {
                {0, 108, 30006, 1, 4, 5, 639, 6, 102},
                {0, 109, 30006, 1, 4, 5, 342, 6, 102},
                {0, 110, 30006, 1, 4, 6, 306, 6, 102}
            },
            [3] = {
                {0, 108, 30007, 1, 4, 5, 639, 6, 102},
                {0, 109, 30007, 1, 4, 5, 342, 6, 102},
                {0, 110, 30007, 1, 4, 6, 306, 6, 102}
            },
            [4] = {
                {0, 108, 30008, 1, 4, 5, 639, 6, 102},
                {0, 109, 30008, 1, 4, 5, 342, 6, 102},
                {0, 110, 30008, 1, 4, 6, 306, 6, 102}
            }
        },
        [2] = {
            [1] = {
                {0, 108, 30005, 1, 4, 6, 302, 6, 102},
                {0, 109, 30005, 1, 4, 5, 409, 6, 102},
                {0, 110, 30005, 1, 4, 5, 79, 5, 80, 6, 102}
            },
            [2] = {
                {0, 108, 30006, 1, 4, 6, 302, 6, 102},
                {0, 109, 30006, 1, 4, 5, 409, 6, 102},
                {0, 110, 30006, 1, 4, 5, 79, 5, 80, 6, 102}
            },
            [3] = {
                {0, 108, 30007, 1, 4, 6, 302, 6, 102},
                {0, 109, 30007, 1, 4, 5, 409, 6, 102},
                {0, 110, 30007, 1, 4, 5, 79, 5, 80, 6, 102}
            },
            [4] = {
                {0, 108, 30008, 1, 4, 6, 302, 6, 102},
                {0, 109, 30008, 1, 4, 5, 409, 6, 102},
                {0, 110, 30008, 1, 4, 5, 79, 5, 80, 6, 102}
            }
        },
        [3] = {
            [1] = {
                {0, 108, 30005, 1, 4, 2, 13075, 6, 102},
                {0, 109, 30005, 1, 4, 5, 342, 6, 102},
                {0, 110, 30005, 1, 4, 6, 306, 6, 102}
            },
            [2] = {
                {0, 108, 30006, 1, 4, 2, 13075, 6, 102},
                {0, 109, 30006, 1, 4, 5, 342, 6, 102},
                {0, 110, 30006, 1, 4, 6, 306, 6, 102}
            },
            [3] = {
                {0, 108, 30007, 1, 4, 2, 13075, 6, 102},
                {0, 109, 30007, 1, 4, 5, 342, 6, 102},
                {0, 110, 30007, 1, 4, 6, 306, 6, 102}
            },
            [4] = {
                {0, 108, 30008, 1, 4, 2, 13075, 6, 102},
                {0, 109, 30008, 1, 4, 5, 342, 6, 102},
                {0, 110, 30008, 1, 4, 6, 306, 6, 102}
            }
        },
        [4] = {
            [1] = {
                {0, 108, 30005, 1, 4, 5, 27, 6, 102},
                {0, 109, 30005, 1, 4, 5, 342, 6, 102},
                {0, 110, 30005, 1, 4, 4, 292, 4, 293, 6, 102}
            },
            [2] = {
                {0, 108, 30006, 1, 4, 5, 27, 6, 102},
                {0, 109, 30006, 1, 4, 5, 342, 6, 102},
                {0, 110, 30006, 1, 4, 4, 292, 4, 293, 6, 102}
            },
            [3] = {
                {0, 108, 30007, 1, 4, 5, 27, 6, 102},
                {0, 109, 30007, 1, 4, 5, 342, 6, 102},
                {0, 110, 30007, 1, 4, 4, 292, 4, 293, 6, 102}
            },
            [4] = {
                {0, 108, 30008, 1, 4, 5, 27, 6, 102},
                {0, 109, 30008, 1, 4, 5, 342, 6, 102},
                {0, 110, 30008, 1, 4, 4, 292, 4, 293, 6, 102}
            }
        }
    }
    tb_translife_cloth_cs7_nhanlai = {
        [1] = {
            [1] = {
                {0, 108, 30029, 1, 4, 7, 639, 3, 371, 7, 102},
                {0, 109, 30029, 1, 4, 5, 342, 7, 102},
                {0, 110, 30029, 1, 4, 4, 282, 7, 250, 7, 102}
            },
            [2] = {
                {0, 108, 30030, 1, 4, 7, 639, 3, 371, 7, 102},
                {0, 109, 30030, 1, 4, 5, 342, 7, 102},
                {0, 110, 30030, 1, 4, 4, 282, 7, 250, 7, 102}
            },
            [3] = {
                {0, 108, 30031, 1, 4, 7, 639, 3, 371, 7, 102},
                {0, 109, 30031, 1, 4, 5, 342, 7, 102},
                {0, 110, 30031, 1, 4, 4, 282, 7, 250, 7, 102}
            },
            [4] = {
                {0, 108, 30032, 1, 4, 7, 639, 3, 371, 7, 102},
                {0, 109, 30032, 1, 4, 5, 342, 7, 102},
                {0, 110, 30032, 1, 4, 4, 282, 7, 250, 7, 102}
            }
        },
        [4] = {
            [1] = {
                {0, 108, 30029, 1, 4, 7, 27, 7, 102},
                {0, 109, 30029, 1, 4, 5, 342, 4, 409, 7, 102},
                {0, 110, 30029, 1, 4, 5, 292, 5, 293, 7, 102}
            },
            [2] = {
                {0, 108, 30030, 1, 4, 7, 27, 7, 102},
                {0, 109, 30030, 1, 4, 5, 342, 4, 409, 7, 102},
                {0, 110, 30030, 1, 4, 5, 292, 5, 293, 7, 102}
            },
            [3] = {
                {0, 108, 30031, 1, 4, 7, 27, 7, 102},
                {0, 109, 30031, 1, 4, 5, 342, 4, 409, 7, 102},
                {0, 110, 30031, 1, 4, 5, 292, 5, 293, 7, 102}
            },
            [4] = {
                {0, 108, 30032, 1, 4, 7, 27, 7, 102},
                {0, 109, 30032, 1, 4, 5, 342, 4, 409, 7, 102},
                {0, 110, 30032, 1, 4, 5, 292, 5, 293, 7, 102}
            }
        },
        [3] = {
            [1] = {
                {0, 108, 30029, 1, 4, 3, 13075, 7, 102},
                {0, 109, 30029, 1, 4, 5, 342, 2, 346, 7, 102},
                {0, 110, 30029, 1, 4, 4, 282, 7, 250, 7, 102}
            },
            [2] = {
                {0, 108, 30030, 1, 4, 3, 13075, 7, 102},
                {0, 109, 30030, 1, 4, 5, 342, 2, 346, 7, 102},
                {0, 110, 30030, 1, 4, 4, 282, 7, 250, 7, 102}
            },
            [3] = {
                {0, 108, 30031, 1, 4, 3, 13075, 7, 102},
                {0, 109, 30031, 1, 4, 5, 342, 2, 346, 7, 102},
                {0, 110, 30031, 1, 4, 4, 282, 7, 250, 7, 102}
            },
            [4] = {
                {0, 108, 30032, 1, 4, 3, 13075, 7, 102},
                {0, 109, 30032, 1, 4, 5, 342, 2, 346, 7, 102},
                {0, 110, 30032, 1, 4, 4, 282, 7, 250, 7, 102}
            }
        },
        [2] = {
            [1] = {
                {0, 108, 30029, 1, 4, 6, 302, 7, 409, 7, 102},
                {0, 109, 30029, 1, 4, 5, 13219, 5, 13220, 7, 102},
                {0, 110, 30029, 1, 4, 4, 290, 7, 250, 7, 102}
            },
            [2] = {
                {0, 108, 30030, 1, 4, 6, 302, 7, 409, 7, 102},
                {0, 109, 30030, 1, 4, 5, 13219, 5, 13220, 7, 102},
                {0, 110, 30030, 1, 4, 4, 290, 7, 250, 7, 102}
            },
            [3] = {
                {0, 108, 30031, 1, 4, 6, 302, 7, 409, 7, 102},
                {0, 109, 30031, 1, 4, 5, 13219, 5, 13220, 7, 102},
                {0, 110, 30031, 1, 4, 4, 290, 7, 250, 7, 102}
            },
            [4] = {
                {0, 108, 30032, 1, 4, 6, 302, 7, 409, 7, 102},
                {0, 109, 30032, 1, 4, 5, 13219, 5, 13220, 7, 102},
                {0, 110, 30032, 1, 4, 4, 290, 7, 250, 7, 102}
            }
        }
    }
    tb_translife_cloth = {
        [1] = {
            [1] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 3, 389, 1, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 4, 111, 1, 102}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 1, 306, 1, 102}}
            },

            [2] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 4, 389, 2, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 5, 111, 2, 102}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 2, 306, 2, 102}}
            },

            [3] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 5, 389, 3, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 6, 111, 3, 102}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 3, 306, 3, 102}}
            },

            [4] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 6, 389, 4, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 7, 111, 4, 102}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 4, 306, 4, 102}}
            },
            [5] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 6, 389, 3, 329}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 5, 342, 3, 329}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 6, 306, 3, 329}}
            }
        },

        [2] = {
            [1] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 1, 107, 1, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 1, 409, 1, 102}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 1, 79, 1, 80, 1, 102}
                }
            },

            [2] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 2, 107, 2, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 2, 409, 2, 102}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 2, 79, 2, 80, 2, 102}
                }
            },

            [3] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 3, 107, 3, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 3, 409, 3, 102}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 3, 79, 3, 80, 3, 102}
                }
            },

            [4] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 4, 107, 4, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 4, 409, 4, 102}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 4, 79, 4, 80, 4, 102}
                }
            },
            [5] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 4, 107, 3, 329}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 5, 409, 3, 329}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 5, 79, 5, 80, 3, 329}
                }
            }
        },

        [4] = {
            [1] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 1, 27, 1, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 4, 111, 1, 102}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 3, 41, 3, 42, 1, 102}
                }
            },

            [2] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 2, 27, 2, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 5, 111, 2, 102}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 4, 41, 4, 42, 2, 102}
                }
            },

            [3] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 3, 27, 3, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 6, 111, 3, 102}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 5, 41, 5, 42, 3, 102}
                }
            },

            [4] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 4, 27, 4, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 7, 111, 4, 102}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 6, 41, 6, 42, 4, 102}
                }
            },
            [5] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 4, 27, 3, 329}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 5, 342, 3, 329}},
                {
                    "Chuy�n Sinh Trang",
                    {0, 110, 514, 1, 1, 4, 292, 4, 293, 3, 329}
                }
            }
        },

        [3] = {
            [1] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 5, 50, 1, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 4, 111, 1, 102}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 1, 306, 1, 102}}
            },

            [2] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 1, 252, 2, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 5, 111, 2, 102}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 2, 306, 2, 102}}
            },

            [3] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 6, 50, 3, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 6, 111, 3, 102}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 3, 306, 3, 102}}
            },

            [4] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 2, 252, 4, 102}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 7, 111, 4, 102}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 4, 306, 4, 102}}
            },
            [5] = {
                {"Chuy�n Sinh Trang", {0, 108, 514, 1, 1, 2, 252, 3, 329}},
                {"Chuy�n Sinh Trang", {0, 109, 514, 1, 1, 5, 342, 3, 329}},
                {"Chuy�n Sinh Trang", {0, 110, 514, 1, 1, 6, 306, 3, 329}}
            }
        }
    }

    tb_option_cloth = {
        {0, 108, 510}, {0, 109, 510}, {0, 110, 510}, {0, 108, 511},
        {0, 109, 511}, {0, 110, 511}, {0, 108, 513}, {0, 109, 513},
        {0, 110, 513}, {0, 108, 512}, {0, 109, 512}, {0, 110, 512},
        {0, 108, 207}, {0, 108, 208}, {0, 108, 209}, {0, 108, 210},
        {0, 108, 211}, {0, 108, 212}, {0, 108, 213}, {0, 108, 214},
        {0, 108, 215}, {0, 108, 216}, {0, 108, 217}, {0, 108, 218},
        {0, 109, 281}, {0, 109, 282}, {0, 109, 283}, {0, 109, 284},
        {0, 109, 285}, {0, 109, 286}, {0, 109, 287}, {0, 109, 288},
        {0, 109, 289}, {0, 109, 290}, {0, 109, 291}, {0, 109, 292},
        {0, 110, 281}, {0, 110, 282}, {0, 110, 283}, {0, 110, 284},
        {0, 110, 285}, {0, 110, 286}, {0, 110, 287}, {0, 110, 288},
        {0, 110, 289}, {0, 110, 290}, {0, 110, 291}, {0, 110, 292},
        {0, 108, 199}, {0, 108, 200}, {0, 108, 201}, {0, 108, 202},
        {0, 109, 277}, {0, 109, 278}, {0, 109, 279}, {0, 109, 280},
        {0, 110, 89}, {0, 110, 90}, {0, 110, 91}, {0, 110, 92}, {0, 108, 195},
        {0, 108, 196}, {0, 108, 197}, {0, 108, 198}, {0, 109, 255},
        {0, 109, 256}, {0, 109, 257}, {0, 109, 258}, {0, 110, 85}, {0, 110, 86},
        {0, 110, 87}, {0, 110, 88}, {0, 108, 139}, {0, 109, 185}, {0, 110, 81},
        {0, 108, 140}, {0, 109, 186}, {0, 110, 82}, {0, 108, 141},
        {0, 109, 187}, {0, 110, 83}, {0, 108, 142}, {0, 109, 188}, {0, 110, 84},
        {0, 108, 570}, {0, 109, 570}, {0, 110, 570}, {0, 108, 571},
        {0, 109, 571}, {0, 110, 571}, {0, 108, 572}, {0, 109, 572},
        {0, 110, 572}, {0, 108, 573}, {0, 109, 573}, {0, 110, 573},
        {0, 108, 562}, {0, 109, 562}, {0, 110, 562}, {0, 108, 563},
        {0, 109, 563}, {0, 110, 563}, {0, 108, 564}, {0, 109, 564},
        {0, 110, 564}, {0, 108, 565}, {0, 109, 565}, {0, 110, 565},
        {0, 108, 566}, {0, 109, 566}, {0, 110, 566}, {0, 108, 567},
        {0, 109, 567}, {0, 110, 567}, {0, 108, 568}, {0, 109, 568},
        {0, 110, 568}, {0, 108, 569}, {0, 109, 569}, {0, 110, 569},
        {0, 108, 30001}, {0, 108, 30002}, {0, 108, 30003}, {0, 108, 30004},
        {0, 108, 30005}, {0, 108, 30006}, {0, 108, 30007}, {0, 108, 30008},
        {0, 108, 30009}, {0, 108, 30010}, {0, 108, 30011}, {0, 108, 30012},
        {0, 109, 30001}, {0, 109, 30002}, {0, 109, 30003}, {0, 109, 30004},
        {0, 109, 30005}, {0, 109, 30006}, {0, 109, 30007}, {0, 109, 30008},
        {0, 109, 30009}, {0, 109, 30010}, {0, 109, 30011}, {0, 109, 30012},
        {0, 110, 30001}, {0, 110, 30002}, {0, 110, 30003}, {0, 110, 30004},
        {0, 110, 30005}, {0, 110, 30006}, {0, 110, 30007}, {0, 110, 30008},
        {0, 110, 30009}, {0, 110, 30010}, {0, 110, 30011}, {0, 110, 30012},
        {0, 108, 109}, {0, 108, 110}, {0, 108, 111}, {0, 108, 112},
        {0, 109, 109}, {0, 109, 110}, {0, 109, 111}, {0, 109, 112},
        {0, 110, 73}, {0, 110, 74}, {0, 110, 75}, {0, 110, 76}, {0, 108, 1},
        {0, 108, 2}, {0, 108, 3}, {0, 108, 4}, {0, 108, 5}, {0, 108, 6},
        {0, 108, 7}, {0, 108, 8}, {0, 108, 9}, {0, 108, 10}, {0, 108, 11},
        {0, 108, 12}, {0, 108, 13}, {0, 108, 14}, {0, 108, 15}, {0, 108, 16},
        {0, 108, 17}, {0, 108, 18}, {0, 108, 518}, {0, 108, 522}, {0, 108, 526},
        {0, 108, 19}, {0, 108, 20}, {0, 108, 21}, {0, 108, 22}, {0, 108, 23},
        {0, 108, 24}, {0, 108, 25}, {0, 108, 26}, {0, 108, 27}, {0, 108, 28},
        {0, 108, 29}, {0, 108, 30}, {0, 108, 31}, {0, 108, 32}, {0, 108, 33},
        {0, 108, 34}, {0, 108, 35}, {0, 108, 36}, {0, 108, 519}, {0, 108, 523},
        {0, 108, 527}, {0, 108, 37}, {0, 108, 38}, {0, 108, 39}, {0, 108, 40},
        {0, 108, 41}, {0, 108, 42}, {0, 108, 43}, {0, 108, 44}, {0, 108, 45},
        {0, 108, 46}, {0, 108, 47}, {0, 108, 48}, {0, 108, 49}, {0, 108, 50},
        {0, 108, 51}, {0, 108, 52}, {0, 108, 53}, {0, 108, 54}, {0, 108, 520},
        {0, 108, 524}, {0, 108, 528}, {0, 108, 55}, {0, 108, 56}, {0, 108, 57},
        {0, 108, 58}, {0, 108, 59}, {0, 108, 60}, {0, 108, 61}, {0, 108, 62},
        {0, 108, 63}, {0, 108, 64}, {0, 108, 65}, {0, 108, 66}, {0, 108, 67},
        {0, 108, 68}, {0, 108, 69}, {0, 108, 70}, {0, 108, 71}, {0, 108, 72},
        {0, 108, 521}, {0, 108, 525}, {0, 108, 529}, {0, 109, 1}, {0, 109, 2},
        {0, 109, 3}, {0, 109, 4}, {0, 109, 5}, {0, 109, 6}, {0, 109, 7},
        {0, 109, 8}, {0, 109, 9}, {0, 109, 10}, {0, 109, 11}, {0, 109, 12},
        {0, 109, 13}, {0, 109, 14}, {0, 109, 15}, {0, 109, 16}, {0, 109, 17},
        {0, 109, 18}, {0, 109, 518}, {0, 109, 522}, {0, 109, 526}, {0, 109, 19},
        {0, 109, 20}, {0, 109, 21}, {0, 109, 22}, {0, 109, 23}, {0, 109, 24},
        {0, 109, 25}, {0, 109, 26}, {0, 109, 27}, {0, 109, 28}, {0, 109, 29},
        {0, 109, 30}, {0, 109, 31}, {0, 109, 32}, {0, 109, 33}, {0, 109, 34},
        {0, 109, 35}, {0, 109, 36}, {0, 109, 519}, {0, 109, 523}, {0, 109, 527},
        {0, 109, 37}, {0, 109, 38}, {0, 109, 39}, {0, 109, 40}, {0, 109, 41},
        {0, 109, 42}, {0, 109, 43}, {0, 109, 44}, {0, 109, 45}, {0, 109, 46},
        {0, 109, 47}, {0, 109, 48}, {0, 109, 49}, {0, 109, 50}, {0, 109, 51},
        {0, 109, 52}, {0, 109, 53}, {0, 109, 54}, {0, 109, 520}, {0, 109, 524},
        {0, 109, 528}, {0, 109, 55}, {0, 109, 56}, {0, 109, 57}, {0, 109, 58},
        {0, 109, 59}, {0, 109, 60}, {0, 109, 61}, {0, 109, 62}, {0, 109, 63},
        {0, 109, 64}, {0, 109, 65}, {0, 109, 66}, {0, 109, 67}, {0, 109, 68},
        {0, 109, 69}, {0, 109, 70}, {0, 109, 71}, {0, 109, 72}, {0, 109, 521},
        {0, 109, 525}, {0, 109, 529}, {0, 110, 1}, {0, 110, 2}, {0, 110, 3},
        {0, 110, 4}, {0, 110, 5}, {0, 110, 6}, {0, 110, 7}, {0, 110, 8},
        {0, 110, 9}, {0, 110, 10}, {0, 110, 11}, {0, 110, 12}, {0, 110, 13},
        {0, 110, 14}, {0, 110, 15}, {0, 110, 16}, {0, 110, 17}, {0, 110, 18},
        {0, 110, 518}, {0, 110, 522}, {0, 110, 526}, {0, 110, 19}, {0, 110, 20},
        {0, 110, 21}, {0, 110, 22}, {0, 110, 23}, {0, 110, 24}, {0, 110, 25},
        {0, 110, 26}, {0, 110, 27}, {0, 110, 28}, {0, 110, 29}, {0, 110, 30},
        {0, 110, 31}, {0, 110, 32}, {0, 110, 33}, {0, 110, 34}, {0, 110, 35},
        {0, 110, 36}, {0, 110, 519}, {0, 110, 523}, {0, 110, 527}, {0, 110, 37},
        {0, 110, 38}, {0, 110, 39}, {0, 110, 40}, {0, 110, 41}, {0, 110, 42},
        {0, 110, 43}, {0, 110, 44}, {0, 110, 45}, {0, 110, 46}, {0, 110, 47},
        {0, 110, 48}, {0, 110, 49}, {0, 110, 50}, {0, 110, 51}, {0, 110, 52},
        {0, 110, 53}, {0, 110, 54}, {0, 110, 520}, {0, 110, 524}, {0, 110, 528},
        {0, 110, 55}, {0, 110, 56}, {0, 110, 57}, {0, 110, 58}, {0, 110, 59},
        {0, 110, 60}, {0, 110, 61}, {0, 110, 62}, {0, 110, 63}, {0, 110, 64},
        {0, 110, 65}, {0, 110, 66}, {0, 110, 67}, {0, 110, 68}, {0, 110, 69},
        {0, 110, 70}, {0, 110, 71}, {0, 110, 72}, {0, 110, 521}, {0, 110, 525},
        {0, 110, 529}
    }

    --------------------------------
    if GetTranslifeCount() <= 0 then
        Talk(1, "", szNpcName .. "Ban chua chuyen sinh?")
        return
    end
    -- if GetTask(336) < 100 then
    --     Talk(1, "", szNpcName ..
    --         "CÇn 100 ®iÓm S­ M«n ®Ó nhËn l�iv�t ph�m.")
    --     return
    -- end
    -- if gf_JudgeRoomWeight(5, 300, szNpcName) == 0 then
    --     return
    -- end

    BigDelItem(2, 0, 30002, BigGetItemCount(2, 0, 30002))
    BigDelItem(2, 0, 30003, BigGetItemCount(2, 0, 30003))
    BigDelItem(2, 0, 30005, BigGetItemCount(2, 0, 30005))
    BigDelItem(2, 0, 30006, BigGetItemCount(2, 0, 30006))
    local nTransCount = GetTranslifeCount()
    local nType = GetTranslifeFaction()
    ---------chuyÓn sinh 6
    if GetPlayerRebornParam(0) == 1 then
        local nType_cs6 = GetPlayerRebornParam(1)
        local nBody = GetBody()
        gf_AddItemEx(tb_translife_seal_cs6[nType_cs6][2],
            tb_translife_seal_cs6[nType_cs6][1])
        -- if GetLevel() < 79 then
        --   Talk(1, "",
        --      "��i hiÖp ch­a ®ñ yªu cÇu ®Ó nhËn l�itrang b�")
        -- return
        -- end
        -- SetTask(336, GetTask(336) - 100)
        -- Msg2Player("B¹n b� trõ 100 ®iÓm s­ m«n.")
        --	local nType_cs6 = GetPlayerRebornParam(1) -- xãa trang bi CS6
        --	local nBody_cs6 = GetBody()
        for i = 1, getn(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody]) do
            local G, D, P, nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3 =
                gf_UnPack(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][i])
            -- P = P + GetBody() - 1
            lvatt3 = lvatt3 or 0
            att3 = att3 or 0
            BigDelItem(G, D, P, BigGetItemCount(G, D, P))
        end
        for i = 1, 3 do
            gf_AddItemEx(tb_translife_cloth_cs6_nhanlai[nType_cs6][nBody][i],
                "Nh�n l�itrang b�")
        end
        for i = 1, getn(tb_translife_cloth[nType][nTransCount]) do
            local G, D, P, nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3 =
                gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
            P = P + GetBody() - 1
            lvatt3 = lvatt3 or 0
            att3 = att3 or 0
            BigDelItem(G, D, P, BigGetItemCount(G, D, P))
            --	gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
        end
        Talk(1,"","��y l� nh�ng v�y qu� gi�, l�n sau c�n th�n ko �� m�t n�a ��y!")	
		WriteLogEx("Chuyen Sinh","nh�n l�i �n v� ngo�i trang chuy�n sinh theo h��ng "..tb_translife_seal[nType_cs6][3])	
        return
    end
    ---------chuyÓn sinh 7
    if GetPlayerRebornParam(0) == 2 then
        local nType_cs7 = GetPlayerRebornParam(1)
        local nBody = GetBody()
        gf_AddItemEx(tb_translife_seal_cs6[nType_cs7][2],
            tb_translife_seal_cs6[nType_cs7][1])
        if GetLevel() < 79 then
            Talk(1,"","��i hi�p ch�a �� y�u c�u �� nh�n l�i trang b�")	
            return
        end
        -- SetTask(336, GetTask(336) - 100)
        -- Msg2Player("B¹n b� trõ 100 ®iÓm s­ m«n.")
        --	local nType_cs6 = GetPlayerRebornParam(1) -- xãa trang bi CS6
        --	local nBody_cs6 = GetBody()
        for i = 1, getn(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody]) do
            local G, D, P, nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3 =
                gf_UnPack(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i])
            -- P = P + GetBody() - 1
            lvatt3 = lvatt3 or 0
            att3 = att3 or 0
            BigDelItem(G, D, P, BigGetItemCount(G, D, P))
        end
        for i = 1, 3 do
            gf_AddItemEx(tb_translife_cloth_cs7_nhanlai[nType_cs7][nBody][i],
                "Nh�n l�i trang b�")
        end
        for i = 1, getn(tb_translife_cloth[nType][nTransCount]) do
            local G, D, P, nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3 =
                gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
            P = P + GetBody() - 1
            lvatt3 = lvatt3 or 0
            att3 = att3 or 0
            BigDelItem(G, D, P, BigGetItemCount(G, D, P))
            --	gf_AddItemEx({G, D, P, nCount,1, lvatt1, att1, lvatt2, att2, lvatt3, att3},tb_translife_cloth[nType][nTransCount][i][1])
        end
        Talk(1,"","��y l� nh�ng v�y qu� gi�, l�n sau c�n th�n ko �� m�t n�a ��y!")	
		WriteLogEx("Chuyen Sinh","nh�n l�i �n v� ngo�i trang chuy�n sinh 7 theo h��ng "..tb_translife_seal[nType_cs6][3])		
        return
    end
    ---------------
    gf_AddItemEx(tb_translife_seal[nType][2], tb_translife_seal[nType][1])
    for i = 1, getn(tb_translife_cloth[nType][nTransCount]) do
        local G, D, P, nCount, _, lvatt1, att1, lvatt2, att2, lvatt3, att3 =
            gf_UnPack(tb_translife_cloth[nType][nTransCount][i][2])
        P = P + GetBody() - 1
        lvatt3 = lvatt3 or 0
        att3 = att3 or 0
        BigDelItem(G, D, P, BigGetItemCount(G, D, P))
        gf_AddItemEx({
            G, D, P, nCount, 1, lvatt1, att1, lvatt2, att2, lvatt3, att3
        }, tb_translife_cloth[nType][nTransCount][i][1])
    end
    -- SetTask(336, GetTask(336) - 100)
    -- Msg2Player("B¹n b� trõ 100 ®iÓm s­ m«n.")
    Talk(1,"",szNpcName.."��y l� nh�ng v�y qu� gi�, l�n sau c�n th�n ko �� m�t n�a ��y!")	
	WriteLogEx("Chuyen Sinh","nh�n l�i �n v� ngo�i trang chuy�n sinh l�n "..nTransCount.." theo h��ng "..tb_translife_seal[nType][3])	
end
function go_exit()
    ExitGame()
end


