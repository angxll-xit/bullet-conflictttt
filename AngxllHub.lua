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

-- =========================
-- BOTÓN PARA REABRIR
-- =========================

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.fromOffset(52, 52)
OpenButton.Position = UDim2.new(0, 15, 0.5, -26)
OpenButton.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
OpenButton.Text = "A"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.TextSize = 22
OpenButton.Font = Enum.Font.GothamBold
OpenButton.Visible = false
OpenButton.Parent = Gui

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(1, 0)
OpenCorner.Parent = OpenButton

-- =========================
-- MENÚ PRINCIPAL
-- =========================

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(620, 430)
Main.Position = UDim2.new(0.5, -310, 0.5, -215)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 23)
Main.BorderSizePixel = 0
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

-- =========================
-- BARRA SUPERIOR
-- =========================

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 60)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 29)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -140, 1, 0)
Title.Position = UDim2.fromOffset(22, 0)
Title.BackgroundTransparency = 1
Title.Text = "Angxll Hub"
Title.TextColor3 = Color3.fromRGB(245, 245, 245)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -140, 0, 20)
Subtitle.Position = UDim2.fromOffset(22, 34)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Mobile Edition"
Subtitle.TextColor3 = Color3.fromRGB(145, 145, 150)
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = TopBar

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.fromOffset(35, 32)
Minimize.Position = UDim2.new(1, -88, 0, 14)
Minimize.BackgroundTransparency = 1
Minimize.Text = "—"
Minimize.TextColor3 = Color3.fromRGB(200, 200, 200)
Minimize.TextSize = 22
Minimize.Font = Enum.Font.GothamBold
Minimize.Parent = TopBar

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(35, 32)
Close.Position = UDim2.new(1, -45, 0, 14)
Close.BackgroundTransparency = 1
Close.Text = "✕"
Close.TextColor3 = Color3.fromRGB(210, 210, 210)
Close.TextSize = 18
Close.Font = Enum.Font.GothamBold
Close.Parent = TopBar

-- =========================
-- SIDEBAR
-- =========================

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 165, 1, -60)
Sidebar.Position = UDim2.fromOffset(0, 60)
Sidebar.BackgroundColor3 = Color3.fromRGB(23, 23, 27)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local function CreateSideButton(Text, Y)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, -20, 0, 42)
    Button.Position = UDim2.fromOffset(10, Y)
    Button.BackgroundColor3 = Color3.fromRGB(29, 29, 34)
    Button.Text = Text
    Button.TextColor3 = Color3.fromRGB(215, 215, 220)
    Button.TextSize = 14
    Button.Font = Enum.Font.Gotham
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.Parent = Sidebar

    local Padding = Instance.new("UIPadding")
    Padding.PaddingLeft = UDim.new(0, 14)
    Padding.Parent = Button

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 7)
    Corner.Parent = Button

    return Button
end

CreateSideButton("⌕   Search", 15)
CreateSideButton("⚙   Farming", 65)
CreateSideButton("♙   General", 115)
CreateSideButton("▣   Server", 165)
CreateSideButton("◉   Config", 215)

-- =========================
-- CONTENIDO
-- =========================

local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -165, 1, -60)
Content.Position = UDim2.fromOffset(165, 60)
Content.BackgroundColor3 = Color3.fromRGB(20, 20, 23)
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 3
Content.CanvasSize = UDim2.new(0, 0, 0, 600)
Content.Parent = Main

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingTop = UDim.new(0, 18)
ContentPadding.PaddingLeft = UDim.new(0, 18)
ContentPadding.PaddingRight = UDim.new(0, 18)
ContentPadding.Parent = Content

local function CreateText(Text, Position, Size, TextSize, Bold)
    local Label = Instance.new("TextLabel")
    Label.Size = Size
    Label.Position = Position
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = Color3.fromRGB(245, 245, 245)
    Label.TextSize = TextSize
    Label.Font = Bold and Enum.Font.GothamBold or Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Content

    return Label
end

CreateText(
    "ℹ  Information",
    UDim2.fromOffset(0, 0),
    UDim2.new(1, 0, 0, 30),
    18,
    true
)

-- =========================
-- TARJETA DE DINERO
-- =========================

local function CreateMoneyCard(Y, TitleText, DefaultText)
    local Card = Instance.new("Frame")
    Card.Size = UDim2.new(1, 0, 0, 60)
    Card.Position = UDim2.fromOffset(0, Y)
    Card.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Card.BorderSizePixel = 0
    Card.Parent = Content

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 9)
    Corner.Parent = Card

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -25, 1, 0)
    Label.Position = UDim2.fromOffset(15, 0)
    Label.BackgroundTransparency = 1
    Label.Text = TitleText .. ": " .. DefaultText
    Label.TextColor3 = Color3.fromRGB(240, 240, 240)
    Label.TextSize = 16
    Label.Font = Enum.Font.GothamBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Card

    return Label
end

local CashLabel = CreateMoneyCard(40, "💵 Cash", "$0")
local BankLabel = CreateMoneyCard(110, "🏦 Bank", "$0")

-- =========================
-- ACTUALIZAR CASH Y BANK
-- =========================

