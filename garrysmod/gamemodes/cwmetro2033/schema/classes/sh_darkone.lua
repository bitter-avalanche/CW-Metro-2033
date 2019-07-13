--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Dark One");
	CLASS.color = Color(35, 166, 48, 255);
	CLASS.factions = {FACTION_DARKONE};
	CLASS.isDefault = true;
	CLASS.description = "A mutant of the surface.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_DARKONE = CLASS:Register();