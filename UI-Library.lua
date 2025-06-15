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

		TweenService:Create(textLabel, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
		TweenService:Create(textLabel, TweenInfo.new(0.15), {TextTransparency = 0}):Play()
		wait(timeX)
		TweenService:Create(textLabel, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
		TweenService:Create(textLabel, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
		wait(0.15)
		textLabel:Destroy()
	end)	
end

function UILibrary:Init()
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
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	
	UILibrary:CreateNotification("Sistem", "yükleniyor", 10)
end

return UILibrary
