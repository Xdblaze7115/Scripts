local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	_G.TagEsp = false
	_G.LimbEsp = false
	_G.ItemEsp = false
	_G.InteractionEsp = false

	local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Xdblaze7115/SuperSploit/refs/heads/main/source.lua", true))()

	local Window = Library:CreateLibrary("SuperSploit", "Granny")

	local Tab = Window:CreateTab("Player")

	local Slider = Window:CreateSlider("WalkSpeed", 100, function(value)
		if Players.LocalPlayer.Character then
			Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = value
		end
	end)

	local Slider = Window:CreateSlider("JumpPower", 100, function(value)
		if Players.LocalPlayer.Character then
			Players.LocalPlayer.Character:WaitForChild("Humanoid").UseJumpPower = true
			Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = value
		end
	end)

	local Tab = Window:CreateTab("Visual")

	local Label = Window:CreateLabel("ESP")

	local Toggle = Window:CreateToggle("TagEsp", function(state)
		if state then
			_G.TagEsp = true
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Players.LocalPlayer and plr.Character then
					AddTagEsp(plr)
				end
			end
			Players.PlayerAdded:Connect(function(plr)
				plr.CharacterAdded:Connect(function()
					if _G.TagEsp then
						wait(2)
						if plr ~= Players.LocalPlayer then
							AddTagEsp(plr)
						end
					end
				end)
			end)
		else
			_G.TagEsp = false
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Players.LocalPlayer and plr.Character then
					RemoveTagEsp(plr)
				end
			end
		end
	end)

	local Toggle = Window:CreateToggle("LimbEsp", function(state)
		if state then
			_G.LimbEsp = true
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Players.LocalPlayer and plr.Character then
					AddLimbEsp(plr)
				end
			end
			Players.PlayerAdded:Connect(function(plr)
				plr.CharacterAdded:Connect(function()
					wait(2)
					if _G.LimbEsp then
						if plr ~= Players.LocalPlayer then
							AddLimbEsp(plr)
						end
					end
				end)
			end)
		else
			_G.LimbEsp = false
			for _, plr in pairs(Players:GetPlayers()) do
				if plr ~= Players.LocalPlayer and plr.Character then
					RemoveLimbEsp(plr)
				end
			end
		end
	end)

	local Toggle = Window:CreateToggle("ItemEsp", function(state)
		local MapLocation, CharacterLocation

		for _, v in pairs(workspace.Map:GetChildren()) do
			if v:FindFirstChild("Tools") then
				MapLocation = v.Tools:FindFirstChild("Map")
				CharacterLocation = v.Tools:FindFirstChild("Character")
			end
		end

		if state then
			_G.ItemEsp = true

			if MapLocation or CharacterLocation then
				AddItemEsp(MapLocation, CharacterLocation)
			end

			Players.PlayerAdded:Connect(function(plr)
				plr.CharacterAdded:Connect(function()
					wait(2)
					if _G.ItemEsp then
						for _, v in pairs(workspace.Map:GetChildren()) do
							if v:FindFirstChild("Tools") then
								MapLocation = v.Tools:FindFirstChild("Map")
								CharacterLocation = v.Tools:FindFirstChild("Character")
							end
						end

						if MapLocation or CharacterLocation then
							AddItemEsp(MapLocation, CharacterLocation)
						end
					end
				end)
			end)
		else
			_G.ItemEsp = false
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
					if v.Name == "ItemNameEsp" or v.Name == "ItemEsp" then
						v:Destroy()
					end
				end
			end
		end
	end)
	
	local Toggle = Window:CreateToggle("InterationEsp", function(state)
		local Interacts

		for _, v in pairs(workspace.Map:GetChildren()) do
			if v:FindFirstChild("Interacts") then
				Interacts = v.Interacts
			end
		end

		if state then
			_G.InteractionEsp = true

			if Interacts then
				AddInteractionEsp(Interacts)
			end

			Players.PlayerAdded:Connect(function(plr)
				plr.CharacterAdded:Connect(function()
					wait(2)
					if _G.InteractionEsp then
						for _, v in pairs(workspace.Map:GetChildren()) do
							if v:FindFirstChild("Interacts") then
								Interacts = v.Interacts
							end
						end

						if Interacts then
							AddInteractionEsp(Interacts)
						end
					end
				end)
			end)
		else
			_G.InteractionEsp = false
			for _, v in pairs(workspace:GetDescendants()) do
				if v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
					if v.Name == "InteractionNameEsp" or v.Name == "InterationEsp" then
						v:Destroy()
					end
				end
			end
		end
	end)

	function AddTagEsp(plr)
		if plr.Character then
			local char = plr.Character

			local Esp = Instance.new("BillboardGui")
			Esp.Parent = char:WaitForChild("Head")
			Esp.Name = "NameEsp"
			Esp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			Esp.AlwaysOnTop = true
			Esp.Size = UDim2.new(2, 0, 2, 0)
			Esp.StudsOffset = Vector3.new(0, 2, 0)

			local Frame = Instance.new("Frame")
			Frame.Parent = Esp
			Frame.BackgroundTransparency = 1
			Frame.Size = UDim2.new(1, 0, 1, 0)

			local Name = Instance.new("TextLabel")
			Name.Parent = Frame
			Name.Size = UDim2.new(1, 0, 1, 0)
			Name.Position = UDim2.new(0, 0, 0, 0)
			Name.Font = Enum.Font.FredokaOne
			Name.Text = plr.Name
			Name.TextColor3 = Color3.new(1, 1, 1)
			Name.BackgroundTransparency = 1
			Name.TextScaled = true
		end
	end

	function RemoveTagEsp(plr)
		if plr.Character and plr.Character:FindFirstChild("Head") then
			local Head = plr.Character.Head
			if Head:FindFirstChild("NameEsp") then
				Head.NameEsp:Destroy()
			end
		end
	end

	function AddLimbEsp(plr)
		if plr.Character then
			local char = plr.Character
			for _, part in pairs(char:GetChildren()) do
				if part:IsA("BasePart") and not part:FindFirstChild("LimbEsp") then
					for _, face in pairs(Enum.NormalId:GetEnumItems()) do
						local Esp = Instance.new("SurfaceGui")
						Esp.Name = "LimbEsp"
						Esp.Parent = part
						Esp.Face = face
						Esp.AlwaysOnTop = true
						Esp.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

						local Box = Instance.new("Frame")
						Box.Parent = Esp
						Box.Size = UDim2.new(1, 0, 1, 0)
						Box.BackgroundColor3 = Color3.new(1, 1, 1)
						Box.BackgroundTransparency = 0.5
						Box.BorderSizePixel = 0
					end
				end
			end
		end
	end

	function RemoveLimbEsp(plr)
		if plr.Character then
			for _, part in pairs(plr.Character:GetChildren()) do
				if part:IsA("BasePart") then
					for _, child in pairs(part:GetChildren()) do
						if child:IsA("SurfaceGui") and child.Name == "LimbEsp" then
							child:Destroy()
						end
					end
				end
			end
		end
	end

	function AddItemEsp(location, location2)
		local function CreateEspForItem(item)
			if not item:FindFirstChild("Handle") then
				warn("Item missing Handle: ", item.Name)
				return
			end

			local Handle = item.Handle

			local Billboard = Instance.new("BillboardGui")
			Billboard.Parent = Handle
			Billboard.Name = "ItemNameEsp"
			Billboard.AlwaysOnTop = true
			Billboard.Size = UDim2.new(2, 0, 2, 0)
			Billboard.StudsOffset = Vector3.new(0, 2, 0)

			local Label = Instance.new("TextLabel")
			Label.Parent = Billboard
			Label.Size = UDim2.new(1, 0, 1, 0)
			Label.Font = Enum.Font.FredokaOne
			Label.Text = item.Name
			Label.TextColor3 = Color3.new(1, 1, 1)
			Label.BackgroundTransparency = 1
			Label.TextScaled = true

			for _, face in pairs(Enum.NormalId:GetEnumItems()) do
				local Surface = Instance.new("SurfaceGui")
				Surface.Name = "ItemEsp"
				Surface.Parent = Handle
				Surface.Face = face
				Surface.AlwaysOnTop = true

				local Frame = Instance.new("Frame")
				Frame.Parent = Surface
				Frame.Size = UDim2.new(1, 0, 1, 0)
				Frame.BackgroundColor3 = Color3.new(1, 1, 1)
				Frame.BackgroundTransparency = 0.5
			end
		end

		if location then
			for _, item in pairs(location:GetChildren()) do
				CreateEspForItem(item)
			end
		end

		if location2 then
			for _, item in pairs(location2:GetChildren()) do
				CreateEspForItem(item)
			end
		end
	end
	
	function AddInteractionEsp(location)
		local function CreateEspForBox(box, puzzle)
			local Billboard = Instance.new("BillboardGui")
			Billboard.Parent = box
			Billboard.Name = "InteractionNameEsp"
			Billboard.AlwaysOnTop = true
			Billboard.Size = UDim2.new(2, 0, 2, 0)
			Billboard.StudsOffset = Vector3.new(0, 2, 0)

			local Label = Instance.new("TextLabel")
			Label.Parent = Billboard
			Label.Size = UDim2.new(1, 0, 1, 0)
			Label.Font = Enum.Font.FredokaOne
			Label.Text = puzzle.Name
			Label.TextColor3 = Color3.new(1, 1, 1)
			Label.BackgroundTransparency = 1
			Label.TextScaled = true
			
			local Status = puzzle.Settings.Status
			
			if Status.Value == "PuzzleLocked" then
				Label.TextColor3 = Color3.new(1, 0, 0)
			else
				Label.TextColor3 = Color3.new(0.333333, 1, 0.498039)
			end
			
			Status.Changed:Connect(function(v)
				if v ~= "PuzzleLocked" then
					Label.TextColor3 = Color3.new(1, 0, 0)
				else
					Label.TextColor3 = Color3.new(0.333333, 1, 0.498039)
				end
			end)

			for _, face in pairs(Enum.NormalId:GetEnumItems()) do
				local Surface = Instance.new("SurfaceGui")
				Surface.Name = "InterationEsp"
				Surface.Parent = box
				Surface.Face = face
				Surface.AlwaysOnTop = true

				local Frame = Instance.new("Frame")
				Frame.Parent = Surface
				Frame.Size = UDim2.new(1, 0, 1, 0)
				Frame.BackgroundColor3 = Color3.new(1, 1, 1)
				Frame.BackgroundTransparency = 0.5
			end
		end
		
		if location then
			for _, interaction in pairs(location:GetChildren()) do
				if interaction:FindFirstChild("Puzzles") then
					local Puzzles = interaction:FindFirstChild("Puzzles")
					
					for _, puzzle in pairs(Puzzles:GetChildren()) do
						print(1 .. puzzle.Name)
						for _, part in pairs(puzzle:GetDescendants()) do
							if part:IsA("BasePart") and part.Name == "Base" then
								print(3 .. part.Name)
								CreateEspForBox(part, puzzle)
							end
						end
					end
				end
			end
		end
	end
