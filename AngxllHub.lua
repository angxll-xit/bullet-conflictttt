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
local TweenService = game:GetService("TweenService")

local Button = {}
Button.__index = Button

local COLORS = {
    Background = Color3.fromRGB(60,110,255),
    Hover = Color3.fromRGB(80,130,255),
    Pressed = Color3.fromRGB(45,90,220),
    Text = Color3.new(1,1,1)
}

function Button.new(parent, text, callback)
    local self = setmetatable({}, Button)

    local Frame = Instance.new("TextButton")
    Frame.Name = "Button"
    Frame.Parent = parent
    Frame.Size = UDim2.new(1,0,0,38)
    Frame.AutoButtonColor = false
    Frame.BackgroundColor3 = COLORS.Background
    Frame.BorderSizePixel = 0
    Frame.Font = Enum.Font.GothamMedium
    Frame.Text = text or "Button"
    Frame.TextColor3 = COLORS.Text
    Frame.TextSize = 15

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0,8)
    Corner.Parent = Frame

    local Stroke = Instance.new("UIStroke")
    Stroke.Parent = Frame
    Stroke.Thickness = 1
    Stroke.Color = Color3.fromRGB(255,255,255)
    Stroke.Transparency = .85

    local function Tween(color, scale)
        TweenService:Create(
            Frame,
            TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {
                BackgroundColor3 = color,
                Size = UDim2.new(1, scale or 0, 0, 38)
            }
        ):Play()
    end

    Frame.MouseEnter:Connect(function()
        Tween(COLORS.Hover)
    end)

    Frame.MouseLeave:Connect(function()
        Tween(COLORS.Background)
    end)

    Frame.MouseButton1Down:Connect(function()
        Tween(COLORS.Pressed, -2)
    end)

    Frame.MouseButton1Up:Connect(function()
        Tween(COLORS.Hover)
    end)

    Frame.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    self.Instance = Frame

    return self
end

function Button:SetText(text)
    self.Instance.Text = text
end

function Button:SetEnabled(enabled)
    self.Instance.Active = enabled
    self.Instance.AutoButtonColor = false

    if enabled then
        self.Instance.BackgroundTransparency = 0
    else
        self.Instance.BackgroundTransparency = .4
    end
end

function Button:Destroy()
    self.Instance:Destroy()
end

return Button
local TweenService = game:GetService("TweenService")

local Toggle = {}
Toggle.__index = Toggle

function Toggle.new(parent, text, defaultValue, callback)
    local self = setmetatable({}, Toggle)

    self.Value = defaultValue or false
    self.Callback = callback

    local Frame = Instance.new("Frame")
    Frame.Name = "Toggle"
    Frame.Parent = parent
    Frame.Size = UDim2.new(1,0,0,40)
    Frame.BackgroundTransparency = 1

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(1,-70,1,0)
    Label.Font = Enum.Font.Gotham
    Label.Text = text or "Toggle"
    Label.TextSize = 15
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextColor3 = Color3.new(1,1,1)

    local Switch = Instance.new("Frame")
    Switch.Parent = Frame
    Switch.AnchorPoint = Vector2.new(1,0.5)
    Switch.Position = UDim2.new(1,-10,0.5,0)
    Switch.Size = UDim2.fromOffset(46,24)
    Switch.BorderSizePixel = 0
    Instance.new("UICorner",Switch).CornerRadius = UDim.new(1,0)

    local Knob = Instance.new("Frame")
    Knob.Parent = Switch
    Knob.Size = UDim2.fromOffset(18,18)
    Knob.Position = UDim2.fromOffset(3,3)
    Knob.BorderSizePixel = 0
    Knob.BackgroundColor3 = Color3.new(1,1,1)
    Instance.new("UICorner",Knob).CornerRadius = UDim.new(1,0)

    local Button = Instance.new("TextButton")
    Button.Parent = Frame
    Button.Size = UDim2.fromScale(1,1)
    Button.BackgroundTransparency = 1
    Button.Text = ""

    local function Update(animated)
        local bg = self.Value
            and Color3.fromRGB(65,170,90)
            or Color3.fromRGB(70,70,80)

        local pos = self.Value
            and UDim2.fromOffset(25,3)
            or UDim2.fromOffset(3,3)

        if animated then
            TweenService:Create(
                Switch,
                TweenInfo.new(.18,Enum.EasingStyle.Quad),
                {BackgroundColor3 = bg}
            ):Play()

            TweenService:Create(
                Knob,
                TweenInfo.new(.18,Enum.EasingStyle.Quad),
                {Position = pos}
            ):Play()
        else
            Switch.BackgroundColor3 = bg
            Knob.Position = pos
        end
    end

    Update(false)

    Button.MouseButton1Click:Connect(function()
        self.Value = not self.Value
        Update(true)

        if self.Callback then
            self.Callback(self.Value)
        end
    end)

    self.Instance = Frame

    return self
