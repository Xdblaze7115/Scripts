-- [ Globals ] --
local HyperionLoaded = false
local WS = nil
local WSEnabled = false

-- [ Connections ] --
local ChatConnection = nil
local WSOnMessageConnection = nil
local WSOncloseConnection = nil
local BubbleFadeConnection = nil

-- [ Services ] --
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

-- [ Variables ] --
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)

if not game:IsLoaded() then game.Loaded:Wait() end
if HyperionLoaded then
	warn("Hyperion Has Already Been Loaded!")
	return
else
    HyperionLoaded = true
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
end

local Hyperion = {}

function Hyperion:CreateChat()
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
    TextBox.ClearTextOnFocus = false
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
    Chat.CanvasSize = UDim2.new(0, 0, 0, 0)
    Chat.ScrollBarThickness = 0

    UIListLayout.Parent = Chat
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)
    
	local GUI = {}

    function GUI:ToggleWS()
        WSEnabled = not WSEnabled
        if WSEnabled then
            TextButton.BackgroundColor3 = Color3.new(0, 255, 0)
        else
            TextButton.BackgroundColor3 = Color3.new(255, 0, 0)
        end
    end

    function GUI:NewMessageLabel(text)
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

        task.wait()
        Chat.CanvasPosition = Vector2.new(0, Chat.CanvasPosition.Y + TextLabel.AbsoluteSize.Y + UIListLayout.Padding.Offset)
    end

    function GUI:NewBubble(username, message)
        local player = Players:FindFirstChild(username)
        if not player then return end

        local char = player.Character
        if char and char:FindFirstChild("BillboardGuiHyperion") then
            if BubbleFadeConnection then
                BubbleFadeConnection:Disconnect()
                BubbleFadeConnection = nil
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

        BubbleFadeConnection = task.spawn(function()
            task.wait(5)
            for i = 1, 20 do
                TextLabel.TextTransparency = i / 20
                TextLabel.Transparency = i / 20
                task.wait(0.05)
            end
            BillboardGui:Destroy()
        end)
    end

    function GUI:SendWS(username, nickname, message)
        if message and #message > 100000 then
            message = message:sub(1, 100000)
        end

        local data = {
            type = "chatted",
            username = username,
            nickname = nickname,
            message = message
        }
        WS:Send(HttpService:JSONEncode(data))
        GUI:NewMessageLabel(`<font color="#ff0000">WS</font> | <font color="#008CFF">{nickname}:</font> {message}`)
        GUI:NewBubble(username, message)
    end

    function GUI:SendChat(text)
        if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
            -- Legacy chat system
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
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

    function GUI:AttachListeners(ws)
        WSOnMessageConnection = ws.OnMessage:Connect(function(message)
            if not message then return end
            local data = HttpService:JSONDecode(message)
            if data.type == "chatted" and data.username and data.nickname and data.message then
                if #data.message > 100000 then
                    data.message = data.message:sub(1, 100000)
                end

                GUI:NewMessageLabel('<font color="#ff0000">WS</font> | <font color="#008CFF">'..data.nickname..':</font> '..data.message)
                GUI:NewBubble(data.username, data.message)
            end
        end)

        WSOncloseConnection = ws.OnClose:Connect(function()
            print("Connection closed, reconnecting...")
            task.spawn(function()
                local success, response 
                repeat
                    task.wait(1)
                    success, response  = pcall(WebSocket.connect, "wss://hyperionencryptchat-production.up.railway.app")
                until success and response 

                WS = response 
                GUI:AttachListeners(WS)
            end)
        end)
    end

    if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
        -- Legacy Chat
        ChatConnection = ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
            GUI:NewMessageLabel(`<font color="#ff0000">Chat</font> | <font color="#008CFF">{messageData.FromSpeaker}:</font> {messageData.Message}`)
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
            ChatConnection = rbxGeneral.MessageReceived:Connect(function(message)
                local sender = message.TextSource and message.TextSource.Name
                GUI:NewMessageLabel(`<font color="#ff0000">Chat</font> | <font color="#008CFF">{sender}:</font> {message.Text}`)
            end)
        end
    end

    local success, response = pcall(WebSocket.connect, "wss://hyperionencryptchat-production.up.railway.app")
    if success and response then
        WS = response
        GUI:AttachListeners(WS)
    else
        warn("Failed to connect to WS initially")
    end

    UserInputService.InputBegan:Connect(function(Input)
        if TextBox:IsFocused() then return end
        if Input.KeyCode == Enum.KeyCode.Slash and not UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and not UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
            local Text = TextBox.Text
            TextBox:CaptureFocus()
            task.wait()
            TextBox.Text = Text
        end
    end)

    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == Enum.KeyCode.Return then
            local EnteredText = TextBox.Text
            if EnteredText == "" then return end
            TextBox.Text = ""
            
            if WSEnabled then
                GUI:SendWS(Player.Name, Player.DisplayName, EnteredText)
            else
                GUI:SendChat(EnteredText)
            end
        end
    end)

    TextButton.MouseButton1Click:Connect(function()
        GUI:ToggleWS()
    end)

    ImageButton.MouseButton1Click:Connect(function()
        local EnteredText = TextBox.Text
        if EnteredText == "" then return end
        TextBox.Text = ""
        
        if _G.WSEnabled then
            GUI:SendWS(Player.Name, Player.DisplayName, EnteredText)
        else
            GUI:SendChat(EnteredText)
        end
    end)

    Players.PlayerRemoving:Connect(function(plr)
        GUI:NewMessageLabel(`<font color="#55ff7f">{plr.DisplayName} Has Left The Game</font>`)
    end)

    Players.PlayerAdded:Connect(function(plr)
        GUI:NewMessageLabel(`<font color="#55ff7f">{plr.DisplayName} Has Joined The Game</font>`)
    end)

    return GUI
end
return Hyperion
