--[[
    Angxll Hub
    UI-only interface for Roblox Studio
    File: AngxllHub.lua
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Eliminar versión anterior
local oldGui = playerGui:FindFirstChild("AngxllHub")
if oldGui then
    oldGui:Destroy()
end

-- ScreenGui principal
local Gui = Instance.new("ScreenGui")
Gui.Name = "AngxllHub"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = playerGui

-- Ventana principal
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(700, 430)
Main.Position = UDim2.new(0.5, -350, 0.5, -215)
Main.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
Main.BorderSizePixel = 0
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

-- Barra superior
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Position = UDim2.fromOffset(18, 0)
Title.BackgroundTransparency = 1
Title.Text = "🤖  Angxll Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 21
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(42, 34)
Close.Position = UDim2.new(1, -50, 0, 8)
Close.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
Close.Text = "✕"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 18
Close.Font = Enum.Font.GothamBold
Close.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = Close

Close.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

-- Barra lateral
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 180, 1, -50)
Sidebar.Position = UDim2.fromOffset(0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(27, 27, 34)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local function CreateSidebarButton(text, y)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -20, 0, 42)
    Button.Position = UDim2.fromOffset(10, y)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(220, 220, 220)
    Button.TextSize = 15
    Button.Font = Enum.Font.Gotham
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.Parent = Sidebar

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Button

    return Button
end

CreateSidebarButton("🔍  Search", 15)
CreateSidebarButton("🌾  Farming", 65)
CreateSidebarButton("⚙️  General", 115)
CreateSidebarButton("🌍  Teleports", 165)
CreateSidebarButton("📦  Inventory", 215)
CreateSidebarButton("👥  Players", 265)
CreateSidebarButton("🔧  Settings", 315)

-- Contenido
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -180, 1, -50)
Content.Position = UDim2.fromOffset(180, 50)
Content.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
Content.BorderSizePixel = 0
Content.Parent = Main

local function CreateLabel(text, position, size, textSize, bold)
    local Label = Instance.new("TextLabel")
    Label.Size = size
    Label.Position = position
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = textSize
    Label.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Content

    return Label
end

CreateLabel(
    "💰  Information",
    UDim2.fromOffset(15, 12),
    UDim2.new(1, -30, 0, 35),
    18,
    true
)

local Cash = CreateLabel(
    "Cash: $125,000",
    UDim2.fromOffset(15, 52),
    UDim2.new(1, -30, 0, 25),
    15,
    false
)

Cash.TextColor3 = Color3.fromRGB(190, 190, 190)

local Bank = CreateLabel(
    "Bank: $3,000,000",
    UDim2.fromOffset(15, 78),
    UDim2.new(1, -30, 0, 25),
    15,
    false
)

Bank.TextColor3 = Color3.fromRGB(190, 190, 190)

local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, -30, 0, 1)
Line.Position = UDim2.fromOffset(15, 115)
Line.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
Line.BorderSizePixel = 0
Line.Parent = Content

CreateLabel(
    "🌾  Farming",
    UDim2.fromOffset(15, 130),
    UDim2.new(1, -30, 0, 30),
    17,
    true
)

-- Crear botones de activación
local function CreateToggle(text, y)
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.fromOffset(250, 35)
    Toggle.Position = UDim2.fromOffset(15, y)
    Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    Toggle.Text = "☐  " .. text
    Toggle.TextColor3 = Color3.fromRGB(220, 220, 220)
    Toggle.TextSize = 14
    Toggle.Font = Enum.Font.Gotham
    Toggle.TextXAlignment = Enum.TextXAlignment.Left
    Toggle.Parent = Content

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 6)
    Corner.Parent = Toggle

    local Enabled = false

    Toggle.MouseButton1Click:Connect(function()
        Enabled = not Enabled

        if Enabled then
            Toggle.Text = "☑  " .. text
            Toggle.BackgroundColor3 = Color3.fromRGB(45, 100, 65)
        else
            Toggle.Text = "☐  " .. text
            Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
        end
    end)

    return Toggle
end

CreateToggle("Auto Farm", 170)
CreateToggle("Auto Sell", 210)
CreateToggle("Auto Collect", 250)

-- Botón Start Farming
local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.fromOffset(250, 40)
StartButton.Position = UDim2.fromOffset(15, 300)
StartButton.BackgroundColor3 = Color3.fromRGB(55, 95, 180)
StartButton.Text = "▶  Start Farming"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.TextSize = 15
StartButton.Font = Enum.Font.GothamBold
StartButton.Parent = Content

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 6)
StartCorner.Parent = StartButton

StartButton.MouseButton1Click:Connect(function()
    StartButton.Text = "⏸  Farming Started"
end)

-- Sistema para mover la ventana
local Dragging = false
local DragStart
local StartPosition

TopBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = Input.Position
        StartPosition = Main.Position
    end
end)

TopBar.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton1
        or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Dragging and (
        Input.UserInputType == Enum.UserInputType.MouseMovement
        or Input.UserInputType == Enum.UserInputType.Touch
    ) then

        local Delta = Input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
    end
end)