-- CAT HUB | Hide/Show GUI
-- Credit: CATJack.gg
-- RXAssetID: 126031329785796

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local RXAssetID = "126031329785796"

local gui = Instance.new("ScreenGui")
gui.Name = "CATHubGUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(330, 210)
main.Position = UDim2.new(0.5, -165, 0.5, -105)
main.BackgroundColor3 = Color3.fromRGB(35, 25, 55)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 48)
title.Position = UDim2.fromOffset(10, 8)
title.BackgroundTransparency = 1
title.Text = "CAT HUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 25
title.Font = Enum.Font.GothamBold
title.Parent = main

local credit = Instance.new("TextLabel")
credit.Size = UDim2.new(1, -20, 0, 25)
credit.Position = UDim2.fromOffset(10, 52)
credit.BackgroundTransparency = 1
credit.Text = "CATJack.gg"
credit.TextColor3 = Color3.fromRGB(190, 170, 220)
credit.TextSize = 14
credit.Font = Enum.Font.Gotham
credit.Parent = main

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -30, 0, 35)
info.Position = UDim2.fromOffset(15, 85)
info.BackgroundTransparency = 1
info.Text = "CAT HUB is ready"
info.TextColor3 = Color3.fromRGB(230, 230, 230)
info.TextSize = 14
info.Font = Enum.Font.Gotham
info.Parent = main

local hideButton = Instance.new("ImageButton")
hideButton.Name = "HideShowButton"
hideButton.Size = UDim2.fromOffset(54, 54)
hideButton.Position = UDim2.new(1, -68, 1, -68)
hideButton.BackgroundColor3 = Color3.fromRGB(75, 45, 105)
hideButton.BorderSizePixel = 0
hideButton.Image = "rbxassetid://" .. RXAssetID
hideButton.ScaleType = Enum.ScaleType.Fit
hideButton.Parent = gui

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(1, 0)
buttonCorner.Parent = hideButton

-- Hide/Show
local visible = true

hideButton.MouseButton1Click:Connect(function()
	visible = not visible
	main.Visible = visible
end)

-- Mobile + PC dragging for the main window
local UserInputService = game:GetService("UserInputService")

local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPosition = main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (
		input.UserInputType == Enum.UserInputType.MouseMovement
		or input.UserInputType == Enum.UserInputType.Touch
	) then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPosition.X.Scale,
			startPosition.X.Offset + delta.X,
			startPosition.Y.Scale,
			startPosition.Y.Offset + delta.Y
		)
	end
end)

print("[CAT HUB] Loaded | CATJack.gg | RXAssetID: " .. RXAssetID)
