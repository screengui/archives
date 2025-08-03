function UserFromBox(String)
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if (string.sub(string.lower(v.Name),1,string.len(String))) == string.lower(String) then
			return v
		end
	end
end

local function getBlockModel(name)
	local block = game:GetService("ReplicatedFirst").Blocks:WaitForChild(name, 3)
	block = block and block:Clone()

	local metablock = game:GetService("ReplicatedFirst").MetaBlocks:FindFirstChild(name)
	if metablock and metablock:IsA("Instance") then
		for i,v in pairs(metablock:GetChildren()) do
			v:Clone().Parent = block
		end
	end

	return block
end

local function clearDataSlot(slotv)
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("invviewer") then
		local slot = game:GetService("Players").LocalPlayer.PlayerGui.invviewer.Frame.inventory:WaitForChild("Slot"..slotv, 5)
		slot.Image = "http://www.roblox.com/asset/?id=49327489"
		slot.count.Visible = false
		slot.durability.Visible = false
		if slot:FindFirstChild("SlotB") then
			slot.SlotB:Destroy()
		end
	end
end

local function clearAllDataSlots()
	if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("invviewer") then
		for _, slotes in pairs(game:GetService("Players").LocalPlayer.PlayerGui.invviewer.Frame.inventory:GetChildren()) do
			slotes.Image = "http://www.roblox.com/asset/?id=49327489"
			slotes.count.Visible = false
			slotes.durability.Visible = false
			if slotes.BackgroundColor3 == Color3.fromRGB(0, 200, 0) then
				slotes.BackgroundColor3 = Color3.fromRGB(201, 201, 201)
			end
			if slotes:FindFirstChild("SlotB") then
				slotes.SlotB:Destroy()
			end
		end
	end
end

local function getDataSlot(playerchr, slotv)
	if playerchr ~= nil and playerchr:WaitForChild("Inventory", 5) then
		local slotStr = playerchr.Inventory:WaitForChild("Slot"..slotv, 5).Value
		local removedData = string.gsub(slotStr, '[%{%}%"]', "")
		local slotData = string.split(removedData, ",")
		local nameData, countData, durData
		for _, data in pairs(slotData) do
			if data:match("name:") then
				nameData = string.sub(data, 6)
			end
			if data:match("count:") then
				countData = string.sub(data, 7)
			end
			if data:match("durability:") then
				durData = string.sub(data, 12)
			end
		end
		return nameData, countData, durData
	else
		return false
	end
end

local function updateDataSlot(playerchr, slotv, nameData, countData, durData)
	if playerchr ~= nil and playerchr:WaitForChild("Inventory", 5) and game.Players.LocalPlayer.PlayerGui:FindFirstChild("invviewer") then
		local image = game.Players.LocalPlayer.PlayerGui.invviewer.Frame.inventory["Slot"..slotv]
		for _, itemtextures in pairs(game:GetService("Players").LocalPlayer.PlayerScripts.MainLocalScript.ItemTextures:GetChildren()) do
			if string.lower(nameData) ~= "" and itemtextures.Name == string.lower(nameData) then
				if tonumber(countData) > 0 then
					image.count.Text = countData
					image.count.Visible = true
					if tonumber(durData) == nil or tonumber(durData) < 1 then
						image.durability.Visible = false
					else
						image.durability.Text = durData
						image.durability.Visible = true
					end
					if itemtextures:IsA("Frame") then
						image["Image"] = itemtextures:FindFirstChildWhichIsA("ImageLabel").Image
					else
						image["Image"] = itemtextures.Image
					end
				end
				break
			end
		end
		if image.Image == "http://www.roblox.com/asset/?id=49327489" then
			if tonumber(countData) > 0 then
				image.count.Text = countData
				image.count.Visible = true
				image.durability.Visible = false
				local display = game:GetService("Players").LocalPlayer.PlayerScripts.MainLocalScript.SlotB:Clone()
				display.Size = UDim2.new(1, 0, 1, 0)
				display.ZIndex = 0
				local block = getBlockModel(nameData)
				if block ~= nil then
					block.CFrame = CFrame.new() * CFrame.Angles(0,math.pi*-.5,0)
					display.Parent = image
					block.Parent = display
				else
					display:Destroy()
				end
			end
		end
	else
		return false
	end
end

