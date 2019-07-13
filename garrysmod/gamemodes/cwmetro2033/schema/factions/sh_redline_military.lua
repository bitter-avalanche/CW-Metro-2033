--[[
	� CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Red Line - Military");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "hl2rp2/factions/citizen";
FACTION.startingInv = {
	["handheld_radio"] = 1
}

FACTION.models = {
	female = {
		"models/arx/redline/red_line_soldier_2.mdl"
	},
	male = {
		"models/arx/redline/red_line_soldier_2.mdl"
	};
};

FACTION.ranks = {
	["Private"] = {
		position = 12,
		class = "Red Line - Enlisted",
		model = "models/arx/redline/red_line_soldier_2.mdl",
		displayRank = true
	},
	["Private First Class"] = {
		position = 11,
		class = "Red Line - Enlisted",
		model = "models/arx/redline/red_line_soldier_2.mdl",
		displayRank = true
	},
	["Junior Sergeant"] = {
		position = 10,
		class = "Red Line - Enlisted",
		model = "models/arx/redline/red_line_soldier_2.mdl",
		displayRank = true
	},
	["Sergeant"] = {
		position = 9,
		class = "Red Line - Non-Commissioned Officer",
		model = "models/arx/redline/red_line_soldier_2.mdl",
		displayRank = true
	},
	["Staff Sergeant"] = {
		position = 8,
		class = "Red Line - Non-Commissioned Officer",
		model = "models/arx/redline/red_line_soldier_2.mdl",
		displayRank = true
	},
	["Junior Lieutenant"] = {
		position = 7,
		class = "Red Line - Commissioned Officer",
		model = "models/arx/redline/red_line_soldier_6.mdl",
		displayRank = true
	},
	["Senior Lieutenant"] = {
		position = 6,
		class = "Red Line - Commissioned Officer",
		model = "models/arx/redline/red_line_soldier_6.mdl",
		displayRank = true
	},
	["Captain"] = {
		position = 5,
		class = "Red Line - Commissioned Officer",
		model = "models/arx/redline/red_line_soldier_3.mdl",
		canPromote = 9,
		canDemote = 8,
		displayRank = true
	},
	["Major"] = {
		position = 4,
		class = "Red Line - Commissioned Officer",
		model = "models/arx/redline/red_line_soldier_3.mdl",
		canPromote = 8,
		canDemote = 7,
		displayRank = true
	},
	["Lieutenant Colonel"] = {
		position = 3,
		class = "Red Line - Commissioned Officer",
		model = "models/arx/redline/red_line_officer_5.mdl",
		canPromote = 7,
		canDemote = 6,
		displayRank = true
	},
	["Colonel"] = {
		position = 2,
		class = "Red Line - Commissioned Officer",
		model = "models/arx/redline/red_line_officer_4.mdl",
		canPromote = 6,
		canDemote = 5,
		displayRank = true
	},
	["Major General"] = {
		position = 1,
		class = "Red Line - Commissioned Officer",
		model = "models/arx/redline/red_line_offcier_1.mdl",
		canPromote = 3,
		canDemote = 2,
		displayRank = true
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

FACTION_REDLINE_MIL = FACTION:Register();
