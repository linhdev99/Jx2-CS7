-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonlineII »Æ½ğÉÌÈË½Å±¾
-- Edited by Ally
-- 2011/08/01

-- ======================================================
Include("\\script\\equip_shop\\equip_shop_head.lua")
function main()
	do return end
	Say("<color=yellow>Tô B¶o Th­¬ng Nh©n: <color>Ta võa mang vÒ nh÷ng vËt phÈm hÊp dÉn ®©y, vµo xem nµo!",
			2,
			"§­îc, ta muèn xem/yes_open",
			"Kh«ng, ta chØ ®i ngang qua ®©y th«i/no_open"
		);
	return nil;
end

function yes_open()
	--OpenEquipShop(1, "Untitled");
	show_equip_shop(1);
end

function no_open()
end