task.spawn(function()
    local Leaderstats = Player:WaitForChild("leaderstats", 10)

    if Leaderstats then
        local Cash = Leaderstats:FindFirstChild("Cash")
        local Bank = Leaderstats:FindFirstChild("Bank")

        if Cash then
            local function UpdateCash()
                CashLabel.Text = "💵 Cash: $" .. tostring(Cash.Value)
            end

            UpdateCash()

            Cash:GetPropertyChangedSignal("Value"):Connect(UpdateCash)
        end

        if Bank then
            local function UpdateBank()
                BankLabel.Text = "🏦 Bank: $" .. tostring(Bank.Value)
            end

            UpdateBank()

            Bank:GetPropertyChangedSignal("Value"):Connect(UpdateBank)
        end
    end
end)

-- =========================
-- DEPOSIT
-- =========================

CreateText(
    "💰 Deposit",
    UDim2.fromOffset(0, 185),
    UDim2.new(1, 0, 0, 30),
    18,
    true
)

local AmountBox = Instance.new("TextBox")
AmountBox.Size = UDim2.new(1, 0, 0, 58)
AmountBox.Position = UDim2.fromOffset(0, 225)
AmountBox.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
AmountBox.Text = "0"
AmountBox.PlaceholderText = "Cash Amount"
AmountBox.TextColor3 = Color3.fromRGB(240, 240, 240)
AmountBox.PlaceholderColor3 = Color3.fromRGB(130, 130, 135)
AmountBox.TextSize = 15
AmountBox.Font = Enum.Font.Gotham
AmountBox.ClearTextOnFocus = false
AmountBox.Parent = Content

local AmountCorner = Instance.new("UICorner")
AmountCorner.CornerRadius = UDim.new(0, 9)
AmountCorner.Parent = AmountBox

local AmountPadding = Instance.new("UIPadding")
AmountPadding.PaddingLeft = UDim.new(0, 15)
AmountPadding.Parent = AmountBox

-- =========================
-- SWITCH
-- =========================

local DepositToggle = Instance.new("TextButton")
DepositToggle.Size = UDim2.new(1, 0, 0, 58)
DepositToggle.Position = UDim2.fromOffset(0, 295)
DepositToggle.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
DepositToggle.Text = "Auto Deposit                         OFF"
DepositToggle.TextColor3 = Color3.fromRGB(240, 240, 240)
DepositToggle.TextSize = 14
DepositToggle.Font = Enum.Font.GothamBold
DepositToggle.TextXAlignment = Enum.TextXAlignment.Left
DepositToggle.Parent = Content

local TogglePadding = Instance.new("UIPadding")
TogglePadding.PaddingLeft = UDim.new(0, 15)
TogglePadding.Parent = DepositToggle

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 9)
ToggleCorner.Parent = DepositToggle

local DepositEnabled = false

DepositToggle.MouseButton1Click:Connect(function()
    DepositEnabled = not DepositEnabled

    if DepositEnabled then
        DepositToggle.Text = "Auto Deposit                         ON"
        DepositToggle.BackgroundColor3 = Color3.fromRGB(55, 75, 65)
    else
        DepositToggle.Text = "Auto Deposit                         OFF"
        DepositToggle.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    end
end)

-- =========================
-- JOBS
-- =========================

CreateText(
    "🚜 Jobs",
    UDim2.fromOffset(0, 370),
    UDim2.new(1, 0, 0, 30),
    18,
    true
)

local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(1, 0, 0, 55)
StartButton.Position = UDim2.fromOffset(0, 410)
StartButton.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
StartButton.Text = "▶   Start Farming"
StartButton.TextColor3 = Color3.fromRGB(245, 245, 245)
StartButton.TextSize = 15
StartButton.Font = Enum.Font.GothamBold
StartButton.Parent = Content

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 9)
StartCorner.Parent = StartButton

StartButton.MouseButton1Click:Connect(function()
    if StartButton.Text == "▶   Start Farming" then
        StartButton.Text = "⏸   Farming Started"
        StartButton.BackgroundColor3 = Color3.fromRGB(55, 75, 65)
    else
        StartButton.Text = "▶   Start Farming"
        StartButton.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
    end
end)

-- =========================
-- OCULTAR / MOSTRAR
-- =========================

Close.MouseButton1Click:Connect(function()
    Main.Visible = false
    OpenButton.Visible = true
end)

Minimize.MouseButton1Click:Connect(function()
    Main.Visible = false
    OpenButton.Visible = true
end)

OpenButton.MouseButton1Click:Connect(function()
    Main.Visible = true
    OpenButton.Visible = false
end)

-- =========================
-- MOVER EL MENÚ
-- =========================

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
local Tabs = {
    Search = SearchFrame,
    Farming = FarmingFrame,
    General = GeneralFrame,
    Server = ServerFrame,
    Config = ConfigFrame
}

local function OpenTab(Name)
    for _, Frame in pairs(Tabs) do
        Frame.Visible = false
    end
    Tabs[Name].Visible = true
end

SearchButton.MouseButton1Click:Connect(function()
    OpenTab("Search")
end)

FarmingButton.MouseButton1Click:Connect(function()
    OpenTab("Farming")
end)