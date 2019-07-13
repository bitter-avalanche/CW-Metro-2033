--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Red Line - Dweller");
	CLASS.color = Color(181, 184, 189, 255);
	CLASS.factions = {FACTION_REDLINE};
	CLASS.isDefault = true;
	CLASS.wagesName = "Supplies";
	CLASS.description = "A dweller of the Red Line.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_REDLINE_DWELLER = CLASS:Register();