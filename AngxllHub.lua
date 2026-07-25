local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Gui = Instance.new("ScreenGui")
Gui.Name = "ModernUI"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Parent = Gui
Main.Size = UDim2.fromOffset(950,560)
Main.Position = UDim2.new(.5,-475,.5,-280)
Main.BackgroundColor3 = Color3.fromRGB(30,30,35)
Main.BorderSizePixel = 0

Instance.new("UICorner",Main).CornerRadius = UDim.new(0,14)

local Shadow = Instance.new("ImageLabel")
Shadow.Parent = Main
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10,10,118,118)
Shadow.Size = UDim2.new(1,40,1,40)
Shadow.Position = UDim2.new(0,-20,0,-20)
Shadow.ImageTransparency = .4
Shadow.ZIndex = 0

local Sidebar = Instance.new("Frame")
Sidebar.Parent = Main
Sidebar.Size = UDim2.fromOffset(240,560)
Sidebar.BackgroundColor3 = Color3.fromRGB(23,23,28)
Sidebar.BorderSizePixel = 0
Instance.new("UICorner",Sidebar).CornerRadius = UDim.new(0,14)

local Title = Instance.new("TextLabel")
Title.Parent = Sidebar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1,0,0,60)
Title.Font = Enum.Font.GothamBold
Title.Text = "Modern UI"
Title.TextSize = 26
Title.TextColor3 = Color3.new(1,1,1)

local Search = Instance.new("TextBox")
Search.Parent = Sidebar
Search.PlaceholderText = "Search..."
Search.Size = UDim2.new(1,-20,0,36)
Search.Position = UDim2.new(0,10,0,70)
Search.BackgroundColor3 = Color3.fromRGB(38,38,44)
Search.TextColor3 = Color3.new(1,1,1)
Search.BorderSizePixel = 0
Search.Font = Enum.Font.Gotham
Search.TextSize = 15
Instance.new("UICorner",Search).CornerRadius = UDim.new(0,8)

local TabHolder = Instance.new("Frame")
TabHolder.Parent = Sidebar
TabHolder.Position = UDim2.new(0,10,0,120)
TabHolder.Size = UDim2.new(1,-20,1,-130)
TabHolder.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout")
Layout.Parent = TabHolder
Layout.Padding = UDim.new(0,8)

local Tabs = {
    "🌾 Farming",
    "⚙ General",
    "🖥 Server",
    "💾 Config"
}

local Buttons = {}

for _,name in ipairs(Tabs) do
    local Button = Instance.new("TextButton")
    Button.Parent = TabHolder
    Button.Size = UDim2.new(1,0,0,42)
    Button.BackgroundColor3 = Color3.fromRGB(38,38,44)
    Button.Text = name
    Button.Font = Enum.Font.Gotham
    Button.TextSize = 15
    Button.TextColor3 = Color3.new(1,1,1)
    Button.AutoButtonColor = false
    Button.BorderSizePixel = 0

    Instance.new("UICorner",Button).CornerRadius = UDim.new(0,8)

    Buttons[name]=Button
end

local Content = Instance.new("Frame")
Content.Parent = Main
Content.Position = UDim2.new(0,250,0,15)
Content.Size = UDim2.new(1,-265,1,-30)
Content.BackgroundTransparency = 1

local Header = Instance.new("TextLabel")
Header.Parent = Content
Header.Size = UDim2.new(1,0,0,40)
Header.BackgroundTransparency = 1
Header.Text = "Information"
Header.Font = Enum.Font.GothamBold
Header.TextSize = 24
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.TextColor3 = Color3.new(1,1,1)
--// PAGES

local Pages = {}

for _,tab in ipairs({"Farming","General","Server","Config"}) do
    local Page = Instance.new("ScrollingFrame")
    Page.Parent = Content
    Page.Name = tab
    Page.Size = UDim2.new(1,0,1,-50)
    Page.Position = UDim2.new(0,0,0,50)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.CanvasSize = UDim2.new()
    Page.ScrollBarThickness = 4
    Page.Visible = false

    local List = Instance.new("UIListLayout")
    List.Parent = Page
    List.Padding = UDim.new(0,12)

    List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.fromOffset(0,List.AbsoluteContentSize.Y+20)
    end)

    Pages[tab] = Page
end

Pages.Farming.Visible = true

--// CARD FUNCTION

local function CreateCard(parent,title,value)

    local Card = Instance.new("Frame")
    Card.Parent = parent
    Card.Size = UDim2.new(1,-10,0,75)
    Card.BackgroundColor3 = Color3.fromRGB(38,38,44)
    Card.BorderSizePixel = 0
    Instance.new("UICorner",Card).CornerRadius = UDim.new(0,10)

    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = Card
    Stroke.Color = Color3.fromRGB(55,55,60)
    Stroke.Thickness = 1

    local Name = Instance.new("TextLabel")
    Name.Parent = Card
    Name.BackgroundTransparency = 1
    Name.Position = UDim2.new(0,20,0,12)
    Name.Size = UDim2.new(.6,0,0,20)
    Name.Font = Enum.Font.Gotham
    Name.Text = title
    Name.TextColor3 = Color3.fromRGB(180,180,180)
    Name.TextSize = 15
    Name.TextXAlignment = Enum.TextXAlignment.Left

    local Amount = Instance.new("TextLabel")
    Amount.Parent = Card
    Amount.BackgroundTransparency = 1
    Amount.Position = UDim2.new(0,20,0,35)
    Amount.Size = UDim2.new(.8,0,0,30)
    Amount.Font = Enum.Font.GothamBold
    Amount.Text = value
    Amount.TextColor3 = Color3.new(1,1,1)
    Amount.TextSize = 22
    Amount.TextXAlignment = Enum.TextXAlignment.Left

    return Card

