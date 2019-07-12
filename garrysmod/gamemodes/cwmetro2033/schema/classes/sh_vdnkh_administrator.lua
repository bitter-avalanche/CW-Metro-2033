--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Administrator");
	CLASS.color = Color(17, 105, 247, 255);
	CLASS.factions = {FACTION_VDNKH};
	CLASS.wagesName = "Wages";
	CLASS.description = "A leader of the VDNKh Commonwealth.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_VDNKH_ADMIN = CLASS:Register();