end

function Toggle:SetValue(value)
    self.Value = value and true or false
end

function Toggle:GetValue()
    return self.Value
end

function Toggle:SetCallback(callback)
    self.Callback = callback
end

function Toggle:Destroy()
    self.Instance:Destroy()
end

return Toggle
local UIS = game:GetService("UserInputService")

local Slider = {}
Slider.__index = Slider

function Slider.new(parent, text, minValue, maxValue, defaultValue, callback)
	local self = setmetatable({}, Slider)

	self.Min = minValue or 0
	self.Max = maxValue or 100
	self.Value = defaultValue or self.Min
	self.Callback = callback

	local Frame = Instance.new("Frame")
	Frame.Parent = parent
	Frame.Size = UDim2.new(1,0,0,60)
	Frame.BackgroundTransparency = 1

	local Title = Instance.new("TextLabel")
	Title.Parent = Frame
	Title.BackgroundTransparency = 1
	Title.Size = UDim2.new(1,-60,0,20)
	Title.Font = Enum.Font.Gotham
	Title.Text = text
	Title.TextColor3 = Color3.new(1,1,1)
	Title.TextSize = 15
	Title.TextXAlignment = Enum.TextXAlignment.Left

	local ValueLabel = Instance.new("TextLabel")
	ValueLabel.Parent = Frame
	ValueLabel.BackgroundTransparency = 1
	ValueLabel.Position = UDim2.new(1,-50,0,0)
	ValueLabel.Size = UDim2.new(0,50,0,20)
	ValueLabel.Font = Enum.Font.GothamBold
	ValueLabel.TextColor3 = Color3.fromRGB(80,170,255)
	ValueLabel.TextSize = 15
	ValueLabel.Text = tostring(self.Value)

	local Bar = Instance.new("Frame")
	Bar.Parent = Frame
	Bar.Position = UDim2.new(0,0,0,35)
	Bar.Size = UDim2.new(1,0,0,8)
	Bar.BackgroundColor3 = Color3.fromRGB(60,60,70)
	Bar.BorderSizePixel = 0
	Instance.new("UICorner",Bar).CornerRadius = UDim.new(1,0)

	local Fill = Instance.new("Frame")
	Fill.Parent = Bar
	Fill.Size = UDim2.new(0,0,1,0)
	Fill.BackgroundColor3 = Color3.fromRGB(70,150,255)
	Fill.BorderSizePixel = 0
	Instance.new("UICorner",Fill).CornerRadius = UDim.new(1,0)

	local Knob = Instance.new("Frame")
	Knob.Parent = Bar
	Knob.Size = UDim2.fromOffset(16,16)
	Knob.AnchorPoint = Vector2.new(.5,.5)
	Knob.Position = UDim2.new(0,0,.5,0)
	Knob.BackgroundColor3 = Color3.new(1,1,1)
	Knob.BorderSizePixel = 0
	Instance.new("UICorner",Knob).CornerRadius = UDim.new(1,0)

	local Dragging = false

	local function Update(x)
		local Percent = math.clamp((x-Bar.AbsolutePosition.X)/Bar.AbsoluteSize.X,0,1)

		Fill.Size = UDim2.new(Percent,0,1,0)
		Knob.Position = UDim2.new(Percent,0,.5,0)

		self.Value = math.floor(self.Min + ((self.Max-self.Min)*Percent))

		ValueLabel.Text = tostring(self.Value)

		if self.Callback then
			self.Callback(self.Value)
		end
	end

	Bar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = true
			Update(input.Position.X)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if Dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			Update(input.Position.X)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			Dragging = false
		end
	end)

	self.Instance = Frame

	return self
