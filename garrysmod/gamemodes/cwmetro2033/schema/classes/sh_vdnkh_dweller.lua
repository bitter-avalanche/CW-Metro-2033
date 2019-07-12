--[[
	© CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local CLASS = Clockwork.class:New("Dweller");
	CLASS.color = Color(181, 184, 189, 255);
	CLASS.factions = {FACTION_VDNKH};
	CLASS.isDefault = true;
	CLASS.wagesName = "Supplies";
	CLASS.description = "A dweller of the VDNKh Commonwealth.";
	CLASS.defaultPhysDesc = "Wearing dirty clothes.";
CLASS_VDNKH_DWELLER = CLASS:Register();