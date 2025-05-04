-- Whispering Pines --

local function createRadar(parent)
	local Radar = Instance.new("ScreenGui")
	Radar.Name = "Radar"
	Radar.Parent = parent

	local RadarFrame = Instance.new("Frame")
	RadarFrame.Name = "RadarFrame"
	RadarFrame.Parent = Radar
	RadarFrame.AnchorPoint = Vector2.new(0, 1)
	RadarFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
	RadarFrame.BackgroundTransparency = 0.250
	RadarFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	RadarFrame.Position = UDim2.new(0, 10, 1, -10)
	RadarFrame.Size = UDim2.new(0, 150, 0, 150)

	local uicorner = Instance.new("UICorner")
	uicorner.CornerRadius = UDim.new(1, 0)
	uicorner.Parent = RadarFrame
	
	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(255, 255, 255)
	stroke.Transparency = 0.5
	
	-- Decor elements directly added
	local Decor = Instance.new("Frame")
	Decor.Name = "Decor"
	Decor.BackgroundTransparency = 1
	Decor.Rotation = 45
	Decor.Size = UDim2.new(1, 0, 1, 0)
	Decor.Parent = RadarFrame
	
	-- First decoration frame (decor_2)
	local decor_2 = Instance.new("Frame")
	decor_2.Parent = Decor
	decor_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	decor_2.BackgroundTransparency = 1
	decor_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	decor_2.Size = UDim2.new(0.6, 0, 0.6, 0)
	decor_2.AnchorPoint = Vector2.new(0.5, 0.5)

	local uicorner_2 = Instance.new("UICorner")
	uicorner_2.CornerRadius = UDim.new(1, 0)
	uicorner_2.Parent = decor_2

	local stroke_2 = Instance.new("UIStroke")
	stroke_2.Color = Color3.fromRGB(255, 255, 255)
	stroke_2.Transparency = 0.8
	stroke_2.Parent = decor_2

	-- Second decoration frame (decor_3)
	local decor_3 = Instance.new("Frame")
	decor_3.Parent = Decor
	decor_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	decor_3.BackgroundTransparency = 1
	decor_3.Position = UDim2.new(0.5, 0, 0.5, 0)
	decor_3.Size = UDim2.new(0.4, 0, 0.4, 0)
	decor_3.AnchorPoint = Vector2.new(0.5, 0.5)

	local uicorner_3 = Instance.new("UICorner")
	uicorner_3.CornerRadius = UDim.new(1, 0)
	uicorner_3.Parent = decor_3

	local stroke_3 = Instance.new("UIStroke")
	stroke_3.Color = Color3.fromRGB(255, 255, 255)
	stroke_3.Transparency = 0.7
	stroke_3.Parent = decor_3

	-- Third decoration frame (decor_4)
	local decor_4 = Instance.new("Frame")
	decor_4.Parent = Decor
	decor_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	decor_4.BackgroundTransparency = 1
	decor_4.Position = UDim2.new(0.5, 0, 0.5, 0)
	decor_4.Size = UDim2.new(0.8, 0, 0.8, 0)
	decor_4.AnchorPoint = Vector2.new(0.5, 0.5)

	local uicorner_4 = Instance.new("UICorner")
	uicorner_4.CornerRadius = UDim.new(1, 0)
	uicorner_4.Parent = decor_4

	local stroke_4 = Instance.new("UIStroke")
	stroke_4.Color = Color3.fromRGB(255, 255, 255)
	stroke_4.Transparency = 0.9
	stroke_4.Parent = decor_4

	-- Mid image
	local Mid = Instance.new("ImageLabel")
	Mid.Name = "Mid"
	Mid.Parent = RadarFrame
	Mid.AnchorPoint = Vector2.new(0.5, 0.5)
	Mid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Mid.BackgroundTransparency = 1
	Mid.Position = UDim2.new(0.5, 0, 0.5, 0)
	Mid.Size = UDim2.new(0.15, 0, 0.15, 0)
	Mid.ZIndex = 2
	Mid.Image = "rbxassetid://13984028920"

	-- Map frame
	local Map = Instance.new("Frame")
	Map.Name = "Map"
	Map.Parent = RadarFrame
	Map.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Map.BackgroundTransparency = 1
	Map.Size = UDim2.new(1, 0, 1, 0)
	Map.ZIndex = 2

	-- Player dot and object (PlayerDot is parented to the Handler script now)
	local PlayerDot = Instance.new("Frame")
	PlayerDot.Name = "PlayerDot"
	PlayerDot.Parent = RadarFrame
	PlayerDot.AnchorPoint = Vector2.new(0.5, 0.5)
	PlayerDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	PlayerDot.Size = UDim2.new(0.025, 0, 0.025, 0)
	PlayerDot.Visible = false

	local Object = Instance.new("ObjectValue")
	Object.Name = "Object"
	Object.Parent = PlayerDot

	local UICorner_4 = Instance.new("UICorner")
	UICorner_4.CornerRadius = UDim.new(1, 0)
	UICorner_4.Parent = PlayerDot

	local UIStroke_4 = Instance.new("UIStroke")
	UIStroke_4.Color = Color3.fromRGB(255, 255, 255)
	UIStroke_4.Thickness = 2
	UIStroke_4.Transparency = 0.5
	UIStroke_4.Parent = PlayerDot

	-- Setup and constants
	local RS = game:GetService("RunService")
	local TweenService = game:GetService("TweenService")

	local Player = game.Players.LocalPlayer
	local Char = Player.Character or Player.CharacterAdded:Wait()
	local HRP = Char:WaitForChild("HumanoidRootPart")

	local Camera = workspace.CurrentCamera
	local DISTANCE_LIMIT = 100

	-- Helper function for tweening
	local function tween(object, duration, goals)
		TweenService:Create(object, TweenInfo.new(duration), goals):Play()
	end

	-- Reusable function for checking if a dot already exists
	local function getExistingDot(humanoid)
		for _, child in pairs(Map:GetChildren()) do
			if child:FindFirstChild("Object") and child.Object.Value == humanoid then
				return child
			end
		end
		return nil
	end

	-- Cache NPCs / enemy humanoids at start
	local cachedHumanoids = {}

	local function cacheHumanoids()
		for _, desc in pairs(workspace:GetDescendants()) do
			if desc:IsA("Humanoid") and not desc:IsDescendantOf(Char) then
				table.insert(cachedHumanoids, desc)
			end
		end
	end

	-- Initial caching
	cacheHumanoids()

	-- Listen for future NPCs added dynamically
	workspace.DescendantAdded:Connect(function(desc)
		if desc:IsA("Humanoid") and not desc:IsDescendantOf(Char) then
			table.insert(cachedHumanoids, desc)
		end
	end)

	-- Create a variable to store the RenderStepped connection
	local renderConnection

	renderConnection = RS.RenderStepped:Connect(function()
		-- Check if Radar still exists; if not, disconnect the event
		if not Radar or not Radar.Parent then
			renderConnection:Disconnect()
			return
		end

		-- Rotate the minimap based on camera orientation
		local _, yaw, _ = Camera.CFrame:ToOrientation()
		Map.Rotation = math.deg(yaw)

		-- Only update player dots in range
		for _, humanoid in pairs(cachedHumanoids) do
			if not humanoid.Parent then continue end -- skip destroyed humanoids

			local rootPart = humanoid.RootPart
			if not rootPart then continue end

			local rootPos = Vector3.new(rootPart.Position.X, 0, rootPart.Position.Z)
			local hrpPos = Vector3.new(HRP.Position.X, 0, HRP.Position.Z)

			local lookVector = Vector3.new(Camera.CFrame.LookVector.X, 0, Camera.CFrame.LookVector.Z)
			local direction = (rootPos - hrpPos).Unit
			direction = Vector3.new(direction.X, 0, direction.Z)

			local dotAngle = math.acos(lookVector:Dot(direction))
			local distance = (rootPos - hrpPos).Magnitude

			local existingDot = getExistingDot(humanoid)

			if distance <= DISTANCE_LIMIT then
				local relativePos = (rootPos - hrpPos) * 0.5 / DISTANCE_LIMIT
				local position = UDim2.new(relativePos.X + 0.5, 0, relativePos.Z + 0.5, 0)

				local color
				if humanoid.Name == "RakeHumanoid" then
					color = Color3.fromRGB(255, 0, 0) -- red
				else
					color = Color3.fromRGB(0, 255, 0) -- green
				end

				if not existingDot then
					local dot = PlayerDot:Clone()
					dot.Parent = Map
					dot.Object.Value = humanoid
					dot.Position = position
					dot.BackgroundColor3 = color
					dot.UIStroke.Color = color
					dot.Visible = true
				else
					tween(existingDot, 0.1, { Position = position })
					tween(existingDot, 0.25, { BackgroundColor3 = color })
					tween(existingDot.UIStroke, 0.25, { Color = color })
				end
			elseif existingDot then
				existingDot:Destroy()
			end
		end
	end)
    return Radar