end

function Slider:GetValue()
	return self.Value
end

function Slider:SetValue(value)
	value = math.clamp(value,self.Min,self.Max)

	self.Value = value
end

function Slider:Destroy()
	self.Instance:Destroy()
end

return Slider
local TweenService = game:GetService("TweenService")

local Dropdown = {}
Dropdown.__index = Dropdown

function Dropdown.new(parent, title, options, defaultOption, callback)
    local self = setmetatable({}, Dropdown)

    self.Options = options or {}
    self.Value = defaultOption or self.Options[1]
    self.Callback = callback
    self.Open = false

    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.Size = UDim2.new(1,0,0,40)
    Frame.BackgroundTransparency = 1

    local Button = Instance.new("TextButton")
    Button.Parent = Frame
    Button.Size = UDim2.new(1,0,0,40)
    Button.BackgroundColor3 = Color3.fromRGB(45,45,52)
    Button.BorderSizePixel = 0
    Button.AutoButtonColor = false
    Button.Text = ""

    Instance.new("UICorner", Button).CornerRadius = UDim.new(0,8)

    local Label = Instance.new("TextLabel")
    Label.Parent = Button
    Label.BackgroundTransparency = 1
    Label.Position = UDim2.new(0,12,0,0)
    Label.Size = UDim2.new(1,-50,1,0)
    Label.Font = Enum.Font.Gotham
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextColor3 = Color3.new(1,1,1)
    Label.Text = string.format("%s: %s", title, self.Value or "")

    local Arrow = Instance.new("TextLabel")
    Arrow.Parent = Button
    Arrow.BackgroundTransparency = 1
    Arrow.AnchorPoint = Vector2.new(1,0.5)
    Arrow.Position = UDim2.new(1,-12,0.5,0)
    Arrow.Size = UDim2.fromOffset(20,20)
    Arrow.Font = Enum.Font.GothamBold
    Arrow.Text = "▼"
    Arrow.TextColor3 = Color3.new(1,1,1)

    local List = Instance.new("Frame")
    List.Parent = Frame
    List.Position = UDim2.new(0,0,0,45)
    List.Size = UDim2.new(1,0,0,0)
    List.ClipsDescendants = true
    List.BackgroundColor3 = Color3.fromRGB(38,38,44)
    List.BorderSizePixel = 0
    Instance.new("UICorner", List).CornerRadius = UDim.new(0,8)

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = List
    Layout.Padding = UDim.new(0,4)

    local function Toggle()
        self.Open = not self.Open

        local height = self.Open and (#self.Options * 34 + 8) or 0

        TweenService:Create(
            List,
            TweenInfo.new(.2),
            {Size = UDim2.new(1,0,0,height)}
        ):Play()

        Arrow.Text = self.Open and "▲" or "▼"
    end

    Button.MouseButton1Click:Connect(Toggle)

    for _,option in ipairs(self.Options) do
        local Item = Instance.new("TextButton")
        Item.Parent = List
        Item.Size = UDim2.new(1,-8,0,30)
        Item.Position = UDim2.new(0,4,0,0)
        Item.BackgroundColor3 = Color3.fromRGB(52,52,60)
        Item.BorderSizePixel = 0
        Item.Font = Enum.Font.Gotham
        Item.Text = option
        Item.TextColor3 = Color3.new(1,1,1)

        Instance.new("UICorner", Item).CornerRadius = UDim.new(0,6)

        Item.MouseButton1Click:Connect(function()
            self.Value = option
            Label.Text = string.format("%s: %s", title, option)

            if self.Callback then
                self.Callback(option)
            end

            Toggle()
        end)
    end

    self.Instance = Frame

    return self
end

function Dropdown:GetValue()
    return self.Value
end

function Dropdown:SetValue(value)
    self.Value = value
end

function Dropdown:Destroy()
    self.Instance:Destroy()
end

return Dropdown
local TweenService = game:GetService("TweenService")

local Notification = {}
Notification.__index = Notification

function Notification.new(parent)

	local self = setmetatable({}, Notification)

	local Holder = Instance.new("Frame")
	Holder.Name = "Notifications"
	Holder.Parent = parent
	Holder.AnchorPoint = Vector2.new(1,1)
	Holder.Position = UDim2.new(1,-20,1,-20)
	Holder.Size = UDim2.new(0,320,1,-40)
	Holder.BackgroundTransparency = 1

	local Layout = Instance.new("UIListLayout")
	Layout.Parent = Holder
	Layout.Padding = UDim.new(0,8)
	Layout.VerticalAlignment = Enum.VerticalAlignment.Bottom

	self.Container = Holder

	return self

end

function Notification:Notify(title,text,duration)

	duration = duration or 3

	local Card = Instance.new("Frame")
	Card.Parent = self.Container
	Card.Size = UDim2.new(1,0,0,70)
	Card.BackgroundColor3 = Color3.fromRGB(34,34,40)
	Card.BorderSizePixel = 0
	Card.BackgroundTransparency = 1

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,10)
	Corner.Parent = Card

	local Stroke = Instance.new("UIStroke")
	Stroke.Parent = Card
	Stroke.Color = Color3.fromRGB(60,110,255)
	Stroke.Thickness = 1

	local Title = Instance.new("TextLabel")
	Title.Parent = Card
	Title.BackgroundTransparency = 1
	Title.Position = UDim2.new(0,15,0,8)
	Title.Size = UDim2.new(1,-30,0,22)
	Title.Font = Enum.Font.GothamBold
	Title.Text = title
	Title.TextColor3 = Color3.new(1,1,1)
	Title.TextSize = 17
	Title.TextXAlignment = Enum.TextXAlignment.Left

	local Desc = Instance.new("TextLabel")
	Desc.Parent = Card
	Desc.BackgroundTransparency = 1
	Desc.Position = UDim2.new(0,15,0,30)
	Desc.Size = UDim2.new(1,-30,0,30)
	Desc.Font = Enum.Font.Gotham
	Desc.TextWrapped = true
	Desc.Text = text
	Desc.TextColor3 = Color3.fromRGB(180,180,180)
	Desc.TextSize = 14
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	Desc.TextYAlignment = Enum.TextYAlignment.Top

	Card.Position = UDim2.new(1,40,0,0)

	TweenService:Create(
		Card,
		TweenInfo.new(.25,Enum.EasingStyle.Quint),
		{
			BackgroundTransparency = 0,
			Position = UDim2.new(0,0,0,0)
		}
	):Play()

	task.delay(duration,function()

		local Tween = TweenService:Create(
			Card,
			TweenInfo.new(.25),
			{
				BackgroundTransparency = 1,
				Position = UDim2.new(1,40,0,0)
			}
		)

		Tween:Play()

		Tween.Completed:Wait()

		Card:Destroy()

	end)

