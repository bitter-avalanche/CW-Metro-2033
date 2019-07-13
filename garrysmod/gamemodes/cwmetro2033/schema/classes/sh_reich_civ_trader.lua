--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Reich - Trader");
	CLASS.color = Color(181, 184, 189, 255);
	CLASS.factions = {FACTION_REICH};
	CLASS.wagesName = "Wages";
	CLASS.description = "A trader of the Reich.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_REICH_TRADER = CLASS:Register();