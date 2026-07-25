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
Gui.Parent = PlayerGui


-- Ventana principal

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(600,400)
Main.Position = UDim2.new(0.5,-300,0.5,-200)
Main.BackgroundColor3 = Color3.fromRGB(20,20,25)
Main.BorderSizePixel = 0
Main.Parent = Gui


local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0,12)
Corner.Parent = Main



-- Barra superior

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1,0,0,55)
TopBar.BackgroundColor3 = Color3.fromRGB(30,30,35)
TopBar.BorderSizePixel = 0
TopBar.Parent = Main


local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-20,1,0)
Title.Position = UDim2.fromOffset(20,0)
Title.BackgroundTransparency = 1
Title.Text = "Angxll Hub"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar
-- =========================
-- SIDEBAR
-- =========================

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.fromOffset(160,345)
Sidebar.Position = UDim2.fromOffset(0,55)
Sidebar.BackgroundColor3 = Color3.fromRGB(25,25,30)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main



local function CreateSideButton(Text, Y)

	local Button = Instance.new("TextButton")

	Button.Size = UDim2.new(1,-20,0,42)
	Button.Position = UDim2.fromOffset(10,Y)

	Button.BackgroundColor3 = Color3.fromRGB(35,35,40)
	Button.Text = Text

	Button.TextColor3 = Color3.fromRGB(230,230,230)
	Button.TextSize = 14
	Button.Font = Enum.Font.Gotham

	Button.TextXAlignment = Enum.TextXAlignment.Left

	Button.Parent = Sidebar


	local Padding = Instance.new("UIPadding")
	Padding.PaddingLeft = UDim.new(0,12)
	Padding.Parent = Button


	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,8)
	Corner.Parent = Button


	return Button
end



-- Botones

local SearchButton = CreateSideButton("⌕  Search",15)

local FarmingButton = CreateSideButton("⚙  Farming",65)

local GeneralButton = CreateSideButton("♙  General",115)

local ServerButton = CreateSideButton("▣  Server",165)

local ConfigButton = CreateSideButton("◉  Config",215)

local ESPButton = CreateSideButton("👁  ESP",265)
-- =========================
-- AREA DE CONTENIDO
-- =========================

local Content = Instance.new("Frame")

Content.Size = UDim2.new(1,-160,1,-55)

Content.Position = UDim2.fromOffset(160,55)

Content.BackgroundColor3 = Color3.fromRGB(20,20,25)

Content.BorderSizePixel = 0

Content.Parent = Main
-- =========================
-- SISTEMA DE PESTAÑAS
-- =========================

local Pages = {}


local function CreatePage(Name)

	local Page = Instance.new("Frame")

	Page.Name = Name

	Page.Size = UDim2.new(1,0,1,0)

	Page.BackgroundTransparency = 1

	Page.Visible = false

	Page.Parent = Content


	Pages[Name] = Page


	return Page
end



-- Crear páginas

local SearchPage = CreatePage("Search")

local FarmingPage = CreatePage("Farming")

local GeneralPage = CreatePage("General")

local ServerPage = CreatePage("Server")

local ConfigPage = CreatePage("Config")

local ESPPage = CreatePage("ESP")




-- Cambiar página

local function ShowPage(Name)

	for PageName, Page in pairs(Pages) do
		
		Page.Visible = false
		
	end


	Pages[Name].Visible = true

end
-- =========================
-- BOTONES FUNCIONALES
-- =========================


SearchButton.MouseButton1Click:Connect(function()
	ShowPage("Search")
end)


FarmingButton.MouseButton1Click:Connect(function()
	ShowPage("Farming")
end)


GeneralButton.MouseButton1Click:Connect(function()
	ShowPage("General")
end)


ServerButton.MouseButton1Click:Connect(function()
	ShowPage("Server")
end)


ConfigButton.MouseButton1Click:Connect(function()
	ShowPage("Config")
end)


ESPButton.MouseButton1Click:Connect(function()
	ShowPage("ESP")
end)



-- Página inicial

ShowPage("Search")
-- =========================
-- CREAR TEXTO EN PAGINAS
-- =========================

local function CreateLabel(Parent, Text, Y)

	local Label = Instance.new("TextLabel")

	Label.Size = UDim2.new(1,-30,0,40)
	Label.Position = UDim2.fromOffset(15,Y)

	Label.BackgroundTransparency = 1

	Label.Text = Text

	Label.TextColor3 = Color3.fromRGB(240,240,240)

	Label.TextSize = 18

	Label.Font = Enum.Font.GothamBold

	Label.TextXAlignment = Enum.TextXAlignment.Left

	Label.Parent = Parent

end



-- SEARCH

CreateLabel(
	SearchPage,
	"⌕ Search Tools",
	20
)



-- FARMING

CreateLabel(
	FarmingPage,
	"⚙ Farming Settings",
	20
)



-- GENERAL

CreateLabel(
	GeneralPage,
	"♙ General Options",
	20
)



-- SERVER

CreateLabel(
	ServerPage,
	"▣ Server Information",
	20
)



-- CONFIG

CreateLabel(
	ConfigPage,
	"◉ Config Settings",
	20
)



-- ESP

CreateLabel(
	ESPPage,
	"👁 Developer ESP Tools",
	20
)
-- =========================
-- CERRAR Y MINIMIZAR
-- =========================

local CloseButton = Instance.new("TextButton")

CloseButton.Size = UDim2.fromOffset(35,30)

CloseButton.Position = UDim2.new(1,-45,0,12)

CloseButton.Text = "✕"

CloseButton.TextSize = 18

CloseButton.BackgroundTransparency = 1

CloseButton.TextColor3 = Color3.new(1,1,1)

CloseButton.Parent = TopBar



CloseButton.MouseButton1Click:Connect(function()

	Gui:Destroy()

end)
-- =========================
-- DRAG MENU
-- =========================

local Dragging = false
local DragStart
local StartPosition


TopBar.InputBegan:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		
		Dragging = true
		
		DragStart = Input.Position
		
		StartPosition = Main.Position
		
	end

end)



TopBar.InputEnded:Connect(function(Input)

	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		
		Dragging = false
		
	end

end)



UserInputService.InputChanged:Connect(function(Input)

	if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
		
		local Delta = Input.Position - DragStart
		
		Main.Position = UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)
		
	end

end)
