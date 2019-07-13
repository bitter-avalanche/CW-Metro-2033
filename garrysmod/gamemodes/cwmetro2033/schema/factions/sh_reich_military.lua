--[[
	� CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Fourth Reich - Military");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "hl2rp2/factions/citizen";
FACTION.startingInv = {
	["handheld_radio"] = 1
}
FACTION.ranks = {
	["Schütze"] = {
		position = 12,
		class = "Reich - Enlisted",
		model = ""
	},
	["Oberschütze"] = {
		position = 11,
		class = "Reich - Enlisted",
		model = ""
	},
	["Sturmmann"] = {
		position = 10,
		class = "Reich - Non-Commissioned Officer",
		model = ""
	},
	["Rottenführer"] = {
		position = 9,
		class = "Reich - Non-Commissioned Officer",
		model = ""
	},
	["Unterscharführer"] = {
		position = 8,
		class = "Red Line - Commissioned Officer",
		model = ""
	},
	["Hauptscharführer"] = {
		position = 7,
		class = "Reich - Non-Commissioned Officer",
		model = ""
	},
	["Sturmscharführer"] = {
		position = 6,
		class = "Reich - Non-Commissioned Officer",
		model = ""
	},
	["Sturmbannführer"] = {
		position = 5,
		class = "Reich - Commissioned Officer",
		model = ""
	},
	["Obersturmbannführer"] = {
		position = 4,
		class = "Reich - Commissioned Officer",
		model = ""
	},
	["Oberführer"] = {
		position = 3,
		class = "Reich - Commissioned Officer",
		model = ""
	},
	["Brigadeführer"] = {
		position = 2,
		class = "Reich - Commissioned Officer",
		model = "",
		canPromote = 4,
		canDemote = 3
	},
	["Gruppenführer"] = {
		position = 1,
		class = "Reich - Commissioned Officer",
		model = "",
		canPromote = 3,
		canDemote = 2
	}
};
-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (Schema:PlayerIsCombine(player)) then
		if (name) then
			local models = self.models[ string.lower(player:QueryCharacter("gender")) ];
			
			if (models) then
				player:SetCharacterData("model", models[ math.random(#models) ], true);
				
				Clockwork.player:SetName(player, name, true);
			end;
		else
			return false, "You need to specify a name as the third argument!";
		end;
	end;
end;

FACTION_REICH_MIL = FACTION:Register();