end

return Notification
local UIS = game:GetService("UserInputService")

local Keybind = {}
Keybind.__index = Keybind

function Keybind.new(parent, title, defaultKey, callback)
	local self = setmetatable({}, Keybind)

	self.Key = defaultKey or Enum.KeyCode.Unknown
	self.Callback = callback
	self.Listening = false

	local Frame = Instance.new("Frame")
	Frame.Parent = parent
	Frame.Size = UDim2.new(1,0,0,40)
	Frame.BackgroundTransparency = 1

	local Label = Instance.new("TextLabel")
	Label.Parent = Frame
	Label.BackgroundTransparency = 1
	Label.Size = UDim2.new(0.6,0,1,0)
	Label.Font = Enum.Font.Gotham
	Label.Text = title
	Label.TextColor3 = Color3.new(1,1,1)
	Label.TextSize = 15
	Label.TextXAlignment = Enum.TextXAlignment.Left

	local Button = Instance.new("TextButton")
	Button.Parent = Frame
	Button.AnchorPoint = Vector2.new(1,0.5)
	Button.Position = UDim2.new(1,0,0.5,0)
	Button.Size = UDim2.fromOffset(120,30)
	Button.BackgroundColor3 = Color3.fromRGB(45,45,52)
	Button.BorderSizePixel = 0
	Button.Font = Enum.Font.Gotham
	Button.TextColor3 = Color3.new(1,1,1)
	Button.TextSize = 14
	Button.Text = self.Key.Name

	Instance.new("UICorner", Button).CornerRadius = UDim.new(0,6)

	Button.MouseButton1Click:Connect(function()
		self.Listening = true
		Button.Text = "Presiona una tecla..."
	end)

	UIS.InputBegan:Connect(function(input, processed)
		if processed then return end

		if self.Listening and input.UserInputType == Enum.UserInputType.Keyboard then
			self.Listening = false
			self.Key = input.KeyCode
			Button.Text = self.Key.Name
			return
		end

		if input.KeyCode == self.Key then
			if self.Callback then
				self.Callback(self.Key)
			end
		end
	end)

	self.Instance = Frame

	return self
