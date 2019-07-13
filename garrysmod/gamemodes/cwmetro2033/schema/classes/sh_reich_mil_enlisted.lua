--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Reich - Enlisted");
	CLASS.color = Color(240, 214, 101, 255);
	CLASS.factions = {FACTION_REICH_MIL};
	CLASS.wagesName = "Wages";
	CLASS.description = "A soldier of the Fourth Reich.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_REICH_ENLISTED = CLASS:Register();