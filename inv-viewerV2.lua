if not game.ReplicatedStorage:FindFirstChild("AssetsMod") then return end
if not game.ReplicatedStorage.AssetsMod:FindFirstChild("ItemInfo") then return end
local M_ItemInfo = require(game.ReplicatedStorage.AssetsMod.ItemInfo)

local MIV = {};
-- StarterGui.invviewer
MIV["SG"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
MIV["SG"]["Name"] = [[invviewer]];
MIV["SG"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
MIV["SG"]["ResetOnSpawn"] = false;
MIV["SG"]["DisplayOrder"] = 999999

-- StarterGui.invviewer.bytehubinv
MIV["BHI"] = Instance.new("Frame", MIV["SG"]);
MIV["BHI"]["ZIndex"] = 100;
MIV["BHI"]["BorderSizePixel"] = 0;
MIV["BHI"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
MIV["BHI"]["Size"] = UDim2.new(0.18717, 0, 0.02538, 0);
MIV["BHI"]["Position"] = UDim2.new(0.03966, 0, 0.64975, 0);
MIV["BHI"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["BHI"]["Name"] = [[bytehubinv]];
MIV["BHI"]["BackgroundTransparency"] = 1;
-- StarterGui.invviewer.bytehubinv.UIAspectRatioConstraint
MIV["BHIUARC"] = Instance.new("UIAspectRatioConstraint", MIV["BHI"]);
MIV["BHIUARC"]["AspectRatio"] = 14;

-- StarterGui.invviewer.bytehubinv.mivtext
MIV["MT"] = Instance.new("Frame", MIV["BHI"]);
MIV["MT"]["ZIndex"] = 102;
MIV["MT"]["BorderSizePixel"] = 0;
MIV["MT"]["BackgroundColor3"] = Color3.fromRGB(11, 101, 255);
MIV["MT"]["Size"] = UDim2.new(1, 0, 1, 0);
MIV["MT"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["MT"]["Name"] = [[mivtext]];
-- StarterGui.invviewer.bytehubinv.mivtext.UIStroke
MIV["MTUS"] = Instance.new("UIStroke", MIV["MT"]);
MIV["MTUS"]["Thickness"] = 2;
MIV["MTUS"]["Color"] = Color3.fromRGB(11, 77, 255);
-- StarterGui.invviewer.bytehubinv.mivtext.UICorner
MIV["MTUC"] = Instance.new("UICorner", MIV["MT"]);

-- StarterGui.invviewer.bytehubinv.mivtext.naem
MIV["MTn"] = Instance.new("TextLabel", MIV["MT"]);
MIV["MTn"]["TextWrapped"] = true;
MIV["MTn"]["ZIndex"] = 103;
MIV["MTn"]["BorderSizePixel"] = 0;
MIV["MTn"]["TextSize"] = 14;
MIV["MTn"]["TextScaled"] = true;
MIV["MTn"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
MIV["MTn"]["FontFace"] = Font.new([[rbxasset://fonts/families/Zekton.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
MIV["MTn"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
MIV["MTn"]["BackgroundTransparency"] = 1;
MIV["MTn"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
MIV["MTn"]["Size"] = UDim2.new(0.71429, 0, 1, 0);
MIV["MTn"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["MTn"]["Text"] = [[Minerscave Inventory Viewer (Byte Hub)]];
MIV["MTn"]["Name"] = [[naem]];
MIV["MTn"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- StarterGui.invviewer.bytehubinv.mivtext.closebut
MIV["CB"] = Instance.new("TextButton", MIV["MT"]);
MIV["CB"]["ZIndex"] = 103;
MIV["CB"]["TextWrapped"] = true;
MIV["CB"]["BorderSizePixel"] = 0;
MIV["CB"]["TextSize"] = 14;
MIV["CB"]["TextScaled"] = true;
MIV["CB"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
MIV["CB"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
MIV["CB"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
MIV["CB"]["ZIndex"] = 2;
MIV["CB"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
MIV["CB"]["BackgroundTransparency"] = 1;
MIV["CB"]["Size"] = UDim2.new(0.07143, 0, 1, 0);
MIV["CB"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["CB"]["Text"] = [[-]];
MIV["CB"]["Name"] = [[closebut]];
MIV["CB"]["Position"] = UDim2.new(0.96, 0, 0.5, 0);

-- StarterGui.invviewer.bytehubinv.scripted
MIV["BHIs"] = Instance.new("Frame", MIV["BHI"]);
MIV["BHIs"]["ZIndex"] = 101;
MIV["BHIs"]["BorderSizePixel"] = 0;
MIV["BHIs"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
MIV["BHIs"]["Size"] = UDim2.new(1, 0, 10, 0);
MIV["BHIs"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["BHIs"]["Name"] = [[scripted]];
MIV["BHIs"]["BackgroundTransparency"] = 0.9;

-- StarterGui.invviewer.bytehubinv.scripted.plrname
MIV["PN"] = Instance.new("TextBox", MIV["BHIs"]);
MIV["PN"]["ZIndex"] = 102;
MIV["PN"]["Name"] = [[plrname]];
MIV["PN"]["BorderSizePixel"] = 0;
MIV["PN"]["TextWrapped"] = true;
MIV["PN"]["TextSize"] = 14;
MIV["PN"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
MIV["PN"]["TextScaled"] = true;
MIV["PN"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
MIV["PN"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
MIV["PN"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
MIV["PN"]["PlaceholderText"] = [[Player Here]];
MIV["PN"]["Size"] = UDim2.new(0.84524, 0, 0.08333, 0);
MIV["PN"]["Position"] = UDim2.new(0.46, 0, 0.165, 0);
MIV["PN"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["PN"]["Text"] = [[]];
MIV["PN"]["BackgroundTransparency"] = 0.9;

-- StarterGui.invviewer.bytehubinv.scripted.plrname.search
MIV["PNs"] = Instance.new("ImageButton", MIV["PN"]);
MIV["PNs"]["ZIndex"] = 104;
MIV["PNs"]["BorderSizePixel"] = 0;
MIV["PNs"]["BackgroundTransparency"] = 0.9;
MIV["PNs"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
MIV["PNs"]["Image"] = [[rbxassetid://2804603863]];
MIV["PNs"]["Size"] = UDim2.new(0.07042, 0, 1, 0);
MIV["PNs"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["PNs"]["Name"] = [[search]];
MIV["PNs"]["Position"] = UDim2.new(1.035, 0, 0, 0);

-- StarterGui.invviewer.bytehubinv.scripted.invbrg
MIV["IBrg"] = Instance.new("Frame", MIV["BHIs"]);
MIV["IBrg"]["ZIndex"] = 103;
MIV["IBrg"]["BorderSizePixel"] = 0;
MIV["IBrg"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0);
MIV["IBrg"]["Size"] = UDim2.new(1, 0, 0.77667, 0);
MIV["IBrg"]["Position"] = UDim2.new(0, 0, 0.223, 0);
MIV["IBrg"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["IBrg"]["Name"] = [[invbrg]];
MIV["IBrg"]["BackgroundTransparency"] = 0.9;
-- StarterGui.invviewer.bytehubinv.scripted.invbrg.UICorner
MIV["IBrgUC"] = Instance.new("UICorner", MIV["IBrg"]);

-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory
MIV["IBrgI"] = Instance.new("Frame", MIV["IBrg"]);
MIV["IBrgI"]["ZIndex"] = 104;
MIV["IBrgI"]["BorderSizePixel"] = 0;
MIV["IBrgI"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
MIV["IBrgI"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
MIV["IBrgI"]["Size"] = UDim2.new(0.96429, 0, 0.96137, 0);
MIV["IBrgI"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
MIV["IBrgI"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
MIV["IBrgI"]["Name"] = [[inventory]];
MIV["IBrgI"]["BackgroundTransparency"] = 1;
-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory.UIGridLayout
MIV["IBrgIUGL"] = Instance.new("UIGridLayout", MIV["IBrgI"]);
MIV["IBrgIUGL"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
MIV["IBrgIUGL"]["CellSize"] = UDim2.new(0.101, 0, 0.183, 0);
MIV["IBrgIUGL"]["FillDirectionMaxCells"] = 9;
MIV["IBrgIUGL"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
MIV["IBrgIUGL"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
MIV["IBrgIUGL"]["CellPadding"] = UDim2.new(0.008, 0, 0.015, 0);

local SOT = Instance.new("UIStroke", MIV["SG"])
SOT.Name = "SlotOutline"
SOT.Enabled = false
SOT.Thickness = 2
SOT.LineJoinMode = Enum.LineJoinMode.Bevel
SOT.Color = Color3.fromRGB(0, 180, 0);

local function createSlot(slotvalue, type, content)
	if type == "Real" then
		-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory.slot
		MIV["IS"] = Instance.new("Frame", MIV["IBrgI"]);
		MIV["IS"]["ZIndex"] = 105;
		MIV["IS"]["BorderSizePixel"] = 0;
		MIV["IS"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		MIV["IS"]["Size"] = UDim2.new(0.10123, 0, 0.18304, 0);
		MIV["IS"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		MIV["IS"]["Name"] = "Slot"..slotvalue;
		-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory.slot.UIGradient
		MIV["ISUG"] = Instance.new("UIGradient", MIV["IS"]);
		MIV["ISUG"]["Rotation"] = -90;
		MIV["ISUG"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(181, 181, 181)),ColorSequenceKeypoint.new(0.500, Color3.fromRGB(191, 191, 191)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(216, 216, 216))};
		-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory.slot.UICorner
		MIV["ISUC"] = Instance.new("UICorner", MIV["IS"]);
		MIV["ISUC"]["CornerRadius"] = UDim.new(0, 5);

		-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory.slot.item
		MIV["ISI"] = Instance.new("ImageLabel", MIV["IS"]);
		MIV["ISI"]["ZIndex"] = 106;
		MIV["ISI"]["BorderSizePixel"] = 0;
		MIV["ISI"]["ScaleType"] = Enum.ScaleType.Crop;
		MIV["ISI"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		MIV["ISI"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		MIV["ISI"]["Image"] = [[rbxassetid://18662155]];
		MIV["ISI"]["Size"] = UDim2.new(0.85366, 0, 0.85366, 0);
		MIV["ISI"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		MIV["ISI"]["BackgroundTransparency"] = 1;
		MIV["ISI"]["Name"] = [[item]];
		MIV["ISI"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
		MIV["ISI"].ResampleMode = Enum.ResamplerMode.Pixelated
		if content then
			local defaultImage = Instance.new("StringValue", MIV["ISI"])
			defaultImage.Name = "defaultContent"
			defaultImage.Value = content
			MIV["ISI"].Image = "rbxassetid://"..content
		end
		local oldBlock = Instance.new("StringValue", MIV["ISI"])
		oldBlock.Name = "oldBlock"
		oldBlock.Value = "NONE"

		-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory.slot.count
		MIV["ISC"] = Instance.new("TextLabel", MIV["IS"]);
		MIV["ISC"]["ZIndex"] = 106;
		MIV["ISC"]["TextWrapped"] = true;
		MIV["ISC"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
		MIV["ISC"]["BorderSizePixel"] = 0;
		MIV["ISC"]["TextSize"] = 14;
		MIV["ISC"]["TextXAlignment"] = Enum.TextXAlignment.Right;
		MIV["ISC"]["TextScaled"] = true;
		MIV["ISC"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		MIV["ISC"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		MIV["ISC"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		MIV["ISC"]["BackgroundTransparency"] = 1;
		MIV["ISC"]["Size"] = UDim2.new(0.97561, 0, 0.4878, 0);
		MIV["ISC"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		MIV["ISC"]["Text"] = [[N]];
		MIV["ISC"]["Name"] = [[count]];
		MIV["ISC"]["Position"] = UDim2.new(0, 0, 0.5, 0);
		MIV["ISC"].Visible = false

		-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory.slot.dur
		MIV["ISD"] = Instance.new("TextLabel", MIV["IS"]);
		MIV["ISD"]["ZIndex"] = 106;
		MIV["ISD"]["TextWrapped"] = true;
		MIV["ISD"]["SizeConstraint"] = Enum.SizeConstraint.RelativeXX;
		MIV["ISD"]["BorderSizePixel"] = 0;
		MIV["ISD"]["TextSize"] = 14;
		MIV["ISD"]["TextXAlignment"] = Enum.TextXAlignment.Right;
		MIV["ISD"]["TextScaled"] = true;
		MIV["ISD"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		MIV["ISD"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		MIV["ISD"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		MIV["ISD"]["BackgroundTransparency"] = 1;
		MIV["ISD"]["Size"] = UDim2.new(0.97561, 0, 0.29268, 0);
		MIV["ISD"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		MIV["ISD"]["Text"] = [[N]];
		MIV["ISD"]["Name"] = [[dur]];
		MIV["ISD"].Visible = false
	elseif type == "Fake" then
		-- StarterGui.invviewer.bytehubinv.scripted.invbrg.inventory.skipframe
		MIV["ISF"] = Instance.new("Frame", MIV["IBrgI"]);
		MIV["ISF"]["ZIndex"] = 106;
		MIV["ISF"]["BorderSizePixel"] = 0;
		MIV["ISF"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		MIV["ISF"]["Size"] = UDim2.new(0.10123, 0, 0.18304, 0);
		MIV["ISF"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		MIV["ISF"]["Name"] = [[skipframe]];
		MIV["ISF"]["BackgroundTransparency"] = 1;
	end
end

for i = 9, 35, 1 do
	createSlot(i, "Real")
end
for i = 103, 100, -1 do
	if i==103 then createSlot(i, "Real", "120766242844257")
	elseif i==102 then createSlot(i, "Real", "122066288812545")
	elseif i==101 then createSlot(i, "Real", "127851120592221")
	else createSlot(i, "Real", "73135807296989") end
end
for i = 1, 4, 1 do
	createSlot(i, "Fake")
end
createSlot(-1, "Real", "94017498041531")
for i = 0, 8, 1 do
	createSlot(i, "Real")
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

function UserFromBox(String)
	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if (string.sub(string.lower(v.Name),1,string.len(String))) == string.lower(String) then
			return v
		end
	end
end

local function getDataSlot(chr, slot)
	if chr and chr:FindFirstChild("Inventory", 5) then
		local slotStr = chr.Inventory:WaitForChild("Slot"..slot, 5).Value
		local removedData = string.gsub(slotStr, '[%{%}%"]', "")
		local slotData = string.split(removedData, ",")
		local name, count, durab
		for _, data in pairs(slotData) do
			if data:match("name:") then
				name = string.sub(data, 6)
			end
			if data:match("count:") then
				count = string.sub(data, 7)
			end
			if data:match("durability:") then
				durab = string.sub(data, 12)
			end
		end
		return name, count, durab
	else
		return false
	end
end

local function slotDataAction(command, chr, slot, nameD, countD, durD)
	if MIV["SG"].Parent ~= nil then
		if command == "ClearAll" then
			SOT.Parent = MIV["SG"]
			SOT.Enabled = false
			for _, slots in pairs(MIV["IBrgI"]:GetDescendants()) do
				if slots:IsA("Frame") and slots:FindFirstChild("item") then
					slots.item.ImageRectOffset = Vector2.new(0, 0)
					slots.item.ImageRectSize = Vector2.new(0, 0)
					if slots.item:FindFirstChild("defaultContent") then
						slots.item.Image = "rbxassetid://"..slots.item.defaultContent.Value
					else
						slots.item.Image = "rbxassetid://18662155"
					end
					if slots.item:FindFirstChild("SlotB") then
						slots.item.oldBlock.Value = "NONE"
						slots.item.SlotB:Destroy()
					end
					slots.count.Visible = false
					slots.dur.Visible = false
				end
			end
		elseif command == "ClearSlot" then
			local forslot = MIV["IBrgI"]["Slot"..slot]
			forslot.item.ImageRectOffset = Vector2.new(0, 0)
			forslot.item.ImageRectSize = Vector2.new(0, 0)
			if forslot.item:FindFirstChild("defaultContent") then
				forslot.item.Image = "rbxassetid://"..forslot.item.defaultContent.Value
			else
				forslot.item.Image = "rbxassetid://18662155"
			end
			forslot.count.Visible = false
			forslot.dur.Visible = false
			if forslot.item:FindFirstChild("SlotB") then
				forslot.item.oldBlock.Value = "NONE"
				forslot.item.SlotB:Destroy()
			end
		elseif command == "UpdateSlot" then
			if chr and chr:FindFirstChild("Inventory") then
				local forslot = MIV["IBrgI"]["Slot"..slot]
				if tonumber(countD) > 1 then
					forslot.count.Text = tostring(math.round(tonumber(countD)))
					forslot.count.Visible = true
				else
					forslot.count.Visible = false
				end
				if tonumber(durD) == nil or tonumber(durD) < 1 then
					forslot.dur.Visible = false
				else
					forslot.dur.Text = durD
					forslot.dur.Visible = true
				end
				local theitem = M_ItemInfo[nameD]
				if theitem then
					if theitem.block then
						forslot.item.Image = "rbxassetid://18662155"
						if not forslot.item:FindFirstChild("SlotB") then
							local display = game:GetService("Players").LocalPlayer.PlayerScripts.MainLocalScript.SlotB:Clone()
							display.Size = UDim2.new(1, 0, 1, 0)
							display.ZIndex = 0
							display.Parent = forslot.item
						end
						if forslot.item.oldBlock.Value == nil or forslot.item.oldBlock.Value ~= theitem.block then
							forslot.item.oldBlock.Value = theitem.block
							local block = getBlockModel(theitem.block)
							if block ~= nil then
								block.CFrame = CFrame.new() * CFrame.Angles(0,math.pi,0)
								block.Parent = forslot.item.SlotB
							else
								forslot.item.Image = "rbxassetid://12905962676"
							end
						end
					else
						forslot.item.oldBlock.Value = "NONE"
						if forslot.item:FindFirstChild("SlotB") then
							forslot.item.SlotB:Destroy()
						end
						local textured = game:GetService("Players").LocalPlayer.PlayerScripts.MainLocalScript.ItemTextures:FindFirstChild(theitem.texture)
						if textured then
							local imageSuccess = false
							if textured:IsA("ImageLabel") then
								forslot.item.Image = textured.Image
								imageSuccess = true
							else
								for _, v in pairs(textured:GetDescendants()) do
									if v:IsA("ImageLabel") then
										forslot.item.Image = v.Image
										if v.Parent:IsA("Frame") and v.Parent.Name == "Warper" then
											forslot.item.ImageRectOffset = Vector2.new(-180, -5)
											forslot.item.ImageRectSize = Vector2.new(495, 365)
										end
										imageSuccess = true
										break
									end
								end
							end
							if imageSuccess == false then
								forslot.item.Image = "rbxassetid://12905962676"
							end
						else
							forslot.item.Image = "rbxassetid://12905962676"
						end
					end
				else
					forslot.item.Image = "rbxassetid://12905962676"
				end
			end
		end
	end
end

MIV["CB"].MouseButton1Click:Connect(function()
	if MIV["CB"].Text == "-" then
		MIV["BHIs"].Visible = false
		MIV["CB"].Text = "+"
	elseif MIV["CB"].Text == "+" then
		MIV["BHIs"].Visible = true
		MIV["CB"].Text = "-"
	end
end)

_G.slotChangeEvents = {}
MIV["PNs"].MouseButton1Click:Connect(function()
	if UserFromBox(MIV["PN"]["Text"]) ~= nil then
		local player = game.Players:FindFirstChild(tostring(UserFromBox(MIV["PN"]["Text"])))
		if player ~= nil and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("Humanoid").Health>0 then
			MIV["PN"].PlaceholderText = "Loaded Inventory: "..player.Name
			MIV["PN"].Text = ""
			local chr = player.Character
			for _, event in pairs(_G.slotChangeEvents) do event:Disconnect() end; table.clear(_G.slotChangeEvents); slotDataAction("ClearAll")
			for i = -1, 35 do
				local name, count, durab = getDataSlot(chr, i)
				if name ~= nil and count ~= nil and tonumber(count)>0 then
					slotDataAction("UpdateSlot", chr, i, name, count, durab)
				end
				table.insert(_G.slotChangeEvents, chr.Inventory["Slot"..i]:GetPropertyChangedSignal("Value"):Connect(function()
					local name, count, durab = getDataSlot(chr, i)
					if name ~= nil and count ~= nil and tonumber(count)>0 then
						slotDataAction("UpdateSlot", chr, i, name, count, durab)
					else
						slotDataAction("ClearSlot", nil, i)
					end
				end))
			end
			for i = 100, 103 do
				local name, count, durab = getDataSlot(chr, i)
				if name ~= nil and count ~= nil and tonumber(count)>0 then
					slotDataAction("UpdateSlot", chr, i, name, count, durab)
				end
				table.insert(_G.slotChangeEvents, chr.Inventory["Slot"..i]:GetPropertyChangedSignal("Value"):Connect(function()
					local name, count, durab = getDataSlot(chr, i)
					if name ~= nil and count ~= nil and tonumber(count)>0 then
						slotDataAction("UpdateSlot", chr, i, name, count, durab)
					else
						slotDataAction("ClearSlot", nil, i)
					end
				end))
			end
			local previousSelectedSlot
			if chr:FindFirstChild("SelectedSlot") and MIV["IBrgI"]:FindFirstChild("Slot"..chr.SelectedSlot.Value) then
				previousSelectedSlot = MIV["IBrgI"]:FindFirstChild("Slot"..chr.SelectedSlot.Value)
				SOT.Parent = previousSelectedSlot
				SOT.Enabled = true
				table.insert(_G.slotChangeEvents, chr.SelectedSlot:GetPropertyChangedSignal("Value"):Connect(function()
					local result = chr.SelectedSlot.Value
					if MIV["IBrgI"]:FindFirstChild("Slot"..result) then
						previousSelectedSlot = MIV["IBrgI"]:FindFirstChild("Slot"..result)
						SOT.Parent = previousSelectedSlot
						SOT.Enabled = true
					end
				end))
			end
			table.insert(_G.slotChangeEvents, game.Players.PlayerRemoving:Connect(function(plr)
				if plr == player then
					MIV["PN"].Text = ""
					MIV["PN"].PlaceholderText = "Player Disconnected: "..plr.Name
					for _, event in pairs(_G.slotChangeEvents) do event:Disconnect() end; table.clear(_G.slotChangeEvents); slotDataAction("ClearAll")
				end
			end))
			if chr:FindFirstChild("Humanoid") then
				table.insert(_G.slotChangeEvents, chr.Humanoid.Died:Connect(function()
					MIV["PN"].Text = ""
					MIV["PN"].PlaceholderText = "Player Died: "..player.Name
					for _, event in pairs(_G.slotChangeEvents) do event:Disconnect() end; table.clear(_G.slotChangeEvents); slotDataAction("ClearAll")
				end))
			end
		end
	else
		for _, event in pairs(_G.slotChangeEvents) do event:Disconnect() end; table.clear(_G.slotChangeEvents); slotDataAction("ClearAll")
		print("[MIV]: Couldn't Load Player Inventory: Player doesn't Exist or is Dead")
		MIV["PNs"].Interactable = false
		MIV["PN"].Interactable = false
		MIV["PN"].PlaceholderText = "Not Found"
		MIV["PN"].PlaceholderColor3 = Color3.fromRGB(255, 0, 0)
		MIV["PN"].Text = ""
		task.delay(1, function()
			MIV["PNs"].Interactable = true
			MIV["PN"].Interactable = true
			MIV["PN"].PlaceholderText = "Player Here"
			MIV["PN"].PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
		end)
	end
end)

local UserInputService = game:GetService("UserInputService")
local gui = MIV["BHI"]
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
