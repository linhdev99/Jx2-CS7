Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\equip_shop\\equip_shop_head.lua");

g_szTitle = "<color=green>L�a ch�n:  <color>"

List = {
	[31324] = {
		[1000] = {1000, "Ti�m T�ng Uy H� T��ng Qu�n"},
		[1001] = {1001, "Ti�m Li�u Uy H� T��ng Qu�n"},
		[1002] = {1002, "Ti�m T�ng Uy H� Nguy�n So�i"},
		[1003] = {1003, "Ti�m Li�u Uy H� Nguy�n So�i "},
	},
	[31325] = {
		[1000] = {1000, "Ti�m T�ng Uy H� T��ng Qu�n"},
		[1001] = {1001, "Ti�m Li�u Uy H� T��ng Qu�n"},
		[1002] = {1002, "Ti�m T�ng Uy H� Nguy�n So�i"},
		[1003] = {1003, "Ti�m Li�u Uy H� Nguy�n So�i "},
	},
	[31223] = {
		[1004] = {1004, "Ti�m T�ng Thanh Long T��ng Qu�n"},
		[1005] = {1005, "Ti�m Li�u Thanh Long T��ng Qu�n"},
		[1006] = {1006, "Ti�m T�ng Thanh Long Nguy�n So�i"},
		[1007] = {1007, "Ti�m Li�u Thanh Long Nguy�n So�i "},
	},
	[31224] = {
		[1004] = {1004, "Ti�m T�ng Thanh Long T��ng Qu�n"},
		[1005] = {1005, "Ti�m Li�u Thanh Long T��ng Qu�n"},
		[1006] = {1006, "Ti�m T�ng Thanh Long Nguy�n So�i"},
		[1007] = {1007, "Ti�m Li�u Thanh Long Nguy�n So�i "},
	}
}

function OnUse(nItemIndex)
	local nItem = GetItemParticular(nItemIndex)

	local tSay = {
	};
	
	for k, v in pairs(List[nItem]) do
		tinsert(tSay,""..v[2].."/#show_equip_shop("..v[1]..")");
	end
	
	tinsert(tSay, "\nRa Kh�i/nothing");
	Say(g_szTitle.."C�a H�ng", getn(tSay), tSay);	
end