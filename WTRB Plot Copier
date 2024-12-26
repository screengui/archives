--// Gui
for i,v in pairs(game.CoreGui:GetChildren()) do if v.Name == "PlotCopier" then v:Destroy() end end
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "PlotCopier"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame", ScreenGui)
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Frame.BorderSizePixel = 0
Frame.LayoutOrder = 2
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 252, 0, 120)
Frame.Active = true
Frame.Draggable = true

local Username = Instance.new("TextBox", Frame)
Username.Name = "Username"
Username.BackgroundColor3 = Color3.fromRGB(98, 98, 98)
Username.BorderSizePixel = 0
Username.Position = UDim2.new(0.0793650821, 0, 0.127244607, 0)
Username.Size = UDim2.new(0, 141, 0, 26)
Username.Font = Enum.Font.GothamBold
Username.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Username.PlaceholderText = "Username"
Username.Text = ""
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.TextSize = 19.000
Username.TextWrapped = true

local Copy = Instance.new("TextButton", Frame)
Copy.Name = "Copy"
Copy.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Copy.BorderSizePixel = 0
Copy.Position = UDim2.new(0.0793650821, 0, 0.401305377, 0)
Copy.Size = UDim2.new(0, 212, 0, 25)
Copy.Font = Enum.Font.GothamBold
Copy.Text = "Copy Plot"
Copy.TextColor3 = Color3.fromRGB(0, 218, 0)
Copy.TextSize = 19.000
Copy.TextStrokeColor3 = Color3.fromRGB(0, 76, 0)
Copy.TextStrokeTransparency = 0.000
Copy.TextWrapped = true

local Cancel = Instance.new("TextButton", Frame)
Cancel.Name = "Cancel"
Cancel.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Cancel.BorderSizePixel = 0
Cancel.Position = UDim2.new(0.0793650821, 0, 0.669195354, 0)
Cancel.Size = UDim2.new(0, 212, 0, 25)
Cancel.Font = Enum.Font.GothamBold
Cancel.Text = "Cancel"
Cancel.TextColor3 = Color3.fromRGB(170, 0, 0)
Cancel.TextSize = 19.000
Cancel.TextStrokeColor3 = Color3.fromRGB(83, 0, 0)
Cancel.TextStrokeTransparency = 0.000
Cancel.TextWrapped = true

local Delay = Instance.new("TextBox", Frame)
Delay.Name = "Delay"
Delay.BackgroundColor3 = Color3.fromRGB(98, 98, 98)
Delay.BorderSizePixel = 0
Delay.Position = UDim2.new(0.666666687, 0, 0.127244607, 0)
Delay.Size = UDim2.new(0, 64, 0, 26)
Delay.Font = Enum.Font.GothamBold
Delay.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Delay.PlaceholderText = "Delay"
Delay.Text = ""
Delay.TextColor3 = Color3.fromRGB(255, 255, 255)
Delay.TextSize = 19.000
Delay.TextWrapped = true

--// Functions
local Stamp = game.ReplicatedStorage.BuildingBridge.Stamp

function findPlot(n)
	for _,v in pairs(workspace.BuildingAreas:GetChildren()) do
		if v.Player.Value == n then
			return v.PlayerArea
		end
	end
	return nil
end
local Base = findPlot(game.Players.LocalPlayer.Name).BasePlate

function getModels(p)
	local t = {}
	for i,v in pairs(p:GetChildren()) do
		if v:IsA("Model") and v:FindFirstChild("SaveCFrame") then
			t[i - 1] = {AssetId = v.AssetId.Value, SaveCFrame = v.SaveCFrame.Value}
		end
	end
	return t
end

function findTime(s)
	return string.format("%02i:%02i:%02i", s/60^2, s/60%60, s%60)
end

local Debounce = false
local Copying = false
Copy.MouseButton1Click:Connect(function()
	local d = tonumber(Delay.Text)
	if not Debounce then
		Debounce = true
		Copy.Text = "Initializing..."
		wait(1.5)
		local p = findPlot(Username.Text)
		if p == nil then
			Copy.Text = "Player Not Found!"
			wait(1.5)
			Copy.Text = "Copy Plot"
			Debounce = false
			return
		end
		Copying = true
		local Models = getModels(p)
		local Amount = #Models
		if Amount <= 1 then
			Copy.Text = "Nothing To Copy!"
			wait(1.5)
			Copy.Text = "Copy Plot"
			Debounce = false
			return
		end
		local Time = tick()
		local bp = p.BasePlate:Clone()
		bp.Parent = workspace
		bp.Transparency = 1
		local i = 1
		repeat
			if Models[i] ~= nil and Models[i].SaveCFrame ~= nil then
				local cs = bp.CFrame:ToObjectSpace(Models[i].SaveCFrame)
				local c = Base.CFrame:ToWorldSpace(cs)
				Stamp:InvokeServer(Models[i].AssetId, c)
			end
			Copy.Text = i.."/"..Amount
			i = i + 1
			if d ~= nil and d > 0 then wait(d) end
		until i == Amount or not Copying
		bp:Destroy()
		Copy.Text = "Finished! | "..findTime(tick() - Time)
		Copying = false
		Time = nil
		wait(2)
		Copy.Text = "Copy Plot"
		Debounce = false
	end
end)

Cancel.MouseButton1Click:Connect(function()
	if Copying then
		Copying = false
	end
end)
