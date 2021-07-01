-- MADE BY IRIS @ V3RM

local NotificationTable = {};

local TableCount = 0;
local function ScanTable(Table)
	
	for Property, Setting in next, Table do
		if type(Setting) == "table" then
			ScanTable(Setting);
		end
		TableCount = TableCount + 1;
	end
	
	return TableCount;
end

local function CreateArgFour()
	local ArgFour = {
		Duration = 4,

		TitleSettings = {
			BackgroundColor3 = Color3.fromRGB(200, 200 ,200),
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextScaled = true,
			TextWrapped = true,
			TextSize = 14,
			Font = Enum.Font.SourceSansBold,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		},

		DescriptionSettings = {
			BackgroundColor3 = Color3.fromRGB(200, 200 ,200),
			TextColor3 = Color3.fromRGB(240, 240, 240),
			TextScaled = true,
			TextWrapped = true,
			TextSize = 14,
			Font = Enum.Font.SourceSansBold,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
		},

		IconSettings = {
			BackgroundTransparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),				
		},

		GradientSettings = {
			GradientEnabled = false,
			SolidColorEnabled = true,
			SolidColor = Color3.fromRGB(0,255,0255),
			Retract = false,
			Extend = false
		},

		Main = {
			BorderColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundColor3 = Color3.fromRGB(30, 30, 30),
			BackgroundTransparency = 0.050,
			Rounding = true,
			BorderSizePixel = 1
		}
	}
	
	return ArgFour;
end

local NotificationFolder = Instance.new("Folder");

NotificationTable.CreateNotification = function(TitleData, Text, Image, Settings)
	
	local Duration = Settings.Duration;
	local TitleSettings = Settings.TitleSettings;
	local DescriptionSettings = Settings.DescriptionSettings;
	local IconSettings = Settings.IconSettings;
	local GradientSettings = Settings.GradientSettings;
	local MainSettings = Settings.Main;
	
	if getgenv then
		if (game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("NotificationFolder")) then
			NotificationFolder = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("NotificationFolder");
		else
			NotificationFolder.Name = "NotificationFolder"
			NotificationFolder.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
		end
	else
		if (game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationFolder")) then
			NotificationFolder = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NotificationFolder");
		else
			NotificationFolder.Name = "NotificationFolder"
			NotificationFolder.Parent = game:GetService("Players").LocalPlayer.PlayerGui;
		end
	end

	local Notification = Instance.new("ScreenGui")
	local _Template = Instance.new("Frame")
	local Icon = Instance.new("ImageLabel")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local Title = Instance.new("TextLabel")
	local TextLabel = Instance.new("TextLabel")
	local UICorner = Instance.new("UICorner")
	local Frame = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")


	Notification.Name = "Notification"
	Notification.Parent = NotificationFolder
	Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Notification.Enabled = true;

	_Template.Name = "_Template"
	_Template.Parent = Notification
	_Template.BackgroundColor3 = MainSettings.BackgroundColor3
	_Template.BackgroundTransparency = MainSettings.BackgroundTransparency
	_Template.BorderColor3 = MainSettings.BorderColor3
	_Template.Position = UDim2.new(0.713929176, 0, 0.587826073, 0)
	_Template.Size = UDim2.new(0, 270, 0, 64)
	_Template.ZIndex = 9

	Icon.Name = "Icon"
	Icon.Parent = _Template
	Icon.BackgroundColor3 = IconSettings.BackgroundColor3
	Icon.BackgroundTransparency = IconSettings.BackgroundTransparency
	Icon.Position = UDim2.new(0.0277603213, 0, 0.182097465, 0)
	Icon.Size = UDim2.new(0, 40, 0, 40)
	Icon.Image = Image

	UIAspectRatioConstraint.Parent = Icon

	Title.Name = "Title"
	Title.Parent = _Template
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0, 63, 0, 2)
	Title.Size = UDim2.new(0, 129, 0, 21)
	Title.Text = TitleData
	Title.TextColor3 = TitleSettings.TextColor3
	Title.TextScaled = TitleSettings.TextScaled
	Title.TextSize = TitleSettings.TextSize
	Title.TextWrapped = TitleSettings.Wrapped
	Title.TextXAlignment = TitleSettings.TextXAlignment
	Title.TextYAlignment = TitleSettings.TextYAlignment
	Title.Font = TitleSettings.Font
	Title.BackgroundColor3 = TitleSettings.BackgroundColor3

	TextLabel.Parent = _Template
	TextLabel.BackgroundColor3 = DescriptionSettings.BackgroundColor3
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0, 63, 0, 23)
	TextLabel.Size = UDim2.new(0, 178, 0, 35)
	TextLabel.Text = Text
	TextLabel.TextColor3 = DescriptionSettings.TextColor3
	TextLabel.TextScaled = DescriptionSettings.TextScaled
	TextLabel.TextSize = DescriptionSettings.TextSize
	TextLabel.TextWrapped = DescriptionSettings.Wrapped
	TextLabel.TextXAlignment = DescriptionSettings.TextXAlignment
	TextLabel.TextYAlignment = DescriptionSettings.TextYAlignment
	TextLabel.Font = DescriptionSettings.Font
	TextLabel.BackgroundColor3 = DescriptionSettings.BackgroundColor3

	
	if MainSettings.Rounding then
		UICorner.Parent = _Template
	end
	
	Frame.Parent = _Template
	Frame.BackgroundColor3 = GradientSettings.SolidColor
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.0148148146, 0, 0.9375, 0)
	Frame.Size = UDim2.new(0, 263, 0, 2)
	Frame.Visible = false;
	
	if GradientSettings.GradientEnabled then
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 8, 231)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(64, 0, 255))}
		UIGradient.Parent = Frame
		Frame.Visible = true
	elseif GradientSettings.SolidColor then
		UIGradient:Destroy();
		Frame.Visible = true
	end
		
	return {_Template, Duration, GradientSettings.Retract, GradientSettings.Extend};