end

CreateCard(Pages.Farming,"💵 Cash","$0")
CreateCard(Pages.Farming,"🏦 Bank","$300,136")
CreateCard(Pages.Farming,"⭐ Level","Level 25")

--// TAB SWITCHING

local Current = "Farming"

local function OpenPage(name)

    for _,page in pairs(Pages) do
        page.Visible = false
    end

    Pages[name].Visible = true

    for _,button in pairs(Buttons) do
        TweenService:Create(button,TweenInfo.new(.2),{
            BackgroundColor3 = Color3.fromRGB(38,38,44)
        }):Play()
    end

    TweenService:Create(
        Buttons["🌾 "..name] or Buttons["⚙ "..name] or Buttons["🖥 "..name] or Buttons["💾 "..name],
        TweenInfo.new(.2),
        {BackgroundColor3 = Color3.fromRGB(58,110,255)}
    ):Play()

    Current = name

end

Buttons["🌾 Farming"].MouseButton1Click:Connect(function()
    OpenPage("Farming")
end)

Buttons["⚙ General"].MouseButton1Click:Connect(function()
    OpenPage("General")
end)

Buttons["🖥 Server"].MouseButton1Click:Connect(function()
    OpenPage("Server")
end)

Buttons["💾 Config"].MouseButton1Click:Connect(function()
    OpenPage("Config")
end)

OpenPage("Farming")
-- UIHelpers.lua (añade estas funciones)

local function CreateSection(parent, title)
    local Section = Instance.new("Frame")
    Section.Parent = parent
    Section.Size = UDim2.new(1,-10,0,170)
    Section.BackgroundColor3 = Color3.fromRGB(38,38,44)
    Section.BorderSizePixel = 0
    Instance.new("UICorner", Section).CornerRadius = UDim.new(0,10)

    local Label = Instance.new("TextLabel")
    Label.Parent = Section
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.fromOffset(15,10)
    Label.Size = UDim2.new(1,-30,0,24)
    Label.Font = Enum.Font.GothamBold
    Label.Text = title
    Label.TextSize = 18
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextColor3 = Color3.new(1,1,1)

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = Section
    Layout.Padding = UDim.new(0,8)
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Layout.VerticalAlignment = Enum.VerticalAlignment.Top

    local Pad = Instance.new("UIPadding")
    Pad.Parent = Section
    Pad.PaddingTop = UDim.new(0,40)
    Pad.PaddingLeft = UDim.new(0,12)
    Pad.PaddingRight = UDim.new(0,12)

    return Section
end

local function CreateButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.Size = UDim2.new(1,0,0,36)
    Button.BackgroundColor3 = Color3.fromRGB(60,110,255)
    Button.Text = text
    Button.Font = Enum.Font.GothamMedium
    Button.TextColor3 = Color3.new(1,1,1)
    Button.BorderSizePixel = 0
    Instance.new("UICorner", Button)

    Button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return Button
end

local function CreateToggle(parent, text, default, callback)
    local Toggle = Instance.new("TextButton")
    Toggle.Parent = parent
    Toggle.Size = UDim2.new(1,0,0,36)
    Toggle.BackgroundColor3 = Color3.fromRGB(48,48,56)
    Toggle.Text = ""
    Toggle.BorderSizePixel = 0
    Instance.new("UICorner", Toggle)

    local Label = Instance.new("TextLabel")
    Label.Parent = Toggle
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.fromOffset(12,0)
    Label.Size = UDim2.new(1,-70,1,0)
    Label.Text = text
    Label.Font = Enum.Font.Gotham
    Label.TextColor3 = Color3.new(1,1,1)
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Indicator = Instance.new("Frame")
    Indicator.Parent = Toggle
    Indicator.Size = UDim2.fromOffset(20,20)
    Indicator.Position = UDim2.new(1,-32,.5,-10)
    Indicator.BorderSizePixel = 0
    Indicator.BackgroundColor3 = default and Color3.fromRGB(70,200,120) or Color3.fromRGB(90,90,90)
    Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1,0)

    local State = default

    Toggle.MouseButton1Click:Connect(function()
        State = not State
        Indicator.BackgroundColor3 =
            State and Color3.fromRGB(70,200,120)
            or Color3.fromRGB(90,90,90)

        if callback then
            callback(State)
        end
    end)
end

local function CreateTextbox(parent, placeholder, callback)
    local Box = Instance.new("TextBox")
    Box.Parent = parent
    Box.Size = UDim2.new(1,0,0,36)
    Box.BackgroundColor3 = Color3.fromRGB(48,48,56)
    Box.PlaceholderText = placeholder
    Box.Text = ""
    Box.ClearTextOnFocus = false
    Box.TextColor3 = Color3.new(1,1,1)
    Box.BorderSizePixel = 0
    Instance.new("UICorner", Box)

    Box.FocusLost:Connect(function()
        if callback then
            callback(Box.Text)
        end
    end)

    return Box
end

-- Ejemplo de uso:

local GeneralSection = CreateSection(Pages.General, "General Settings")

CreateToggle(GeneralSection, "Enable Feature", false, function(state)
    print("Toggle:", state)
end)

CreateTextbox(GeneralSection, "Player Name", function(text)
    print(text)
end)

CreateButton(GeneralSection, "Save Settings", function()
    print("Saved")
end)