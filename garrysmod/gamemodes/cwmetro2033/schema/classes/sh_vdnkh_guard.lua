--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Guard");
	CLASS.color = Color(104, 153, 232, 255);
	CLASS.factions = {FACTION_VDNKH};
	CLASS.wagesName = "Wages";
	CLASS.description = "A guard of the VDNKh Commonwealth.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_VDNKH_GUARD = CLASS:Register();