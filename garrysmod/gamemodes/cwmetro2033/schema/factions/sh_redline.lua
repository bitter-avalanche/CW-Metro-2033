--[[
	� CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Red Line");

FACTION.useFullName = true;
FACTION.material = "hl2rp2/factions/citizen";
FACTION.startingInv = {
	["cw_suitcase"] = 1
}
FACTION.ranks = {
	["Private"] = {
		position = 12,
		class = "Red Line - Enlisted",
		model = ""
	},
	["Private First Class"] = {
		position = 11,
		class = "Red Line - Enlisted",
		model = ""
	},
	["Junior Sergeant"] = {
		position = 10,
		class = "Red Line - Enlisted",
		model = ""
	},
	["Sergeant"] = {
		position = 9,
		class = "Red Line - Non-Commissioned Officer",
		model = ""
	},
	["Staff Sergeant"] = {
		position = 8,
		class = "Red Line - Non-Commissioned Officer",
		model = ""
	},
	["Junior Lieutenant"] = {
		position = 7,
		class = "Red Line - Commissioned Officer",
		model = ""
	},
	["Senior Lieutenant"] = {
		position = 6,
		class = "Red Line - Commissioned Officer",
		model = ""
	},
	["Captain"] = {
		position = 5,
		class = "Red Line - Commissioned Officer",
		model = "",
		canPromote = 9,
		canDemote = 8
	},
	["Major"] = {
		position = 4,
		class = "Red Line - Commissioned Officer",
		model = "",
		canPromote = 8,
		canDemote = 7
	},
	["Lieutenant Colonel"] = {
		position = 3,
		class = "Red Line - Commissioned Officer",
		model = "",
		canPromote = 7,
		canDemote = 6
	},
	["Colonel"] = {
		position = 2,
		class = "Red Line - Commissioned Officer",
		model = "",
		canPromote = 6,
		canDemote = 5
	},
	["Major General"] = {
		position = 1,
		class = "Red Line - Commissioned Officer",
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

FACTION_REDLINE = FACTION:Register();
