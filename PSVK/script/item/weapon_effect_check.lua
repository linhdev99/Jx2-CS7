-- ½Å±¾Ãû³Æ£ºÁéÆÇ¿ªÆô½Å±¾
-- ½Å±¾¹¦ÄÜ£ºµã»÷ÁéÆÇ¿ªÆôµÄ»Øµ÷½Å±¾£¬Ö÷ÒªÓÃÓÚ¿ªÆôÌõ¼şµÄÅĞ¶Ï
-- ´úÂë¿ª·¢ÈË£ºÁõÓî±ó
-- ´úÂë¿ª·¢Ê±¼ä£º2010-3-23
-- ´úÂëĞŞ¸Ä¼ÇÂ¼£º
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\weaponeffect\\ling_add_main.lua")
Include("\\script\\lib\\globalfunctions.lua")

function main(aptitude_name)
    if aptitude_name == "·÷Ïş" or aptitude_name == "ÆÆÏş" or aptitude_name == "TuÊn DËt" or aptitude_name ==
        "Ch­íc NhËt" or aptitude_name == "B¸ch ChiÕn" or aptitude_name == "eff16" or aptitude_name == "eff17" or
        aptitude_name == "eff18" or aptitude_name == "eff19" or aptitude_name == "eff20" or aptitude_name == "eff21" or
        aptitude_name == "eff22" or aptitude_name == "eff23" or aptitude_name == "eff24" or aptitude_name == "eff25" or
        aptitude_name == "eff26" or aptitude_name == "eff27" or aptitude_name == "eff28" or aptitude_name == "eff29" or
        aptitude_name == "eff30" or aptitude_name == "eff31" or aptitude_name == "eff32" or aptitude_name == "eff33" or
        aptitude_name == "eff34" or aptitude_name == "eff35" or aptitude_name == "eff36" or aptitude_name == "eff37" or
        aptitude_name == "eff38" or aptitude_name == "eff39" or aptitude_name == "eff40" or aptitude_name == "eff41" or
        aptitude_name == "eff42" then
        if GetLevel() < 73 or gf_Check55MaxSkill() == 0 then
            Talk(1, "",
                "<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>" ..
                    aptitude_name ..
                    "<color>. C¸c h¹ cÇn ph¶i ®¹t ®¼ng cÊp 73 trë lªn vµ th«ng th¹o kü n¨ng cÊp 55.")
            return 1
        else
            return 1
        end
    end
    if aptitude_name == "Hµo m«n" or --
    aptitude_name == "§o¹n Giao" or --
    aptitude_name == "PhÇn V©n" or --
    aptitude_name == "Ph¸ Qu©n" then
        if GetItemCount(2, 0, 30002) < 1 and --
        GetItemCount(2, 0, 30003) < 1 and --
        GetItemCount(2, 0, 30005) < 1 and --
        GetItemCount(2, 0, 30006) < 1 then --
            Talk(1, "",
                "<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>" ..
                    aptitude_name .. "<color>. Kh«ng cã Ên tİn trong hµnh trang cña b¹n.")
            return 1
        end
    elseif aptitude_name == "L¹c Hµ" then
        if GetItemCount(2, 0, 30001) < 1 then
            Talk(1, "",
                "<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>" ..
                    aptitude_name .. "<color>. Kh«ng cã Vâ l©m thËp nhŞ sø trong hµnh trang cña b¹n.")
            return 1
        end
    else
        Talk(1, "",
            "<color=green>Nh¾c nhë<color>: HiÖn kh«ng thÓ ®¸p øng ®iÒu kiÖn kİch ho¹t Linh ph¸ch <color=yellow>" ..
                aptitude_name .. "<color>.")
        return 0
    end
    -- ÁéÆÇ¿ªÆôÌõ¼şÅĞ¶Ï
    return 1;
end
