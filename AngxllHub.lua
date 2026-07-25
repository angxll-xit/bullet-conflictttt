--[[
    Angxll Hub
    Mobile UI
]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local OldGui = PlayerGui:FindFirstChild("AngxllHub")
if OldGui then
    OldGui:Destroy()
end

local Gui = Instance.new("ScreenGui")
Gui.Name = "AngxllHub"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

-- BOTÓN PARA VOLVER A ABRIR EL MENÚ
local OpenButton = Instance.new("TextButton")
OpenButton.Name = "OpenButton"
OpenButton.Size = UDim2.fromOffset(55, 55)
OpenButton.Position = UDim2.new(0, 15, 0.5, -27)
OpenButton.BackgroundColor3 = Color3.fromRGB(45, 90, 180)
OpenButton.Text = "🤖"
OpenButton.TextSize = 25
OpenButton.Visible = false
OpenButton.Parent = Gui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenButton

-- MENÚ PRINCIPAL
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(360, 300)
Main.Position = UDim2.new(0.5, -180, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
Main.BorderSizePixel = 0
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

-- BARRA SUPERIOR
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 42)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -55, 1, 0)
Title.Position = UDim2.fromOffset(12, 0)
Title.BackgroundTransparency = 1
Title.Text = "🤖 Angxll Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 17
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- BOTÓN CERRAR
local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(35, 30)
Close.Position = UDim2.new(1, -42, 0, 6)
Close.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
Close.Text = "✕"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 16
Close.Font = Enum.Font.GothamBold
Close.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = Close

-- SIDEBAR
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 100, 1, -42)
Sidebar.Position = UDim2.fromOffset(0, 42)
Sidebar.BackgroundColor3 = Color3.fromRGB(27, 27, 34)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local function CreateSideButton(Text, Y)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -10, 0, 30)
    Button.Position = UDim2.fromOffset(5, Y)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    Button.Text = Text
    Button.TextColor3 = Color3.fromRGB(220, 220, 220)
    Button.TextSize = 11
    Button.Font = Enum.Font.Gotham
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.Parent = Sidebar

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 5)
    Corner.Parent = Button

    return Button
end

CreateSideButton("🔍 Search", 10)
CreateSideButton("🌾 Farming", 47)
CreateSideButton("⚙️ General", 84)
CreateSideButton("🌍 Teleports", 121)
CreateSideButton("📦 Inventory", 158)
CreateSideButton("👥 Players", 195)
CreateSideButton("🔧 Settings", 232)

-- CONTENIDO
local Content = Instance.new("Frame")
Content.Size = UDim2.new(1, -100, 1, -42)
Content.Position = UDim2.fromOffset(100, 42)
Content.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
Content.BorderSizePixel = 0
Content.Parent = Main

local function CreateLabel(Text, X, Y, Size, TextSize, Bold)
    local Label = Instance.new("TextLabel")
    Label.Size = Size
    Label.Position = UDim2.fromOffset(X, Y)
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = TextSize
    Label.Font = Bold and Enum.Font.GothamBold or Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Content

    return Label
end

-- INFORMACIÓN
CreateLabel(
    "💰 Information",
    12,
    10,
    UDim2.new(1, -20, 0, 25),
    15,
    true
)

-- CASH DINÁMICO
local CashLabel = CreateLabel(
    "Cash: $0",
    12,
    38,
    UDim2.new(1, -20, 0, 20),
    12,
    false
)

-- BANCO
local BankLabel = CreateLabel(
    "Bank: $0",
    12,
    59,
    UDim2.new(1, -20, 0, 20),
    12,
    false
)

-- ACTUALIZAR CASH AUTOMÁTICAMENTE
task.spawn(function()
    local Leaderstats = Player:WaitForChild("leaderstats", 10)

    if Leaderstats then
        local Cash = Leaderstats:FindFirstChild("Cash")

        if Cash then
            local function UpdateCash()
                CashLabel.Text = "Cash: $" .. tostring(Cash.Value)
            end

            UpdateCash()

            Cash:GetPropertyChangedSignal("Value"):Connect(function()
                UpdateCash()
            end)
        else
            CashLabel.Text = "Cash: $0"
        end
    end
end)

-- ACTUALIZAR BANK SI EXISTE
task.spawn(function()
    local Leaderstats = Player:WaitForChild("leaderstats", 10)

    if Leaderstats then
        local Bank = Leaderstats:FindFirstChild("Bank")

        if Bank then
            local function UpdateBank()
                BankLabel.Text = "Bank: $" .. tostring(Bank.Value)
            end

            UpdateBank()

            Bank:GetPropertyChangedSignal("Value"):Connect(function()
                UpdateBank()
            end)
        end
    end
end)

-- SEPARADOR
local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, -20, 0, 1)
Line.Position = UDim2.fromOffset(10, 85)
Line.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
Line.BorderSizePixel = 0
Line.Parent = Content

-- TÍTULO FARMING
CreateLabel(
    "🌾 Farming",
    12,
    94,
    UDim2.new(1, -20, 0, 25),
    14,
    true
)

-- TOGGLES
local function CreateToggle(Text, Y)
    local Toggle = Instance.new("TextButton")
    Toggle.Size = UDim2.new(1, -20, 0, 28)
    Toggle.Position = UDim2.fromOffset(10, Y)
    Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
    Toggle.Text = "☐  " .. Text
    Toggle.TextColor3 = Color3.fromRGB(220, 220, 220)
    Toggle.TextSize = 12
    Toggle.Font = Enum.Font.Gotham
    Toggle.TextXAlignment = Enum.TextXAlignment.Left
    Toggle.Parent = Content

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 5)
    Corner.Parent = Toggle

    local Enabled = false

    Toggle.MouseButton1Click:Connect(function()
        Enabled = not Enabled

        if Enabled then
            Toggle.Text = "☑  " .. Text
            Toggle.BackgroundColor3 = Color3.fromRGB(45, 100, 65)
        else
            Toggle.Text = "☐  " .. Text
            Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 44)
        end
    end)

    return Toggle
end

CreateToggle("Auto Farm", 125)
CreateToggle("Auto Sell", 158)
CreateToggle("Auto Collect", 191)

-- BOTÓN START
local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(1, -20, 0, 32)
StartButton.Position = UDim2.fromOffset(10, 230)
StartButton.BackgroundColor3 = Color3.fromRGB(55, 95, 180)
StartButton.Text = "▶ Start Farming"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.TextSize = 12
StartButton.Font = Enum.Font.GothamBold
StartButton.Parent = Content

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 5)
StartCorner.Parent = StartButton

StartButton.MouseButton1Click:Connect(function()
    StartButton.Text = "⏸ Farming Started"
end)

-- CERRAR MENÚ
Close.MouseButton1Click:Connect(function()
    Main.Visible = false
    OpenButton.Visible = true
end)

-- VOLVER A ABRIR MENÚ
OpenButton.MouseButton1Click:Connect(function()
    Main.Visible = true
    OpenButton.Visible = false
end)

-- MOVER EL MENÚ
local Dragging = false
local DragStart
local StartPosition

TopBar.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Touch
        or Input.UserInputType == Enum.UserInputType.MouseButton1 then

        Dragging = true
        DragStart = Input.Position
        StartPosition = Main.Position
    end
end)

TopBar.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.Touch
        or Input.UserInputType == Enum.UserInputType.MouseButton1 then

        Dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(Input)
    if Dragging and (
        Input.UserInputType == Enum.UserInputType.Touch
        or Input.UserInputType == Enum.UserInputType.MouseMovement
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