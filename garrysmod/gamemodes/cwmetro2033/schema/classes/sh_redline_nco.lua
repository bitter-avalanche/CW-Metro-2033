--[[
	� CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Red Line - Non-Commissioned Officer");
	CLASS.color = Color(255, 99, 99, 255);
	CLASS.factions = {FACTION_REDLINE_MIL};
	CLASS.wagesName = "Wages";
	CLASS.description = "A soldier of the Red Line.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_REDLINE_CO = CLASS:Register();