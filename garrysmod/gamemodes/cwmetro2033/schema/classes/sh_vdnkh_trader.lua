--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Trader");
	CLASS.color = Color(7, 71, 173, 255);
	CLASS.factions = {FACTION_VDNKH};
	CLASS.wagesName = "Wages";
	CLASS.description = "A trader of the Commonwealth.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_VDNKH_TRADER = CLASS:Register();