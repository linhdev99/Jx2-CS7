-- ====================== �ļ���Ϣ ======================

-- ������ԵonlineII �ƽ����˽ű�
-- Edited by Ally
-- 2011/08/01

-- ======================================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
function main()
	do return end
	Say("<color=yellow>T� B�o Th��ng Nh�n: <color>Ta v�a mang v� nh�ng v�t ph�m h�p d�n ��y, v�o xem n�o!",
			2,
			"���c, ta mu�n xem/yes_open",
			"Kh�ng, ta ch� �i ngang qua ��y th�i/no_open"
		);
	return nil;
end

function yes_open()
	--OpenEquipShop(1, "Untitled");
	show_equip_shop(1);
end

function no_open()
end

