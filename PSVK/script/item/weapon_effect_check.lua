-- �ű����ƣ����ǿ����ű�
-- �ű����ܣ�������ǿ����Ļص��ű�����Ҫ���ڿ����������ж�
-- ���뿪���ˣ������
-- ���뿪��ʱ�䣺2010-3-23
-- �����޸ļ�¼��
Include("\\script\\online_activites\\reborn\\effect\\head.lua")
Include("\\script\\weaponeffect\\ling_add_main.lua")
Include("\\script\\lib\\globalfunctions.lua")

function main(aptitude_name)
    if aptitude_name == "����" or aptitude_name == "����" or aptitude_name == "Tu�n D�t" or aptitude_name ==
        "Ch��c Nh�t" or aptitude_name == "B�ch Chi�n" or aptitude_name == "eff16" or aptitude_name == "eff17" or
        aptitude_name == "eff18" or aptitude_name == "eff19" or aptitude_name == "eff20" or aptitude_name == "eff21" or
        aptitude_name == "eff22" or aptitude_name == "eff23" or aptitude_name == "eff24" or aptitude_name == "eff25" or
        aptitude_name == "eff26" or aptitude_name == "eff27" or aptitude_name == "eff28" or aptitude_name == "eff29" or
        aptitude_name == "eff30" or aptitude_name == "eff31" or aptitude_name == "eff32" or aptitude_name == "eff33" or
        aptitude_name == "eff34" or aptitude_name == "eff35" or aptitude_name == "eff36" or aptitude_name == "eff37" or
        aptitude_name == "eff38" or aptitude_name == "eff39" or aptitude_name == "eff40" or aptitude_name == "eff41" or
        aptitude_name == "eff42" then
        if GetLevel() < 73 or gf_Check55MaxSkill() == 0 then
            Talk(1, "",
                "<color=green>Nh�c nh�<color>: Hi�n kh�ng th� ��p �ng �i�u ki�n k�ch ho�t Linh ph�ch <color=yellow>" ..
                    aptitude_name ..
                    "<color>. C�c h� c�n ph�i ��t ��ng c�p 73 tr� l�n v� th�ng th�o k� n�ng c�p 55.")
            return 1
        else
            return 1
        end
    end
    if aptitude_name == "H�o m�n" or --
    aptitude_name == "�o�n Giao" or --
    aptitude_name == "Ph�n V�n" or --
    aptitude_name == "Ph� Qu�n" then
        if GetItemCount(2, 0, 30002) < 1 and --
        GetItemCount(2, 0, 30003) < 1 and --
        GetItemCount(2, 0, 30005) < 1 and --
        GetItemCount(2, 0, 30006) < 1 then --
            Talk(1, "",
                "<color=green>Nh�c nh�<color>: Hi�n kh�ng th� ��p �ng �i�u ki�n k�ch ho�t Linh ph�ch <color=yellow>" ..
                    aptitude_name .. "<color>. Kh�ng c� �n t�n trong h�nh trang c�a b�n.")
            return 1
        end
    elseif aptitude_name == "L�c H�" then
        if GetItemCount(2, 0, 30001) < 1 then
            Talk(1, "",
                "<color=green>Nh�c nh�<color>: Hi�n kh�ng th� ��p �ng �i�u ki�n k�ch ho�t Linh ph�ch <color=yellow>" ..
                    aptitude_name .. "<color>. Kh�ng c� V� l�m th�p nh� s� trong h�nh trang c�a b�n.")
            return 1
        end
    else
        Talk(1, "",
            "<color=green>Nh�c nh�<color>: Hi�n kh�ng th� ��p �ng �i�u ki�n k�ch ho�t Linh ph�ch <color=yellow>" ..
                aptitude_name .. "<color>.")
        return 0
    end
    -- ���ǿ��������ж�
    return 1;
end
