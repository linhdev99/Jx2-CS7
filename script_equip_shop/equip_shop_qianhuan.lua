--�ű����ܣ�
--�����̵���ڶԻ�

Include("\\script\\equip_shop\\equip_shop_head.lua")

function ShowQianHuanGroup(nKind)
	local sTitle,tbSay;
	if nKind == 1 then
		sTitle = "H�y l�a ch�n ph��ng th�c ��i";
		tbSay = {
			"Thi�n Huy�n c�p 1 ��i U�n Linh ��u kh�i/#show_equip_shop(3013)",
			"Thi�n Huy�n c�p 1 ��i U�n Linh y/#show_equip_shop(3014)",
			"Thi�n Huy�n c�p 1 ��i U�n Linh h� y/#show_equip_shop(3015)",
			"Kh�ng c�n ��u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
	if nKind == 2 then
		sTitle = "H�y l�a ch�n ph��ng th�c ��i";
		tbSay = {
			"Thi�n Huy�n c�p 2 ��i U�n Linh ��u kh�i/#show_equip_shop(3016)",
			"Thi�n Huy�n c�p 2 ��i U�n Linh y/#show_equip_shop(3017)",
			"Thi�n Huy�n c�p 2 ��i U�n Linh h� y/#show_equip_shop(3018)",
			"Kh�ng c�n ��u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
	if nKind == 3 then
		sTitle = "H�y l�a ch�n ph��ng th�c ��i";
		tbSay = {
			"Thi�n Huy�n c�p 3 ��i U�n Linh ��u kh�i/#show_equip_shop(3019)",
			"Thi�n Huy�n c�p 3 ��i U�n Linh y/#show_equip_shop(3020)",
			"Thi�n Huy�n c�p 3 ��i U�n Linh h� y/#show_equip_shop(3021)",
			"Kh�ng c�n ��u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
end

function do_nothing()
--do nothing
end