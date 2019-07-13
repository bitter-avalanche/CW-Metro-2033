--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Red Line Light Armor";
ITEM.uniqueID = "redline_lightarmor";
ITEM.weight = 1;
--ITEM.protection = 0.1; // Uncommented because I don't know if this is necessary. - Lion
ITEM.description = "A light suit of armor, for those preferring stealth or speed over bulk and protection.";
ITEM.replacement = "models/arx/redline/red_line_soldier_1.mdl";

--[[ Future note for armor values.
Protection:
- Head: 25

- Depletion happens by attack or the player taking damage while wearing the suit in the relevant zones.
--]]

ITEM:Register();