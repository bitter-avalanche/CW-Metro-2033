--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("clothes_base");

ITEM.name = "Red Line Medium Armor";
ITEM.uniqueID = "resistance_uniform";
ITEM.weight = 3;
--ITEM.protection = 0.1; // Uncommented because I don't know if this is necessary. - Lion
ITEM.description = "A medium suit of armor, for those who want to be allround.";
ITEM.replacement = "models/arx/redline/red_line_soldier_15.mdl";

--[[ Future note for armor values.
Protection:
- Head: 50
- Chest: 35
- Arms: 10
- Legs: 5

- Depletion happens by attack or the player taking damage while wearing the suit in the relevant zones.
--]]

ITEM:Register();