_G.Tablo = {}
local MIV = {};
MIV["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")); MIV["1"]["Name"] = [[invviewer]]; MIV["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling; MIV["1"]["ResetOnSpawn"] = false;

MIV["2"] = Instance.new("Frame", MIV["1"]); MIV["2"]["BorderSizePixel"] = 0; MIV["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0); MIV["2"]["Size"] = UDim2.new(0.23127, 0, 0.33558, 0); MIV["2"]["Position"] = UDim2.new(0.08418, 0, 0.45194, 0); MIV["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["2"]["BackgroundTransparency"] = 0.8;

MIV["3"] = Instance.new("UICorner", MIV["2"]);

MIV["4"] = Instance.new("TextBox", MIV["2"]); MIV["4"]["CursorPosition"] = -1; MIV["4"]["Name"] = [[plrtext]]; MIV["4"]["BorderSizePixel"] = 0; MIV["4"]["TextWrapped"] = true; MIV["4"]["TextSize"] = 25; MIV["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255); MIV["4"]["TextScaled"] = true; MIV["4"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0); MIV["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal); MIV["4"]["PlaceholderText"] = [[Player Here]]; MIV["4"]["Size"] = UDim2.new(0.86, 0, 0.07538, 0); MIV["4"]["Position"] = UDim2.new(0.03116, 0, 0.13227, 0); MIV["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["4"]["Text"] = [[]]; MIV["4"]["BackgroundTransparency"] = 0.8;

MIV["5"] = Instance.new("UICorner", MIV["4"]);

MIV["6"] = Instance.new("ImageButton", MIV["2"]); MIV["6"]["BorderSizePixel"] = 0; MIV["6"]["BackgroundTransparency"] = 0.8; MIV["6"]["Image"] = [[http://www.roblox.com/asset/?id=395920720]]; MIV["6"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0); MIV["6"]["Image"] = [[rbxassetid://395920720]]; MIV["6"]["Size"] = UDim2.new(0.06, 0, 0.07538, 0); MIV["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["6"]["Name"] = [[findplr]]; MIV["6"]["Position"] = UDim2.new(0.91325, 0, 0.13226, 0);

MIV["6"].MouseButton1Click:Connect(function()
	local player = UserFromBox(MIV["4"].Text)
	if player ~= nil and game.Players:FindFirstChild(tostring(player)) and game.Players:FindFirstChild(tostring(player)).Character ~= nil and game.Players:FindFirstChild(tostring(player)).Character:FindFirstChild("Inventory") then
		MIV["4"].PlaceholderText = "Loaded Player Inventory: "..tostring(player)
        MIV["4"].Text = ""
		local targetCharacterInv = game.Players:FindFirstChild(tostring(player)).Character
		for i, event in pairs(_G.Tablo) do event:Disconnect() end; table.clear(_G.Tablo); clearAllDataSlots()
		for i = 0, 35 do
			local nameData, countData, durData = getDataSlot(targetCharacterInv, i)
			if nameData ~= nil and countData ~= nil then
				updateDataSlot(targetCharacterInv, i, nameData, countData, durData)
			end
			table.insert(_G.Tablo, targetCharacterInv.Inventory["Slot"..i]:GetPropertyChangedSignal("Value"):Connect(function()
				clearDataSlot(i)
				local nameData, countData, durData = getDataSlot(targetCharacterInv, i)
				if nameData ~= nil and countData ~= nil then
					updateDataSlot(targetCharacterInv, i, nameData, countData, durData)
				end
			end))
		end

		for i = 100, 103 do
			local nameData, countData, durData = getDataSlot(targetCharacterInv, i)
			if nameData ~= nil and countData ~= nil then
				updateDataSlot(targetCharacterInv, i, nameData, countData, durData)
			end
			table.insert(_G.Tablo, targetCharacterInv.Inventory["Slot"..i]:GetPropertyChangedSignal("Value"):Connect(function()
				clearDataSlot(i)
				local nameData, countData, durData = getDataSlot(targetCharacterInv, i)
				if nameData ~= nil and countData ~= nil then
					updateDataSlot(targetCharacterInv, i, nameData, countData, durData)
				end
			end))
		end
		
		local previousSelectedSlot
		if targetCharacterInv:FindFirstChild("SelectedSlot") and game:GetService("Players").LocalPlayer.PlayerGui.invviewer.Frame.inventory:FindFirstChild("Slot"..targetCharacterInv.SelectedSlot.Value) then
			previousSelectedSlot = game:GetService("Players").LocalPlayer.PlayerGui.invviewer.Frame.inventory:FindFirstChild("Slot"..targetCharacterInv.SelectedSlot.Value)
			previousSelectedSlot.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
			table.insert(_G.Tablo, targetCharacterInv.SelectedSlot:GetPropertyChangedSignal("Value"):Connect(function()
				previousSelectedSlot.BackgroundColor3 = Color3.fromRGB(201, 201, 201)
				local result = targetCharacterInv.SelectedSlot.Value
				if result < 36 and result > -1 and game:GetService("Players").LocalPlayer.PlayerGui.invviewer.Frame.inventory:FindFirstChild("Slot"..result) then
					previousSelectedSlot = game:GetService("Players").LocalPlayer.PlayerGui.invviewer.Frame.inventory:FindFirstChild("Slot"..result)
					previousSelectedSlot.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
				end
			end))
		end

		local nameData, countData, durData = getDataSlot(targetCharacterInv, -1)
		if nameData ~= nil and countData ~= nil then
			updateDataSlot(targetCharacterInv, -1, nameData, countData, durData)
		end
		table.insert(_G.Tablo, targetCharacterInv.Inventory["Slot-1"]:GetPropertyChangedSignal("Value"):Connect(function()
			clearDataSlot(-1)
			local nameData, countData, durData = getDataSlot(targetCharacterInv, -1)
			if nameData ~= nil and countData ~= nil then
				updateDataSlot(targetCharacterInv, -1, nameData, countData, durData)
			end
		end))
        table.insert(_G.Tablo, game.Players.PlayerRemoving:Connect(function(plr)
            if plr.Name == tostring(player) then
                MIV["4"].Text = ""
                MIV["4"].PlaceholderText = "Player Disconnected: "..plr.Name
                for i, event in pairs(_G.Tablo) do event:Disconnect() end; table.clear(_G.Tablo); clearAllDataSlots()
            end
        end))
        if targetCharacterInv:FindFirstChild("Humanoid") then
            table.insert(_G.Tablo, targetCharacterInv.Humanoid.Died:Connect(function()
                MIV["4"].Text = ""
                MIV["4"].PlaceholderText = "Player Died: "..targetCharacterInv.Name
                for i, event in pairs(_G.Tablo) do event:Disconnect() end; table.clear(_G.Tablo); clearAllDataSlots()
            end))
        end
	else
		for i, event in pairs(_G.Tablo) do event:Disconnect() end; table.clear(_G.Tablo); clearAllDataSlots()
        MIV["4"].Text = ""
        MIV["4"].PlaceholderText = "Player or Character not Found"
        MIV["4"].PlaceholderColor3 = Color3.fromRGB(255, 50, 0)
        MIV["4"].Interactable = false
		MIV["6"].Interactable = false
		task.delay(1.5, function()
			MIV["4"].PlaceholderText = "Player Here"
			MIV["4"].PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
            MIV["4"].Interactable = true
			MIV["6"].Interactable = true
		end)
	end
end)

MIV["7"] = Instance.new("UICorner", MIV["6"]);

MIV["8"] = Instance.new("Frame", MIV["2"]); MIV["8"]["BorderSizePixel"] = 0; MIV["8"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0); MIV["8"]["Size"] = UDim2.new(1, 0, 0.75377, 0); MIV["8"]["Position"] = UDim2.new(0, 0, 0.25, 0); MIV["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["8"]["Name"] = [[inventory]]; MIV["8"]["BackgroundTransparency"] = 0.8;

MIV["9"] = Instance.new("Frame", MIV["2"]); MIV["9"]["BorderSizePixel"] = 0; MIV["9"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0); MIV["9"]["Size"] = UDim2.new(1, 0, 0.11307, 0); MIV["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["9"]["Name"] = [[titel]]; MIV["9"]["BackgroundTransparency"] = 0.8;

MIV["a"] = Instance.new("TextLabel", MIV["9"]); MIV["a"]["TextWrapped"] = true; MIV["a"]["BorderSizePixel"] = 0; MIV["a"]["TextSize"] = 14; MIV["a"]["TextScaled"] = true; MIV["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255); MIV["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal); MIV["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255); MIV["a"]["BackgroundTransparency"] = 1; MIV["a"]["Size"] = UDim2.new(0.6, 0, 0.55556, 0); MIV["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["a"]["Text"] = [[Minerscave Inventory Viewer]]; MIV["a"]["Name"] = [[titeltext]]; MIV["a"]["Position"] = UDim2.new(0.2, 0, 0.26667, 0);

local function generateSlot(slotCC, corda, huhY)
	MIV["slote"] = Instance.new("ImageLabel", MIV["8"]); MIV["slote"]["BorderSizePixel"] = 0; MIV["slote"]["BackgroundColor3"] = Color3.fromRGB(201, 201, 201); MIV["slote"]["Image"] = [[http://www.roblox.com/asset/?id=49327489]]; MIV["slote"]["Size"] = UDim2.new(0.1, 0, 0.16667, 0); MIV["slote"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["slote"]["Name"] = "Slot"..slotCC; MIV["slote"]["Position"] = UDim2.new(corda, 0, huhY, 0);
	MIV["ccc"] = Instance.new("TextLabel", MIV["slote"]); MIV["ccc"]["TextWrapped"] = true; MIV["ccc"]["BorderSizePixel"] = 0; MIV["ccc"]["TextSize"] = 20; MIV["ccc"]["TextXAlignment"] = Enum.TextXAlignment.Right; MIV["ccc"]["TextYAlignment"] = Enum.TextYAlignment.Bottom; MIV["ccc"]["TextScaled"] = true; MIV["ccc"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255); MIV["ccc"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal); MIV["ccc"]["TextColor3"] = Color3.fromRGB(255, 255, 255); MIV["ccc"]["BackgroundTransparency"] = 1; MIV["ccc"]["Size"] = UDim2.new(0.96, 0, 0.5, 0); MIV["ccc"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["ccc"]["Text"] = [[0]]; MIV["ccc"]["Name"] = [[count]]; MIV["ccc"]["Position"] = UDim2.new(0, 0, 0.5, 0); MIV["ccc"]["Visible"] = false;
	MIV["uic"] = Instance.new("UICorner", MIV["slote"]);
	MIV["dur"] = Instance.new("TextLabel", MIV["slote"]); MIV["dur"]["TextWrapped"] = true; MIV["dur"]["BorderSizePixel"] = 0; MIV["dur"]["TextSize"] = 15; MIV["dur"]["TextXAlignment"] = Enum.TextXAlignment.Right; MIV["dur"]["TextYAlignment"] = Enum.TextYAlignment.Top; MIV["dur"]["TextScaled"] = true; MIV["dur"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255); MIV["dur"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal); MIV["dur"]["TextColor3"] = Color3.fromRGB(255, 255, 255); MIV["dur"]["BackgroundTransparency"] = 1; MIV["dur"]["Size"] = UDim2.new(0.96, 0, 0.3, 0); MIV["dur"]["BorderColor3"] = Color3.fromRGB(0, 0, 0); MIV["dur"]["Text"] = [[0]]; MIV["dur"]["Name"] = [[durability]]; MIV["dur"]["Visible"] = false;
end

-- Main Slots
local paso, corda, slotCC = 0, 0.01, 0
for i = 1, 9 do
	generateSlot(slotCC, corda, 0.82); corda += 0.11; slotCC += 1
end
-- Inventory Slots
local huhY = 0.015
for i = 1, 3 do
	local corda = 0.01
	for i = 1, 9 do
		generateSlot(slotCC, corda, huhY); corda += 0.11; slotCC += 1
	end
	huhY += 0.175
end
-- Armor Slots
slotCC = 103; corda = 0.01
for i = 1, 4 do
	generateSlot(slotCC, corda, 0.645); corda += 0.11; slotCC -= 1
end
-- Drag Slot
generateSlot("-1", 0.89, 0.645)

-- Move Frame
local UserInputService = game:GetService("UserInputService")
local gui = MIV["2"]
local dragging
local dragInput
local dragStart
local startPos
local function update(input)
    local delta = input.Position - dragStart
    gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end
gui.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = gui.Position
        		
        input.Changed:Connect(function()
        	if input.UserInputState == Enum.UserInputState.End then
        		dragging = false
        	end
        end)
    end
end)
gui.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
    	dragInput = input
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
