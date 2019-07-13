--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Reich - Commissioned Officer");
	CLASS.color = Color(255, 208, 0, 255);
	CLASS.factions = {FACTION_REICH_MIL};
	CLASS.wagesName = "Wages";
	CLASS.description = "A soldier of the Fourth Reich.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_REICH_CO = CLASS:Register();