--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Reich - Non-Commissioned Officer");
	CLASS.color = Color(196, 165, 24, 255);
	CLASS.factions = {FACTION_REICH_MIL};
	CLASS.wagesName = "Wages";
	CLASS.description = "A soldier of the Fourth Reich.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_REICH_NCO = CLASS:Register();