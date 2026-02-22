local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local remote = game.ReplicatedStorage:WaitForChild("GiveVendingItem")

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- FRAME (abu abu, bisa drag)
local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 280, 0, 180)
frame.Position = UDim2.new(0.5, -140, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(120,120,120)
frame.Active = true
frame.Draggable = true

-- DESKRIPSI
local desc = Instance.new("TextLabel")
desc.Parent = frame
desc.Size = UDim2.new(1, 0, 0.25, 0)
desc.BackgroundColor3 = Color3.fromRGB(90,90,90)
desc.Text = "Khusus owner, ambil tool Handle dari Vending Machine"
desc.TextScaled = true
desc.TextWrapped = true

-- INPUT
local box = Instance.new("TextBox")
box.Parent = frame
box.Position = UDim2.new(0.1, 0, 0.35, 0)
box.Size = UDim2.new(0.8, 0, 0.2, 0)
box.PlaceholderText = "Max 8"
box.Text = ""
box.TextScaled = true

-- BUTTON START
local startBtn = Instance.new("TextButton")
startBtn.Parent = frame
startBtn.Position = UDim2.new(0.2, 0, 0.65, 0)
startBtn.Size = UDim2.new(0.6, 0, 0.25, 0)
startBtn.Text = "Start"
startBtn.TextScaled = true
startBtn.TextColor3 = Color3.fromRGB(0,255,255)
startBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)

-- TOGGLE BUTTON
local toggleBtn = Instance.new("TextButton")
toggleBtn.Parent = screenGui
toggleBtn.Size = UDim2.new(0, 40, 0, 40)
toggleBtn.Position = UDim2.new(1, -50, 0, 20)
toggleBtn.Text = "-"
toggleBtn.TextScaled = true
toggleBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)

local visible = true

toggleBtn.MouseButton1Click:Connect(function()
	visible = not visible
	frame.Visible = visible
	
	if visible then
		toggleBtn.Text = "-"
	else
		toggleBtn.Text = "+"
	end
end)

-- FUNCTION BUTTON
startBtn.MouseButton1Click:Connect(function()
	local amount = tonumber(box.Text)
	if not amount then return end
	
	if amount > 8 then
		amount = 8
	end
	
	remote:FireServer(amount)
end)
