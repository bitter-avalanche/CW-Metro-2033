--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Reich - Dweller");
	CLASS.color = Color(181, 184, 189, 255);
	CLASS.factions = {FACTION_REICH};
	CLASS.isDefault = true;
	CLASS.wagesName = "Supplies";
	CLASS.description = "A dweller of the Reich.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_REICH_DWELLER = CLASS:Register();