end

function Keybind:GetKey()
	return self.Key
end

function Keybind:SetKey(keyCode)
	self.Key = keyCode
end

function Keybind:Destroy()
	self.Instance:Destroy()
end

return Keybind
local ColorPicker = {}
ColorPicker.__index = ColorPicker

local COLORS = {
    Color3.fromRGB(255, 70, 70),
    Color3.fromRGB(255, 170, 70),
    Color3.fromRGB(255, 255, 70),
    Color3.fromRGB(70, 255, 70),
    Color3.fromRGB(70, 170, 255),
    Color3.fromRGB(170, 70, 255),
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(120, 120, 120),
}

function ColorPicker.new(parent, title, defaultColor, callback)
    local self = setmetatable({}, ColorPicker)

    self.Value = defaultColor or COLORS[1]
    self.Callback = callback

    local Frame = Instance.new("Frame")
    Frame.Parent = parent
    Frame.Size = UDim2.new(1,0,0,110)
    Frame.BackgroundTransparency = 1

    local Label = Instance.new("TextLabel")
    Label.Parent = Frame
    Label.Size = UDim2.new(1,0,0,20)
    Label.BackgroundTransparency = 1
    Label.Text = title or "Color"
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 15
    Label.TextColor3 = Color3.new(1,1,1)
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local Grid = Instance.new("Frame")
    Grid.Parent = Frame
    Grid.Position = UDim2.new(0,0,0,30)
    Grid.Size = UDim2.new(1,0,0,70)
    Grid.BackgroundTransparency = 1

    local Layout = Instance.new("UIGridLayout")
    Layout.Parent = Grid
    Layout.CellSize = UDim2.fromOffset(30,30)
    Layout.CellPadding = UDim2.fromOffset(6,6)

    for _, color in ipairs(COLORS) do
        local Button = Instance.new("TextButton")
        Button.Parent = Grid
        Button.Text = ""
        Button.BackgroundColor3 = color
        Button.BorderSizePixel = 0

        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(1,0)
        Corner.Parent = Button

        Button.MouseButton1Click:Connect(function()
            self.Value = color

            if self.Callback then
                self.Callback(color)
            end
        end)
    end

    self.Instance = Frame

    return self
