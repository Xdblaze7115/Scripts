if not game:IsLoaded() then game.Loaded:Wait() end
if _G.HyperionEncryptChatLoaded then
	warn("HyperionEncryptChat Has Already Been Loaded!")
	return
end

-- [ Globals ] --
_G.HyperionEncryptChatLoaded = true
_G.WS = false

-- [ Connections ] --
_G.BubbleFadeConnection = nil

-- [ Services ] --
local HttpService = game:GetService("HttpService")
local UIS = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local RS = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local Plrs = game:GetService("Players")

-- [ Variables ] --
local ws = WebSocket.connect("wss://hyperionencryptchat.onrender.com")
local Plr = Plrs.LocalPlayer

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

-- [ Instances ] --
local HyperionEncryptChat = Instance.new("ScreenGui")
local Container = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local UIPadding = Instance.new("UIPadding")
local ImageButton = Instance.new("ImageButton")
local TextButton = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Chat = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")

-- [ Properties ] --
HyperionEncryptChat.Name = "HyperionEncryptChat"
HyperionEncryptChat.Parent = CoreGui
HyperionEncryptChat.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Container.Name = "Container"
Container.Parent = HyperionEncryptChat
Container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Container.BackgroundTransparency = 0.200
Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
Container.BorderSizePixel = 0
Container.Position = UDim2.new(0, 10, 0, 5)
Container.Size = UDim2.new(0, 450, 0, 250)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Container

TextBox.Parent = Container
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.BackgroundTransparency = 0.200
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 10, 0, 205)
TextBox.Size = UDim2.new(0, 430, 0, 35)
TextBox.Font = Enum.Font.SourceSansBold
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
TextBox.PlaceholderText = "To chat click here or press / key"
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextSize = 14.000
TextBox.TextStrokeTransparency = 0.500
TextBox.TextXAlignment = Enum.TextXAlignment.Left

UICorner_2.CornerRadius = UDim.new(0, 4)
UICorner_2.Parent = TextBox

UIPadding.Parent = TextBox
UIPadding.PaddingLeft = UDim.new(0, 10)

ImageButton.Parent = TextBox
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0, 395, 0, 11)
ImageButton.Size = UDim2.new(0, 15, 0, 13)
ImageButton.Image = "rbxassetid://99695614644990"

TextButton.Parent = Container
TextButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 425, 0, 10)
TextButton.Size = UDim2.new(0, 15, 0, 15)
TextButton.ZIndex = 2
TextButton.Font = Enum.Font.SourceSansBold
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

UICorner_3.CornerRadius = UDim.new(1, 0)
UICorner_3.Parent = TextButton

Chat.Name = "Chat"
Chat.Parent = Container
Chat.Active = true
Chat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Chat.BackgroundTransparency = 1.000
Chat.BorderColor3 = Color3.fromRGB(0, 0, 0)
Chat.BorderSizePixel = 0
Chat.Position = UDim2.new(0, 10, 0, 10)
Chat.Size = UDim2.new(0, 430, 0, 185)
Chat.AutomaticCanvasSize = Enum.AutomaticSize.Y
Chat.CanvasSize = UDim2.new(0, 0, 1, 0)
Chat.ScrollBarThickness = 0

UIListLayout.Parent = Chat
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- [ Functions ] --
function ToggleWS()
	_G.WS = not _G.WS
	if _G.WS then
		TextButton.BackgroundColor3 = Color3.new(0, 255, 0)
	else
		TextButton.BackgroundColor3 = Color3.new(255, 0, 0)
	end
end

-- [ Local Functions ] --

local function CloseConnection()
	if ws and ws.Connected then
		ws:Close()
	end
end

local function NewMessageLabel(text)
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = Chat
	TextLabel.AutomaticSize = Enum.AutomaticSize.Y
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(1, 0, 0, 16)
	TextLabel.Font = Enum.Font.SourceSansBold
	TextLabel.RichText = true
	TextLabel.Text = text
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 16.000
	TextLabel.TextStrokeTransparency = 0.500
	TextLabel.TextWrapped = true
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top
	
	local isAtBottom = Chat.CanvasPosition.Y >= Chat.AbsoluteCanvasSize.Y - Chat.AbsoluteSize.Y - 2
	if isAtBottom then
		Chat.CanvasPosition = Vector2.new(0, Chat.AbsoluteCanvasSize.Y - Chat.AbsoluteSize.Y)
	end
end

