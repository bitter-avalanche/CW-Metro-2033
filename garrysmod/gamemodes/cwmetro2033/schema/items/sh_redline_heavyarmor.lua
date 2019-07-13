--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Red Line Heavy Armor";
ITEM.uniqueID = "redline_heavyarmor";
ITEM.weight = 5;
--ITEM.protection = 0.1; // Uncommented because I don't know if this is necessary. - Lion
ITEM.description = "A heavy suit of armor, for those preferring bulk and protection over stealth or speed.";
ITEM.replacement = "models/arx/redline/red_line_soldier_12.mdl";

--[[ Future note for armor values.
Protection:
- Head: 75
- Chest: 60
- Arms: 35
- Legs: 10

- Depletion happens by attack or the player taking damage while wearing the suit in the relevant zones.
--]]

ITEM:Register();