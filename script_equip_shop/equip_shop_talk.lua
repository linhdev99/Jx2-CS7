--�ű����ܣ�
--�����̵���ڶԻ�

Include("\\script\\equip_shop\\equip_shop_head.lua")
Include("\\script\\system_switch_config.lua")

function OnOpenShopGroup1()
	local szTitle = format("H�y l�a ch�n ph��ng th�c ��i")
	local strtab = {}
	tinsert(strtab,"\n T� B�o Th��ng Nh�n C� Linh Th�ch /OnOpenShops_GuLingShi");
	tinsert(strtab,"\n T� B�o Th��ng Nh�n C� Linh Ng�c /OnOpenShops_GuLingYu");
	if IsTongTianHuanJingMissionSystemOpen() == 1 then
		tinsert(strtab,"\n T� B�o Th��ng Nh�n Thi�n M�n Kim L�nh /OnOpenShops_TianMenJinLing");
	end
	tinsert(strtab,"\n r�t lui/nothing");
	
	Say(szTitle, getn(strtab), strtab)

end

--����ʯ�һ�
function OnOpenShops_GuLingShi()
	local szTitle = format("H�y l�a ch�n ph��ng th�c ��i")
	local strtab = {
			"\n Ti�m t�p h�a C� Linh Th�ch /#show_equip_shop(3001)",
			"\n ��i S� M�n b� 4/#show_equip_shop(3)",
			"\n ��i S� M�n b� 5/#show_equip_shop(6)",
			"\n ��i U�n Linh c�p 1 /OpenLevel1WenShiShops",
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)
end

--һ�����ζһ�
function OpenLevel1WenShiShops()
		local szTitle = format("Vui l�ng ch�n b� ph�n V�n Linh")
	local strtab = {
			"\n ��i U�n Linh ��u qu�n c�p 1/#show_equip_shop(3004)",
			"\n ��i U�n Linh y ph�c c�p 1/#show_equip_shop(3005)",
			"\n ��i U�n Linh h� y c�p 1/#show_equip_shop(3006)",
			"\n Ph�n h�i/OnOpenShops_GuLingShi",
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)

end

function OnOpenShops_GuLingYu()
	local szTitle = format("H�y l�a ch�n ph��ng th�c ��i")
	local strtab = {
			"\nTi�m T�p h�a C� Linh Ng�c/#show_equip_shop(3002)",
			"\n ��i trang b� C� Linh Ng�c H�o Nguy�t/#show_equip_shop(10)",
			"\n ��i U�n Linh c�p 2/OpenLevel2WenShiShops",
			"\n ��i U�n Linh c�p 3/OpenLevel3WenShiShops",
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)

end

--�������ζһ�
function OpenLevel2WenShiShops()
	local szTitle = format("Vui l�ng ch�n b� ph�n V�n Linh")
	local strtab = {
			"\n ��i U�n Linh ��u qu�n c�p 2/#show_equip_shop(3007)",
			"\n ��i U�n Linh y ph�c c�p 2/#show_equip_shop(3008)",
			"\n ��i U�n Linh h� y c�p 2/#show_equip_shop(3009)",
			"\n Ph�n h�i/OnOpenShops_GuLingYu",
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)

end

--�������ζһ�
function OpenLevel3WenShiShops()
	local szTitle = format("Vui l�ng ch�n b� ph�n V�n Linh")
	local strtab = {
			"\n ��i U�n Linh ��u qu�n c�p 3/#show_equip_shop(3010)",
			"\n ��i U�n Linh y ph�c c�p 3/#show_equip_shop(3011)",
			"\n��i U�n Linh Kh� c�p 3/#show_equip_shop(3012)",
			"\n Ph�n h�i/OnOpenShops_GuLingYu",
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)

end

function OnOpenShops_TianMenJinLing()
	local szTitle = format("H�y l�a ch�n ph��ng th�c ��i")
	local strtab = {
			"\nTi�m T�p h�a Thi�n M�m Kim L�nh/#show_equip_shop(3003)",
			"\n ��i trang b� Th�ng Thi�n Di�u D��ng/#show_equip_shop(13)",
	};
	
	--�¾�ҫ�������װ���һ�
	local nDate = tonumber(date("%Y%m%d%H"));
	if nDate >= 2012101200 and nDate < 2012111200 then
		tinsert(strtab, "\n��i trang b� H�o Nguy�n, Di�u D��ng (t� 12 th�ng 10 ��n 11 th�ng 11)/#show_equip_shop(3025)");
	end 
	
	tinsert(strtab, "\n r�t lui/nothing");
	Say(szTitle, getn(strtab), strtab)

end

--�������ζһ�
function OpenLeihuJingPoShops()
	local szTitle = format("Vui l�ng ch�n b� ph�n V�n Linh")
	local strtab = {
			"\n c�a hi�u qu�n ph�c L�i H�/#show_equip_shop(3038)",
			"\n r�t lui/nothing",
	};
	Say(szTitle, getn(strtab), strtab)

end

function nothing()
end

