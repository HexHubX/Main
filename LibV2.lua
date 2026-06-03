pcall(function()                                                                       --creds to mjcontega--
    game:GetService('CoreGui'):FindFirstChild('HexHubX'):Destroy()
end)

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

local Library = {}

local Color_Accent = Color3.fromRGB(255, 5, 5)
local Color_Main   = Color3.fromRGB(15, 15, 15)
local Color_Sec    = Color3.fromRGB(25, 25, 25)
local Color_Text   = Color3.fromRGB(255, 255, 255)
local Color_TextDim= Color3.fromRGB(150, 150, 150)

function Library:Window(title)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "HexHubX"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true

    local ToggleBtn = Instance.new("TextButton")
    local ToggleCorner = Instance.new("UICorner")
    local ToggleStroke = Instance.new("UIStroke")

    ToggleBtn.Name = "ToggleBtn"
    ToggleBtn.Parent = ScreenGui
    ToggleBtn.BackgroundColor3 = Color_Sec
    ToggleBtn.Position = UDim2.new(0.100000001, 21, 0.100000001, 64)
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
    TabsContainer.Size = UDim2.new(1, 0, 1, 0)
    TabsContainer.ScrollBarThickness = 0

    TabsList.Parent = TabsContainer
    TabsList.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabsList.SortOrder = Enum.SortOrder.LayoutOrder
    TabsList.Padding = UDim.new(0, 5)

    TabsPad.Parent = TabsContainer
    TabsPad.PaddingTop = UDim.new(0, 10)

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

        function Elements:Button(text, callback)
            local Button = Instance.new("TextButton")
            local BtnCorner = Instance.new("UICorner")
            local BtnStroke = Instance.new("UIStroke")
            
            Button.Parent = Page
            Button.BackgroundColor3 = Color_Sec
            Button.Size = UDim2.new(1, 0, 0, 32)
            Button.Font = Enum.Font.Gotham
            Button.Text = text
            Button.TextColor3 = Color_Text
            Button.TextSize = 13
            Button.AutoButtonColor = false

            BtnCorner.CornerRadius = UDim.new(0, 6)
            BtnCorner.Parent = Button

            BtnStroke.Parent = Button
            BtnStroke.Thickness = 1
            BtnStroke.Color = Color_Sec
            BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            Button.MouseEnter:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35,35,35)}):Play()
                TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color_Accent}):Play()
            end)

            Button.MouseLeave:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.2), {BackgroundColor3 = Color_Sec}):Play()
                TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color_Sec}):Play()
            end)

            Button.MouseButton1Click:Connect(function()
                TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = Color_Accent, TextColor3 = Color_Main}):Play()
                task.wait(0.1)
                TweenService:Create(Button, TweenInfo.new(0.3), {BackgroundColor3 = Color_Sec, TextColor3 = Color_Text}):Play()
                pcall(callback)
            end)
        end

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
    local DiscordFrame = Instance.new("TextButton")
    local DiscordCorner = Instance.new("UICorner")
    local Icon = Instance.new("ImageLabel")
    local TextContainer = Instance.new("Frame")
    local TitleLabel = Instance.new("TextLabel")
    private = Instance.new("TextLabel")
    local OpenButton = Instance.new("TextButton")
    local OpenCorner = Instance.new("UICorner")
    local OpenStroke = Instance.new("UIStroke")

    DiscordFrame.Parent = Page
    DiscordFrame.BackgroundColor3 = Color_Sec
    DiscordFrame.Size = UDim2.new(1, 0, 0, 60)
    DiscordFrame.AutoButtonColor = false
    DiscordFrame.Text = ""

    DiscordCorner.CornerRadius = UDim.new(0, 6)
    DiscordCorner.Parent = DiscordFrame

    Icon.Parent = DiscordFrame
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0, 12, 0.5, -15)
    Icon.Size = UDim2.new(0, 30, 0, 30)
    Icon.Image = data.DiscordIcon or "rbxassetid://10723424838"

    TextContainer.Parent = DiscordFrame
    TextContainer.BackgroundTransparency = 1
    TextContainer.Position = UDim2.new(0, 52, 0, 0)
    TextContainer.Size = UDim2.new(1, -120, 1, 0)

    TitleLabel.Parent = TextContainer
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 0, 0, 8)
    TitleLabel.Size = UDim2.new(1, 0, 0, 18)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = data.DiscordTitle or "Join our Discord"
    TitleLabel.TextColor3 = Color_Text
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

    private.Parent = TextContainer
    private.BackgroundTransparency = 1
    private.Position = UDim2.new(0, 0, 0, 28)
    private.Size = UDim2.new(1, 0, 0, 18)
    private.Font = Enum.Font.Gotham
    private.Text = data.DiscordLink or "discord.gg/..."
    private.TextColor3 = Color3.fromRGB(150, 150, 150)
    private.TextSize = 12
    private.TextXAlignment = Enum.TextXAlignment.Left

    OpenButton.Parent = DiscordFrame
    OpenButton.BackgroundColor3 = Color_Main
    OpenButton.Position = UDim2.new(1, -50, 0.5, -12)
    OpenButton.Size = UDim2.new(0, 40, 0, 24)
    OpenButton.Text = "Join"
    OpenButton.TextColor3 = Color_Text
    OpenButton.TextSize = 12
    OpenButton.Font = Enum.Font.GothamBold
    OpenButton.AutoButtonColor = false

    OpenCorner.CornerRadius = UDim.new(0, 4)
    OpenCorner.Parent = OpenButton

    OpenStroke.Parent = OpenButton
    OpenStroke.Thickness = 1
    OpenStroke.Color = Color3.fromRGB(50, 50, 50)

    OpenButton.MouseEnter:Connect(function()
        TweenService:Create(OpenButton, TweenInfo.new(0.2), {BackgroundColor3 = Color_Accent}):Play()
    end)
    OpenButton.MouseLeave:Connect(function()
        TweenService:Create(OpenButton, TweenInfo.new(0.2), {BackgroundColor3 = Color_Main}):Play()
    end)

    OpenButton.MouseButton1Click:Connect(function()
        if data.DiscordLink and data.DiscordLink ~= "" then
            setclipboard(data.DiscordLink)
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Discord Link",
                Text = "Link copied to clipboard!",
                Duration = 2
            })
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
        function Elements:Stats(text)
    local Lab = Instance.new("TextLabel")
    local LabCorner = Instance.new("UICorner")
    
    Lab.Parent = Page
    Lab.BackgroundColor3 = Color_Sec
    Lab.Size = UDim2.new(1, 0, 0, 28)
    Lab.Font = Enum.Font.Gotham
    Lab.Text = text
    Lab.TextColor3 = Color_Text
    Lab.TextSize = 13

    LabCorner.CornerRadius = UDim.new(0, 6)
    LabCorner.Parent = Lab
    
    return Lab
end

function Elements:setLabel(labelObject, newText)
    labelObject.Text = newText
end
        function Elements:Label(text)
            local Lab = Instance.new("TextLabel")
            local LabCorner = Instance.new("UICorner")
            
            Lab.Parent = Page
            Lab.BackgroundColor3 = Color_Sec
            Lab.Size = UDim2.new(1, 0, 0, 28)
            Lab.Font = Enum.Font.Gotham
            Lab.Text = text
            Lab.TextColor3 = Color_Text
            Lab.TextSize = 13

            LabCorner.CornerRadius = UDim.new(0, 6)
            LabCorner.Parent = Lab
        end

        return Elements
    end

    return TabHandler
end

return Library
