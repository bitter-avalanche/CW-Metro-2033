--[[
	� CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local FACTION = Clockwork.faction:New("Spartan Rangers");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "hl2rp2/factions/citizen";
FACTION.startingInv = {
	["handheld_radio"] = 1
}
FACTION.ranks = {
	["Private"] = {
		position = 11,
		class = "Rangers - Initiate",
		model = "",
		displayRank = true
	},
	["Private First Class"] = {
		position = 10,
		class = "Rangers - Initiate",
		model = "",
		displayRank = true
	},
	["Junior Sergeant"] = {
		position = 9,
		class = "Rangers - Initiate",
		model = "",
		displayRank = true
	},
	["Sergeant"] = {
		position = 8,
		class = "Rangers - Hunter",
		model = "",
		displayRank = true
	},
	["Staff Sergeant"] = {
		position = 7,
		class = "Rangers - Hunter",
		model = "",
		displayRank = true
	},
	["Junior Lieutenant"] = {
		position = 6,
		class = "Rangers - Hunter",
		model = "",
		displayRank = true
	},
	["Senior Lieutenant"] = {
		position = 5,
		class = "Rangers - Hunter",
		model = "",
		displayRank = true
	},
	["Captain"] = {
		position = 4,
		class = "Rangers - Veteran",
		model = "",
		canPromote = 9,
		canDemote = 8,
		displayRank = true
	},
	["Major"] = {
		position = 3,
		class = "Rangers - Veteran",
		model = "",
		canPromote = 8,
		canDemote = 7,
		displayRank = true
	},
	["Lieutenant Colonel"] = {
		position = 2,
		class = "Rangers - Veteran",
		model = "",
		canPromote = 7,
		canDemote = 6,
		displayRank = true
	},
	["Colonel"] = {
		position = 1,
		class = "Rangers - Veteran",
		model = "",
		canPromote = 6,
		canDemote = 5,
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

FACTION_SPARTANS = FACTION:Register();
