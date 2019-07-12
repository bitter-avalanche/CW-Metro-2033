--[[
	� CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]
-- The directory stuff has to be looked into. I don't know if I should be removing this - Lion.
Clockwork.kernel:AddFile("resource/fonts/vacersansregularpersonal.ttf");
Clockwork.kernel:AddFile("resource/fonts/mailartrubberstamp.ttf");
Clockwork.kernel:AddFile("resource/fonts/goldenageregular.ttf");
Clockwork.kernel:AddFile("resource/fonts/monofonto.ttf");

Clockwork.kernel:AddDirectory("materials/models/humans/female/group01/cityadm_sheet.*");
Clockwork.kernel:AddDirectory("materials/models/humans/male/group01/cityadm_sheet.*");
Clockwork.kernel:AddDirectory("models/humans/group17/*.mdl");
Clockwork.kernel:AddDirectory("models/police/*.mdl");
Clockwork.kernel:AddDirectory("materials/models/humans/female/group01/cityadm_sheet.*");
Clockwork.kernel:AddDirectory("materials/models/deadbodies/");
Clockwork.kernel:AddDirectory("materials/models/spraycan3.*");
Clockwork.kernel:AddDirectory("materials/models/police/*.*");
Clockwork.kernel:AddDirectory("materials/models/lagmite/");
Clockwork.kernel:AddDirectory("materials/hl2rp2/themes/grunge/");
Clockwork.kernel:AddDirectory("materials/hl2rp2/themes/plain/");
Clockwork.kernel:AddDirectory("materials/hl2rp2/icons/");
Clockwork.kernel:AddDirectory("materials/hl2rp2/factions/");
Clockwork.kernel:AddDirectory("materials/hl2rp2/infotext/");
Clockwork.kernel:AddDirectory("materials/hl2rp2/menuitems/");
Clockwork.kernel:AddDirectory("materials/hl2rp2/");
Clockwork.kernel:AddDirectory("models/lagmite/");
Clockwork.kernel:AddDirectory("models/deadbodies/");

Clockwork.config:Add("server_whitelist_identity", "");
Clockwork.config:Add("combine_lock_overrides", false);
Clockwork.config:Add("intro_text_small", "Where the tunnels hide secrets", true);
Clockwork.config:Add("intro_text_big", "MOSCOW METRO, 2033", true);
Clockwork.config:Add("knockout_time", 60);
Clockwork.config:Add("business_cost", 160, true);
Clockwork.config:Add("cwu_props", true);
Clockwork.config:Add("permits", true, true);
Clockwork.config:Add("dull_vision", true, true);

Clockwork.config:Get("enable_gravgun_punt"):Set(false);
Clockwork.config:Get("default_inv_weight"):Set(6);
Clockwork.config:Get("enable_crosshair"):Set(false);
Clockwork.config:Get("disable_sprays"):Set(false);
Clockwork.config:Get("prop_cost"):Set(false);
Clockwork.config:Get("door_cost"):Set(0);

-- A function to add a human hint.
function Clockwork.hint:AddHumanHint(name, text, combine)
	Clockwork.hint:Add(name, text, function(player)
		if (player) then
			return !Schema:PlayerIsCombine(player, combine);
		end;
	end);
end;

Clockwork.hint:AddHumanHint("HintLife", "HintLifeDesc", false);
Clockwork.hint:AddHumanHint("HintSleep", "HintSleepDesc", false);
Clockwork.hint:AddHumanHint("HintEating", "HintEatingDesc", false);
Clockwork.hint:AddHumanHint("HintFriends", "HintFriendsDesc", false);

Clockwork.hint:AddHumanHint("HintCurfew", "HintCurfewDesc");
Clockwork.hint:AddHumanHint("HintPrison", "HintPrisonDesc");
Clockwork.hint:AddHumanHint("HintRebels", "HintRebelsDesc");
Clockwork.hint:AddHumanHint("HintTalking", "HintTalkingDesc");
Clockwork.hint:AddHumanHint("HintRations", "HintRationsDesc");
Clockwork.hint:AddHumanHint("HintCombine", "HintCombineDesc");
Clockwork.hint:AddHumanHint("HintJumping", "HintJumpingDesc");
Clockwork.hint:AddHumanHint("HintPunching", "HintPunchingDesc");
Clockwork.hint:AddHumanHint("HintCompliance", "HintComplianceDesc");
Clockwork.hint:AddHumanHint("HintCombineRaids", "HintCombineRaidsDesc");
Clockwork.hint:AddHumanHint("HintRequestDevice", "HintRequestDeviceDesc");
Clockwork.hint:AddHumanHint("HintCivilProtection", "HintCivilProtectionDesc");

Clockwork.hint:Add("HintAdmins", "HintAdminsDesc");
Clockwork.hint:Add("HintAction", "HintActionDesc");
Clockwork.hint:Add("HintGrammar", "HintGrammarDesc");
Clockwork.hint:Add("HintRunning", "HintRunningDesc");
Clockwork.hint:Add("HintHealing", "HintHealingDesc");
Clockwork.hint:Add("HintF3Hotkey", "HintF3HotkeyDesc");
Clockwork.hint:Add("HintF4Hotkey", "HintF4HotkeyDesc");
Clockwork.hint:Add("HintAttributes", "HintAttributesDesc");
Clockwork.hint:Add("HintFirefights", "HintFirefightsDesc");
Clockwork.hint:Add("HintMetagaming", "HintMetagamingDesc");
Clockwork.hint:Add("HintPassiveRP", "HintPassiveRPDesc");
Clockwork.hint:Add("HintDevelopment", "HintDevelopmentDesc");
Clockwork.hint:Add("HintPowergaming", "HintPowergamingDesc");

Clockwork.datastream:Hook("ObjectPhysDesc", function(player, data)
	if (type(data) == "table" and type(data[1]) == "string") then
		if (player.objectPhysDesc == data[2]) then
			local physDesc = data[1];
			
			if (string.len(physDesc) > 80) then
				physDesc = string.sub(physDesc, 1, 80).."...";
			end;
			
			data[2]:SetNetworkedString("physDesc", physDesc);
		end;
	end;
end);

-- A function to load the NPCs.
function Schema:LoadNPCs()
	local npcs = Clockwork.kernel:RestoreSchemaData("plugins/npcs/"..game.GetMap());
	
	for k, v in pairs(npcs) do
		local entity = ents.Create(v.class);
		
		if (IsValid(entity)) then
			entity:SetKeyValue("spawnflags", v.spawnFlags or 0);
			entity:SetKeyValue("additionalequipment", v.equipment or "");
			entity:SetAngles(v.angles);
			entity:SetModel(v.model);
			entity:SetPos(v.position);
			entity:Spawn();
			
			if (IsValid(entity)) then
				entity:Activate();
				
				entity:SetNetworkedString("cw_Name", v.name);
				entity:SetNetworkedString("cw_Title", v.title);
			end;
		end;
	end;
end;

-- A function to save the NPCs.
function Schema:SaveNPCs()
	local npcs = {};
	
	for k, v in pairs(ents.FindByClass("npc_*")) do
		local name = v:GetNetworkedString("cw_Name");
		local title = v:GetNetworkedString("cw_Title");
		
		if (name != "" and title != "") then
			local keyValues = table.LowerKeyNames(v:GetKeyValues());
			
			npcs[#npcs + 1] = {
				spawnFlags = keyValues["spawnflags"],
				equipment = keyValues["additionequipment"],
				position = v:GetPos(),
				angles = v:GetAngles(),
				model = v:GetModel(),
				title = title,
				class = v:GetClass(),
				name = name
			};
		end;
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/npcs/"..game.GetMap(), npcs);
end;

-- A function to load the radios.
function Schema:LoadRadios()
	local radios = Clockwork.kernel:RestoreSchemaData("plugins/radios/"..game.GetMap());
	
	for k, v in pairs(radios) do
		local entity = ents.Create("cw_radio");
		
		Clockwork.player:GivePropertyOffline(v.key, v.uniqueID, entity);
		
		entity:SetAngles(v.angles);
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (IsValid(entity)) then
			entity:SetFrequency(v.frequency);
			entity:SetOff(v.off);
		end;
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if (IsValid(physicsObject)) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the radios.
function Schema:SaveRadios()
	local radios = {};
	
	for k, v in pairs(ents.FindByClass("cw_radio")) do
		local physicsObject = v:GetPhysicsObject();
		local moveable;
		
		if (IsValid(physicsObject)) then
			moveable = physicsObject:IsMoveable();
		end;
		
		radios[#radios + 1] = {
			off = v:IsOff(),
			key = Clockwork.entity:QueryProperty(v, "key"),
			angles = v:GetAngles(),
			moveable = moveable,
			uniqueID = Clockwork.entity:QueryProperty(v, "uniqueID"),
			position = v:GetPos(),
			frequency = v:GetFrequency()
		};
	end;
	
	Clockwork.kernel:SaveSchemaData("plugins/radios/"..game.GetMap(), radios);
end;

-- A function to get a player's location.
function Schema:PlayerGetLocation(player)
	local areaNames = Clockwork.plugin:FindByID("Area Names");
	local closest;
	
	if (areaNames) then
		for k, v in pairs(areaNames.areaNames) do
			if (Clockwork.entity:IsInBox(player, v.minimum, v.maximum)) then
				if (string.sub(string.lower(v.name), 1, 4) == "the ") then
					return string.sub(v.name, 5);
				else
					return v.name;
				end;
			else
				local distance = player:GetShootPos():Distance(v.minimum);
				
				if (!closest or distance < closest[1]) then
					closest = {distance, v.name};
				end;
			end;
		end;
		
		if (!completed) then
			if (closest) then
				if (string.sub(string.lower(closest[2]), 1, 4) == "the ") then
					return string.sub(closest[2], 5);
				else
					return closest[2];
				end;
			end;
		end;
	end;
	
	return "unknown location";
end;

-- A function to get a player's heal amount.
function Schema:GetHealAmount(player, scale)
	local medical = Clockwork.attributes:Fraction(player, ATB_MEDICAL, 35);
	local healAmount = (15 + medical) * (scale or 1);
	
	return healAmount;
end;

-- A function to get a player's dexterity time.
function Schema:GetDexterityTime(player)
	return 7 - Clockwork.attributes:Fraction(player, ATB_DEXTERITY, 5, 5);
end;

-- A function to bust down a door.
function Schema:BustDownDoor(player, door, force)
	door.bustedDown = true;
	
	door:SetNotSolid(true);
	door:DrawShadow(false);
	door:SetNoDraw(true);
	door:EmitSound("physics/wood/wood_box_impact_hard3.wav");
	door:Fire("Unlock", "", 0);
	
	if (IsValid(door.combineLock)) then
		door.combineLock:Explode();
		door.combineLock:Remove();
	end;
	
	if (IsValid(door.breach)) then
		door.breach:BreachEntity();
	end;
	
	local fakeDoor = ents.Create("prop_physics");
	
	fakeDoor:SetCollisionGroup(COLLISION_GROUP_WORLD);
	fakeDoor:SetAngles(door:GetAngles());
	fakeDoor:SetModel(door:GetModel());
	fakeDoor:SetSkin(door:GetSkin());
	fakeDoor:SetPos(door:GetPos());
	fakeDoor:Spawn();
	
	local physicsObject = fakeDoor:GetPhysicsObject();
	
	if (IsValid(physicsObject)) then
		if (!force) then
			if (IsValid(player)) then
				physicsObject:ApplyForceCenter((door:GetPos() - player:GetPos()):GetNormal() * 10000);
			end;
		else
			physicsObject:ApplyForceCenter(force);
		end;
	end;
	
	Clockwork.entity:Decay(fakeDoor, 300);
	
	Clockwork.kernel:CreateTimer("reset_door_"..door:EntIndex(), 300, 1, function()
		if (IsValid(door)) then
			door.bustedDown = nil;
			door:SetNotSolid(false);
			door:DrawShadow(true);
			door:SetNoDraw(false);
		end;
	end);
end;

-- A function to permanently kill a player.
function Schema:PermaKillPlayer(player, ragdoll)
	if (player:Alive()) then
		player:Kill(); ragdoll = player:GetRagdollEntity();
	end;
	
	local inventory = player:GetInventory();
	local cash = player:GetCash();
	local info = {};
	
	if (!player:GetCharacterData("PermaKilled")) then
		info.inventory = inventory;
		info.cash = cash;
		
		if (!IsValid(ragdoll)) then
			info.entity = ents.Create("cw_belongings");
		end;
		
		Clockwork.plugin:Call("PlayerAdjustPermaKillInfo", player, info);
		
		for k, v in pairs(info.inventory) do
			local itemTable = Clockwork.item:FindByID(k);
			
			if (itemTable and itemTable.allowStorage == false) then
				info.inventory[k] = nil;
			end;
		end;
		
		player:SetCharacterData("PermaKilled", true);
		player:SetCharacterData("inventory", {}, true);
		player:SetCharacterData("cash", 0, true);
		
		player:SetSharedVar("PermaKilled", true);
		
		if (!IsValid(ragdoll)) then
			if (table.Count(info.inventory) > 0 or info.cash > 0) then
				info.entity:SetData(info.inventory, info.cash);
				info.entity:SetPos(player:GetPos() + Vector(0, 0, 48));
				info.entity:Spawn();
			else
				info.entity:Remove();
			end;
		else
			ragdoll.areBelongings = true;
			ragdoll.inventory = info.inventory;
			ragdoll.cash = info.cash;
		end;
		
		Clockwork.player:SaveCharacter(player);
	end;
end;

-- A function to tie or untie a player.
function Schema:TiePlayer(player, isTied, reset, combine)
	if (isTied) then
		if (combine) then
			player:SetSharedVar("IsTied", 2);
		else
			player:SetSharedVar("IsTied", 1);
		end;
	else
		player:SetSharedVar("IsTied", 0);
	end;
	
	if (isTied) then
		Clockwork.player:DropWeapons(player);
		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has been tied.");
		
		player:Flashlight(false);
		player:StripWeapons();
	elseif (!reset) then
		if (player:Alive() and !player:IsRagdolled()) then 
			Clockwork.player:LightSpawn(player, true, true);
		end;
		
		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has been untied.");
	end;
end;
