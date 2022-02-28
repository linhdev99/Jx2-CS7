Include("\\settings\\static_script\\cheat\\task\\list.lua");

--Setting
Max_Event = 2000;

--List
Event_List = {
	--Th�ng 1
	[1] = {
		["name"] = "T�t Nguy�n ��n",
		["item"] = {
			{"L� Dong", {2,1,30619}},
			{"��u Xanh Nh�n Th�t", {2,1,30620}},
		},
		["final_item"] = {
			{"B�nh Ch�ng", 70, {2,1,30621,1},0, TASK_MOD.ITEM_T1_1},
			{"B�nh T�t", 30, {2,1,30622,1},0, TASK_MOD.ITEM_T1_2}
		}
	},
	--Th�ng 2
	[2] = {
		["name"] = "L� H�i T�nh Nh�n",
		["item"] = {
			{"Cacao Nguy�n Ch�t", {2,1,30628}},
			{"S�a Tinh Tr�ng", {2,1,30629}},
		},
		["final_item"] = {
			{"Chocolare Chips Muffin", 70, {2,1,30630,1},0, TASK_MOD.ITEM_T2_1},
			{"Dark Chocolate", 30, {2,1,30631,1},0, TASK_MOD.ITEM_T2_2},
		}
	},
	--Th�ng 3
	[3] = {
		["name"] = "Qu�c T� Ph� N� 8/3",
		["item"] = {
			{"Gi�y B�ng Ki�ng", {2,1,30632}},
			{"B�a C�ng", {2,1,30633}}
		},
		["final_item"] = {
			{"Qu� 8/3", 70, {2,1,30634,1},0, TASK_MOD.ITEM_T3_1},
			{"Hoa 8/3", 30, {2,1,30635,1},0, TASK_MOD.ITEM_T3_2},
		}
	},
	--Th�ng 4
	[4] = {
		["name"] = "H�c B�ch Chi�n K�",
		["item"] = {
			{"Gi�y Ng� S�c", {2,1,30637}},
			{"H� Keo", {2,1,30638}}
		},
		["final_item"] = {
			{"B�ch K�", 70, {2,1,30639,1},0, TASK_MOD.ITEM_T4_1},
			{"H�c K�", 30, {2,1,30640,1},0, TASK_MOD.ITEM_T4_2},
		}
	},
	--Th�ng 5
	[5] = {
		["name"] = "H��ng N�ng M�a H�",
		["item"] = {
			{"D�u T��i", {2,1,30645}},
			{"B�c H�", {2,1,30646}}
		},
		["final_item"] = {
			{"Sero D�u T��i", 70, {2,1,30647,1},0, TASK_MOD.ITEM_T5_1},
			{"Sero B�c H�", 30, {2,1,30648,1},0, TASK_MOD.ITEM_T5_2},
		}
	},
	--Th�ng 6
	[6] = {
		["name"] = "T�t Thi�u Nhi",
		["item"] = {
			{"M�t Ong", {2,1,30660}},
			{"Tr�i C�y", {2,1,30661}}
		},
		["final_item"] = {
			{"K�o D�o Tr�i C�y", 70, {2,1,30662,1},0, TASK_MOD.ITEM_T6_1},
			{"K�o D�o Chip Chip", 30, {2,1,30663,1},0, TASK_MOD.ITEM_T6_2},
		}
	},
	--Th�ng 7
	[7] = {
		["name"] = "Tr�i C�y M�a H�",
		["item"] = {
			{"Gi� Tr�i C�y", {2,1,30550}},
			{"S�a Ti�t Tr�ng", {2,1,30551}}
		},
		["final_item"] = {
			{"Sinh T� Th�p C�m", 70, {2,1,30552,1},0, TASK_MOD.ITEM_T6_1},
			{"Tr�i C�y D�m", 30, {2,1,30553,1},0, TASK_MOD.ITEM_T6_2},
		}
	},
	--Th�ng 8
	[8] = {
		["name"] = "M�ng L� Vu Lan",
		["item"] = {
			{"H�t Sen", {2,1,30706}},
			{"Hoa Sen", {2,1,30705}}
		},
		["final_item"] = {
			{"Ch� H�t Sen", 70, {2,1,30709,1},0, TASK_MOD.ITEM_T8_1},
			{"B�nh L� Sen", 30, {2,1,30708,1},0, TASK_MOD.ITEM_T8_2},
		}
	},
	--Th�ng 9
	[9] = {
		["name"] = "Vui H�i Tr�ng R�m",
		["item"] = {
			{"D�ng C� L�m ��n", {2,1,30718}},
			{"Gi�y Ki�ng M�u", {2,1,30717}}
		},
		["final_item"] = {
			{"L�ng ��n ��", 70, {2,1,30719,1},0, TASK_MOD.ITEM_T9_1},
			{"L�ng ��n T�m", 30, {2,1,30720,1},0, TASK_MOD.ITEM_T9_2},
		}
	},
	--Th�ng 10
	[10] = {
		["name"] = "Ng�y Ph� N� Vi�t Nam 20/10",
		["item"] = {
			{"D�ng C� G�i Hoa", {2,1,30735}},
			{"Hoa H�ng", {2,1,30736}}
		},
		["final_item"] = {
			{"��a H�ng ��", 70, {2,1,30737,1},0, TASK_MOD.ITEM_T10_1},
			{"��a H�ng V�ng", 30, {2,1,30738,1},0, TASK_MOD.ITEM_T10_2},
		}
	},
	--Th�ng 11
	[11] = {
		["name"] = "Ng�y Nh� Gi�o Vi�t Nam",
		["item"] = {
			{"N�p Tranh", {2,1,30741}},
			{"Nghi�n M�c", {2,1,30742}}
		},
		["final_item"] = {
			{"Tranh Th� Ph�p", 70, {2,1,30743,1},0, TASK_MOD.ITEM_T11_1},
			{"Tranh Th� Ph�p ��c Bi�t", 30, {2,1,30744,1},0, TASK_MOD.ITEM_T11_2},
		}
	},
	--Th�ng 12
	[12] = {
		["name"] = "Noel",
		["item"] = {
			{"Tuy�t Tr�ng", {2,1,30756}},
			{"H�p Trang Tr�", {2,1,30757}}
		},
		["final_item"] = {
			{"H�p Tuy�t Gi�ng Sinh", 70, {2,1,30758,1},0, TASK_MOD.ITEM_T12_1},
			{"Ng��i Tuy�t", 30, {2,1,30759,1},0, TASK_MOD.ITEM_T12_2},
		}
	},
}