end

-- Call the function to create the radar
local Radar = nil

_G.InfiniteSprint = false
_G.FallDamage = false
_G.FullBright = false

local Lighting = game:GetService("Lighting")
local Plr = game:GetService("Players").LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:wait()
local Hum = Char:WaitForChild("Humanoid")
local HRP = Char:WaitForChild("HumanoidRootPart")

-- Full bright target settings
local fullBrightSettings = {
	Brightness = 2,
	ClockTime = 12,
	Ambient = Color3.new(1, 1, 1),
	OutdoorAmbient = Color3.new(1, 1, 1),
	GlobalShadows = false,
	FogEnd = 1e6,
	FogStart = 0
}

-- Function to apply full bright settings
local function applyFullBright()
	if not _G.FullBright then return end

	for prop, value in pairs(fullBrightSettings) do
		if Lighting[prop] ~= value then
			Lighting[prop] = value
		end
	end
end

-- Detect and fix changes only when enabled
for prop in pairs(fullBrightSettings) do
	Lighting:GetPropertyChangedSignal(prop):Connect(function()
		applyFullBright()
	end)
end

function EnableFallDamage(char)
    for _, obj in pairs(char:WaitForChild("FallDamage"):GetDescendants()) do
        if obj.Name == "Client2" then
            obj.Enabled = true
        end
    end
