--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Doctor");
	CLASS.color = Color(86, 126, 194, 255);
	CLASS.factions = {FACTION_VDNKH};
	CLASS.wagesName = "Wages";
	CLASS.description = "A doctor of the VDNKh Commonwealth.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_VDNKH_DOCTOR = CLASS:Register();