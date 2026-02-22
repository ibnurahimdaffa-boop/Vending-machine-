local remote = game.ReplicatedStorage:WaitForChild("GiveVendingItem")

local vending = workspace:WaitForChild("Vending Machine")
local itemsFolder = vending:WaitForChild("Items")

local function getRandomTool()
	local items = itemsFolder:GetChildren()
	if #items == 0 then return nil end
	return items[math.random(1, #items)]
end

remote.OnServerEvent:Connect(function(player, amount)
	if not amount then return end
	
	if amount > 8 then
		amount = 8
	end
	
	for i = 1, amount do
		local tool = getRandomTool()
		
		if tool then
			local clone = tool:Clone()
			clone.Parent = player.Backpack
		end
		
		task.wait(0.1)
	end
end)
