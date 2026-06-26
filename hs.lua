local Library = (function()
    pcall(function()
        if game:GetService('CoreGui'):FindFirstChild('HexHubX') then
            game:GetService('CoreGui'):FindFirstChild('HexHubX'):Destroy()
        end
    end)

    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Player = Players.LocalPlayer
    local Mouse = Player:GetMouse()
    local CoreGui = game:GetService("CoreGui")

    local Lib = {}

    local Color_Accent = Color3.fromRGB(255, 5, 5)
    local Color_Main   = Color3.fromRGB(15, 15, 15)
    local Color_Sec    = Color3.fromRGB(25, 25, 25)
    local Color_Text   = Color3.fromRGB(255, 255, 255)
    local Color_TextDim= Color3.fromRGB(150, 150, 150)

    getgenv().MakeNotifi = function(Configs)
        local Title = Configs.Title or "HexHubX"
        local text = Configs.Text or "Notification"
        local timewait = Configs.Time or 5

        local NotifyScreen = CoreGui:FindFirstChild("NotificationsLib")
        if not NotifyScreen then
            NotifyScreen = Instance.new("ScreenGui")
            NotifyScreen.Name = "NotificationsLib"
            NotifyScreen.Parent = CoreGui
        end

        local Menu_Notifi = NotifyScreen:FindFirstChild("Menu_Notifi")
        if not Menu_Notifi then
            Menu_Notifi = Instance.new("Frame")
            Menu_Notifi.Name = "Menu_Notifi"
            Menu_Notifi.Size = UDim2.new(0, 300, 1, 0)
            Menu_Notifi.Position = UDim2.new(1, 0, 0, 0)
            Menu_Notifi.AnchorPoint = Vector2.new(1, 0)
            Menu_Notifi.BackgroundTransparency = 1
            Menu_Notifi.Parent = NotifyScreen

            local ListLayout = Instance.new("UIListLayout")
            ListLayout.Padding = UDim.new(0, 15)
            ListLayout.VerticalAlignment = "Bottom"
            ListLayout.Parent = Menu_Notifi

            local UIPadding = Instance.new("UIPadding")
            UIPadding.PaddingLeft = UDim.new(0, 25)
            UIPadding.PaddingTop = UDim.new(0, 25)
            UIPadding.PaddingBottom = UDim.new(0, 50)
            UIPadding.Parent = Menu_Notifi
        end

        local Frame1 = Instance.new("Frame")
        Frame1.Size = UDim2.new(2, 0, 0, 0)
        Frame1.BackgroundTransparency = 1
        Frame1.AutomaticSize = "Y"
        Frame1.Name = "Title"
        Frame1.Parent = Menu_Notifi

        local Frame2 = Instance.new("Frame")
        Frame2.Size = UDim2.new(0, Menu_Notifi.Size.X.Offset - 50, 0, 0)
        Frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        Frame2.Position = UDim2.new(1, 0, 0, 0)
        Frame2.AutomaticSize = "Y"
        Frame2.Parent = Frame1

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(0, 15)
        Corner.Parent = Frame2

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, 0, 0, 25)
        TextLabel.Font = Enum.Font.FredokaOne
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = Title
        TextLabel.TextSize = 20
        TextLabel.Position = UDim2.new(0, 20, 0, 5)
        TextLabel.TextXAlignment = "Left"
        TextLabel.TextColor3 = Color3.fromRGB(240, 240, 240)
        TextLabel.Parent = Frame2

        local TextButton = Instance.new("TextButton")
        TextButton.Text = "X"
        TextButton.Font = Enum.Font.FredokaOne
        TextButton.TextSize = 20
        TextButton.BackgroundTransparency = 1
        TextButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TextButton.Position = UDim2.new(1, -5, 0, 5)
        TextButton.AnchorPoint = Vector2.new(1, 0)
        TextButton.Size = UDim2.new(0, 25, 0, 25)
        TextButton.Parent = Frame2

        local TextLabel2 = Instance.new("TextLabel")
        TextLabel2.Size = UDim2.new(1, -30, 0, 0)
        TextLabel2.Position = UDim2.new(0, 20, 0, TextButton.Size.Y.Offset + 10)
        TextLabel2.TextSize = 15
        TextLabel2.TextColor3 = Color3.fromRGB(240, 240, 240)
        TextLabel2.TextXAlignment = "Left"
        TextLabel2.TextYAlignment = "Top"
        TextLabel2.AutomaticSize = "Y"
        TextLabel2.Text = text
        TextLabel2.Font = Enum.Font.FredokaOne
        TextLabel2.BackgroundTransparency = 1
        TextLabel2.TextWrapped = true
        TextLabel2.Parent = Frame2

        local Cor_Stroke = Instance.new("Frame")
        Cor_Stroke.Size = UDim2.new(1, 0, 0, 2)
        Cor_Stroke.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        Cor_Stroke.Position = UDim2.new(0, 2, 0, 30)
        Cor_Stroke.BorderSizePixel = 0
        Cor_Stroke.Parent = Frame2

        local Corner2 = Instance.new("UICorner")
        Corner2.CornerRadius = UDim.new(0, 15)
        Corner2.Parent = Cor_Stroke

        local Spacer = Instance.new("Frame")
        Spacer.Size = UDim2.new(0, 0, 0, 5)
        Spacer.Position = UDim2.new(0, 0, 1, 5)
        Spacer.BackgroundTransparency = 1
        Spacer.Parent = Frame2

        task.spawn(function()
            local tween = TweenService:Create(Cor_Stroke, TweenInfo.new(timewait, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 2)})
            tween:Play()
        end)

        TextButton.MouseButton1Click:Connect(function()
            local tween1 = TweenService:Create(Frame2, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Position = UDim2.new(0, -20, 0, 0)})
            tween1:Play()
            tween1.Completed:Wait()
            local tween2 = TweenService:Create(Frame2, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {Position = UDim2.new(1, 0, 0, 0)})
            tween2:Play()
            Frame1:Destroy()
        end)

        task.spawn(function()
            local tween1 = TweenService:Create(Frame2, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {Position = UDim2.new(0, -20, 0, 0)})
            tween1:Play()
            task.wait(0.1)
            local tween2 = TweenService:Create(Frame2, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Position = UDim2.new(0, 0, 0, 0)})
            tween2:Play()
            task.wait(timewait)
            if Frame2 and Frame2.Parent then
                local tween3 = TweenService:Create(Frame2, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {Position = UDim2.new(0, -20, 0, 0)})
                tween3:Play()
                tween3.Completed:Wait()
                local tween4 = TweenService:Create(Frame2, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {Position = UDim2.new(1, 0, 0, 0)})
                tween4:Play()
                Frame1:Destroy()
            end
        end)
    end

    function Lib:Window(Configs)
        local title = Configs.Hub.Title or "HexHubX"
        local customTag = Configs.Hub.UserTag or "Premium User"
        
        local KeySystem = Configs.Key.KeySystem or false
        local KeyTitle = Configs.Key.Title or "Key System"
        local KeyDescription = Configs.Key.Description or "Get key on discord server"
        local KeyKey = Configs.Key.Keys or {"123", "321"}
        local KeyLink = Configs.Key.KeyLink or ""
        local KeyNotifications = Configs.Key.Notifi.Notifications or true
        local KeyNotSuccess = Configs.Key.Notifi.Incorrectkey or "The key is incorrect"
        local KeySuccess = Configs.Key.Notifi.CorrectKey or "Running the Script..."
        local KeyCopyKeyLink = Configs.Key.Notifi.CopyKeyLink or "Copied to Clipboard"

        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "HexHubX"
        ScreenGui.Parent = game:GetService("CoreGui")
        ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ScreenGui.ResetOnSpawn = false
        ScreenGui.IgnoreGuiInset = true

        if KeySystem then
            local KeyMenu = Instance.new("Frame")
            local KeyMenuCorner = Instance.new("UICorner")
            local KeyMenuStroke = Instance.new("UIStroke")
            local CloseButton = Instance.new("TextButton")
            local CloseCorner = Instance.new("UICorner")
            local KTitle = Instance.new("TextLabel")
            local Description = Instance.new("TextLabel")
            local ConfirmButton = Instance.new("TextButton")
            local ConfirmCorner = Instance.new("UICorner")
            local GetKeyLink = Instance.new("TextButton")
            local GetKeyCorner = Instance.new("UICorner")
            local TextBox = Instance.new("TextBox")
            local TextBoxCorner = Instance.new("UICorner")

            KeyMenu.Name = "KeyMenu"
            KeyMenu.Parent = ScreenGui
            KeyMenu.Size = UDim2.new(0, 438, 0, 324)
            KeyMenu.BackgroundColor3 = Color_Main
            KeyMenu.AnchorPoint = Vector2.new(0.5, 0.5)
            KeyMenu.Position = UDim2.new(0.5, 0, 0.5, 0)
            KeyMenu.Active = true
            KeyMenu.Draggable = true

            KeyMenuCorner.CornerRadius = UDim.new(0, 8)
            KeyMenuCorner.Parent = KeyMenu

            KeyMenuStroke.Parent = KeyMenu
            KeyMenuStroke.Thickness = 1.7
            KeyMenuStroke.Color = Color_Accent

            CloseButton.Parent = KeyMenu
            CloseButton.Size = UDim2.new(0, 30, 0, 30)
            CloseButton.Position = UDim2.new(1, -10, 0, 5)
            CloseButton.AnchorPoint = Vector2.new(1, 0)
            CloseButton.Text = "X"
            CloseButton.Font = Enum.Font.FredokaOne
            CloseButton.TextSize = 20
            CloseButton.TextColor3 = Color_Accent
            CloseButton.BackgroundTransparency = 1

            CloseCorner.CornerRadius = UDim.new(0, 6)
            CloseCorner.Parent = CloseButton

            KTitle.Parent = KeyMenu
            KTitle.Size = UDim2.new(1, -80, 0, 30)
            KTitle.Position = UDim2.new(0, 20, 0, 10)
            KTitle.Text = KeyTitle
            KTitle.Font = Enum.Font.GothamBold
            KTitle.TextSize = 16
            KTitle.TextColor3 = Color_Text
            KTitle.TextXAlignment = Enum.TextXAlignment.Left
            KTitle.BackgroundTransparency = 1

            Description.Parent = KeyMenu
            Description.Size = UDim2.new(1, -40, 0, 0)
            Description.Text = KeyDescription
            Description.TextSize = 13
            Description.TextColor3 = Color_TextDim
            Description.Font = Enum.Font.Gotham
            Description.Position = UDim2.new(0, 20, 0, 45)
            Description.TextXAlignment = Enum.TextXAlignment.Left
            Description.AutomaticSize = Enum.AutomaticSize.Y
            Description.TextYAlignment = Enum.TextYAlignment.Top
            Description.BackgroundTransparency = 1

            TextBox.Parent = KeyMenu
            TextBox.Size = UDim2.new(0, 336, 0, 50)
            TextBox.Position = UDim2.new(0.5, 0, 0, 100)
            TextBox.AnchorPoint = Vector2.new(0.5, 0)
            TextBox.BackgroundColor3 = Color_Sec
            TextBox.PlaceholderText = "Put the Key here"
            TextBox.Text = ""
            TextBox.TextColor3 = Color_Text
            TextBox.Font = Enum.Font.Gotham
            TextBox.TextSize = 14
            TextBox.BorderSizePixel = 0

            TextBoxCorner.CornerRadius = UDim.new(0, 6)
            TextBoxCorner.Parent = TextBox

            GetKeyLink.Parent = KeyMenu
            GetKeyLink.Text = "Get Key Link"
            GetKeyLink.Font = Enum.Font.GothamBold
            GetKeyLink.TextSize = 14
            GetKeyLink.TextColor3 = Color_Text
            GetKeyLink.Size = UDim2.new(0, 150, 0, 45)
            GetKeyLink.Position = UDim2.new(0, 52, 0, 190)
            GetKeyLink.BackgroundColor3 = Color_Sec
            GetKeyLink.BorderSizePixel = 0

            GetKeyCorner.CornerRadius = UDim.new(0, 6)
            GetKeyCorner.Parent = GetKeyLink

            ConfirmButton.Parent = KeyMenu
            ConfirmButton.Text = "Confirm"
            ConfirmButton.Font = Enum.Font.GothamBold
            ConfirmButton.TextSize = 14
            ConfirmButton.TextColor3 = Color_Text
            ConfirmButton.Size = UDim2.new(0, 150, 0, 45)
            ConfirmButton.Position = UDim2.new(0, 238, 0, 190)
            ConfirmButton.BackgroundColor3 = Color_Sec
            ConfirmButton.BorderSizePixel = 0

            ConfirmCorner.CornerRadius = UDim.new(0, 6)
            ConfirmCorner.Parent = ConfirmButton

            local KeyVerify = false
            
            CloseButton.MouseButton1Click:Connect(function()
                ScreenGui:Destroy()
            end)

            ConfirmButton.MouseButton1Click:Connect(function()
                for _, v in pairs(KeyKey) do
                    if TextBox.Text == v then
                        KeyVerify = true
                    end
                end
                if not KeyVerify then
                    if KeyNotifications then
                        getgenv().MakeNotifi({
                            Title = KeyTitle,
                            Text = KeyNotSuccess,
                            Time = 5
                        })
                    end
                else
                    if KeyNotifications then
                        getgenv().MakeNotifi({
                            Title = KeyTitle,
                            Text = KeySuccess,
                            Time = 5
                        })
                    end
                    task.wait(1)
                    KeyMenu:Destroy()
                end
            end)

            GetKeyLink.MouseButton1Click:Connect(function()
                setclipboard(KeyLink)
                if KeyNotifications then
                    getgenv().MakeNotifi({
                        Title = KeyTitle,
                        Text = KeyCopyKeyLink,
                        Time = 5
                    })
                end
            end)

            repeat task.wait() until KeyVerify
        end

        local ToggleBtn = Instance.new("TextButton")
        local ToggleCorner = Instance.new("UICorner")
        local ToggleStroke = Instance.new("UIStroke")

        ToggleBtn.Name = "ToggleBtn"
        ToggleBtn.Parent = ScreenGui
        ToggleBtn.BackgroundColor3 = Color_Sec
        ToggleBtn.Position = UDim2.new(0.1, 21, 0.1, 64)
        ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
        ToggleBtn.Font = Enum.Font.GothamBold
        ToggleBtn.Text = "UI"
        ToggleBtn.TextColor3 = Color_Accent
        ToggleBtn.TextSize = 20
        ToggleBtn.Active = true
        ToggleBtn.Draggable = true

        ToggleCorner.CornerRadius = UDim.new(1, 0)
        ToggleCorner.Parent = ToggleBtn

        ToggleStroke.Parent = ToggleBtn
        ToggleStroke.Thickness = 2
        ToggleStroke.Color = Color_Accent
        ToggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local Main = Instance.new("Frame")
        local MainCorner = Instance.new("UICorner")
        local MainStroke = Instance.new("UIStroke")
        
        Main.Name = "Main"
        Main.Parent = ScreenGui
        Main.BackgroundColor3 = Color_Main
        Main.BorderSizePixel = 0
        Main.AnchorPoint = Vector2.new(0.5, 0.5)
        Main.Position = UDim2.new(0.5, 0, 0.5, 0)
        Main.Size = UDim2.new(0, 0, 0, 0)
        Main.Visible = false
        Main.ClipsDescendants = true

        local isOpen = false
        local fullSize = UDim2.new(0, 470, 0, 283)

        ToggleBtn.MouseButton1Click:Connect(function()
            isOpen = not isOpen
            if isOpen then
                Main.Visible = true
                TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = fullSize}):Play()
                TweenService:Create(MainStroke, TweenInfo.new(0.5), {Transparency = 0}):Play()
            else
                local closeTween = TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
                TweenService:Create(MainStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
                closeTween:Play()
                closeTween.Completed:Wait()
                Main.Visible = false
            end
        end)

        MainCorner.CornerRadius = UDim.new(0, 8)
        MainCorner.Parent = Main

        MainStroke.Parent = Main
        MainStroke.Thickness = 1
        MainStroke.Color = Color_Accent
        MainStroke.Transparency = 1 

        local dragging, dragInput, dragStart, startPos
        
        local function update(input)
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        Main.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = Main.Position
                
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        Main.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)

        local Top = Instance.new("Frame")
        local Line = Instance.new("Frame")
        local GameTitle = Instance.new("TextLabel")
        local CloseBtn = Instance.new("TextButton")

        Top.Name = "Top"
        Top.Parent = Main
        Top.BackgroundColor3 = Color_Sec
        Top.Size = UDim2.new(1, 0, 0, 34)
        Top.BorderSizePixel = 0

        local TopCorner = Instance.new("UICorner")
        TopCorner.CornerRadius = UDim.new(0, 8)
        TopCorner.Parent = Top
        
        local TopCover = Instance.new("Frame")
        TopCover.Parent = Top
        TopCover.BackgroundColor3 = Color_Sec
        TopCover.BorderSizePixel = 0
        TopCover.Position = UDim2.new(0, 0, 1, -5)
        TopCover.Size = UDim2.new(1, 0, 0, 5)

        Line.Name = "Line"
        Line.Parent = Top
        Line.BackgroundColor3 = Color_Accent
        Line.BorderSizePixel = 0
        Line.Position = UDim2.new(0, 0, 1, 0)
        Line.Size = UDim2.new(1, 0, 0, 1)

        GameTitle.Parent = Top
        GameTitle.BackgroundTransparency = 1
        GameTitle.Position = UDim2.new(0, 12, 0, 0)
        GameTitle.Size = UDim2.new(0, 200, 1, 0)
        GameTitle.Font = Enum.Font.GothamBold
        GameTitle.Text = title
        GameTitle.TextColor3 = Color_Accent
        GameTitle.TextSize = 15
        GameTitle.TextXAlignment = Enum.TextXAlignment.Left

        CloseBtn.Parent = Top
        CloseBtn.BackgroundTransparency = 1
        CloseBtn.Position = UDim2.new(1, -30, 0, 0)
        CloseBtn.Size = UDim2.new(0, 30, 1, 0)
        CloseBtn.Font = Enum.Font.GothamBold
        CloseBtn.Text = "X"
        CloseBtn.TextColor3 = Color_TextDim
        CloseBtn.TextSize = 14
        
        CloseBtn.MouseButton1Click:Connect(function()
            isOpen = false
            local closeTween = TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
            TweenService:Create(MainStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
            closeTween:Play()
            closeTween.Completed:Wait()
            Main.Visible = false
        end)

        local TabsFrame = Instance.new("Frame")
        local TabsContainer = Instance.new("ScrollingFrame")
        local PagesFrame = Instance.new("Frame")
        local TabsList = Instance.new("UIListLayout")
        local TabsPad = Instance.new("UIPadding")

        TabsFrame.Parent = Main
        TabsFrame.BackgroundColor3 = Color_Sec
        TabsFrame.Position = UDim2.new(0, 0, 0, 35)
        TabsFrame.Size = UDim2.new(0, 120, 1, -35)
        TabsFrame.BorderSizePixel = 0
        
        local TabsCorner = Instance.new("UICorner")
        TabsCorner.CornerRadius = UDim.new(0, 8)
        TabsCorner.Parent = TabsFrame

        local TabsCover = Instance.new("Frame")
        TabsCover.Parent = TabsFrame
        TabsCover.BackgroundColor3 = Color_Sec
        TabsCover.BorderSizePixel = 0
        TabsCover.Position = UDim2.new(1, -4, 0, 0)
        TabsCover.Size = UDim2.new(0, 4, 1, 0)

        TabsContainer.Parent = TabsFrame
        TabsContainer.BackgroundTransparency = 1
        TabsContainer.Size = UDim2.new(1, 0, 1, -55) -- Adjusted to leave space for the profile layout card
        TabsContainer.ScrollBarThickness = 0

        TabsList.Parent = TabsContainer
        TabsList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        TabsList.SortOrder = Enum.SortOrder.LayoutOrder
        TabsList.Padding = UDim.new(0, 5)

        TabsPad.Parent = TabsContainer
        TabsPad.PaddingTop = UDim.new(0, 10)

        -- Integrated English Profile Card Feature
        local UserCard = Instance.new("Frame")
        local CardCorner = Instance.new("UICorner")
        local UserAvatar = Instance.new("ImageLabel")
        local AvatarCorner = Instance.new("UICorner")
        local TextContainer = Instance.new("Frame")
        local TopCustomText = Instance.new("TextLabel")
        local PlayerNameLabel = Instance.new("TextLabel")

        UserCard.Name = "UserCard"
        UserCard.Parent = TabsFrame
        UserCard.Size = UDim2.new(1, -12, 0, 45)
        UserCard.Position = UDim2.new(0.5, 0, 1, -10)
        UserCard.AnchorPoint = Vector2.new(0.5, 1)
        UserCard.BackgroundColor3 = Color_Main
        UserCard.BorderSizePixel = 0

        CardCorner.CornerRadius = UDim.new(0, 6)
        CardCorner.Parent = UserCard

        UserAvatar.Name = "UserAvatar"
        UserAvatar.Parent = UserCard
        UserAvatar.Size = UDim2.new(0, 32, 0, 32)
        UserAvatar.Position = UDim2.new(0, 6, 0.5, 0)
        UserAvatar.AnchorPoint = Vector2.new(0, 0.5)
        UserAvatar.BackgroundTransparency = 1
        UserAvatar.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. Player.UserId .. "&width=150&height=150&format=png"

        AvatarCorner.CornerRadius = UDim.new(1, 0)
        AvatarCorner.Parent = UserAvatar

        TextContainer.Name = "TextContainer"
        TextContainer.Parent = UserCard
        TextContainer.Size = UDim2.new(1, -44, 1, 0)
        TextContainer.Position = UDim2.new(0, 42, 0, 0)
        TextContainer.BackgroundTransparency = 1

        TopCustomText.Name = "TopCustomText"
        TopCustomText.Parent = TextContainer
        TopCustomText.Size = UDim2.new(1, 0, 0, 18)
        TopCustomText.Position = UDim2.new(0, 0, 0, 5)
        TopCustomText.BackgroundTransparency = 1
        TopCustomText.Font = Enum.Font.GothamBold
        TopCustomText.Text = customTag
        TopCustomText.TextColor3 = Color_Accent
        TopCustomText.TextSize = 10
        TopCustomText.TextXAlignment = Enum.TextXAlignment.Left

        PlayerNameLabel.Name = "PlayerNameLabel"
        PlayerNameLabel.Parent = TextContainer
        PlayerNameLabel.Size = UDim2.new(1, 0, 0, 18)
        PlayerNameLabel.Position = UDim2.new(0, 0, 0, 18)
        PlayerNameLabel.BackgroundTransparency = 1
        PlayerNameLabel.Font = Enum.Font.GothamMedium
        PlayerNameLabel.Text = Player.DisplayName
        PlayerNameLabel.TextColor3 = Color_Text
        PlayerNameLabel.TextSize = 11
        PlayerNameLabel.TextXAlignment = Enum.TextXAlignment.Left
        PlayerNameLabel.TextTruncate = Enum.TextTruncate.AtEnd

        PagesFrame.Parent = Main
        PagesFrame.BackgroundColor3 = Color_Main
        PagesFrame.BackgroundTransparency = 1
        PagesFrame.Position = UDim2.new(0, 125, 0, 40)
        PagesFrame.Size = UDim2.new(1, -130, 1, -45)

        local Resizer = Instance.new("ImageButton")
        Resizer.Parent = Main
        Resizer.BackgroundTransparency = 1
        Resizer.Position = UDim2.new(1, -20, 1, -20)
        Resizer.Size = UDim2.new(0, 20, 0, 20)
        Resizer.Image = "rbxassetid://3926307971"
        Resizer.ImageRectOffset = Vector2.new(204, 364)
        Resizer.ImageRectSize = Vector2.new(36, 36)
        Resizer.ImageColor3 = Color_Accent
        
        local isResizing = false
        local resizeStart = Vector2.new(0,0)
        local startSize = UDim2.new(0,0,0,0)

        Resizer.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isResizing = true
                resizeStart = input.Position
                startSize = Main.Size
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if isResizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - resizeStart
                local newX = math.max(350, startSize.X.Offset + delta.X)
                local newY = math.max(200, startSize.Y.Offset + delta.Y)
                Main.Size = UDim2.new(0, newX, 0, newY)
                fullSize = UDim2.new(0, newX, 0, newY)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                isResizing = false
            end
        end)

        local TabHandler = {}
        local FirstTab = true

        function TabHandler:Tab(text)
            local TabBtn = Instance.new("TextButton")
            local TabBtnCorner = Instance.new("UICorner")
            
            TabBtn.Name = text
            TabBtn.Parent = TabsContainer
            TabBtn.BackgroundColor3 = Color_Accent
            TabBtn.BackgroundTransparency = 1
            TabBtn.Size = UDim2.new(0, 100, 0, 28)
            TabBtn.Font = Enum.Font.GothamMedium
            TabBtn.Text = text
            TabBtn.TextColor3 = Color_TextDim
            TabBtn.TextSize = 13
            
            TabBtnCorner.CornerRadius = UDim.new(0, 6)
            TabBtnCorner.Parent = TabBtn

            local Page = Instance.new("ScrollingFrame")
            local PageList = Instance.new("UIListLayout")
            local PagePad = Instance.new("UIPadding")

            Page.Name = text .. "_Page"
            Page.Parent = PagesFrame
            Page.BackgroundTransparency = 1
            Page.Size = UDim2.new(1, 0, 1, 0)
            Page.ScrollBarThickness = 2
            Page.ScrollBarImageColor3 = Color_Accent
            Page.Visible = false
            Page.CanvasSize = UDim2.new(0, 0, 0, 0)

            PageList.Parent = Page
            PageList.SortOrder = Enum.SortOrder.LayoutOrder
            PageList.Padding = UDim.new(0, 6)

            PagePad.Parent = Page
            PagePad.PaddingRight = UDim.new(0, 6)

            PageList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                Page.CanvasSize = UDim2.new(0, 0, 0, PageList.AbsoluteContentSize.Y + 10)
            end)

            local function Activate()
                for _, v in pairs(TabsContainer:GetChildren()) do
                    if v:IsA("TextButton") then
                        TweenService:Create(v, TweenInfo.new(0.3), {BackgroundTransparency = 1, TextColor3 = Color_TextDim}):Play()
                    end
                end
                for _, v in pairs(PagesFrame:GetChildren()) do
                    v.Visible = false
                end

                Page.Visible = true
                TweenService:Create(TabBtn, TweenInfo.new(0.3), {BackgroundTransparency = 0.85, TextColor3 = Color_Accent}):Play()
            end

            TabBtn.MouseButton1Click:Connect(Activate)

            if FirstTab then
                FirstTab = false
                Activate()
            end

            local Elements = {}

            function Elements:Toggle(text, default, callback)
                local ToggleFrame = Instance.new("TextButton")
                local TogCorner = Instance.new("UICorner")
                local TogTitle = Instance.new("TextLabel")
                local TogBox = Instance.new("Frame")
                local TogBoxCorner = Instance.new("UICorner")
                local TogBoxStroke = Instance.new("UIStroke")
                local Check = Instance.new("Frame")
                local CheckCorner = Instance.new("UICorner")

                local toggled = default or false

                ToggleFrame.Parent = Page
                ToggleFrame.BackgroundColor3 = Color_Sec
                ToggleFrame.Size = UDim2.new(1, 0, 0, 32)
                ToggleFrame.AutoButtonColor = false
                ToggleFrame.Text = ""

                TogCorner.CornerRadius = UDim.new(0, 6)
                TogCorner.Parent = ToggleFrame

                TogTitle.Parent = ToggleFrame
                TogTitle.BackgroundTransparency = 1
                TogTitle.Position = UDim2.new(0, 10, 0, 0)
                TogTitle.Size = UDim2.new(1, -40, 1, 0)
                TogTitle.Font = Enum.Font.Gotham
                TogTitle.Text = text
                TogTitle.TextColor3 = Color_Text
                TogTitle.TextSize = 13
                TogTitle.TextXAlignment = Enum.TextXAlignment.Left

                TogBox.Parent = ToggleFrame
                TogBox.BackgroundColor3 = Color_Main
                TogBox.Position = UDim2.new(1, -26, 0.5, -9)
                TogBox.Size = UDim2.new(0, 18, 0, 18)

                TogBoxCorner.CornerRadius = UDim.new(0, 4)
                TogBoxCorner.Parent = TogBox

                TogBoxStroke.Parent = TogBox
                TogBoxStroke.Thickness = 1
                TogBoxStroke.Color = Color3.fromRGB(50,50,50)

                Check.Parent = TogBox
                Check.BackgroundColor3 = Color_Accent
                Check.AnchorPoint = Vector2.new(0.5,0.5)
                Check.Position = UDim2.new(0.5,0,0.5,0)
                Check.Size = UDim2.new(0, 0, 0, 0)

                CheckCorner.CornerRadius = UDim.new(0, 2)
                CheckCorner.Parent = Check

                if toggled then
                    Check.Size = UDim2.new(0, 10, 0, 10)
                    TogBoxStroke.Color = Color_Accent
                end

                ToggleFrame.MouseEnter:Connect(function()
                    TweenService:Create(ToggleFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
                end)
                ToggleFrame.MouseLeave:Connect(function()
                    TweenService:Create(ToggleFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color_Sec}):Play()
                end)

                ToggleFrame.MouseButton1Click:Connect(function()
                    toggled = not toggled
                    if toggled then
                        TweenService:Create(Check, TweenInfo.new(0.2, Enum.EasingStyle.Back), {Size = UDim2.new(0, 10, 0, 10)}):Play()
                        TweenService:Create(TogBoxStroke, TweenInfo.new(0.2), {Color = Color_Accent}):Play()
                    else
                        TweenService:Create(Check, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 0)}):Play()
                        TweenService:Create(TogBoxStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(50,50,50)}):Play()
                    end
                    pcall(callback, toggled)
                end)
            end
            
            function Elements:Discord(data)
                local DiscordFrame = Instance.new("Frame")
                DiscordFrame.Parent = Page
                DiscordFrame.Size = UDim2.new(1, 0, 0, 110)
                DiscordFrame.BackgroundColor3 = Color_Sec
                DiscordFrame.AutomaticSize = "Y"
                DiscordFrame.BorderSizePixel = 0

                local DiscordCorner = Instance.new("UICorner")
                DiscordCorner.CornerRadius = UDim.new(0, 6)
                DiscordCorner.Parent = DiscordFrame

                local LinkLabel = Instance.new("TextLabel")
                LinkLabel.Parent = DiscordFrame
                LinkLabel.Size = UDim2.new(1, 0, 0, 25)
                LinkLabel.Position = UDim2.new(0, 12, 0, 0)
                LinkLabel.BackgroundTransparency = 1
                LinkLabel.Text = data.DiscordLink or "discord.gg/..."
                LinkLabel.TextXAlignment = Enum.TextXAlignment.Left
                LinkLabel.TextColor3 = Color3.fromRGB(0, 120, 255)
                LinkLabel.Font = Enum.Font.GothamBold
                LinkLabel.TextSize = 14

                local TitleLabel = Instance.new("TextLabel")
                TitleLabel.Parent = DiscordFrame
                TitleLabel.Size = UDim2.new(1, 0, 0, 25)
                TitleLabel.Position = UDim2.new(0, 60, 0, 25)
                TitleLabel.BackgroundTransparency = 1
                TitleLabel.Text = data.DiscordTitle or "Join our Discord"
                TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
                TitleLabel.TextColor3 = Color_Text
                TitleLabel.Font = Enum.Font.GothamBold
                TitleLabel.TextSize = 14

                local Icon = Instance.new("ImageLabel")
                Icon.Parent = DiscordFrame
                Icon.Size = UDim2.new(0, 40, 0, 40)
                Icon.AnchorPoint = Vector2.new(0, 0.5)
                Icon.Position = UDim2.new(0, 12, 0.45, 0)
                Icon.BackgroundTransparency = 1
                Icon.Image = data.DiscordIcon or "rbxassetid://10723424838"

                local IconCorner = Instance.new("UICorner")
                IconCorner.CornerRadius = UDim.new(0, 4)
                IconCorner.Parent = Icon

                local JoinButton = Instance.new("TextButton")
                JoinButton.Parent = DiscordFrame
                JoinButton.Size = UDim2.new(1, -24, 0, 30)
                JoinButton.AnchorPoint = Vector2.new(0.5, 1)
                JoinButton.Position = UDim2.new(0.5, 0, 1, -8)
                JoinButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
                JoinButton.Text = "Join"
                JoinButton.TextColor3 = Color3.fromRGB(220, 220, 220)
                JoinButton.Font = Enum.Font.GothamBold
                JoinButton.TextSize = 15
                JoinButton.BorderSizePixel = 0
                JoinButton.AutoButtonColor = false

                local JoinCorner = Instance.new("UICorner")
                JoinCorner.CornerRadius = UDim.new(0, 4)
                JoinCorner.Parent = JoinButton

                local clickTime = tick()
                local clickCount = 0

                JoinButton.MouseEnter:Connect(function()
                    TweenService:Create(JoinButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 220, 60)}):Play()
                end)

                JoinButton.MouseLeave:Connect(function()
                    if JoinButton.Text ~= "Copied to Clipboard" then
                        TweenService:Create(JoinButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 200, 50)}):Play()
                    end
                end)

                JoinButton.MouseButton1Click:Connect(function()
                    if clickCount == 0 or tick() - clickTime > 5 then
                        clickTime = tick()
                        setclipboard(data.DiscordLink or "")
                        clickCount = clickCount + 1
                        JoinButton.Text = "Copied to Clipboard"
                        JoinButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
                        JoinButton.TextColor3 = Color3.fromRGB(150, 150, 150)
                        task.wait(5)
                        JoinButton.Text = "Join"
                        JoinButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
                        JoinButton.TextColor3 = Color3.fromRGB(220, 220, 220)
                    end
                end)
            end

            function Elements:TextBox(text, placeholder, callback)
                local TextBoxFrame = Instance.new("TextButton")
                local BoxCorner = Instance.new("UICorner")
                local BoxTitle = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")
                local BoxStroke = Instance.new("UIStroke")

                TextBoxFrame.Parent = Page
                TextBoxFrame.BackgroundColor3 = Color_Sec
                TextBoxFrame.Size = UDim2.new(1, 0, 0, 52)
                TextBoxFrame.AutoButtonColor = false
                TextBoxFrame.Text = ""

                BoxCorner.CornerRadius = UDim.new(0, 6)
                BoxCorner.Parent = TextBoxFrame

                BoxTitle.Parent = TextBoxFrame
                BoxTitle.BackgroundTransparency = 1
                BoxTitle.Position = UDim2.new(0, 10, 0, 0)
                BoxTitle.Size = UDim2.new(1, -20, 0, 20)
                BoxTitle.Font = Enum.Font.Gotham
                BoxTitle.Text = text
                BoxTitle.TextColor3 = Color_Text
                BoxTitle.TextSize = 13
                BoxTitle.TextXAlignment = Enum.TextXAlignment.Left

                TextBox.Parent = TextBoxFrame
                TextBox.BackgroundColor3 = Color_Main
                TextBox.Position = UDim2.new(0, 10, 0, 24)
                TextBox.Size = UDim2.new(1, -20, 0, 22)
                TextBox.Font = Enum.Font.Gotham
                TextBox.TextColor3 = Color_Text
                TextBox.TextSize = 12
                TextBox.TextXAlignment = Enum.TextXAlignment.Left
                TextBox.Text = placeholder or ""
                TextBox.PlaceholderText = placeholder or "Enter text..."
                TextBox.ClearTextOnFocus = false

                BoxStroke.Parent = TextBox
                BoxStroke.Thickness = 1
                BoxStroke.Color = Color3.fromRGB(50, 50, 50)

                TextBox.FocusLost:Connect(function(enterPressed)
                    pcall(callback, TextBox.Text)
                end)
            end

            function Elements:Slider(text, min, max, default, callback)
                local SliderFrame = Instance.new("Frame")
                local SlideCorner = Instance.new("UICorner")
                local SlideTitle = Instance.new("TextLabel")
                local SlideValue = Instance.new("TextLabel")
                local BarBG = Instance.new("Frame")
                local BarCorner = Instance.new("UICorner")
                local BarFill = Instance.new("Frame")
                local FillCorner = Instance.new("UICorner")
                local Interact = Instance.new("TextButton")

                min = min or 0
                max = max or 100
                default = default or min
                local value = default

                SliderFrame.Parent = Page
                SliderFrame.BackgroundColor3 = Color_Sec
                SliderFrame.Size = UDim2.new(1, 0, 0, 50)

                SlideCorner.CornerRadius = UDim.new(0, 6)
                SlideCorner.Parent = SliderFrame

                SlideTitle.Parent = SliderFrame
                SlideTitle.BackgroundTransparency = 1
                SlideTitle.Position = UDim2.new(0, 10, 0, 5)
                SlideTitle.Size = UDim2.new(1, -20, 0, 20)
                SlideTitle.Font = Enum.Font.Gotham
                SlideTitle.Text = text
                SlideTitle.TextColor3 = Color_Text
                SlideTitle.TextSize = 13
                SlideTitle.TextXAlignment = Enum.TextXAlignment.Left

                SlideValue.Parent = SliderFrame
                SlideValue.BackgroundTransparency = 1
                SlideValue.Position = UDim2.new(0, 10, 0, 5)
                SlideValue.Size = UDim2.new(1, -20, 0, 20)
                SlideValue.Font = Enum.Font.Gotham
                SlideValue.Text = tostring(value)
                SlideValue.TextColor3 = Color_Accent
                SlideValue.TextSize = 13
                SlideValue.TextXAlignment = Enum.TextXAlignment.Right

                BarBG.Parent = SliderFrame
                BarBG.BackgroundColor3 = Color_Main
                BarBG.Position = UDim2.new(0, 10, 0, 30)
                BarBG.Size = UDim2.new(1, -20, 0, 6)

                BarCorner.CornerRadius = UDim.new(1, 0)
                BarCorner.Parent = BarBG

                BarFill.Parent = BarBG
                BarFill.BackgroundColor3 = Color_Accent
                BarFill.Size = UDim2.new((value - min) / (max - min), 0, 1, 0)

                FillCorner.CornerRadius = UDim.new(1, 0)
                FillCorner.Parent = BarFill

                Interact.Parent = SliderFrame
                Interact.BackgroundTransparency = 1
                Interact.Position = UDim2.new(0, 0, 0, 25)
                Interact.Size = UDim2.new(1, 0, 0, 25)
                Interact.Text = ""

                local function UpdateSlide(input)
                    local SizeX = BarBG.AbsoluteSize.X
                    local SlideX = BarBG.AbsolutePosition.X
                    local InputX = input.Position.X
                    
                    local Percent = math.clamp((InputX - SlideX) / SizeX, 0, 1)
                    value = math.floor(min + (max - min) * Percent)
                    
                    SlideValue.Text = tostring(value)
                    TweenService:Create(BarFill, TweenInfo.new(0.05), {Size = UDim2.new(Percent, 0, 1, 0)}):Play()
                    pcall(callback, value)
                end

                local sliding = false

                Interact.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        sliding = true
                        TweenService:Create(SliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
                        UpdateSlide(input)
                    end
                end)

                Interact.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        sliding = false
                        TweenService:Create(SliderFrame, TweenInfo.new(0.2), {BackgroundColor3 = Color_Sec}):Play()
                    end
                end)

                UserInputService.InputChanged:Connect(function(input)
                    if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        UpdateSlide(input)
                    end
                end)
            end

            function Elements:Dropdown(text, options, callback)
                local DropFrame = Instance.new("Frame")
                local DropCorner = Instance.new("UICorner")
                local DropButton = Instance.new("TextButton")
                local DropTitle = Instance.new("TextLabel")
                local DropArrow = Instance.new("ImageLabel")
                local OptionHolder = Instance.new("Frame")
                local OptionList = Instance.new("UIListLayout")
                
                local dropped = false

                DropFrame.Parent = Page
                DropFrame.BackgroundColor3 = Color_Sec
                DropFrame.Size = UDim2.new(1, 0, 0, 32)
                DropFrame.ClipsDescendants = true
                DropFrame.ZIndex = 2

                DropCorner.CornerRadius = UDim.new(0, 6)
                DropCorner.Parent = DropFrame

                DropButton.Parent = DropFrame
                DropButton.BackgroundTransparency = 1
                DropButton.Size = UDim2.new(1, 0, 0, 32)
                DropButton.Text = ""

                DropTitle.Parent = DropFrame
                DropTitle.BackgroundTransparency = 1
                DropTitle.Position = UDim2.new(0, 10, 0, 0)
                DropTitle.Size = UDim2.new(1, -35, 0, 32)
                DropTitle.Font = Enum.Font.Gotham
                DropTitle.Text = text
                DropTitle.TextColor3 = Color_Text
                DropTitle.TextSize = 13
                DropTitle.TextXAlignment = Enum.TextXAlignment.Left

                DropArrow.Parent = DropFrame
                DropArrow.BackgroundTransparency = 1
                DropArrow.Position = UDim2.new(1, -25, 0, 8)
                DropArrow.Size = UDim2.new(0, 16, 0, 16)
                DropArrow.Image = "rbxassetid://6031091004"
                DropArrow.ImageColor3 = Color_Accent

                OptionHolder.Parent = DropFrame
                OptionHolder.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                OptionHolder.BorderSizePixel = 0
                OptionHolder.Position = UDim2.new(0, 0, 0, 32)
                OptionHolder.Size = UDim2.new(1, 0, 0, 0)

                OptionList.Parent = OptionHolder
                OptionList.SortOrder = Enum.SortOrder.LayoutOrder

                local function RefreshOptions()
                    for _, v in pairs(OptionHolder:GetChildren()) do
                        if v:IsA("TextButton") then v:Destroy() end
                    end
                    
                    for _, opt in pairs(options) do
                        local OptBtn = Instance.new("TextButton")
                        OptBtn.Parent = OptionHolder
                        OptBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                        OptBtn.Size = UDim2.new(1, 0, 0, 30)
                        OptBtn.Font = Enum.Font.Gotham
                        OptBtn.Text = opt
                        OptBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
                        OptBtn.TextSize = 13
                        OptBtn.BorderSizePixel = 0
                        
                        OptBtn.MouseEnter:Connect(function()
                            TweenService:Create(OptBtn, TweenInfo.new(0.2), {TextColor3 = Color_Accent}):Play()
                        end)
                        OptBtn.MouseLeave:Connect(function()
                            TweenService:Create(OptBtn, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
                        end)

                        OptBtn.MouseButton1Click:Connect(function()
                            DropTitle.Text = text .. ": " .. opt
                            pcall(callback, opt)
                            dropped = false
                            TweenService:Create(DropFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 32)}):Play()
                            TweenService:Create(DropArrow, TweenInfo.new(0.3), {Rotation = 0}):Play()
                        end)
                    end
                end

                RefreshOptions()

                DropButton.MouseButton1Click:Connect(function()
                    dropped = not dropped
                    if dropped then
                        local count = #options
                        local contentSize = count * 30
                        TweenService:Create(DropFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 32 + contentSize)}):Play()
                        TweenService:Create(OptionHolder, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 0, contentSize)}):Play()
                        TweenService:Create(DropArrow, TweenInfo.new(0.3), {Rotation = 180}):Play()
                    else
                        TweenService:Create(DropFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 0, 32)}):Play()
                        TweenService:Create(OptionHolder, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 0, 0)}):Play()
                        TweenService:Create(DropArrow, TweenInfo.new(0.3), {Rotation = 0}):Play()
                    end
                end)
            end

            function Elements:Paragraph(config)
                local PFrame = Instance.new("Frame")
                local PCorner = Instance.new("UICorner")
                local PTitle = Instance.new("TextLabel")
                local PText = Instance.new("TextLabel")

                PFrame.Parent = Page
                PFrame.BackgroundColor3 = Color_Sec
                PFrame.Size = UDim2.new(1, 0, 0, 52)

                PCorner.CornerRadius = UDim.new(0, 6)
                PCorner.Parent = PFrame

                PTitle.Parent = PFrame
                PTitle.BackgroundTransparency = 1
                PTitle.Position = UDim2.new(0, 10, 0, 5)
                PTitle.Size = UDim2.new(1, -20, 0, 18)
                PTitle.Font = Enum.Font.GothamBold
                PTitle.Text = config.Title or "Paragraph"
                PTitle.TextColor3 = Color_Accent
                PTitle.TextSize = 13
                PTitle.TextXAlignment = Enum.TextXAlignment.Left

                PText.Parent = PFrame
                PText.BackgroundTransparency = 1
                PText.Position = UDim2.new(0, 10, 0, 23)
                PText.Size = UDim2.new(1, -20, 0, 24)
                PText.Font = Enum.Font.Gotham
                PText.Text = config.Text or ""
                PText.TextColor3 = Color_TextDim
                PText.TextSize = 12
                PText.TextXAlignment = Enum.TextXAlignment.Left
                PText.TextWrapped = true
            end
        
            function Elements:Label(text)
                local Lab = Instance.new("TextLabel")
                local LabCorner = Instance.new("UICorner")
                local LabStroke = Instance.new("UIStroke")
                
                Lab.Parent = Page 
                Lab.BackgroundColor3 = Color_Sec
                Lab.Size = UDim2.new(1, 0, 0, 28)
                Lab.Font = Enum.Font.Gotham
                Lab.Text = text
                Lab.TextColor3 = Color_Text
                Lab.TextSize = 13

                LabCorner.CornerRadius = UDim.new(0, 6)
                LabCorner.Parent = Lab

                LabStroke.Parent = Lab
                LabStroke.Thickness = 1
                LabStroke.Color = Color3.fromRGB(152, 17, 242)
                LabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                
                return Lab
            end

            function Elements:setLabel(labelObject, newText)
                if labelObject and labelObject:IsA("TextLabel") then
                    labelObject.Text = newText
                end
            end
            
            function Elements:State(text)
                local Lab = Instance.new("TextLabel")
                local LabCorner = Instance.new("UICorner")
                local LabStroke = Instance.new("UIStroke")
                
                Lab.Parent = Page 
                Lab.BackgroundColor3 = Color_Sec
                Lab.Size = UDim2.new(1, 0, 0, 28)
                Lab.Font = Enum.Font.Gotham
                Lab.Text = text
                Lab.TextColor3 = Color_Text
                Lab.TextSize = 13

                LabCorner.CornerRadius = UDim.new(0, 6)
                LabCorner.Parent = Lab

                LabStroke.Parent = Lab
                LabStroke.Thickness = 1
                LabStroke.Color = Color3.fromRGB(74, 0, 255)
                LabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                
                return Lab
            end

            function Elements:ColorPicker(Configs)
                local name = Configs.Title or "Color Picker"
                local Default = Configs.Default or Color3.fromRGB(255, 0, 0)
                local Callback = Configs.Callback or function() end
                
                local ColorH, ColorS, ColorV = Color3.toHSV(Default)
                pcall(Callback, Default)

                local TextButton = Instance.new("Frame")
                local TextButtonCorner = Instance.new("UICorner")
                local TextButtonStroke = Instance.new("UIStroke")
                
                TextButton.Parent = Page
                TextButton.Size = UDim2.new(1, 0, 0, 25)
                TextButton.BackgroundColor3 = Color_Sec
                TextButton.ClipsDescendants = true

                TextButtonCorner.CornerRadius = UDim.new(0, 6)
                TextButtonCorner.Parent = TextButton

                TextButtonStroke.Color = Color3.fromRGB(45, 45, 45)
                TextButtonStroke.Thickness = 1
                TextButtonStroke.Parent = TextButton

                local click = Instance.new("TextButton")
                click.Parent = TextButton
                click.Size = UDim2.new(1, 0, 0, 25)
                click.BackgroundTransparency = 1
                click.AutoButtonColor = false
                click.Text = ""

                local TextLabel = Instance.new("TextLabel")
                TextLabel.Parent = TextButton
                TextLabel.Size = UDim2.new(1, -10, 0, 25)
                TextLabel.Position = UDim2.new(0, 35, 0, 0)
                TextLabel.TextSize = 12
                TextLabel.TextColor3 = Color_Text
                TextLabel.TextXAlignment = Enum.TextXAlignment.Left
                TextLabel.Text = name
                TextLabel.Font = Enum.Font.Gotham
                TextLabel.BackgroundTransparency = 1

                local picker = Instance.new("Frame")
                local pickerCorner = Instance.new("UICorner")
                local pickerStroke = Instance.new("UIStroke")
                
                picker.Parent = TextButton
                picker.Size = UDim2.new(0, 20, 0, 20)
                picker.Position = UDim2.new(0, 5, 0, 2.5)
                picker.BackgroundColor3 = Default

                pickerCorner.CornerRadius = UDim.new(0, 4)
                pickerCorner.Parent = picker

                pickerStroke.Color = Color3.fromRGB(60, 60, 60)
                pickerStroke.Thickness = 1
                pickerStroke.Parent = picker

                local UI_Grade = Instance.new("ImageButton")
                local UI_GradeCorner = Instance.new("UICorner")
                local UI_GradeStroke = Instance.new("UIStroke")
                
                UI_Grade.Parent = TextButton
                UI_Grade.Size = UDim2.new(1, -100, 0, 95)
                UI_Grade.Position = UDim2.new(0, 10, 0, 37)
                UI_Grade.Visible = false
                UI_Grade.Image = "rbxassetid://4155801252"

                UI_GradeCorner.CornerRadius = UDim.new(0, 4)
                UI_GradeCorner.Parent = UI_Grade

                UI_GradeStroke.Color = Color3.fromRGB(50, 50, 50)
                UI_GradeStroke.Parent = UI_Grade

                local SavePos = Instance.new("Frame")
                SavePos.Parent = UI_Grade
                SavePos.Visible = false

                local grade = Instance.new("TextButton")
                local gradeCorner = Instance.new("UICorner")
                local gradeStroke = Instance.new("UIStroke")
                local gradGradient = Instance.new("UIGradient")
                
                grade.Parent = TextButton
                grade.Size = UDim2.new(0, 30, 0, 95)
                grade.Position = UDim2.new(1, -10, 0, 37)
                grade.AnchorPoint = Vector2.new(1, 0)
                grade.Visible = false
                grade.Text = ""

                gradeCorner.CornerRadius = UDim.new(0, 4)
                gradeCorner.Parent = grade

                gradeStroke.Color = Color3.fromRGB(50, 50, 50)
                gradeStroke.Parent = grade

                gradGradient.Rotation = 90
                gradGradient.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
                    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
                    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
                    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
                    ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
                })
                gradGradient.Parent = grade

                local SavePos2 = Instance.new("Frame")
                SavePos2.Parent = grade
                SavePos2.Visible = false
                SavePos2.Size = UDim2.new(1, 0, 0, 0)

                local A_1 = Instance.new("Frame")
                local A_1Stroke = Instance.new("UIStroke")
                
                A_1.Parent = TextButton
                A_1.Size = UDim2.new(1, 0, 0, 1)
                A_1.Position = UDim2.new(0, 0, 0, 30)
                A_1.Visible = false
                A_1Stroke.Color = Color3.fromRGB(45, 45, 45)
                A_1Stroke.Parent = A_1

                local Select1 = Instance.new("Frame")
                local Select1Corner = Instance.new("UICorner")
                local Select1Stroke = Instance.new("UIStroke")
                
                Select1.Parent = grade
                Select1.Size = UDim2.new(1, 0, 0, 6)
                Select1.Position = UDim2.new(0, 0, 0, ColorH * 95)
                Select1.BackgroundTransparency = 1
                Select1.Active = true
                Select1.Draggable = true

                Select1Corner.CornerRadius = UDim.new(1, 0)
                Select1Corner.Parent = Select1
                Select1Stroke.Color = Color3.fromRGB(255, 255, 255)
                Select1Stroke.Thickness = 1.5
                Select1Stroke.Parent = Select1

                local Select2 = Instance.new("Frame")
                local Select2Corner = Instance.new("UICorner")
                local Select2Stroke = Instance.new("UIStroke")
                
                Select2.Parent = UI_Grade
                Select2.Size = UDim2.new(0, 10, 0, 10)
                Select2.Position = UDim2.new(0, ColorS * 222, 0, (1 - ColorV) * 95)
                Select2.BackgroundTransparency = 1
                Select2.Active = true
                Select2.Draggable = true

                Select2Corner.CornerRadius = UDim.new(1, 0)
                Select2Corner.Parent = Select2
                Select2Stroke.Color = Color3.fromRGB(255, 255, 255)
                Select2Stroke.Thickness = 1.5
                Select2Stroke.Parent = Select2

                local function callback()
                    pcall(Callback, Color3.fromHSV(ColorH, ColorS, ColorV))
                end

                local function updcolorpicker()
                    ColorH = math.clamp(Select1.Position.Y.Offset / 95, 0, 1)
                    ColorS = math.clamp(Select2.Position.X.Offset / UI_Grade.AbsoluteSize.X, 0, 1)
                    ColorV = math.clamp(1 - (Select2.Position.Y.Offset / 95), 0, 1)
                    
                    UI_Grade.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
                    picker.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                    callback()
                end

                UI_Grade.MouseButton1Click:Connect(function()
                    local mouse = UserInputService:GetMouseLocation()
                    local savepos = UI_Grade.AbsolutePosition
                    local newX = math.clamp(mouse.X - savepos.X, 0, UI_Grade.AbsoluteSize.X)
                    local newY = math.clamp(mouse.Y - savepos.Y - 36, 0, 95)
                    TweenService:Create(Select2, TweenInfo.new(0.2), {Position = UDim2.new(0, newX, 0, newY)}):Play()
                    task.wait(0.05)
                    updcolorpicker()
                end)

                grade.MouseButton1Click:Connect(function()
                    local mouse = UserInputService:GetMouseLocation().Y - 36
                    local savepos = grade.AbsolutePosition.Y
                    local newY = math.clamp(mouse - savepos, 0, 95)
                    TweenService:Create(Select1, TweenInfo.new(0.2), {Position = UDim2.new(0, 0, 0, newY)}):Play()
                    task.wait(0.05)
                    updcolorpicker()
                end)

                Select1.Changed:Connect(function(prop)
                    if prop == "Position" then
                        Select1.Position = UDim2.new(0, 0, 0, math.clamp(Select1.Position.Y.Offset, 0, 95))
                        updcolorpicker()
                    end
                end)

                Select2.Changed:Connect(function(prop)
                    if prop == "Position" then
                        Select2.Position = UDim2.new(0, math.clamp(Select2.Position.X.Offset, 0, 222), 0, math.clamp(Select2.Position.Y.Offset, 0, 95))
                        updcolorpicker()
                    end
                end)

                TextButton.Changed:Connect(function(prop)
                    if prop == "Size" then
                        if TextButton.Size.Y.Offset >= 60 then
                            picker.Position = UDim2.new(0, 5, 0, 5)
                            UI_Grade.Visible = true
                            A_1.Visible = true
                            grade.Visible = true
                        else
                            picker.Position = UDim2.new(0, 5, 0, 2.5)
                            UI_Grade.Visible = false
                            A_1.Visible = false
                            grade.Visible = false
                        end
                    end
                end)

                local onoff = false
                click.MouseButton1Click:Connect(function()
                    onoff = not onoff
                    if onoff == true then
                        TweenService:Create(TextButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 0, 145)}):Play()
                    else
                        TweenService:Create(TextButton, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 0, 25)}):Play()
                    end
                end)
                
                updcolorpicker()
                return picker
            end

            return Elements
        end

        return TabHandler
    end

    return Lib
end)()

return Library