end


NotificationFolder.ChildRemoved:Connect(function()
	local TweenService = game:GetService("TweenService");

	local TweenInfData = TweenInfo.new(.25);
	for _, NotificationObject in next, NotificationFolder:GetChildren() do
		local Notification = NotificationObject["_Template"];

		TweenService:Create(Notification, TweenInfData, {
			Position = UDim2.new(1, -280, 1, Notification.Position.Y.Offset + 68 + 1);
		}):Play();
	end

end)

NotificationTable.InsertNotification = function(Notification, Duration, Retracting, Extending)
	local TweenService = game:GetService("TweenService");

	local ShowPosition = UDim2.new(1, -280, 1, -70 * #NotificationFolder:GetChildren() - 1);
	local HidePosition = UDim2.new(1, 70, 1, -70);

	Notification.Position = HidePosition;
	Notification.Visible = true;

	local TweenInfData = TweenInfo.new(0.4);
	local TweenInfData2 = TweenInfo.new(Duration);
	
	TweenService:Create(Notification, TweenInfData, {
		Position = ShowPosition
	}):Play();
	
	if (Retracting) then
		local TweenService = game:GetService("TweenService");

		TweenService:Create(Notification.Frame, TweenInfData2, {
			Size = UDim2.new(0, 0, 0, 2)
		}):Play();
	elseif (Extending) then
		Notification.Frame.Size = UDim2.new(0, 0, 0, 2);
		
		local TweenService = game:GetService("TweenService");

		TweenService:Create(Notification.Frame, TweenInfData2, {
			Size = UDim2.new(0, 263, 0, 2)
		}):Play();
	end

	wait(TweenInfData2.Time);
	wait(TweenInfData.Time);
	
	TweenService:Create(Notification, TweenInfData, {
		Position = HidePosition
	}):Play();
	
	wait(TweenInfData.Time);

	Notification.Parent:Destroy();
end

NotificationTable.Notify = function(...)
	coroutine.wrap(function(...)
		TableCount = 0;
		local Args = {...};

		assert(#Args < 5, "Error: Too many arguments for Notify | Expected 3 : 4");
		assert(#Args > 2, "Error: Too little arguments for Notify | Expected 3 : 4")

		for Index,Argument in next, Args do
			if Index ~= 4 then
				Args[Index] = tostring(Argument);
			end
		end
		
		if (#Args == 3) then
			Args[4] = CreateArgFour();
		end
		
		if (type(Args[4]) ~= "table") then
		    warn("Settings table malformed, please make sure you have the exact table copied! { ARG4_INVALID_TABLE }");
			Args[4] = CreateArgFour();
		end
		
		if (ScanTable(Args[4]) ~= 34) then
		    warn("Settings table malformed, please make sure you have the exact table copied!");
			Args[4] = CreateArgFour();
		end
		
		local NotifFrame = NotificationTable.CreateNotification(Args[1], Args[2], Args[3], Args[4]);

		NotificationTable.InsertNotification(NotifFrame[1], NotifFrame[2], NotifFrame[3], NotifFrame[4]);
	end)(...)
end

return NotificationTable;