end

function ColorPicker:GetValue()
    return self.Value
end

function ColorPicker:SetValue(color)
    self.Value = color
end

function ColorPicker:Destroy()
    self.Instance:Destroy()
end

return ColorPicker
local Theme = {}

Theme.Themes = {

    Dark = {

        Background = Color3.fromRGB(28,30,36),
        Secondary = Color3.fromRGB(37,40,47),
        Accent = Color3.fromRGB(0,170,255),

        Text = Color3.fromRGB(255,255,255),
        TextDark = Color3.fromRGB(185,185,185),

        Stroke = Color3.fromRGB(60,60,70),

        Success = Color3.fromRGB(60,180,75),
        Error = Color3.fromRGB(220,70,70),
        Warning = Color3.fromRGB(255,170,0)

    },

    Light = {

        Background = Color3.fromRGB(245,245,245),
        Secondary = Color3.fromRGB(228,228,228),
        Accent = Color3.fromRGB(0,120,255),

        Text = Color3.fromRGB(20,20,20),
        TextDark = Color3.fromRGB(80,80,80),

        Stroke = Color3.fromRGB(190,190,190),

        Success = Color3.fromRGB(60,180,75),
        Error = Color3.fromRGB(220,70,70),
        Warning = Color3.fromRGB(255,170,0)

    }

}

Theme.Current = Theme.Themes.Dark

Theme.Listeners = {}

function Theme:Get(name)

    return self.Current[name]

end

function Theme:SetTheme(name)

    if self.Themes[name] then

        self.Current = self.Themes[name]

        for _,callback in ipairs(self.Listeners) do
            callback(self.Current)
        end

    end

end

function Theme:SetCustom(data)

    self.Current = data

    for _,callback in ipairs(self.Listeners) do
        callback(self.Current)
    end

end

function Theme:OnChanged(callback)

    table.insert(self.Listeners,callback)

end

return Theme
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Window = {}
Window.__index = Window

function Window.new(frame)

	local self = setmetatable({},Window)

	self.Frame = frame
	self.Minimized = false

	---------------------------------------------------
	-- DRAG
	---------------------------------------------------

	local dragging = false
	local dragStart
	local startPos

	frame.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then

			dragging = true

			dragStart = input.Position
			startPos = frame.Position

		end

	end)

	UIS.InputChanged:Connect(function(input)

		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then

			local delta = input.Position - dragStart

			frame.Position = UDim2.new(

				startPos.X.Scale,
				startPos.X.Offset + delta.X,

				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y

			)

		end

	end)

	UIS.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then

			dragging = false

		end

	end)

	---------------------------------------------------
	-- RESIZE HANDLE
	---------------------------------------------------

	local Handle = Instance.new("Frame")

	Handle.Parent = frame
	Handle.Size = UDim2.fromOffset(18,18)
	Handle.Position = UDim2.new(1,-18,1,-18)

	Handle.BackgroundColor3 = Color3.fromRGB(90,90,90)

	Instance.new("UICorner",Handle)

	local resizing = false
	local resizeStart
	local startSize

	Handle.InputBegan:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then

			resizing = true

			resizeStart = input.Position

			startSize = frame.Size

		end

	end)

	UIS.InputChanged:Connect(function(input)

		if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then

			local delta = input.Position - resizeStart

			frame.Size = UDim2.new(

				startSize.X.Scale,
				math.max(400,startSize.X.Offset + delta.X),

				startSize.Y.Scale,
				math.max(250,startSize.Y.Offset + delta.Y)

			)

		end

	end)

	UIS.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 then

			resizing = false

		end

	end)

	---------------------------------------------------
	-- MINIMIZE
	---------------------------------------------------

	local Button = Instance.new("TextButton")

	Button.Parent = frame

	Button.Size = UDim2.fromOffset(30,30)

	Button.Position = UDim2.new(1,-40,0,10)

	Button.Text = "-"

	Button.Font = Enum.Font.GothamBold

	Button.TextSize = 18

	Button.BackgroundColor3 = Color3.fromRGB(55,55,60)

	Instance.new("UICorner",Button)

	local OriginalSize = frame.Size

	Button.MouseButton1Click:Connect(function()

		self.Minimized = not self.Minimized

		if self.Minimized then

			TweenService:Create(

				frame,

				TweenInfo.new(.25),

				{

					Size = UDim2.new(

						frame.Size.X.Scale,

						frame.Size.X.Offset,

						0,

						50

					)

				}

			):Play()

			Button.Text = "+"

		else

			TweenService:Create(

				frame,

				TweenInfo.new(.25),

				{

					Size = OriginalSize

				}

			):Play()

			Button.Text = "-"

		end

	end)

	return self

