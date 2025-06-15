local UILibrary = {}

local PlayerGUI = game:GetService("Players").LocalPlayer.PlayerGui
local TweenService = game:GetService("TweenService")

function consolewrite(arg: string, mode: string?, repeatCount: number?)
	repeatCount = repeatCount or 1
	for i = 1, repeatCount do
		task.wait()
		if mode == "warn" then
			warn("//ANAN XD//:", arg)
		else
			print("//ANAN XD//:", arg)
		end
	end
end

function UILibrary:createUIelement(element, ...)
	if not PlayerGUI:FindFirstChild("UI") then consolewrite("UI IS NOT FOUND", true) return {} end
	local args = {...}
	if element == "button" then
		local button = Instance.new("TextButton", PlayerGUI.UI.ScriptTab:FindFirstChild("scriptActionsArea"))
		button.Name = "actionButton"
		button.BackgroundTransparency = 0.9
		button.TextScaled = true
		button.TextWrapped = true
		button.Font = Enum.Font.Nunito
		button.BackgroundTransparency = 0.9
		button.RichText = true
		button.Size = UDim2.new(0.15, 0, 0.3, 0)
		button.BorderSizePixel = 0
		button.TextColor3 = Color3.fromRGB(210,210,210)
		
		if args[1] == "buttonText" and args[2] then
			button.Text = "<b>"..args[2].."</b>"
		end
		
		local uiCorner = Instance.new("UICorner", button)
		uiCorner.CornerRadius = UDim.new(0,9)
		return button
	end
end

function UILibrary:CreateNotification(baslik : string, yazi : string, timeX : number)
	if not PlayerGUI:FindFirstChild("UI") then consolewrite("UI IS NOT FOUND", true) return {} end
	task.spawn(function()
		local NotifyBar = PlayerGUI:FindFirstChild("UI").NotificationBar
		local textLabel = Instance.new("TextLabel")
		textLabel.Text = ("["..baslik.."]: "..yazi)
		textLabel.Parent = NotifyBar
		textLabel.Size = UDim2.new(1,0,0.07,0)
		textLabel.Font = Enum.Font.Nunito
		textLabel.TextScaled = true
		textLabel.TextWrapped = true
		textLabel.Visible = true
		textLabel.TextTransparency = 1
		textLabel.TextColor3 = Color3.fromRGB(210,210,210)
		textLabel.BorderSizePixel = 0
		textLabel.BackgroundTransparency = 1
		textLabel.BackgroundColor3 = Color3.fromRGB(30,30,30)
		
		local uiCorner = Instance.new("UICorner", textLabel)
		uiCorner.CornerRadius = UDim.new(0,9)

		TweenService:Create(textLabel, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
		TweenService:Create(textLabel, TweenInfo.new(0.15), {TextTransparency = 0}):Play()
		wait(timeX)
		TweenService:Create(textLabel, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
		TweenService:Create(textLabel, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
		wait(0.15)
		textLabel:Destroy()
	end)	
end

function UILibrary:Init(GameName : string)
	if not GameName then GameName = "Universal" end
	consolewrite("LOADING UI LIBRARY")
	
	local UI = Instance.new("ScreenGui", PlayerGUI)
	UI.Parent = PlayerGUI
	UI.ResetOnSpawn = false
	UI.IgnoreGuiInset = true
	UI.Name = "UI"
	
	local NotificationFrame = Instance.new("Frame", UI)
	NotificationFrame.Name = "NotificationBar"
	NotificationFrame.Size = UDim2.new(0.32,0, 0.6,0)
	NotificationFrame.BackgroundTransparency = 1
	NotificationFrame.ClipsDescendants = true
	NotificationFrame.Position = UDim2.new(.68,0,0.381,0)
	
	local UIListLayout = Instance.new("UIListLayout", NotificationFrame)
	UIListLayout.Wraps = true
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout.Padding = UDim.new(0.025,0)
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UILibrary:CreateNotification("System", "Loading ananXD UI", 5)
	task.wait(5)
	local ScriptTabFrame = Instance.new("Frame", UI)
	ScriptTabFrame.Name = "ScriptTab"
	ScriptTabFrame.Size = UDim2.new(0.4, 0,0.3, 0)
	ScriptTabFrame.Position = UDim2.new(0.3,0,0.35,0)
	ScriptTabFrame.BackgroundTransparency = 1
	ScriptTabFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
	ScriptTabFrame.BorderSizePixel = 0
	
	local uiCorner = Instance.new("UICorner", ScriptTabFrame)
	uiCorner.CornerRadius = UDim.new(0,9)
	
	local ScriptTabLabel = Instance.new("TextLabel", ScriptTabFrame)
	ScriptTabLabel.BorderSizePixel = 0
	ScriptTabLabel.Font = Enum.Font.Nunito
	ScriptTabLabel.TextScaled = true
	ScriptTabLabel.Text = "ananXD : "..GameName
	ScriptTabLabel.Size = UDim2.new(0.35,0,0.1,0)
	ScriptTabLabel.BackgroundTransparency = 1
	ScriptTabLabel.RichText = true
	ScriptTabLabel.Text = "<b>ananXD : </b><i>"..GameName.."</i>"
	ScriptTabLabel.TextColor3 = Color3.fromRGB(210,210,210)
	
	local scriptActionsArea = Instance.new("Frame")
	scriptActionsArea.Name = "scriptActionsArea"
	scriptActionsArea.Parent = ScriptTabFrame
	scriptActionsArea.BackgroundTransparency = 1
	scriptActionsArea.Size = UDim2.new(0.9,0,0.8,0)
	scriptActionsArea.Position = UDim2.new(0.05,0,0.15,0)
	
	local UIListLayout1 = Instance.new("UIListLayout", scriptActionsArea)
	UIListLayout1.Wraps = true
	UIListLayout1.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout1.Padding = UDim.new(0.025,0)
	UIListLayout1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	
	local closeButton = Instance.new("TextButton")
	closeButton.Name = "CloseUI"
	closeButton.Parent = ScriptTabFrame
	closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	closeButton.BackgroundTransparency = 0.7
	closeButton.BorderSizePixel = 0
	closeButton.Position = UDim2.new(0.899725258, 0, 0, 0)
	closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
	closeButton.Font = Enum.Font.Nunito
	closeButton.RichText = true
	closeButton.Text = "<b>Close</b>"
	closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	closeButton.TextScaled = true
	closeButton.TextWrapped = true
	
	local uiCorner = Instance.new("UICorner", closeButton)
	uiCorner.CornerRadius = UDim.new(0,9)
	
	closeButton.MouseButton1Click:Connect(function()
		UI:Destroy()
	end)
	
	local drag = Instance.new("UIDragDetector")
	drag.Parent = ScriptTabFrame
	
	TweenService:Create(ScriptTabFrame, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()	
	wait(0.3)	
	TweenService:Create(ScriptTabLabel, TweenInfo.new(0.15), {TextTransparency = 0}):Play()	
end

return UILibrary