local function NewBubble(username, message)
	local player = Plrs:FindFirstChild(username)
    if not player then return end

	local char = player.Character
	if char and char:FindFirstChild("BillboardGuiHyperion") then
		if _G.BubbleFadeConnection then
			_G.BubbleFadeConnection:Disconnect()
			_G.BubbleFadeConnection = nil
			if char.BillboardGuiHyperion then
				char.BillboardGuiHyperion:Destroy()
			end
		end
	end

	local BillboardGui = Instance.new("BillboardGui")
	local TextLabel = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local UICorner = Instance.new("UICorner")

	BillboardGui.Name = "BillboardGuiHyperion"
	BillboardGui.Parent = char:FindFirstChild("HumanoidRootPart")
	BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BillboardGui.Active = true
	BillboardGui.AlwaysOnTop = true
	BillboardGui.LightInfluence = 1.000
	BillboardGui.MaxDistance = 25.000
	BillboardGui.Size = UDim2.new(0, 1000, 0, 1000)
	BillboardGui.StudsOffset = Vector3.new(0, 3, 0)

	TextLabel.Parent = BillboardGui
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.AutomaticSize = Enum.AutomaticSize.XY
	TextLabel.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(0, 16, 0, 16)
	TextLabel.Font = Enum.Font.Unknown
	TextLabel.Text = message
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 16.000
	TextLabel.TextWrapped = true

	UIPadding.Parent = TextLabel
	UIPadding.PaddingBottom = UDim.new(0, 10)
	UIPadding.PaddingLeft = UDim.new(0, 10)
	UIPadding.PaddingRight = UDim.new(0, 10)
	UIPadding.PaddingTop = UDim.new(0, 10)

	UICorner.CornerRadius = UDim.new(0, 10)
	UICorner.Parent = TextLabel

	_G.BubbleFadeConnection = task.spawn(function()
		task.wait(5)
		for i = 1, 20 do
			TextLabel.TextTransparency = i / 20
			TextLabel.Transparency = i / 20
			task.wait(0.05)
		end
		BillboardGui:Destroy()
	end)
end

local function SendWSMessage(username, nickname, message)
	local data = {
		type = "chatted",
		username = username,
		nickname = nickname,
		message = message
	}
	ws:Send(HttpService:JSONEncode(data))
end

local function SendChatMessage(text)
	if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
		-- Legacy chat system
		RS.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
	else
		-- New TextChatService system
		local rbxGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
		if rbxGeneral and rbxGeneral:IsA("TextChannel") then
			rbxGeneral:SendAsync(text)
		else
			warn("RBXGeneral channel not found")
		end
	end
end

-- [ Connections ] --
ws.OnMessage:Connect(function(message)
	if not message or message == "" then
		return
	end

	local data = HttpService:JSONDecode(message)
	
	if data.type == "chatted" and data.username and data.nickname and data.message then
		NewMessageLabel(`<font color="#ff0000">WS</font> | <font color="#008CFF">{data.nickname}:</font> {data.message}`)
		NewBubble(data.username, data.message)
	end
end)

if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
	-- Legacy Chat
	RS.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
		NewMessageLabel(`<font color="#ff0000">Chat</font> | <font color="#008CFF">{messageData.FromSpeaker}:</font> {messageData.Message}`)
	end)
else
	-- New Chat
	local rbxGeneral
	for _, channel in ipairs(TextChatService:GetDescendants()) do
		if channel.Name == "RBXGeneral" and channel:IsA("TextChannel") then
			rbxGeneral = channel
			break
		end
	end

	if rbxGeneral then
		rbxGeneral.MessageReceived:Connect(function(message)
			local sender = message.TextSource and message.TextSource.Name
			NewMessageLabel(`<font color="#ff0000">Chat</font> | <font color="#008CFF">{sender}:</font> {message.Text}`)
		end)
	end
end

ws.OnClose:Connect(function()
	print("Connection closed")
end)

UIS.InputBegan:Connect(function(Input)
	if TextBox.Focused then return end
	if Input.KeyCode == Enum.KeyCode.Slash and not UIS:IsKeyDown(Enum.KeyCode.LeftShift) and not UIS:IsKeyDown(Enum.KeyCode.RightShift) then
        local Text = TextBox.Text
		TextBox:CaptureFocus()
		task.wait()
		TextBox.Text = Text
	end
end)

UIS.InputBegan:Connect(function(Input)
	if Input.KeyCode == Enum.KeyCode.Return then
		local EnteredText = TextBox.Text
		if EnteredText == "" then return end
		TextBox.Text = ""
		
		if _G.WS then
			SendWSMessage(Plr.Name, Plr.DisplayName, EnteredText)
			NewMessageLabel(`<font color="#ff0000">WS</font> | <font color="#008CFF">{Plr.DisplayName}:</font> {EnteredText}`)
			NewBubble(Plr.Name, EnteredText)
		else
			SendChatMessage(EnteredText)
		end
	end
end)

TextButton.MouseButton1Click:Connect(function()
	ToggleWS()
end)

ImageButton.MouseButton1Click:Connect(function()
	local EnteredText = TextBox.Text
	if EnteredText == "" then return end
	TextBox.Text = ""
	
	if _G.WS then
		SendWSMessage(Plr.Name, Plr.DisplayName, EnteredText)
		NewMessageLabel(`<font color="#ff0000">WS</font> | <font color="#008CFF">{Plr.DisplayName}:</font> {EnteredText}`)
		NewBubble(Plr.Name, EnteredText)
	else
		SendChatMessage(EnteredText)
	end
end)

Plrs.PlayerRemoving:Connect(function(plr)
    if plr == Plr then
        CloseConnection()
    end
end)

Plrs.PlayerAdded:Connect(function(plr)
	NewMessageLabel(`<font color="#55ff7f">{plr.DisplayName} Has Joined The Game!</font>`)
end)
