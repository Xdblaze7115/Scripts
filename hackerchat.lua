if not game:IsLoaded() then game.Loaded:Wait() end
if _G.HyperionLoaded then
	warn("Hyperion Has Already Been Loaded!")
	return
else
    _G.HyperionLoaded = true
end

-- [ Connections ] --
local WSOnMessageConnection = nil
local WSOncloseConnection = nil
local ChatConnection = nil
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

local Hyperion = {}

local HyperionGui = Instance.new("ScreenGui")
HyperionGui.Name = "Hyperion"
HyperionGui.Parent = CoreGui
HyperionGui.ResetOnSpawn = false
HyperionGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function Hyperion:CreateChat()
    _G.ChatLoaded = false
    if _G.ChatLoaded then return end
    _G.ChatLoaded = true
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)

    -- [ Instances ] --
    local Container = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Tab = Instance.new("ImageButton")
    local Tabs = Instance.new("Frame")
    local Tab_2 = Instance.new("Frame")
    local TextBox = Instance.new("TextBox")
    local UICorner_2 = Instance.new("UICorner")
    local UIPadding = Instance.new("UIPadding")
    local ImageButton = Instance.new("ImageButton")
    local WSF = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local Tab_3 = Instance.new("Frame")
    local TextBox_2 = Instance.new("TextBox")
    local UICorner_3 = Instance.new("UICorner")
    local UIPadding_2 = Instance.new("UIPadding")
    local ImageButton_2 = Instance.new("ImageButton")
    local TextButton = Instance.new("TextButton")
    local UICorner_4 = Instance.new("UICorner")
    local Chat = Instance.new("ScrollingFrame")
    local UIListLayout_2 = Instance.new("UIListLayout")
    local ClientsOnline = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local UICorner_5 = Instance.new("UICorner")
    local Separator = Instance.new("Frame")
    local UICorner_6 = Instance.new("UICorner")
    local List = Instance.new("ScrollingFrame")
    local UIListLayout_3 = Instance.new("UIListLayout")

    -- [ Properties ] --
    Container.Name = "Container"
    Container.Parent = HyperionGui
    Container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Container.BackgroundTransparency = 0.200
    Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Container.BorderSizePixel = 0
    Container.ClipsDescendants = true
    Container.Position = UDim2.new(0, 10, 0, 5)
    Container.Size = UDim2.new(0, 450, 0, 250)

    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = Container

    Tab.Name = "Tab"
    Tab.Parent = Container
    Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tab.BackgroundTransparency = 1.000
    Tab.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tab.BorderSizePixel = 0
    Tab.Position = UDim2.new(0, 428, 0, 10)
    Tab.Size = UDim2.new(0, 15, 0, 15)
    Tab.AutoButtonColor = false
    Tab.Image = "rbxassetid://72456773280111"

    Tabs.Name = "Tabs"
    Tabs.Parent = Container
    Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tabs.BackgroundTransparency = 1.000
    Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tabs.BorderSizePixel = 0
    Tabs.Size = UDim2.new(2, 0, 1, 0)

    Tab_2.Name = "Tab"
    Tab_2.Parent = Tabs
    Tab_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tab_2.BackgroundTransparency = 1.000
    Tab_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tab_2.BorderSizePixel = 0
    Tab_2.Position = UDim2.new(0.5, 0, 0, 0)
    Tab_2.Size = UDim2.new(1, 0, 1, 0)

    TextBox.Parent = Tab_2
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
    TextBox.TextSize = 16.000
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

    WSF.Name = "WS"
    WSF.Parent = Tab_2
    WSF.Active = true
    WSF.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WSF.BackgroundTransparency = 1.000
    WSF.BorderColor3 = Color3.fromRGB(0, 0, 0)
    WSF.BorderSizePixel = 0
    WSF.Position = UDim2.new(0, 10, 0, 10)
    WSF.Size = UDim2.new(0, 430, 0, 185)
    WSF.AutomaticCanvasSize = Enum.AutomaticSize.Y
    WSF.CanvasSize = UDim2.new(0, 0, 0, 0)
    WSF.ScrollBarThickness = 0

    UIListLayout.Parent = WSF
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    Tab_3.Name = "Tab"
    Tab_3.Parent = Tabs
    Tab_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Tab_3.BackgroundTransparency = 1.000
    Tab_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Tab_3.BorderSizePixel = 0
    Tab_3.Size = UDim2.new(1, 0, 1, 0)

    TextBox_2.Parent = Tab_3
    TextBox_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TextBox_2.BackgroundTransparency = 0.200
    TextBox_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextBox_2.BorderSizePixel = 0
    TextBox_2.ClearTextOnFocus = false
    TextBox_2.Position = UDim2.new(0, 10, 0, 205)
    TextBox_2.Size = UDim2.new(0, 430, 0, 35)
    TextBox_2.Font = Enum.Font.SourceSansBold
    TextBox_2.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
    TextBox_2.PlaceholderText = "To chat click here or press / key"
    TextBox_2.Text = ""
    TextBox_2.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox_2.TextSize = 16.000
    TextBox_2.TextStrokeTransparency = 0.500
    TextBox_2.TextXAlignment = Enum.TextXAlignment.Left

    UICorner_3.CornerRadius = UDim.new(0, 4)
    UICorner_3.Parent = TextBox_2

    UIPadding_2.Parent = TextBox_2
    UIPadding_2.PaddingLeft = UDim.new(0, 10)

    ImageButton_2.Parent = TextBox_2
    ImageButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton_2.BackgroundTransparency = 1.000
    ImageButton_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ImageButton_2.BorderSizePixel = 0
    ImageButton_2.Position = UDim2.new(0, 395, 0, 11)
    ImageButton_2.Size = UDim2.new(0, 15, 0, 13)
    ImageButton_2.Image = "rbxassetid://99695614644990"

    TextButton.Parent = Tab_3
    TextButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.BorderSizePixel = 0
    TextButton.Position = UDim2.new(0, 410, 0, 10)
    TextButton.Size = UDim2.new(0, 15, 0, 15)
    TextButton.ZIndex = 2
    TextButton.Font = Enum.Font.SourceSansBold
    TextButton.Text = ""
    TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextButton.TextSize = 14.000

    UICorner_4.CornerRadius = UDim.new(1, 0)
    UICorner_4.Parent = TextButton

    Chat.Name = "Chat"
    Chat.Parent = Tab_3
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

    UIListLayout_2.Parent = Chat
    UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_2.Padding = UDim.new(0, 5)

    ClientsOnline.Name = "ClientsOnline"
    ClientsOnline.Parent = HyperionGui
    ClientsOnline.Visible = false
    ClientsOnline.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ClientsOnline.BackgroundTransparency = 0.200
    ClientsOnline.BorderColor3 = Color3.fromRGB(0, 0, 0)
    ClientsOnline.BorderSizePixel = 0
    ClientsOnline.Position = UDim2.new(0, 465, 0, 5)
    ClientsOnline.Size = UDim2.new(0, 250, 0, 250)

    Title.Name = "Title"
    Title.Parent = ClientsOnline
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Title.BorderSizePixel = 0
    Title.AnchorPoint = Vector2.new(0.5, 0)
    Title.Position = UDim2.new(0.5, 0, 0, 10)
    Title.Size = UDim2.new(0, 120, 0, 15)
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = "CLIENTS ONLINE"
    Title.TextColor3 = Color3.fromRGB(0, 255, 150)
    Title.TextSize = 16.000
    Title.TextStrokeTransparency = 0.500
    Title.TextWrapped = true

    UICorner_5.CornerRadius = UDim.new(0, 10)
    UICorner_5.Parent = ClientsOnline

    Separator.Name = "Separator"
    Separator.Parent = ClientsOnline
    Separator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Separator.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Separator.BorderSizePixel = 0
    Separator.AnchorPoint = Vector2.new(0.5, 0)
    Separator.Position = UDim2.new(0.5, 0, 0, 35)
    Separator.Size = UDim2.new(0, 220, 0, 2)

    UICorner_6.CornerRadius = UDim.new(0, 10)
    UICorner_6.Parent = Separator

    List.Name = "List"
    List.Parent = ClientsOnline
    List.Active = true
    List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    List.BackgroundTransparency = 1.000
    List.BorderColor3 = Color3.fromRGB(0, 0, 0)
    List.BorderSizePixel = 0
    List.Position = UDim2.new(0, 15, 0, 45)
    List.Size = UDim2.new(0, 220, 0, 195)
    List.CanvasSize = UDim2.new(0, 0, 0, 0)
    List.ScrollBarThickness = 0

    UIListLayout_3.Parent = List
    UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout_3.Padding = UDim.new(0, 8)
    
	local GUI = {}
    local AliveClients = {}
    local WS = nil
    local WSEnabled = false
    local ChatTab = 1

    function GUI:ToggleWS()
        WSEnabled = not WSEnabled
        if WSEnabled then
            TextButton.BackgroundColor3 = Color3.new(0, 255, 0)
        else
            TextButton.BackgroundColor3 = Color3.new(255, 0, 0)
        end
    end

    function GUI:NewMessageLabel(parent, text)
        local TextLabelM = Instance.new("TextLabel")
        TextLabelM.Parent = parent
        TextLabelM.AutomaticSize = Enum.AutomaticSize.Y
        TextLabelM.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabelM.BackgroundTransparency = 1.000
        TextLabelM.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabelM.BorderSizePixel = 0
        TextLabelM.Size = UDim2.new(1, 0, 0, 16)
        TextLabelM.Font = Enum.Font.SourceSansBold
        TextLabelM.RichText = true
        TextLabelM.Text = text
        TextLabelM.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabelM.TextSize = 16.000
        TextLabelM.TextStrokeTransparency = 0.500
        TextLabelM.TextWrapped = true
        TextLabelM.TextXAlignment = Enum.TextXAlignment.Left
        TextLabelM.TextYAlignment = Enum.TextYAlignment.Top

        task.wait()
        parent.CanvasPosition = Vector2.new(0, parent.CanvasPosition.Y + TextLabelM.AbsoluteSize.Y + UIListLayout.Padding.Offset)
    end

    function GUI:NewTextLabel(parent, name, text)
        local TextLabelM = Instance.new("TextLabel")
        TextLabelM.Parent = parent
        TextLabelM.Name = name
        TextLabelM.AutomaticSize = Enum.AutomaticSize.Y
        TextLabelM.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabelM.BackgroundTransparency = 1.000
        TextLabelM.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabelM.BorderSizePixel = 0
        TextLabelM.Size = UDim2.new(1, 0, 0, 14)
        TextLabelM.RichText = true
        TextLabelM.Font = Enum.Font.SourceSansBold
        TextLabelM.Text = text
        TextLabelM.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabelM.TextSize = 16.000
        TextLabelM.TextStrokeTransparency = 0.500
        TextLabelM.TextWrapped = true
        TextLabelM.TextXAlignment = Enum.TextXAlignment.Left
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
        local TextLabelB = Instance.new("TextLabel")
        local UIPaddingB = Instance.new("UIPadding")
        local UICornerB = Instance.new("UICorner")

        BillboardGui.Name = "BillboardGuiHyperion"
        BillboardGui.Parent = char:FindFirstChild("HumanoidRootPart")
        BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        BillboardGui.Active = true
        BillboardGui.AlwaysOnTop = true
        BillboardGui.LightInfluence = 1.000
        BillboardGui.MaxDistance = 25.000
        BillboardGui.Size = UDim2.new(0, 1000, 0, 1000)
        BillboardGui.StudsOffset = Vector3.new(0, 3, 0)

        TextLabelB.Parent = BillboardGui
        TextLabelB.AnchorPoint = Vector2.new(0.5, 0.5)
        TextLabelB.AutomaticSize = Enum.AutomaticSize.XY
        TextLabelB.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
        TextLabelB.BorderColor3 = Color3.fromRGB(0, 0, 0)
        TextLabelB.BorderSizePixel = 0
        TextLabelB.Position = UDim2.new(0.5, 0, 0.5, 0)
        TextLabelB.Size = UDim2.new(0, 16, 0, 16)
        TextLabelB.Font = Enum.Font.Unknown
        TextLabelB.Text = message
        TextLabelB.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabelB.TextSize = 16.000
        TextLabelB.TextWrapped = true

        UIPaddingB.Parent = TextLabelB
        UIPaddingB.PaddingBottom = UDim.new(0, 10)
        UIPaddingB.PaddingLeft = UDim.new(0, 10)
        UIPaddingB.PaddingRight = UDim.new(0, 10)
        UIPaddingB.PaddingTop = UDim.new(0, 10)

        UICornerB.CornerRadius = UDim.new(0, 10)
        UICornerB.Parent = TextLabelB

        BubbleFadeConnection = task.spawn(function()
            task.wait(5)
            for i = 1, 20 do
                TextLabelB.TextTransparency = i / 20
                TextLabelB.Transparency = i / 20
                task.wait(0.05)
            end
            BillboardGui:Destroy()
        end)
    end

    function GUI:SendWS(username, nickname, message)
        if not WS then return end
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
        GUI:NewMessageLabel(Chat, `<font color="#ff0000">WS</font> | <font color="#008CFF">{nickname}:</font> {message}`)
        GUI:NewMessageLabel(WSF, `<font color="#ff0000">WS</font> | <font color="#008CFF">{nickname}:</font> {message}`)
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
        task.spawn(function()
            while ws and ws.Connected do
                task.wait(10)
                local data = {
                    type = "alive",
                    username = Player.Name,
                    nickname = Player.DisplayName
                }
                ws:Send(HttpService:JSONEncode(data))
            end
            GUI:NewTextLabel(List, Player.Name, `<font color="#008CFF">{Player.Name} ({Player.DisplayName})</font>`)
        end)

        task.spawn(function()
            while ws and ws.Connected do
                task.wait(5)
                local now = os.clock()
                for user, data in pairs(AliveClients) do
                    if now - data.last > 30 then
                        AliveClients[user] = nil
                        for _, child in pairs(List:GetChildren()) do
                            if child:IsA("TextLabel") and child.Name == user then
                                child:Destroy()
                                GUI:NewTextLabel(Chat, "TextLabel", `<font color="#008CFF">{data} Disconnected</font>`)
                                GUI:NewTextLabel(WSF, "TextLabel", `<font color="#008CFF">{data} Disconnected</font>`)
                                break
                            end
                        end
                    end
                end
            end
        end)
        
        WSOnMessageConnection = ws.OnMessage:Connect(function(message)
            if not message then return end
            local data = HttpService:JSONDecode(message)
            if not data then return end
            
            if data.type == "alive" then
                if not data.username and data.nickname then return end
                if not AliveClients[data.username] then
                    GUI:NewTextLabel(List, data.username, `<font color="#008CFF">{data.nickname} ({data.username})</font>`)
                end
                AliveClients[data.username] = {
                    nickname = data.nickname,
                    last = os.clock()
                }
            elseif data.type == "chatted" then
                if not data.username and data.nickname and data.message then return end
                if #data.message > 100000 then
                    data.message = data.message:sub(1, 100000)
                end

                GUI:NewMessageLabel(Chat, `<font color="#ff0000">WS</font> | <font color="#008CFF">{data.nickname}:</font> {data.message}`)
                GUI:NewMessageLabel(WSF, `<font color="#ff0000">WS</font> | <font color="#008CFF">{data.nickname}:</font> {data.message}`)
                GUI:NewBubble(data.username, data.message)
            end
        end)

        WSOncloseConnection = ws.OnClose:Connect(function()
            print("Connection Closed, Reconnecting...")
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

    function GUI:SmoothHideUI(table, parent)
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
        if table[parent] == nil then
            table[parent] = parent.BackgroundTransparency
        end
        TweenService:Create(parent, tweenInfo, {BackgroundTransparency = 0}):Play()

        for _, v in ipairs(parent:GetDescendants()) do
            if v:IsA("Frame") or v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("ImageLabel") or v:IsA("ImageButton") then
                if table[v] == nil then
                    table[v] = v.BackgroundTransparency
                end
                TweenService:Create(v, tweenInfo, {BackgroundTransparency = 0}):Play()
            end
        end
        task.wait(tweenInfo.Time)
    end

    function GUI:SmoothUnHideUI(table)
        local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
        for v, trans in pairs(table) do
            if v and v.Parent then -- make sure object still exists
                TweenService:Create(v, tweenInfo, {BackgroundTransparency = trans}):Play()
            end
        end
        task.wait(tweenInfo.Time)
    end

    if TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService then
        -- Legacy Chat
        ChatConnection = ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
            GUI:NewMessageLabel(Chat, `<font color="#ff0000">Chat</font> | <font color="#008CFF">{messageData.FromSpeaker}:</font> {messageData.Message}`)
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
                GUI:NewMessageLabel(Chat, `<font color="#ff0000">Chat</font> | <font color="#008CFF">{sender}:</font> {message.Text}`)
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

    local ChatUITransparencies = {}
    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == Enum.KeyCode.T
        and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
        or Input.KeyCode == Enum.KeyCode.T
        and UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
            if Container.Visible then
                GUI:SmoothHideUI(ChatUITransparencies, Container)
                Container.Visible = false
            else
                GUI:SmoothUnHideUI(ChatUITransparencies)
                Container.Visible = true
            end
        end
    end)

    local ClientsOnlineUITransparencies = {}
    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == Enum.KeyCode.P
        and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
        or Input.KeyCode == Enum.KeyCode.P
        and UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
            local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
            if ClientsOnline.Visible then
                GUI:SmoothHideUI(ClientsOnlineUITransparencies, ClientsOnline)
                ClientsOnline.Visible = false
            else
                GUI:SmoothUnHideUI(ClientsOnlineUITransparencies)
                ClientsOnline.Visible = true
            end
        end
    end)

    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == Enum.KeyCode.Slash
        and not UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
        and not UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
            if Tabs.Position == UDim2.new(0, 0, 0, 0) then
                local Text = TextBox_2.Text
                TextBox_2:CaptureFocus()
                task.wait()
                TextBox_2.Text = Text
            else
                local Text = TextBox.Text
                TextBox:CaptureFocus()
                task.wait()
                TextBox.Text = Text
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
        
        GUI:SendWS(Player.Name, Player.DisplayName, EnteredText)
    end)

    ImageButton_2.MouseButton1Click:Connect(function()
        local EnteredText = TextBox_2.Text
        if EnteredText == "" then return end
        TextBox_2.Text = ""
        
        if WSEnabled then
            GUI:SendWS(Player.Name, Player.DisplayName, EnteredText)
        else
            GUI:SendChat(EnteredText)
        end
    end)

    Tab.MouseButton1Click:Connect(function()
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
        if ChatTab == 2 then
            ChatTab = 1
            Tab.Image = "rbxassetid://72456773280111"
            TweenService:Create(Tab, tweenInfo, { Rotation = 0 }):Play()
            TweenService:Create(Tabs, tweenInfo, { Position = UDim2.new(0, 0, 0, 0) }):Play()
        else
            ChatTab = 2
            Tab.Image = "rbxassetid://111335953127713"
            TweenService:Create(Tab, tweenInfo, { Rotation = 180 }):Play()
            TweenService:Create(Tabs, tweenInfo, { Position = UDim2.new(-1, 0, 0, 0) }):Play()
        end
    end)

    TextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local EnteredText = TextBox.Text
            if EnteredText == "" then return end
            TextBox.Text = ""
            GUI:SendWS(Player.Name, Player.DisplayName, EnteredText)
        end
    end)

    TextBox_2.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local EnteredText = TextBox_2.Text
            if EnteredText == "" then return end
            TextBox_2.Text = ""
            if WSEnabled then
                GUI:SendWS(Player.Name, Player.DisplayName, EnteredText)
            else
                GUI:SendChat(EnteredText)
            end
        end
    end)

    Players.PlayerRemoving:Connect(function(plr)
        if plr == Player then
            if WSOncloseConnection then
                WSOncloseConnection:Disconnect()
                WSOncloseConnection = nil
            end
            if WSOnMessageConnection then
                WSOnMessageConnection:Disconnect()
                WSOnMessageConnection = nil
            end
            if WS then
                WS:Close()
                WS = nil
            end

            _G.ChatLoaded = false
        end
        
        GUI:NewMessageLabel(Chat, `<font color="#55ff7f">{plr.DisplayName} Has Left The Game</font>`)
    end)

    Players.PlayerAdded:Connect(function(plr)
        GUI:NewMessageLabel(Chat, `<font color="#55ff7f">{plr.DisplayName} Has Joined The Game</font>`)
    end)

    return GUI
end
return Hyperion