end

return Window
local TweenService = game:GetService("TweenService")

local TabManager = {}
TabManager.__index = TabManager

function TabManager.new(sidebar, content)
    local self = setmetatable({}, TabManager)

    self.Sidebar = sidebar
    self.Content = content

    self.Tabs = {}
    self.Current = nil

    local Layout = Instance.new("UIListLayout")
    Layout.Parent = sidebar
    Layout.Padding = UDim.new(0,6)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    return self
end

function TabManager:CreateTab(name, icon)

    local Button = Instance.new("TextButton")
    Button.Parent = self.Sidebar
    Button.Size = UDim2.new(1,-8,0,38)
    Button.BackgroundColor3 = Color3.fromRGB(42,42,48)
    Button.BorderSizePixel = 0
    Button.AutoButtonColor = false
    Button.Text = ""

    Instance.new("UICorner",Button).CornerRadius = UDim.new(0,8)

    local Label = Instance.new("TextLabel")
    Label.Parent = Button
    Label.BackgroundTransparency = 1
    Label.Size = UDim2.new(1,-20,1,0)
    Label.Position = UDim2.fromOffset(12,0)
    Label.Font = Enum.Font.GothamMedium
    Label.Text = (icon or "").." "..name
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextColor3 = Color3.new(1,1,1)
    Label.TextSize = 15

    local Page = Instance.new("ScrollingFrame")
    Page.Parent = self.Content
    Page.Size = UDim2.fromScale(1,1)
    Page.CanvasSize = UDim2.new()
    Page.ScrollBarThickness = 4
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.Visible = false

    local List = Instance.new("UIListLayout")
    List.Parent = Page
    List.Padding = UDim.new(0,8)

    List:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.fromOffset(0,List.AbsoluteContentSize.Y+20)
    end)

    local Tab = {
        Button = Button,
        Page = Page
    }

    function Tab:Add(object)
        object.Parent = Page
    end

    function Tab:Show()

        if self.Manager.Current then
            self.Manager.Current.Page.Visible = false

            TweenService:Create(
                self.Manager.Current.Button,
                TweenInfo.new(.15),
                {
                    BackgroundColor3 = Color3.fromRGB(42,42,48)
                }
            ):Play()
        end

        Page.Visible = true

        TweenService:Create(
            Button,
            TweenInfo.new(.15),
            {
                BackgroundColor3 = Color3.fromRGB(65,120,255)
            }
        ):Play()

        self.Manager.Current = self
    end

    Tab.Manager = self

    Button.MouseButton1Click:Connect(function()
        Tab:Show()
    end)

    table.insert(self.Tabs,Tab)

    if #self.Tabs == 1 then
        Tab:Show()
    end

    return Tab
end

function TabManager:RemoveTab(name)

    for i,tab in ipairs(self.Tabs) do

        local text = tab.Button:FindFirstChildWhichIsA("TextLabel")

        if text and string.find(text.Text,name,1,true) then

            tab.Button:Destroy()
            tab.Page:Destroy()

            table.remove(self.Tabs,i)

            break

        end

    end

end

return TabManager