end

function DisableFallDamage(char)
    for _, obj in pairs(char:WaitForChild("FallDamage"):GetDescendants()) do
        if obj:IsA("LocalScript") then
            obj.Disabled = true
        end
    end
end

Plr.CharacterAdded:Connect(function(char)
    Char = char
    Hum = Char:WaitForChild("Humanoid")
    HRP = Char:WaitForChild("HumanoidRootPart")

    if _G.InfiniteSprint then
        Hum.WalkSpeed = 25
    end

    if _G.FallDamage then
        DisableFallDamage(Char)
    end
    
    Hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if _G.InfiniteSprint and Hum.WalkSpeed ~= 25 then
            Hum.WalkSpeed = 25
        end
    end)
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Whispering Pines",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Whispering Pines Script",
    LoadingSubtitle = "by Hyperion",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Hyperion", -- Create a custom folder for your hub/game
       FileName = "CONFIG"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
})

local Tab = Window:CreateTab("Player", "user")

local Toggle = Tab:CreateToggle({
    Name = "Infinite sprint",
    CurrentValue = false,
    Flag = "InfiniteSprint", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.InfiniteSprint = Value
        if Value then
            Hum.WalkSpeed = 25
        else
            Hum.WalkSpeed = 10
        end
    end,
})
 
local Toggle = Tab:CreateToggle({
    Name = "Disable Fall Damage",
    CurrentValue = false,
    Flag = "FallDamage", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.FallDamage = Value
        if Value then
            DisableFallDamage(Char)
        else
            EnableFallDamage(Char)
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        if Radar then
            Radar:Destroy()
        end
        Rayfield:Destroy()
    end,
})

local Tab = Window:CreateTab("Visual", "eye")

local Toggle = Tab:CreateToggle({
    Name = "Full Bright",
    CurrentValue = false,
    Flag = "FullBright", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        _G.FullBright = Value
        if _G.FullBright then
            applyFullBright()
        end
    end,
})

local Toggle = Tab:CreateToggle({
    Name = "Radar",
    CurrentValue = false,
    Flag = "Radar", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        if Value then
            Radar = createRadar(game:GetService("CoreGui"))
        else
            Radar:Destroy()
        end
    end,
})

local Tab = Window:CreateTab("Teleport", "disc")

local Button = Tab:CreateButton({
    Name = "Watch Tower #1",
    Callback = function()
        HRP.CFrame = workspace.Map.Buildings.InBounds.FireTower2.Details.Couch.CFrame
    end,
})

local Button = Tab:CreateButton({
    Name = "Watch Tower #2",
    Callback = function()
        HRP.CFrame = workspace.Map.Buildings.InBounds.FireTower1.Interactions.Locker.Door.CFrame
    end,
})
