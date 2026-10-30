local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function Notify(Title, Text, Duration)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CreditNotification"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 280, 0, 65)
    MainFrame.Position = UDim2.new(1, -300, 0, 20)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(255, 5, 5)
    UIStroke.Thickness = 2
    UIStroke.Parent = MainFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 0, 25)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextSize = 16
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Text = Title
    TitleLabel.Parent = MainFrame

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Size = UDim2.new(1, -20, 0, 25)
    TextLabel.Position = UDim2.new(0, 10, 0, 30)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.TextSize = 14
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left
    TextLabel.Text = Text
    TextLabel.Parent = MainFrame

    task.delay(Duration or 5, function()
        if ScreenGui then
            ScreenGui:Destroy()
        end
    end)
end

Notify("Credits", "Made by [HexHubX]", 10)
