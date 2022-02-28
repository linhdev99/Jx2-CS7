Include("\\settings\\static_script\\cheat\\task\\list.lua");

--Setting
Max_Event = 2000;

--List
Event_List = {
	--Th¸ng 1
	[1] = {
		["name"] = "TÕt Nguyªn §¸n",
		["item"] = {
			{"L¸ Dong", {2,1,30619}},
			{"§Ëu Xanh Nh©n ThÞt", {2,1,30620}},
		},
		["final_item"] = {
			{"B¸nh Ch­ng", 70, {2,1,30621,1},0, TASK_MOD.ITEM_T1_1},
			{"B¸nh TÐt", 30, {2,1,30622,1},0, TASK_MOD.ITEM_T1_2}
		}
	},
	--Th¸ng 2
	[2] = {
		["name"] = "LÔ Héi T×nh Nh©n",
		["item"] = {
			{"Cacao Nguyªn ChÊt", {2,1,30628}},
			{"S÷a Tinh Trøng", {2,1,30629}},
		},
		["final_item"] = {
			{"Chocolare Chips Muffin", 70, {2,1,30630,1},0, TASK_MOD.ITEM_T2_1},
			{"Dark Chocolate", 30, {2,1,30631,1},0, TASK_MOD.ITEM_T2_2},
		}
	},
	--Th¸ng 3
	[3] = {
		["name"] = "Quèc TÕ Phô N÷ 8/3",
		["item"] = {
			{"GiÊy Bãng KiÓng", {2,1,30632}},
			{"B×a Cøng", {2,1,30633}}
		},
		["final_item"] = {
			{"Quµ 8/3", 70, {2,1,30634,1},0, TASK_MOD.ITEM_T3_1},
			{"Hoa 8/3", 30, {2,1,30635,1},0, TASK_MOD.ITEM_T3_2},
		}
	},
	--Th¸ng 4
	[4] = {
		["name"] = "H¾c B¹ch ChiÕn Kú",
		["item"] = {
			{"GiÊy Ngò S¾c", {2,1,30637}},
			{"Hå Keo", {2,1,30638}}
		},
		["final_item"] = {
			{"B¹ch Kú", 70, {2,1,30639,1},0, TASK_MOD.ITEM_T4_1},
			{"H¾c Kú", 30, {2,1,30640,1},0, TASK_MOD.ITEM_T4_2},
		}
	},
	--Th¸ng 5
	[5] = {
		["name"] = "H­¬ng N¾ng Mïa HÌ",
		["item"] = {
			{"D©u T­¬i", {2,1,30645}},
			{"B¹c Hµ", {2,1,30646}}
		},
		["final_item"] = {
			{"Sero D©u T­¬i", 70, {2,1,30647,1},0, TASK_MOD.ITEM_T5_1},
			{"Sero B¹c Hµ", 30, {2,1,30648,1},0, TASK_MOD.ITEM_T5_2},
		}
	},
	--Th¸ng 6
	[6] = {
		["name"] = "TÕt ThiÕu Nhi",
		["item"] = {
			{"MËt Ong", {2,1,30660}},
			{"Tr¸i C©y", {2,1,30661}}
		},
		["final_item"] = {
			{"KÑo DÎo Tr¸i C©y", 70, {2,1,30662,1},0, TASK_MOD.ITEM_T6_1},
			{"KÑo DÎo Chip Chip", 30, {2,1,30663,1},0, TASK_MOD.ITEM_T6_2},
		}
	},
	--Th¸ng 7
	[7] = {
		["name"] = "Tr¸i C©y Mïa HÌ",
		["item"] = {
			{"Giá Tr¸i C©y", {2,1,30550}},
			{"S÷a TiÖt Trïng", {2,1,30551}}
		},
		["final_item"] = {
			{"Sinh Tè ThËp CÈm", 70, {2,1,30552,1},0, TASK_MOD.ITEM_T6_1},
			{"Tr¸i C©y DÇm", 30, {2,1,30553,1},0, TASK_MOD.ITEM_T6_2},
		}
	},
	--Th¸ng 8
	[8] = {
		["name"] = "Mõng LÔ Vu Lan",
		["item"] = {
			{"H¹t Sen", {2,1,30706}},
			{"Hoa Sen", {2,1,30705}}
		},
		["final_item"] = {
			{"ChÌ H¹t Sen", 70, {2,1,30709,1},0, TASK_MOD.ITEM_T8_1},
			{"B¸nh L¸ Sen", 30, {2,1,30708,1},0, TASK_MOD.ITEM_T8_2},
		}
	},
	--Th¸ng 9
	[9] = {
		["name"] = "Vui Héi Tr¨ng R»m",
		["item"] = {
			{"Dông Cô Lµm §Ìn", {2,1,30718}},
			{"GiÊy KiÕng Mµu", {2,1,30717}}
		},
		["final_item"] = {
			{"Lång §Ìn §á", 70, {2,1,30719,1},0, TASK_MOD.ITEM_T9_1},
			{"Lång §Ìn TÝm", 30, {2,1,30720,1},0, TASK_MOD.ITEM_T9_2},
		}
	},
	--Th¸ng 10
	[10] = {
		["name"] = "Ngµy Phô N÷ ViÖt Nam 20/10",
		["item"] = {
			{"Dông Cô Gãi Hoa", {2,1,30735}},
			{"Hoa Hång", {2,1,30736}}
		},
		["final_item"] = {
			{"§ãa Hång §á", 70, {2,1,30737,1},0, TASK_MOD.ITEM_T10_1},
			{"§ãa Hång Vµng", 30, {2,1,30738,1},0, TASK_MOD.ITEM_T10_2},
		}
	},
	--Th¸ng 11
	[11] = {
		["name"] = "Ngµy Nhµ Gi¸o ViÖt Nam",
		["item"] = {
			{"NÑp Tranh", {2,1,30741}},
			{"Nghiªn Mùc", {2,1,30742}}
		},
		["final_item"] = {
			{"Tranh Th­ Ph¸p", 70, {2,1,30743,1},0, TASK_MOD.ITEM_T11_1},
			{"Tranh Th­ Ph¸p §Æc BiÖt", 30, {2,1,30744,1},0, TASK_MOD.ITEM_T11_2},
		}
	},
	--Th¸ng 12
	[12] = {
		["name"] = "Noel",
		["item"] = {
			{"TuyÕt Tr©ng", {2,1,30756}},
			{"Hép Trang TrÝ", {2,1,30757}}
		},
		["final_item"] = {
			{"Hép TuyÕt Gi¸ng Sinh", 70, {2,1,30758,1},0, TASK_MOD.ITEM_T12_1},
			{"Ng­êi TuyÕt", 30, {2,1,30759,1},0, TASK_MOD.ITEM_T12_2},
		}
	},
}






