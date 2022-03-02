--½Å±¾¹¦ÄÜ£º
--´ú±ÒÉÌµêÈë¿Ú¶Ô»°

Include("\\script\\equip_shop\\equip_shop_head.lua")

function ShowQianHuanGroup(nKind)
	local sTitle,tbSay;
	if nKind == 1 then
		sTitle = "H·y lùa chän ph­¬ng thøc ®æi";
		tbSay = {
			"Thiªn HuyÔn cÊp 1 ®æi UÈn Linh ®Çu khèi/#show_equip_shop(3013)",
			"Thiªn HuyÔn cÊp 1 ®æi UÈn Linh y/#show_equip_shop(3014)",
			"Thiªn HuyÔn cÊp 1 ®æi UÈn Linh h¹ y/#show_equip_shop(3015)",
			"Kh«ng cÇn ®©u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
	if nKind == 2 then
		sTitle = "H·y lùa chän ph­¬ng thøc ®æi";
		tbSay = {
			"Thiªn HuyÔn cÊp 2 ®æi UÈn Linh ®Çu khèi/#show_equip_shop(3016)",
			"Thiªn HuyÔn cÊp 2 ®æi UÈn Linh y/#show_equip_shop(3017)",
			"Thiªn HuyÔn cÊp 2 ®æi UÈn Linh h¹ y/#show_equip_shop(3018)",
			"Kh«ng cÇn ®©u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
	if nKind == 3 then
		sTitle = "H·y lùa chän ph­¬ng thøc ®æi";
		tbSay = {
			"Thiªn HuyÔn cÊp 3 ®æi UÈn Linh ®Çu khèi/#show_equip_shop(3019)",
			"Thiªn HuyÔn cÊp 3 ®æi UÈn Linh y/#show_equip_shop(3020)",
			"Thiªn HuyÔn cÊp 3 ®æi UÈn Linh h¹ y/#show_equip_shop(3021)",
			"Kh«ng cÇn ®©u/do_nothing",
		};
		Say(sTitle,getn(tbSay),tbSay);
	end
end

function do_nothing()
--do nothing
end