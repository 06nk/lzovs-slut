
--ANTI VIRUS

local MAX_SIGMA_REDIRECTS = 5;
getgenv().lastSigmaUiSpot = nil;
getgenv().isSigmaPromptPopping = false;
getgenv().sigmaPromptGoSignal = getgenv().sigmaPromptGoSignal or Instance.new("BindableEvent");
getgenv().isSigmaGuardingLoadstringContent = false;
getgenv().isAutoAcceptEnabled = false;
local basedHttpRequestPls;
if (syn and syn.request) then
	basedHttpRequestPls = syn.request;
elseif http_request then
	basedHttpRequestPls = http_request;
elseif request then
	basedHttpRequestPls = request;
elseif (http and http.request) then
	basedHttpRequestPls = http.request;
else
	warn("UltraSigmaGuard: No based HTTP request function found! All fetches will noop.");
	function basedHttpRequestPls()
		return {StatusCode=0,Body=""};
	end
end
local function getSigmaApproval(message)
	if getgenv().isAutoAcceptEnabled then
		return true;
	end
	while getgenv().isSigmaPromptPopping do
		getgenv().sigmaPromptGoSignal.Event:Wait();
	end
	getgenv().isSigmaPromptPopping = true;
	local sigmaMessageFontSize = 13;
	local sigmaButtonFontSize = 12;
	local sigmaLogoAsset = "97624125917387";
	local sigmaLogoDimensions = Vector2.new(40, 40);
	local sigmaLogoGap = 10;
	local BasedCoreGui = game:GetService("CoreGui");
	local sigmaScreenWidget = Instance.new("ScreenGui", BasedCoreGui);
	sigmaScreenWidget.Name = "UltraSigmaPrompt";
	local sigmaMainPanel = Instance.new("Frame", sigmaScreenWidget);
	sigmaMainPanel.Size = UDim2.new(0, 500, 0, 320);
	if getgenv().lastSigmaUiSpot then
		sigmaMainPanel.Position = getgenv().lastSigmaUiSpot;
	else
		sigmaMainPanel.Position = UDim2.new(0.5, -250, 0.5, -160);
	end
	sigmaMainPanel.AnchorPoint = Vector2.new(0.5, 0.5);
	sigmaMainPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
	sigmaMainPanel.BorderSizePixel = 0;
	sigmaMainPanel.Draggable = true;
	sigmaMainPanel.Active = true;
	local sigmaPanelRoundEdge = Instance.new("UICorner", sigmaMainPanel);
	sigmaPanelRoundEdge.CornerRadius = UDim.new(0, 8);
	local sigmaPanelOutline = Instance.new("UIStroke", sigmaMainPanel);
	sigmaPanelOutline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	sigmaPanelOutline.Color = Color3.fromRGB(255, 255, 255);
	sigmaPanelOutline.Thickness = 1;
	local titleXOffset = 10;
	local titleWidthScale = 1;
	local titleWidthOffset = -20;
	if (sigmaLogoAsset and (sigmaLogoAsset ~= "")) then
		local logoImage = Instance.new("ImageLabel", sigmaMainPanel);
		logoImage.Name = "UltraSigmaLogo";
		logoImage.Image = "rbxassetid://" .. sigmaLogoAsset;
		logoImage.Size = UDim2.new(0, sigmaLogoDimensions.X, 0, sigmaLogoDimensions.Y);
		logoImage.Position = UDim2.new(0, sigmaLogoGap, 0, sigmaLogoGap);
		logoImage.BackgroundTransparency = 1;
		logoImage.ImageColor3 = Color3.fromRGB(255, 255, 255);
		logoImage.ScaleType = Enum.ScaleType.Fit;
	end
	local sigmaTitleText = Instance.new("TextLabel", sigmaMainPanel);
	sigmaTitleText.Size = UDim2.new(1, 0, 0, 30);
	sigmaTitleText.Position = UDim2.new(0, 0, 0, 10);
	sigmaTitleText.Text = "ULTRAGUARD+";
	sigmaTitleText.Font = Enum.Font.GothamBold;
	sigmaTitleText.TextSize = 24;
	sigmaTitleText.TextColor3 = Color3.fromRGB(255, 255, 255);
	sigmaTitleText.BackgroundTransparency = 1;
	sigmaTitleText.TextXAlignment = Enum.TextXAlignment.Center;
	local sigmaSubTitleText = Instance.new("TextLabel", sigmaMainPanel);
	sigmaSubTitleText.Size = UDim2.new(1, 0, 0, 20);
	sigmaSubTitleText.Position = UDim2.new(0, 0, 0, 35);
	sigmaSubTitleText.Text = "for nocturnal";
	sigmaSubTitleText.Font = Enum.Font.Gotham;
	sigmaSubTitleText.TextSize = 12;
	sigmaSubTitleText.TextColor3 = Color3.fromRGB(200, 200, 200);
	sigmaSubTitleText.BackgroundTransparency = 1;
	sigmaSubTitleText.TextXAlignment = Enum.TextXAlignment.Center;
	local sigmaSelectedTabColor = Color3.fromRGB(60, 60, 60);
	local sigmaDefaultTabColor = Color3.fromRGB(45, 45, 45);
	local sigmaTabFontColor = Color3.fromRGB(255, 255, 255);
	local sigmaMainContentArea = Instance.new("Frame", sigmaMainPanel);
	sigmaMainContentArea.Name = "MainSigmaContent";
	sigmaMainContentArea.Size = UDim2.new(1, -20, 0, 180);
	sigmaMainContentArea.Position = UDim2.new(0, 10, 0, 100);
	sigmaMainContentArea.BackgroundTransparency = 1;
	sigmaMainContentArea.Visible = true;
	local sigmaMessageScrollFrame = Instance.new("ScrollingFrame", sigmaMainContentArea);
	sigmaMessageScrollFrame.Name = "MessageScroller";
	sigmaMessageScrollFrame.Size = UDim2.new(1, 0, 1, -45);
	sigmaMessageScrollFrame.Position = UDim2.new(0, 0, 0, 0);
	sigmaMessageScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
	sigmaMessageScrollFrame.BorderSizePixel = 0;
	sigmaMessageScrollFrame.ScrollBarThickness = 6;
	sigmaMessageScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y;
	local sigmaPromptMessageText = Instance.new("TextLabel", sigmaMessageScrollFrame);
	sigmaPromptMessageText.Name = "TheActualSigmaMessage";
	sigmaPromptMessageText.Size = UDim2.new(1, -10, 0, 0);
	sigmaPromptMessageText.Position = UDim2.new(0, 5, 0, 5);
	sigmaPromptMessageText.Text = message;
	sigmaPromptMessageText.TextWrapped = true;
	sigmaPromptMessageText.TextColor3 = Color3.new(1, 1, 1);
	sigmaPromptMessageText.BackgroundTransparency = 1;
	sigmaPromptMessageText.Font = Enum.Font.Gotham;
	sigmaPromptMessageText.TextSize = sigmaMessageFontSize;
	sigmaPromptMessageText.TextXAlignment = Enum.TextXAlignment.Left;
	sigmaPromptMessageText.TextYAlignment = Enum.TextYAlignment.Top;
	sigmaPromptMessageText.AutomaticSize = Enum.AutomaticSize.Y;
	local function updateMessageScrollCanvas()
		if (sigmaPromptMessageText and sigmaMessageScrollFrame) then
			sigmaMessageScrollFrame.CanvasSize = UDim2.new(0, 0, 0, sigmaPromptMessageText.AbsoluteSize.Y + 10);
		end
	end
	sigmaPromptMessageText:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateMessageScrollCanvas);
	task.defer(updateMessageScrollCanvas);
	local sigmaCreditsArea = Instance.new("Frame", sigmaMainPanel);
	sigmaCreditsArea.Size = UDim2.new(1, -20, 0, 180);
	sigmaCreditsArea.Position = UDim2.new(0, 10, 0, 100);
	sigmaCreditsArea.BackgroundTransparency = 1;
	sigmaCreditsArea.Visible = false;
	for _, child in ipairs(sigmaCreditsArea:GetChildren()) do
		child:Destroy();
	end
	local sigmaCreditsListThingy = Instance.new("UIListLayout", sigmaCreditsArea);
	sigmaCreditsListThingy.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	sigmaCreditsListThingy.VerticalAlignment = Enum.VerticalAlignment.Top;
	sigmaCreditsListThingy.Padding = UDim.new(0, 10);
	sigmaCreditsListThingy.SortOrder = Enum.SortOrder.LayoutOrder;
	local sigmaCreditsTitleText = Instance.new("TextLabel", sigmaCreditsArea);
	sigmaCreditsTitleText.Name = "SigmaCreditsTitle";
	sigmaCreditsTitleText.Size = UDim2.new(1, 0, 0, 30);
	sigmaCreditsTitleText.Text = "CREDITS";
	sigmaCreditsTitleText.Font = Enum.Font.GothamBold;
	sigmaCreditsTitleText.TextSize = 20;
	sigmaCreditsTitleText.TextColor3 = Color3.fromRGB(255, 255, 255);
	sigmaCreditsTitleText.BackgroundTransparency = 1;
	sigmaCreditsTitleText.TextXAlignment = Enum.TextXAlignment.Center;
	sigmaCreditsTitleText.LayoutOrder = 1;
	local sigmaDevInfoBox = Instance.new("Frame", sigmaCreditsArea);
	sigmaDevInfoBox.Name = "SigmaDeveloperInfo";
	sigmaDevInfoBox.Size = UDim2.new(0.9, 0, 0, 40);
	sigmaDevInfoBox.BackgroundTransparency = 1;
	sigmaDevInfoBox.LayoutOrder = 2;
	local sigmaDevInfoListThingy = Instance.new("UIListLayout", sigmaDevInfoBox);
	sigmaDevInfoListThingy.FillDirection = Enum.FillDirection.Horizontal;
	sigmaDevInfoListThingy.VerticalAlignment = Enum.VerticalAlignment.Center;
	sigmaDevInfoListThingy.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	sigmaDevInfoListThingy.Padding = UDim.new(0, 10);
	local sigmaDevNameText = Instance.new("TextLabel", sigmaDevInfoBox);
	sigmaDevNameText.Name = "SigmaDeveloperText";
	sigmaDevNameText.Text = "MainDeveloper/Scripter: CoverEu";
	sigmaDevNameText.Font = Enum.Font.Gotham;
	sigmaDevNameText.TextSize = sigmaMessageFontSize - 2;
	sigmaDevNameText.TextColor3 = Color3.fromRGB(220, 220, 220);
	sigmaDevNameText.BackgroundTransparency = 1;
	sigmaDevNameText.TextXAlignment = Enum.TextXAlignment.Right;
	sigmaDevNameText.Size = UDim2.new(0, sigmaDevNameText.TextBounds.X + 5, 1, 0);
	sigmaDevNameText.AutomaticSize = Enum.AutomaticSize.X;
	local sigmaDevPfpImage = Instance.new("ImageLabel", sigmaDevInfoBox);
	sigmaDevPfpImage.Name = "SigmaDeveloperPFP";
	sigmaDevPfpImage.Image = "rbxassetid://70602183475196";
	sigmaDevPfpImage.Size = UDim2.new(0, 35, 0, 35);
	sigmaDevPfpImage.BackgroundTransparency = 1;
	local pfpCorner = Instance.new("UICorner", sigmaDevPfpImage);
	pfpCorner.CornerRadius = UDim.new(0, 6);
	local sigmaLogHistoryArea = Instance.new("Frame", sigmaMainPanel);
	sigmaLogHistoryArea.Size = UDim2.new(1, -20, 0, 180);
	sigmaLogHistoryArea.Position = UDim2.new(0, 10, 0, 100);
	sigmaLogHistoryArea.BackgroundTransparency = 1;
	sigmaLogHistoryArea.Visible = false;
	local sigmaLogScrollFrame = Instance.new("ScrollingFrame", sigmaLogHistoryArea);
	sigmaLogScrollFrame.Size = UDim2.new(1, 0, 1, -40);
	sigmaLogScrollFrame.Position = UDim2.new(0, 0, 0, 0);
	sigmaLogScrollFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10);
	sigmaLogScrollFrame.BorderSizePixel = 0;
	sigmaLogScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0);
	local sigmaLogListThingy = Instance.new("UIListLayout", sigmaLogScrollFrame);
	sigmaLogListThingy.SortOrder = Enum.SortOrder.LayoutOrder;
	sigmaLogListThingy.Padding = UDim.new(0, 2);
	local nukeSigmaLogsButton = Instance.new("TextButton", sigmaLogHistoryArea);
	nukeSigmaLogsButton.Size = UDim2.new(0.5, 0, 0, 30);
	nukeSigmaLogsButton.Position = UDim2.new(0.25, 0, 1, -25);
	nukeSigmaLogsButton.Text = "Clear Logs";
	nukeSigmaLogsButton.Font = Enum.Font.GothamBold;
	nukeSigmaLogsButton.TextSize = sigmaButtonFontSize;
	nukeSigmaLogsButton.TextColor3 = Color3.fromRGB(255, 255, 255);
	nukeSigmaLogsButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
	local clearLogsCorner = Instance.new("UICorner", nukeSigmaLogsButton);
	clearLogsCorner.CornerRadius = UDim.new(0, 6);
	local clearLogsStroke = Instance.new("UIStroke", nukeSigmaLogsButton);
	clearLogsStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	clearLogsStroke.Color = Color3.fromRGB(255, 255, 255);
	clearLogsStroke.Thickness = 1;
	nukeSigmaLogsButton.MouseButton1Click:Connect(function()
		local originalText = nukeSigmaLogsButton.Text;
		nukeSigmaLogsButton.Text = "Clearing...";
		nukeSigmaLogsButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60);
		for _, child in pairs(sigmaLogScrollFrame:GetChildren()) do
			if child:IsA("TextLabel") then
				child:Destroy();
			end
		end
		local noSigmaLogsText = Instance.new("TextLabel", sigmaLogScrollFrame);
		noSigmaLogsText.Name = "NoSigmaLogsText";
		noSigmaLogsText.Text = "No logs to display.";
		noSigmaLogsText.Font = Enum.Font.Gotham;
		noSigmaLogsText.TextSize = 14;
		noSigmaLogsText.TextColor3 = Color3.fromRGB(200, 200, 200);
		noSigmaLogsText.TextXAlignment = Enum.TextXAlignment.Center;
		noSigmaLogsText.Size = UDim2.new(1, -10, 0, 30);
		noSigmaLogsText.Position = UDim2.new(0, 5, 0, 10);
		noSigmaLogsText.BackgroundTransparency = 1;
		sigmaLogScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 50);
		pcall(function()
			rawset(getgenv(), "sigmaLogBlasts", {});
		end);
		getgenv().sigmaLogBlasts = {};
		if (type(getgenv().sigmaLogBlasts) == "table") then
			for i = #getgenv().sigmaLogBlasts, 1, -1 do
				table.remove(getgenv().sigmaLogBlasts, i);
			end
		end
		print("UltraSigmaGuard: Log history forcefully cleared!");
		task.delay(0.5, function()
			nukeSigmaLogsButton.Text = originalText;
			nukeSigmaLogsButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
		end);
	end);
	local sigmaTabYPosition = 0.2;
	local sigmaTabHeight = 30;
	local sigmaTotalPanelPadding = 10 * 2;
	local sigmaTabSpacing = 5 * 2;
	local sigmaTabWidth = ((sigmaMainPanel.AbsoluteSize.X - sigmaTotalPanelPadding) - sigmaTabSpacing) / 4;
	local sigmaMainTab = Instance.new("TextButton", sigmaMainPanel);
	sigmaMainTab.Size = UDim2.new(0, sigmaTabWidth, 0, sigmaTabHeight);
	sigmaMainTab.Position = UDim2.new(0, 10, 0, 65);
	sigmaMainTab.Text = "Main";
	sigmaMainTab.Font = Enum.Font.GothamBold;
	sigmaMainTab.TextSize = sigmaButtonFontSize + 2;
	sigmaMainTab.TextColor3 = sigmaTabFontColor;
	sigmaMainTab.BackgroundColor3 = sigmaSelectedTabColor;
	local mainTabCorner = Instance.new("UICorner", sigmaMainTab);
	mainTabCorner.CornerRadius = UDim.new(0, 6);
	local mainTabStroke = Instance.new("UIStroke", sigmaMainTab);
	mainTabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	mainTabStroke.Color = Color3.fromRGB(255, 255, 255);
	mainTabStroke.Thickness = 1;
	local sigmaSettingsTab = Instance.new("TextButton", sigmaMainPanel);
	sigmaSettingsTab.Size = UDim2.new(0, sigmaTabWidth, 0, sigmaTabHeight);
	sigmaSettingsTab.Position = UDim2.new(0, 10 + sigmaTabWidth + 5, 0, 65);
	sigmaSettingsTab.Text = "Settings";
	sigmaSettingsTab.Font = Enum.Font.GothamBold;
	sigmaSettingsTab.TextSize = sigmaButtonFontSize + 2;
	sigmaSettingsTab.TextColor3 = sigmaTabFontColor;
	sigmaSettingsTab.BackgroundColor3 = sigmaDefaultTabColor;
	local settingsTabCorner = Instance.new("UICorner", sigmaSettingsTab);
	settingsTabCorner.CornerRadius = UDim.new(0, 6);
	local settingsTabStroke = Instance.new("UIStroke", sigmaSettingsTab);
	settingsTabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	settingsTabStroke.Color = Color3.fromRGB(255, 255, 255);
	settingsTabStroke.Thickness = 1;
	local sigmaCreditsTab = Instance.new("TextButton", sigmaMainPanel);
	sigmaCreditsTab.Size = UDim2.new(0, sigmaTabWidth, 0, sigmaTabHeight);
	sigmaCreditsTab.Position = UDim2.new(0, 10 + ((sigmaTabWidth + 5) * 2), 0, 65);
	sigmaCreditsTab.Text = "Credits";
	sigmaCreditsTab.Font = Enum.Font.GothamBold;
	sigmaCreditsTab.TextSize = sigmaButtonFontSize + 2;
	sigmaCreditsTab.TextColor3 = sigmaTabFontColor;
	sigmaCreditsTab.BackgroundColor3 = sigmaDefaultTabColor;
	local creditsTabCorner = Instance.new("UICorner", sigmaCreditsTab);
	creditsTabCorner.CornerRadius = UDim.new(0, 6);
	local creditsTabStroke = Instance.new("UIStroke", sigmaCreditsTab);
	creditsTabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	creditsTabStroke.Color = Color3.fromRGB(255, 255, 255);
	creditsTabStroke.Thickness = 1;
	local sigmaLogHistoryTab = Instance.new("TextButton", sigmaMainPanel);
	sigmaLogHistoryTab.Size = UDim2.new(0, sigmaTabWidth, 0, sigmaTabHeight);
	sigmaLogHistoryTab.Position = UDim2.new(0, 10 + ((sigmaTabWidth + 5) * 3), 0, 65);
	sigmaLogHistoryTab.Text = "Log History";
	sigmaLogHistoryTab.Font = Enum.Font.GothamBold;
	sigmaLogHistoryTab.TextSize = sigmaButtonFontSize + 2;
	sigmaLogHistoryTab.TextColor3 = sigmaTabFontColor;
	sigmaLogHistoryTab.BackgroundColor3 = sigmaDefaultTabColor;
	local logHistoryTabCorner = Instance.new("UICorner", sigmaLogHistoryTab);
	logHistoryTabCorner.CornerRadius = UDim.new(0, 6);
	local logHistoryTabStroke = Instance.new("UIStroke", sigmaLogHistoryTab);
	logHistoryTabStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	logHistoryTabStroke.Color = Color3.fromRGB(255, 255, 255);
	logHistoryTabStroke.Thickness = 1;
	local sigmaSettingsArea = Instance.new("Frame", sigmaMainPanel);
	sigmaSettingsArea.Size = UDim2.new(1, -20, 0, 180);
	sigmaSettingsArea.Position = UDim2.new(0, 10, 0, 100);
	sigmaSettingsArea.BackgroundTransparency = 1;
	sigmaSettingsArea.Visible = false;
	local sigmaAutoAcceptButton = Instance.new("TextButton", sigmaSettingsArea);
	sigmaAutoAcceptButton.Size = UDim2.new(0.9, 0, 0, 40);
	sigmaAutoAcceptButton.Position = UDim2.new(0.05, 0, 0, 30);
	sigmaAutoAcceptButton.Text = "Toggle Auto-Accept: OFF";
	sigmaAutoAcceptButton.Font = Enum.Font.GothamBold;
	sigmaAutoAcceptButton.TextSize = sigmaButtonFontSize;
	sigmaAutoAcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255);
	sigmaAutoAcceptButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60);
	sigmaAutoAcceptButton.Name = "SigmaAutoAcceptButton";
	local autoAcceptCorner = Instance.new("UICorner", sigmaAutoAcceptButton);
	autoAcceptCorner.CornerRadius = UDim.new(0, 6);
	local autoAcceptStroke = Instance.new("UIStroke", sigmaAutoAcceptButton);
	autoAcceptStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	autoAcceptStroke.Color = Color3.fromRGB(255, 255, 255);
	autoAcceptStroke.Thickness = 1;
	local sigmaAutoAcceptDesc = Instance.new("TextLabel", sigmaSettingsArea);
	sigmaAutoAcceptDesc.Size = UDim2.new(0.9, 0, 0, 50);
	sigmaAutoAcceptDesc.Position = UDim2.new(0.05, 0, 0, 80);
	sigmaAutoAcceptDesc.Text = "Toggles automatic acceptance of all security prompts. When ON, all actions will be allowed without prompting. Use with extreme caution!";
	sigmaAutoAcceptDesc.Font = Enum.Font.Gotham;
	sigmaAutoAcceptDesc.TextSize = sigmaButtonFontSize - 2;
	sigmaAutoAcceptDesc.TextColor3 = Color3.fromRGB(200, 200, 200);
	sigmaAutoAcceptDesc.BackgroundTransparency = 1;
	sigmaAutoAcceptDesc.TextWrapped = true;
	sigmaAutoAcceptDesc.TextXAlignment = Enum.TextXAlignment.Center;
	local sigmaAutoAcceptStatus = Instance.new("TextLabel", sigmaSettingsArea);
	sigmaAutoAcceptStatus.Size = UDim2.new(0.9, 0, 0, 30);
	sigmaAutoAcceptStatus.Position = UDim2.new(0.05, 0, 0, 140);
	sigmaAutoAcceptStatus.Text = "Current Status: Security prompts will be shown";
	sigmaAutoAcceptStatus.Font = Enum.Font.GothamBold;
	sigmaAutoAcceptStatus.TextSize = sigmaButtonFontSize - 1;
	sigmaAutoAcceptStatus.TextColor3 = Color3.fromRGB(100, 255, 100);
	sigmaAutoAcceptStatus.BackgroundTransparency = 1;
	sigmaAutoAcceptStatus.TextWrapped = true;
	sigmaAutoAcceptStatus.TextXAlignment = Enum.TextXAlignment.Center;
	local function updateSigmaLogDisplay()
		if not sigmaLogScrollFrame then
			return;
		end
		if (type(getgenv().sigmaLogBlasts) ~= "table") then
			return;
		end
		for _, child in ipairs(sigmaLogScrollFrame:GetChildren()) do
			if child:IsA("TextLabel") then
				child:Destroy();
			end
		end
		local canvasHeight = 0;
		if (#getgenv().sigmaLogBlasts == 0) then
			local noSigmaLogsText = Instance.new("TextLabel", sigmaLogScrollFrame);
			noSigmaLogsText.Name = "NoSigmaLogsText";
			noSigmaLogsText.Text = "No logs to display.";
			noSigmaLogsText.Font = Enum.Font.Gotham;
			noSigmaLogsText.TextSize = 14;
			noSigmaLogsText.TextColor3 = Color3.fromRGB(200, 200, 200);
			noSigmaLogsText.TextXAlignment = Enum.TextXAlignment.Center;
			noSigmaLogsText.Size = UDim2.new(1, -10, 0, 30);
			noSigmaLogsText.Position = UDim2.new(0, 5, 0, 10);
			noSigmaLogsText.BackgroundTransparency = 1;
			canvasHeight = 50;
		else
			for i, entryText in ipairs(getgenv().sigmaLogBlasts) do
				local logEntryLabel = Instance.new("TextLabel", sigmaLogScrollFrame);
				logEntryLabel.Name = "SigmaLogEntry_" .. i;
				logEntryLabel.Text = entryText;
				logEntryLabel.Font = Enum.Font.Gotham;
				logEntryLabel.TextSize = 12;
				logEntryLabel.TextColor3 = Color3.fromRGB(230, 230, 230);
				logEntryLabel.TextXAlignment = Enum.TextXAlignment.Left;
				logEntryLabel.TextWrapped = true;
				logEntryLabel.Size = UDim2.new(1, -10, 0, 0);
				logEntryLabel.AutomaticSize = Enum.AutomaticSize.Y;
				logEntryLabel.BackgroundTransparency = 1;
				logEntryLabel.LayoutOrder = i;
				canvasHeight = canvasHeight + logEntryLabel.AbsoluteSize.Y + sigmaLogListThingy.Padding.Offset;
			end
		end
		sigmaLogScrollFrame.CanvasSize = UDim2.new(0, 0, 0, canvasHeight);
	end
	local function setActiveSigmaTab(selectedTab)
		sigmaMainContentArea.Visible = selectedTab == sigmaMainTab;
		sigmaSettingsArea.Visible = selectedTab == sigmaSettingsTab;
		sigmaCreditsArea.Visible = selectedTab == sigmaCreditsTab;
		sigmaLogHistoryArea.Visible = selectedTab == sigmaLogHistoryTab;
		sigmaMainTab.BackgroundColor3 = ((selectedTab == sigmaMainTab) and sigmaSelectedTabColor) or sigmaDefaultTabColor;
		sigmaSettingsTab.BackgroundColor3 = ((selectedTab == sigmaSettingsTab) and sigmaSelectedTabColor) or sigmaDefaultTabColor;
		sigmaCreditsTab.BackgroundColor3 = ((selectedTab == sigmaCreditsTab) and sigmaSelectedTabColor) or sigmaDefaultTabColor;
		sigmaLogHistoryTab.BackgroundColor3 = ((selectedTab == sigmaLogHistoryTab) and sigmaSelectedTabColor) or sigmaDefaultTabColor;
		if (selectedTab == sigmaLogHistoryTab) then
			updateSigmaLogDisplay();
		end
	end
	sigmaMainTab.MouseButton1Click:Connect(function()
		setActiveSigmaTab(sigmaMainTab);
	end);
	sigmaSettingsTab.MouseButton1Click:Connect(function()
		setActiveSigmaTab(sigmaSettingsTab);
	end);
	sigmaCreditsTab.MouseButton1Click:Connect(function()
		setActiveSigmaTab(sigmaCreditsTab);
	end);
	sigmaLogHistoryTab.MouseButton1Click:Connect(function()
		setActiveSigmaTab(sigmaLogHistoryTab);
	end);
	sigmaAutoAcceptButton.MouseButton1Click:Connect(function()
		getgenv().isAutoAcceptEnabled = not getgenv().isAutoAcceptEnabled;
		if getgenv().isAutoAcceptEnabled then
			sigmaAutoAcceptButton.Text = "Toggle Auto-Accept: ON";
			sigmaAutoAcceptButton.BackgroundColor3 = Color3.fromRGB(150, 60, 60);
			sigmaAutoAcceptStatus.Text = "Current Status: All actions will be automatically accepted!";
			sigmaAutoAcceptStatus.TextColor3 = Color3.fromRGB(255, 100, 100);
			blastToSigmaLog(string.format("[%s] Auto-Accept enabled (toggle mode)", os.date("%H:%M:%S")));
			print("UltraSigmaGuard: Auto-Accept enabled (toggle mode)");
		else
			sigmaAutoAcceptButton.Text = "Toggle Auto-Accept: OFF";
			sigmaAutoAcceptButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60);
			sigmaAutoAcceptStatus.Text = "Current Status: Security prompts will be shown";
			sigmaAutoAcceptStatus.TextColor3 = Color3.fromRGB(100, 255, 100);
			blastToSigmaLog(string.format("[%s] Auto-Accept disabled (toggle mode)", os.date("%H:%M:%S")));
			print("UltraSigmaGuard: Auto-Accept disabled (toggle mode)");
		end
	end);
	local sigmaYesButton = Instance.new("TextButton", sigmaMainContentArea);
	sigmaYesButton.Size, sigmaYesButton.Position = UDim2.new(0.38, 0, 0, 35), UDim2.new(0.05, 0, 1, -25);
	sigmaYesButton.Text, sigmaYesButton.Font = "✅ Yes", Enum.Font.GothamBold;
	sigmaYesButton.TextColor3, sigmaYesButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255), Color3.fromRGB(40, 40, 40);
	sigmaYesButton.TextSize = sigmaButtonFontSize;
	sigmaYesButton.Name = "SigmaYesButton";
	sigmaYesButton.ZIndex = 10;
	local yesCorner = Instance.new("UICorner", sigmaYesButton);
	yesCorner.CornerRadius = UDim.new(0, 6);
	local yesStroke = Instance.new("UIStroke", sigmaYesButton);
	yesStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	yesStroke.Color = Color3.fromRGB(255, 255, 255);
	yesStroke.Thickness = 1;
	local sigmaNoButton = Instance.new("TextButton", sigmaMainContentArea);
	sigmaNoButton.Size, sigmaNoButton.Position = UDim2.new(0.38, 0, 0, 35), UDim2.new(0.57, 0, 1, -25);
	sigmaNoButton.Text, sigmaNoButton.Font = "Reject", Enum.Font.GothamBold;
	sigmaNoButton.TextColor3, sigmaNoButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255), Color3.fromRGB(50, 50, 50);
	sigmaNoButton.TextSize = sigmaButtonFontSize;
	sigmaNoButton.Name = "SigmaNoButton";
	sigmaNoButton.ZIndex = 10;
	local noCorner = Instance.new("UICorner", sigmaNoButton);
	noCorner.CornerRadius = UDim.new(0, 6);
	local noStroke = Instance.new("UIStroke", sigmaNoButton);
	noStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	noStroke.Color = Color3.fromRGB(255, 255, 255);
	noStroke.Thickness = 1;
	local function rememberSigmaUiSpot()
		if (sigmaMainPanel and sigmaMainPanel.Position) then
			getgenv().lastSigmaUiSpot = sigmaMainPanel.Position;
		end
	end
	sigmaMainPanel.Changed:Connect(function(property)
		if (property == "Position") then
			rememberSigmaUiSpot();
		end
	end);
	local sigmaChoiceEvent = Instance.new("BindableEvent");
	sigmaYesButton.MouseButton1Click:Connect(function()
		rememberSigmaUiSpot();
		sigmaChoiceEvent:Fire(true);
	end);
	sigmaNoButton.MouseButton1Click:Connect(function()
		rememberSigmaUiSpot();
		sigmaChoiceEvent:Fire(false);
	end);
	local choice = sigmaChoiceEvent.Event:Wait();
	sigmaScreenWidget:Destroy();
	getgenv().isSigmaPromptPopping = false;
	getgenv().sigmaPromptGoSignal:Fire();
	return choice;
end
local sigmaHostDecisions = {};
local sigmaFileOpDecisions = {};
getgenv().sigmaLogBlasts = {};
local maxSigmaLogBlasts = 50;
local function blastToSigmaLog(logMessage)
	if (type(getgenv().sigmaLogBlasts) ~= "table") then
		getgenv().sigmaLogBlasts = {};
	end
	table.insert(getgenv().sigmaLogBlasts, 1, logMessage);
	if (#getgenv().sigmaLogBlasts > maxSigmaLogBlasts) then
		table.remove(getgenv().sigmaLogBlasts, #getgenv().sigmaLogBlasts);
	end
end
local sigmaApprovedHosts = {["luarmor.net"]=true,["api.luarmor.net"]=true,["cdn.luarmor.net"]=true,["docs.luarmor.net"]=true,["ads.luarmor.net"]=true};
for host, allowed in pairs(sigmaApprovedHosts) do
	if allowed then
		sigmaHostDecisions[host] = true;
	end
end
do
	local mt = assert(getrawmetatable(game), "No metatable on game!");
	setreadonly(mt, false);
	local oldIndex = mt.__index;
	local original_game_HttpGet = game.HttpGet;
	if (type(original_game_HttpGet) ~= "function") then
		original_game_HttpGet = nil;
	end
	mt.__index = newcclosure(function(self, key)
		if ((self == game) and (key == "HttpGet")) then
			return function(_, url, nocache)
				if getgenv().isSigmaGuardingLoadstringContent then
					if original_game_HttpGet then
						return original_game_HttpGet(_, url, nocache);
					else
						return basedHttpRequestPls({Url=url,Method="GET",Headers={["Cache-Control"]=((nocache and "no-cache") or "")}}).Body or "";
					end
				end
				local currentSigmaUrl = url;
				local initialSigmaUrlForPrompt = url;
				local sigmaRedirectsDone = 0;
				local final_body = "";
				local last_res_headers = {};
				while sigmaRedirectsDone <= MAX_SIGMA_REDIRECTS do
					local host = tostring(currentSigmaUrl):match("^https?://([^/]+)") or currentSigmaUrl;
					local sigmaDecisionBasis = "CACHE";
					local sigmaPromptWasShown = false;
					local is_initial_request = sigmaRedirectsDone == 0;
					local was_auto_allowed_by_sigma_rule = false;
					if string.find(tostring(currentSigmaUrl):lower(), "luarmor") then
						sigmaHostDecisions[host] = true;
						sigmaDecisionBasis = "LUARMOR_KEYWORD";
						was_auto_allowed_by_sigma_rule = true;
					end
					if not was_auto_allowed_by_sigma_rule then
						if (sigmaHostDecisions[host] == nil) then
							sigmaDecisionBasis = "PROMPT";
							sigmaPromptWasShown = true;
							local prompt_msg;
							if is_initial_request then
								prompt_msg = string.format([[
-- DOWNLOAD DATA (Game HTTP GET) --
This script wants to: Download information from the internet.

-- DETAILS --
URL: %s

-- WHAT THIS MEANS --
Safe Use: Loading game assets, leaderboards, or essential game data.
Potential Risk: If the URL is unrecognized, it could be trying to fetch harmful scripts or track you.

Always review URLs from untrusted scripts.
Allow this download?]], currentSigmaUrl);
							else
								prompt_msg = string.format([[
-- REDIRECTING DOWNLOAD (Game HTTP GET) --
The download from '%s' wants to redirect to a new URL.

-- NEW DETAILS --
New URL: %s

-- WHAT THIS MEANS --
Safe Use: The server might be organizing files or using a content delivery network (CDN).
Potential Risk: Could be redirecting you to a malicious site after an initial safe-looking URL.

Ensure you trust this new location.
Follow redirect and download?]], initialSigmaUrlForPrompt, currentSigmaUrl);
							end
							sigmaHostDecisions[host] = getSigmaApproval(prompt_msg);
						else
							sigmaDecisionBasis = "CACHE_USED";
						end
					end
					local log_message;
					if sigmaHostDecisions[host] then
						if is_initial_request then
							log_message = string.format("[%s] ALLOWED HTTP GET: %s (%s)", os.date("%H:%M:%S"), currentSigmaUrl, sigmaDecisionBasis);
						else
							log_message = string.format("[%s] ALLOWED REDIRECT (GET): %s (%s)", os.date("%H:%M:%S"), currentSigmaUrl, sigmaDecisionBasis);
						end
					elseif is_initial_request then
						log_message = string.format("[%s] UltraSigmaGuard: Denied HttpGet → %s (%s)", os.date("%H:%M:%S"), currentSigmaUrl, sigmaDecisionBasis);
					else
						log_message = string.format("[%s] UltraSigmaGuard: Denied redirect (GET) → %s (%s)", os.date("%H:%M:%S"), currentSigmaUrl, sigmaDecisionBasis);
					end
					blastToSigmaLog(log_message);
					if not sigmaHostDecisions[host] then
						if sigmaPromptWasShown then
							warn("UltraSigmaGuard: Denied " .. ((is_initial_request and "HttpGet") or "redirect (GET)") .. " → " .. currentSigmaUrl);
						end
						return "";
					end
					local sigmaResponse = basedHttpRequestPls({Url=currentSigmaUrl,Method="GET",Headers={["Cache-Control"]=((nocache and "no-cache") or "")}});
					local sigmaStatusCode = tonumber(sigmaResponse.StatusCode) or 0;
					last_res_headers = sigmaResponse.Headers or {};
					final_body = sigmaResponse.Body or "";
					if ((sigmaStatusCode >= 300) and (sigmaStatusCode < 400) and last_res_headers.Location) then
						if (sigmaRedirectsDone == MAX_SIGMA_REDIRECTS) then
							warn("UltraSigmaGuard: Max redirects reached for HttpGet starting with " .. url);
							blastToSigmaLog(string.format("[%s] UltraSigmaGuard: Max redirects (%d) reached, stopping at %s", os.date("%H:%M:%S"), MAX_SIGMA_REDIRECTS, currentSigmaUrl));
							return final_body;
						end
						currentSigmaUrl = last_res_headers.Location;
						sigmaRedirectsDone = sigmaRedirectsDone + 1;
					else
						return final_body;
					end
				end
				warn("UltraSigmaGuard: Exited HttpGet redirect loop unexpectedly for " .. url);
				return final_body;
			end;
		end
		return (type(oldIndex) == "function") and oldIndex(self, key);
	end);
	setreadonly(mt, true);
end
local function makeSigmaHttpHookBrain(sigmaRequestData, originalBasedFunction, originalBasedFunctionName)
	if getgenv().isSigmaGuardingLoadstringContent then
		return originalBasedFunction(sigmaRequestData);
	end
	local currentSigmaUrl = sigmaRequestData.Url or sigmaRequestData.url;
	if (not currentSigmaUrl or (type(currentSigmaUrl) ~= "string")) then
		warn("UltraSigmaGuard: Could not determine URL from request to " .. originalBasedFunctionName);
		return originalBasedFunction(sigmaRequestData);
	end
	local initialSigmaMethod = string.upper(sigmaRequestData.Method or "GET");
	local currentSigmaMethod = initialSigmaMethod;
	local current_req_package = sigmaRequestData;
	local sigmaRedirectsDone = 0;
	local finalSigmaResponseData = {StatusCode=0,Body="",Headers={},StatusMessage="UltraSigmaGuard Initial State",Success=false};
	while sigmaRedirectsDone <= MAX_SIGMA_REDIRECTS do
		local rawSigmaHost = tostring(currentSigmaUrl):match("^https?://([^/]+)") or currentSigmaUrl;
		local sigmaHostForCache = rawSigmaHost;
		local sigmaHostForIpCheck = rawSigmaHost:match("^([^:]+)") or rawSigmaHost;
		local sigmaDecisionBasis = "CACHE";
		local sigmaPromptWasShown = false;
		local is_initial_request = sigmaRedirectsDone == 0;
		local was_auto_allowed_by_sigma_rule = false;
		local ipv4_pattern = "^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$";
		local host_is_ipv4 = string.match(sigmaHostForIpCheck, ipv4_pattern) ~= nil;
		local alwaysSigmaPromptHost = (sigmaHostForIpCheck == "127.0.0.1") or host_is_ipv4;
		if string.find(tostring(currentSigmaUrl):lower(), "luarmor") then
			sigmaHostDecisions[sigmaHostForCache] = true;
			sigmaDecisionBasis = (is_initial_request and "LUARMOR_KEYWORD") or "LUARMOR_REDIRECT";
			was_auto_allowed_by_sigma_rule = true;
		end
		if not was_auto_allowed_by_sigma_rule then
			if (alwaysSigmaPromptHost or (sigmaHostDecisions[sigmaHostForCache] == nil)) then
				sigmaDecisionBasis = (is_initial_request and "PROMPT") or "PROMPT_REDIRECT";
				sigmaPromptWasShown = true;
				local prompt_message;
				if is_initial_request then
					prompt_message = string.format([[
-- NETWORK REQUEST (%s %s) --
This script wants to: Send or receive data over the internet.

-- DETAILS --
Function Used: %s
Method: %s
URL: %s

-- WHAT THIS MEANS --
Safe Use: Saving progress, authenticating with a service, loading custom content.
Potential Risk: Sending your private data to an unauthorized server, or downloading harmful content if the URL is suspicious.

Review the URL, method, and function used.
Allow this network action?]], originalBasedFunctionName, currentSigmaMethod, originalBasedFunctionName, currentSigmaMethod, currentSigmaUrl);
				else
					prompt_message = string.format([[
-- REDIRECTING NETWORK REQUEST (%s) --
The %s request to '%s' wants to redirect.

-- NEW DETAILS --
New URL: %s
Method for redirect: GET

-- WHAT THIS MEANS --
Safe Use: Common for web services to finalize an action or direct to a new resource page.
Potential Risk: Could be redirecting to a malicious site after an initial interaction.

Ensure you trust this new location.
Follow redirect?]], originalBasedFunctionName, initialSigmaMethod, sigmaRequestData.Url, currentSigmaUrl);
				end
				sigmaHostDecisions[sigmaHostForCache] = getSigmaApproval(prompt_message);
			elseif (sigmaHostDecisions[sigmaHostForCache] ~= nil) then
				sigmaDecisionBasis = "CACHE_USED";
			end
		end
		local sigmaLogActionDetails = string.format("[%s] %s", originalBasedFunctionName, currentSigmaMethod);
		local log_message;
		if sigmaHostDecisions[sigmaHostForCache] then
			if is_initial_request then
				log_message = string.format("[%s] ALLOWED %s: %s (%s)", os.date("%H:%M:%S"), sigmaLogActionDetails, currentSigmaUrl, sigmaDecisionBasis);
			else
				log_message = string.format("[%s] ALLOWED REDIRECT %s: %s (%s)", os.date("%H:%M:%S"), sigmaLogActionDetails, currentSigmaUrl, sigmaDecisionBasis);
			end
		elseif is_initial_request then
			log_message = string.format("[%s] UltraSigmaGuard: Denied %s → %s (%s)", os.date("%H:%M:%S"), sigmaLogActionDetails, currentSigmaUrl, sigmaDecisionBasis);
		else
			log_message = string.format("[%s] UltraSigmaGuard: Denied redirect %s → %s (%s)", os.date("%H:%M:%S"), sigmaLogActionDetails, currentSigmaUrl, sigmaDecisionBasis);
		end
		blastToSigmaLog(log_message);
		if not sigmaHostDecisions[sigmaHostForCache] then
			if sigmaPromptWasShown then
				warn("UltraSigmaGuard: Denied " .. sigmaLogActionDetails .. " → " .. currentSigmaUrl);
			end
			finalSigmaResponseData = {StatusCode=0,Body="",Headers={},StatusMessage="UltraSigmaGuard Denied",Success=false};
			if is_initial_request then
				return finalSigmaResponseData;
			else
				return finalSigmaResponseData;
			end
		end
		local sigmaResponse;
		if is_initial_request then
			sigmaResponse = originalBasedFunction(current_req_package);
		else
			sigmaResponse = basedHttpRequestPls({Url=currentSigmaUrl,Method="GET",Headers={}});
		end
		finalSigmaResponseData = sigmaResponse;
		local sigmaStatusCode = tonumber(sigmaResponse.StatusCode) or 0;
		local sigmaHeaders = sigmaResponse.Headers or {};
		if ((sigmaStatusCode >= 300) and (sigmaStatusCode < 400) and sigmaHeaders.Location) then
			if (sigmaRedirectsDone >= MAX_SIGMA_REDIRECTS) then
				warn("UltraSigmaGuard: Max redirects reached for " .. originalBasedFunctionName .. " starting with " .. (sigmaRequestData.Url or sigmaRequestData.url));
				blastToSigmaLog(string.format("[%s] UltraSigmaGuard: Max redirects (%d) for %s, stopping at %s", os.date("%H:%M:%S"), MAX_SIGMA_REDIRECTS, originalBasedFunctionName, currentSigmaUrl));
				return finalSigmaResponseData;
			end
			currentSigmaUrl = sigmaHeaders.Location;
			currentSigmaMethod = "GET";
			current_req_package = {Url=currentSigmaUrl,Method=currentSigmaMethod,Headers={}};
			sigmaRedirectsDone = sigmaRedirectsDone + 1;
		else
			return finalSigmaResponseData;
		end
	end
	warn("UltraSigmaGuard: Exited " .. originalBasedFunctionName .. " redirect loop unexpectedly for " .. (sigmaRequestData.Url or sigmaRequestData.url));
	return finalSigmaResponseData;
end
do
	local hookedSomething = false;
	if (syn and (type(syn.request) == "function")) then
		local original_syn_request = syn.request;
		syn.request = function(sigmaRequestData)
			if getgenv().isSigmaGuardingLoadstringContent then
				return original_syn_request(sigmaRequestData);
			end
			return makeSigmaHttpHookBrain(sigmaRequestData, original_syn_request, "syn.request");
		end;
		print("UltraSigmaGuard: Hooked syn.request");
		hookedSomething = true;
	end
	local env = getgenv();
	if (type(env.http_request) == "function") then
		if not (syn and syn.request and (env.http_request == syn.request)) then
			local original_http_request = env.http_request;
			env.http_request = function(sigmaRequestData)
				if getgenv().isSigmaGuardingLoadstringContent then
					return original_http_request(sigmaRequestData);
				end
				return makeSigmaHttpHookBrain(sigmaRequestData, original_http_request, "http_request");
			end;
			print("UltraSigmaGuard: Hooked http_request (global/env)");
			hookedSomething = true;
		else
			print("UltraSigmaGuard: Skipped hooking http_request as it's identical to already hooked syn.request");
		end
	end
	if (type(env.request) == "function") then
		if not ((syn and syn.request and (env.request == syn.request)) or (env.http_request and (env.request == env.http_request))) then
			local original_request = env.request;
			env.request = function(sigmaRequestData)
				if getgenv().isSigmaGuardingLoadstringContent then
					return original_request(sigmaRequestData);
				end
				return makeSigmaHttpHookBrain(sigmaRequestData, original_request, "request");
			end;
			print("UltraSigmaGuard: Hooked request (global/env)");
			hookedSomething = true;
		else
			print("UltraSigmaGuard: Skipped hooking request as it's identical to an already hooked function");
		end
	end
	if not hookedSomething then
		print("UltraSigmaGuard: No common executor HTTP functions (syn.request, http_request, request) were found to hook.");
	end
end
local function makeSigmaFileHook(basedFileFunctionName, sigmaFileActionText)
	local originalFuncFromEnv = getgenv()[basedFileFunctionName];
	if getgenv().isSigmaGuardingLoadstringContent then
		return originalFuncFromEnv;
	end
	if originalFuncFromEnv then
		local originalRegisteredFunc = originalFuncFromEnv;
		getgenv()[basedFileFunctionName] = function(...)
			if getgenv().isSigmaGuardingLoadstringContent then
				return originalRegisteredFunc(...);
			end
			local sigmaFileArgs = {...};
			local sigmaFilePath = sigmaFileArgs[1];
			local sigmaCacheKey = tostring(sigmaFilePath) .. ":" .. basedFileFunctionName;
			local sigmaDecisionBasis = "CACHE";
			local sigmaPromptWasShown = false;
			if (sigmaFileOpDecisions[sigmaCacheKey] == nil) then
				sigmaDecisionBasis = "PROMPT";
				sigmaPromptWasShown = true;
				local promptMessage = string.format([[
-- FILE SYSTEM ACTION --
This script wants to: %s

-- DETAILS --
Path: %s

-- WHAT THIS MEANS --
Safe Use: Saving game settings, custom assets, or log files related to this script.
Potential Risk: Deleting important files, creating unwanted files, or modifying system configurations if the path is outside expected script folders (e.g., game's own save folder).

This directly interacts with your computer's files.
Allow this file operation?]], sigmaFileActionText, tostring(sigmaFilePath));
				sigmaFileOpDecisions[sigmaCacheKey] = getSigmaApproval(promptMessage);
			end
			local log_message;
			if sigmaFileOpDecisions[sigmaCacheKey] then
				log_message = string.format("[%s] ALLOWED %s: %s (%s)", os.date("%H:%M:%S"), sigmaFileActionText, tostring(sigmaFilePath), sigmaDecisionBasis);
			else
				log_message = string.format("[%s] UltraSigmaGuard: Denied %s → %s (%s)", os.date("%H:%M:%S"), sigmaFileActionText, tostring(sigmaFilePath), sigmaDecisionBasis);
			end
			blastToSigmaLog(log_message);
			if not sigmaFileOpDecisions[sigmaCacheKey] then
				if sigmaPromptWasShown then
					warn("UltraSigmaGuard: Denied " .. sigmaFileActionText .. " → " .. tostring(sigmaFilePath));
				end
				if ((basedFileFunctionName == "writefile") or (basedFileFunctionName == "makefolder") or (basedFileFunctionName == "os.rename")) then
					return false;
				end
				if (basedFileFunctionName == "os.remove") then
					return nil, "UltraSigmaGuard: Denied by policy (os.remove)";
				end
				return;
			end
			return originalRegisteredFunc(...);
		end;
		print("UltraSigmaGuard: Hooked " .. basedFileFunctionName);
	else
		print("UltraSigmaGuard: Could not hook " .. basedFileFunctionName .. " - not found in environment.");
	end
end
makeSigmaFileHook("writefile", "WRITE FILE");
makeSigmaFileHook("delfile", "DELETE FILE");
makeSigmaFileHook("makefolder", "CREATE FOLDER");
makeSigmaFileHook("delfolder", "DELETE FOLDER");
makeSigmaFileHook("deletefolder", "Terminate Folder");
if os then
	if (type(os.remove) == "function") then
		makeSigmaFileHook("os.remove", "DELETE FILE/FOLDER (os.remove)");
	else
		print("UltraSigmaGuard: os.remove not found or not a function, cannot hook.");
	end
	if (type(os.rename) == "function") then
		makeSigmaFileHook("os.rename", "RENAME/MOVE FILE (os.rename)");
	else
		print("UltraSigmaGuard: os.rename not found or not a function, cannot hook.");
	end
else
	print("UltraSigmaGuard: 'os' table not found, cannot hook os.remove or os.rename.");
end
if (io and (type(io.open) == "function")) then
	local originalBasedIoOpen = io.open;
	io.open = function(sigmaIoFilePath, sigmaIoMode)
		if getgenv().isSigmaGuardingLoadstringContent then
			return originalBasedIoOpen(sigmaIoFilePath, sigmaIoMode);
		end
		sigmaIoMode = sigmaIoMode or "r";
		local sigmaFileActionText = nil;
		local sigmaIoNeedsPrompt = false;
		if string.find(sigmaIoMode, "[wa]") then
			sigmaIoNeedsPrompt = true;
			if string.find(sigmaIoMode, "a") then
				sigmaFileActionText = "OPEN/CREATE FILE FOR APPENDING (io.open)";
			else
				sigmaFileActionText = "OPEN/CREATE FILE FOR WRITING (io.open)";
			end
		end
		if sigmaIoNeedsPrompt then
			local sigmaIoFilePathString = tostring(sigmaIoFilePath);
			local sigmaCacheKey = sigmaIoFilePathString .. ":io.open:" .. sigmaIoMode;
			local sigmaDecisionBasis = "CACHE";
			local sigmaPromptWasShown = false;
			if (sigmaFileOpDecisions[sigmaCacheKey] == nil) then
				sigmaDecisionBasis = "PROMPT";
				sigmaPromptWasShown = true;
				local promptMessage = string.format([[
-- %s --
This script wants to: Access a file with intent to modify or create it.

-- DETAILS --
File Path: %s
Mode: %s

-- WHAT THIS MEANS --
Safe Use: Saving script data, logs, configurations, or creating new files as part of a feature.
Potential Risk: Overwriting important files, creating unwanted files, or subtly altering data if the script or path is untrusted.

Allow opening '%s' with mode '%s'?]], sigmaFileActionText, sigmaIoFilePathString, sigmaIoMode, sigmaIoFilePathString, sigmaIoMode);
				sigmaFileOpDecisions[sigmaCacheKey] = getSigmaApproval(promptMessage);
			end
			local log_message;
			if sigmaFileOpDecisions[sigmaCacheKey] then
				log_message = string.format("[%s] ALLOWED %s: %s (Mode: %s) (%s)", os.date("%H:%M:%S"), sigmaFileActionText, sigmaIoFilePathString, sigmaIoMode, sigmaDecisionBasis);
			else
				log_message = string.format("[%s] UltraSigmaGuard: Denied %s for %s (Mode: %s) (%s)", os.date("%H:%M:%S"), sigmaFileActionText, sigmaIoFilePathString, sigmaIoMode, sigmaDecisionBasis);
			end
			blastToSigmaLog(log_message);
			if not sigmaFileOpDecisions[sigmaCacheKey] then
				if sigmaPromptWasShown then
					warn("UltraSigmaGuard: Denied " .. sigmaFileActionText .. " for file " .. sigmaIoFilePathString .. " with mode " .. sigmaIoMode);
				end
				return nil, "UltraSigmaGuard: Denied by policy (io.open for " .. sigmaIoMode .. ")";
			end
		end
		return originalBasedIoOpen(sigmaIoFilePath, sigmaIoMode);
	end;
	print("UltraSigmaGuard: Hooked io.open to monitor write/append modes.");
else
	print("UltraSigmaGuard: io.open not found or not a function, cannot hook for write/append modes.");
end
local function makeSigmaClipboardHook(basedFileFunctionName, sigmaFileActionText)
	local originalFuncFromEnv = getgenv()[basedFileFunctionName];
	if getgenv().isSigmaGuardingLoadstringContent then
		return originalFuncFromEnv;
	end
	if originalFuncFromEnv then
		local originalRegisteredFunc = originalFuncFromEnv;
		getgenv()[basedFileFunctionName] = function(sigmaTextToClipboard)
			if getgenv().isSigmaGuardingLoadstringContent then
				return originalRegisteredFunc(sigmaTextToClipboard);
			end
			local sigmaDecisionBasis = "PROMPT";
			local sigmaPromptWasShown = true;
			local max_prompt_chars = 200;
			local sigmaClipboardPreviewText = sigmaTextToClipboard;
			if (#sigmaTextToClipboard > max_prompt_chars) then
				sigmaClipboardPreviewText = string.sub(sigmaTextToClipboard, 1, max_prompt_chars) .. "... (truncated)";
			end
			local allowSigmaClipboard = getSigmaApproval(string.format([[
-- CLIPBOARD ACTION --
This script wants to: %s

-- DETAILS --
Content (preview): "%s"

-- WHAT THIS MEANS --
Safe Use: Copying useful information like codes, links, or script output for you to paste elsewhere.
Potential Risk: Secretly copying sensitive information (like passwords if they were visible), or replacing your current clipboard content with something malicious (like a harmful link or command).

This will change or read your system clipboard.
Allow this clipboard action?]], sigmaFileActionText, sigmaClipboardPreviewText));
			local sigmaClipboardLogPreview = sigmaTextToClipboard;
			if (#sigmaTextToClipboard > 50) then
				sigmaClipboardLogPreview = string.sub(sigmaTextToClipboard, 1, 50) .. "...";
			end
			local log_message;
			if allowSigmaClipboard then
				log_message = string.format('[%s] ALLOWED %s: \"%s\" (%s)', os.date("%H:%M:%S"), sigmaFileActionText, sigmaClipboardLogPreview, sigmaDecisionBasis);
				blastToSigmaLog(log_message);
				return originalRegisteredFunc(sigmaTextToClipboard);
			else
				log_message = string.format('[%s] UltraSigmaGuard: Denied %s → \"%s\" (%s)', os.date("%H:%M:%S"), sigmaFileActionText, sigmaClipboardLogPreview, sigmaDecisionBasis);
				blastToSigmaLog(log_message);
				if sigmaPromptWasShown then
					warn("UltraSigmaGuard: Denied " .. sigmaFileActionText .. ' → \"' .. sigmaClipboardLogPreview .. '\"');
				end
				return false;
			end
		end;
		print("UltraSigmaGuard: Hooked " .. basedFileFunctionName .. " for clipboard control.");
	else
		print("UltraSigmaGuard: Could not hook " .. basedFileFunctionName .. " for clipboard control - not found in environment.");
	end
end
makeSigmaClipboardHook("setclipboard", "COPY TO CLIPBOARD");
local function makeSigmaOpenLinkHook(basedFileFunctionName, sigmaFileActionText)
	local originalFuncFromEnv = getgenv()[basedFileFunctionName];
	if getgenv().isSigmaGuardingLoadstringContent then
		return originalFuncFromEnv;
	end
	if originalFuncFromEnv then
		local originalRegisteredFunc = originalFuncFromEnv;
		getgenv()[basedFileFunctionName] = function(sigmaLinkToOpen)
			if getgenv().isSigmaGuardingLoadstringContent then
				return originalRegisteredFunc(sigmaLinkToOpen);
			end
			local sigmaDecisionBasis = "PROMPT";
			local sigmaPromptWasShown = true;
			local allowSigmaOpenLink = getSigmaApproval(string.format([[
-- OPEN EXTERNAL URL --
This script wants to: %s

-- DETAILS --
URL: %s

-- WHAT THIS MEANS --
Safe Use: Opening a legitimate webpage for information, a game's community page, or a help document.
Potential Risk: Opening a phishing website (fake login page), a site that downloads malware, or an unwanted advertisement.

This will open a link in your default web browser or another application.
Allow opening this URL?]], sigmaFileActionText, tostring(sigmaLinkToOpen)));
			local log_message;
			if allowSigmaOpenLink then
				log_message = string.format("[%s] ALLOWED %s: %s (%s)", os.date("%H:%M:%S"), sigmaFileActionText, tostring(sigmaLinkToOpen), sigmaDecisionBasis);
				blastToSigmaLog(log_message);
				return originalRegisteredFunc(sigmaLinkToOpen);
			else
				log_message = string.format("[%s] UltraSigmaGuard: Denied %s → %s (%s)", os.date("%H:%M:%S"), sigmaFileActionText, tostring(sigmaLinkToOpen), sigmaDecisionBasis);
				blastToSigmaLog(log_message);
				if sigmaPromptWasShown then
					warn("UltraSigmaGuard: Denied " .. sigmaFileActionText .. " → " .. tostring(sigmaLinkToOpen));
				end
				return false;
			end
		end;
		print("UltraSigmaGuard: Hooked " .. basedFileFunctionName .. " for external URL opening control.");
	else
		print("UltraSigmaGuard: Could not hook " .. basedFileFunctionName .. " for external URL opening control - not found in environment.");
	end
end
makeSigmaOpenLinkHook("openurl", "OPEN URL EXTERNALLY");
if (os and os.execute) then
	local originalBasedOsExecute = os.execute;
	os.execute = function(sigmaSystemCommand)
		if getgenv().isSigmaGuardingLoadstringContent then
			return originalBasedOsExecute(sigmaSystemCommand);
		end
		local lowerSigmaSystemCommand = tostring(sigmaSystemCommand):lower();
		local isSigmaCommandSus = false;
		local sigmaSusKeywords = {"http:","https://","discord.gg","start ","open ","xdg-open"};
		for _, keyword in ipairs(sigmaSusKeywords) do
			if string.find(lowerSigmaSystemCommand, keyword) then
				isSigmaCommandSus = true;
				break;
			end
		end
		if isSigmaCommandSus then
			local sigmaDecisionBasis = "PROMPT";
			local sigmaPromptWasShown = true;
			local sigmaFileActionText = "EXECUTE COMMAND";
			local allowSigmaExecute = getSigmaApproval(string.format([[
-- EXECUTE SYSTEM COMMAND --
This script wants to: Run a command directly on your computer.

-- DETAILS --
Command: %s

-- WHAT THIS MEANS --
This is a very powerful action with high security risks.
Safe Use: Extremely rare for typical game scripts. Possibly used by advanced local tools IF you fully trust the script's source and understand the command.
Potential Risk: Can run ANY program, delete files, download/install malware, open unwanted websites, change system settings, or completely compromise your computer.

ONLY ALLOW IF YOU ARE ABSOLUTELY SURE WHAT THIS COMMAND DOES AND YOU FULLY TRUST THE SCRIPT SOURCE.
Allow this command execution?]], sigmaSystemCommand));
			local log_message;
			if allowSigmaExecute then
				log_message = string.format("[%s] ALLOWED %s: %s (%s)", os.date("%H:%M:%S"), sigmaFileActionText, sigmaSystemCommand, sigmaDecisionBasis);
				blastToSigmaLog(log_message);
				return originalBasedOsExecute(sigmaSystemCommand);
			else
				log_message = string.format("[%s] UltraSigmaGuard: Denied %s → %s (%s)", os.date("%H:%M:%S"), sigmaFileActionText, sigmaSystemCommand, sigmaDecisionBasis);
				blastToSigmaLog(log_message);
				if sigmaPromptWasShown then
					warn("UltraSigmaGuard: Denied " .. sigmaFileActionText .. " → " .. sigmaSystemCommand);
				end
				return false;
			end
		else
			return originalBasedOsExecute(sigmaSystemCommand);
		end
	end;
	print("UltraSigmaGuard: Hooked os.execute for potential external URL opening control.");
else
	print("UltraSigmaGuard: Could not hook os.execute - not found in environment.");
end
do
	local success, socket_http = pcall(require, "socket.http");
	if (success and socket_http and (type(socket_http.request) == "function")) then
		local originalBasedSocketRequest = socket_http.request;
		socket_http.request = function(sigmaSocketRequestData)
			if getgenv().isSigmaGuardingLoadstringContent then
				return originalBasedSocketRequest(sigmaSocketRequestData);
			end
			local initialSigmaSocketData;
			if (type(sigmaSocketRequestData) == "string") then
				initialSigmaSocketData = {url=sigmaSocketRequestData,method="GET"};
			elseif (type(sigmaSocketRequestData) == "table") then
				initialSigmaSocketData = sigmaSocketRequestData;
			else
				return originalBasedSocketRequest(sigmaSocketRequestData);
			end
			local currentSigmaSocketData = initialSigmaSocketData;
			local currentSigmaUrl = currentSigmaSocketData.url;
			local currentSigmaMethod = string.upper(currentSigmaSocketData.method or "GET");
			local sigmaRedirectsDone = 0;
			local finalSigmaResponseData = {nil,"UltraSigmaGuard Initial State",{},"UltraSigmaGuard Initial State"};
			local was_auto_allowed_by_sigma_rule = false;
			while sigmaRedirectsDone <= MAX_SIGMA_REDIRECTS do
				if (not currentSigmaUrl or (type(currentSigmaUrl) ~= "string")) then
					warn("UltraSigmaGuard [socket.http.request]: Could not determine URL or invalid URL type.");
					return unpack(finalSigmaResponseData);
				end
				local rawSigmaHost = tostring(currentSigmaUrl):match("^https?://([^/]+)") or currentSigmaUrl;
				local sigmaHostForCache = rawSigmaHost;
				local sigmaHostForIpCheck = rawSigmaHost:match("^([^:]+)") or rawSigmaHost;
				local sigmaDecisionBasis = "CACHE";
				local sigmaPromptWasShown = false;
				local is_initial_request = sigmaRedirectsDone == 0;
				was_auto_allowed_by_sigma_rule = false;
				local ipv4_pattern = "^%d%d?%d?%.%d%d?%d?%.%d%d?%d?%.%d%d?%d?$";
				local host_is_ipv4 = string.match(sigmaHostForIpCheck, ipv4_pattern) ~= nil;
				local alwaysSigmaPromptHost = (sigmaHostForIpCheck == "127.0.0.1") or host_is_ipv4;
				if string.find(tostring(currentSigmaUrl):lower(), "luarmor") then
					sigmaHostDecisions[sigmaHostForCache] = true;
					sigmaDecisionBasis = (is_initial_request and "LUARMOR_KEYWORD") or "LUARMOR_REDIRECT";
					was_auto_allowed_by_sigma_rule = true;
				end
				if not was_auto_allowed_by_sigma_rule then
					if (alwaysSigmaPromptHost or (sigmaHostDecisions[sigmaHostForCache] == nil)) then
						sigmaDecisionBasis = (is_initial_request and "PROMPT") or "PROMPT_REDIRECT";
						sigmaPromptWasShown = true;
						local prompt_message;
						if is_initial_request then
							prompt_message = string.format([[
-- LOW-LEVEL NETWORK REQUEST (socket.http %s) --
This script wants to: Make a direct, low-level network connection.

-- DETAILS --
Method: %s
URL: %s

-- WHAT THIS MEANS --
Safe Use: Custom communication for game features or specialized tools from highly trusted developers.
Potential Risk: Can bypass some standard security layers, send sensitive data without typical browser protections, or connect to malicious servers. This offers more direct network control than regular HTTP requests.

Review URL and method very carefully.
Allow this low-level action?]], currentSigmaMethod, currentSigmaMethod, currentSigmaUrl);
						else
							prompt_message = string.format([[
-- REDIRECTING LOW-LEVEL REQUEST (socket.http) --
The low-level request to '%s' wants to redirect.

-- NEW DETAILS --
New URL: %s
Method for redirect: GET

-- WHAT THIS MEANS --
Safe Use: The server might be load balancing or moving resources for this low-level connection.
Potential Risk: An initial "safe-looking" direct connection could redirect to a harmful one.

Ensure you trust this new network location for a low-level connection.
Follow redirect?]], initialSigmaSocketData.url, currentSigmaUrl);
						end
						sigmaHostDecisions[sigmaHostForCache] = getSigmaApproval(prompt_message);
					elseif (sigmaHostDecisions[sigmaHostForCache] ~= nil) then
						sigmaDecisionBasis = "CACHE_USED";
					end
				end
				local sigmaLogActionDetails = string.format("[socket.http.request] %s", currentSigmaMethod);
				local log_message;
				if sigmaHostDecisions[sigmaHostForCache] then
					log_message = string.format("[%s] ALLOWED %s: %s (%s)", os.date("%H:%M:%S"), sigmaLogActionDetails, currentSigmaUrl, sigmaDecisionBasis);
				else
					log_message = string.format("[%s] UltraSigmaGuard: Denied %s → %s (%s)", os.date("%H:%M:%S"), sigmaLogActionDetails, currentSigmaUrl, sigmaDecisionBasis);
				end
				blastToSigmaLog(log_message);
				if not sigmaHostDecisions[sigmaHostForCache] then
					if sigmaPromptWasShown then
						warn("UltraSigmaGuard: Denied " .. sigmaLogActionDetails .. " → " .. currentSigmaUrl);
					end
					if is_initial_request then
						return nil, "UltraSigmaGuard: Denied by policy", {}, "UltraSigmaGuard: Request Denied";
					else
						return unpack(finalSigmaResponseData);
					end
				end
				local sigmaSocketBody, sigmaSocketCode, sigmaSocketHeaders, sigmaSocketStatus;
				if is_initial_request then
					sigmaSocketBody, sigmaSocketCode, sigmaSocketHeaders, sigmaSocketStatus = originalBasedSocketRequest(currentSigmaSocketData);
				else
					local raw_res_table = basedHttpRequestPls({Url=currentSigmaUrl,Method="GET",Headers={}});
					sigmaSocketBody = raw_res_table.Body;
					sigmaSocketCode = raw_res_table.StatusCode;
					sigmaSocketHeaders = raw_res_table.Headers;
					sigmaSocketStatus = raw_res_table.StatusMessage or (raw_res_table.Success and tostring(raw_res_table.StatusCode)) or "Error";
				end
				finalSigmaResponseData = {sigmaSocketBody,sigmaSocketCode,sigmaSocketHeaders,sigmaSocketStatus};
				if ((type(sigmaSocketCode) == "number") and (sigmaSocketCode >= 300) and (sigmaSocketCode < 400) and sigmaSocketHeaders and sigmaSocketHeaders.location) then
					if (sigmaRedirectsDone >= MAX_SIGMA_REDIRECTS) then
						warn("UltraSigmaGuard: Max redirects reached for socket.http.request starting with " .. initialSigmaSocketData.url);
						blastToSigmaLog(string.format("[%s] UltraSigmaGuard: Max redirects (%d) for socket.http.request, stopping at %s", os.date("%H:%M:%S"), MAX_SIGMA_REDIRECTS, currentSigmaUrl));
						return unpack(finalSigmaResponseData);
					end
					currentSigmaUrl = sigmaSocketHeaders.location;
					currentSigmaMethod = "GET";
					currentSigmaSocketData = {url=currentSigmaUrl,method=currentSigmaMethod};
					sigmaRedirectsDone = sigmaRedirectsDone + 1;
				else
					return unpack(finalSigmaResponseData);
				end
			end
			warn("UltraSigmaGuard: Exited socket.http.request redirect loop unexpectedly for " .. initialSigmaSocketData.url);
			return unpack(finalSigmaResponseData);
		end;
		print("UltraSigmaGuard: Hooked socket.http.request for low-level network control.");
	elseif not success then
		print("UltraSigmaGuard: Could not hook socket.http.request - 'socket.http' module failed to load.");
	elseif not (socket_http and (type(socket_http.request) == "function")) then
		print("UltraSigmaGuard: Could not hook socket.http.request - 'socket.http.request' function not found after loading module.");
	end
end
if (type(loadstring) == "function") then
	local originalSigmaLoadstring = loadstring;
	function loadstring(sigmaCodeString, sigmaChunkName)
		local trusted_loadstring_source = "@https://api.luarmor.net";
		if ((type(sigmaChunkName) == "string") and (sigmaChunkName == trusted_loadstring_source)) then
			blastToSigmaLog(string.format("[%s] AUTOMATICALLY ALLOWED loadstring from trusted chunk: %s", os.date("%H:%M:%S"), sigmaChunkName));
			getgenv().isSigmaGuardingLoadstringContent = true;
			local success, resultOrError = pcall(originalSigmaLoadstring, sigmaCodeString, sigmaChunkName);
			getgenv().isSigmaGuardingLoadstringContent = false;
			if success then
				return originalSigmaLoadstring(sigmaCodeString, sigmaChunkName);
			else
				warn("UltraSigmaGuard: Error during auto-allowed loadstring execution from " .. trusted_loadstring_source .. ": ", tostring(resultOrError));
				return nil, resultOrError;
			end
		end
		if getgenv().isSigmaGuardingLoadstringContent then
			return originalSigmaLoadstring(sigmaCodeString, sigmaChunkName);
		end
		local sigmaCodeSnippet = sigmaCodeString;
		if (#sigmaCodeString > 200) then
			sigmaCodeSnippet = string.sub(sigmaCodeString, 1, 200) .. "... (code truncated)";
		end
		sigmaCodeSnippet = sigmaCodeSnippet:gsub("\n", "\\n");
		local promptMessage = string.format([[
-- EXECUTE STRING OF CODE (loadstring) --
This script wants to: Compile and run Lua code provided as a text string.

-- CODE SNIPPET (first 200 chars, newlines escaped) --
%s

-- WHAT THIS MEANS --
Safe Use: Sometimes used by legitimate scripts for dynamic functionality or loading modules from text.
Potential Risk: VERY HIGH. This can execute ANY Lua code. Malicious scripts often use loadstring to hide their harmful actions or download and run more bad code.

ONLY ALLOW IF YOU ARE ABSOLUTELY SURE WHAT THIS CODE DOES AND YOU FULLY TRUST THE SCRIPT SOURCE.
Allow executing this string of code?]], sigmaCodeSnippet);
		local allowSigmaLoad = getSigmaApproval(promptMessage);
		local log_message;
		local result, err;
		if allowSigmaLoad then
			log_message = string.format("[%s] ALLOWED loadstring: Snippet: '%s' (ChunkName: %s)", os.date("%H:%M:%S"), sigmaCodeSnippet, tostring(sigmaChunkName));
			blastToSigmaLog(log_message);
			getgenv().isSigmaGuardingLoadstringContent = true;
			result, err = pcall(originalSigmaLoadstring, sigmaCodeString, sigmaChunkName);
			getgenv().isSigmaGuardingLoadstringContent = false;
			if result then
				return originalSigmaLoadstring(sigmaCodeString, sigmaChunkName);
			else
				warn("UltraSigmaGuard: Error during pcalled original loadstring: ", tostring(err));
				return nil, err;
			end
		else
			log_message = string.format("[%s] UltraSigmaGuard: Denied loadstring: Snippet: '%s' (ChunkName: %s)", os.date("%H:%M:%S"), sigmaCodeSnippet, tostring(sigmaChunkName));
			blastToSigmaLog(log_message);
			warn("UltraSigmaGuard: Denied execution of loadstring content. Snippet: " .. sigmaCodeSnippet);
			return nil, "UltraSigmaGuard: Denied by policy (loadstring)";
		end
	end
	print("UltraSigmaGuard: Hooked loadstring function.");
else
	print("UltraSigmaGuard: loadstring not found or not a function, cannot hook.");
end
local TeleportService = game:GetService("TeleportService");
local sigmaTeleportMethodsToHook = {"Teleport","TeleportToPrivateServer","TeleportToPlaceInstance","TeleportPartyAsync"};
for _, sigmaMethodName in ipairs(sigmaTeleportMethodsToHook) do
	if (type(TeleportService[sigmaMethodName]) == "function") then
		local originalSigmaTeleportMethod = TeleportService[sigmaMethodName];
		TeleportService[sigmaMethodName] = function(...)
			local sigmaTeleportArgs = {...};
			if getgenv().isSigmaGuardingLoadstringContent then
				return originalSigmaTeleportMethod(TeleportService, unpack(sigmaTeleportArgs));
			end
			local sigmaTargetPlaceId = sigmaTeleportArgs[1];
			local sigmaTargetInstanceId = ((sigmaMethodName == "TeleportToPlaceInstance") and sigmaTeleportArgs[2]) or nil;
			local sigmaReservedAccessCode = ((sigmaMethodName == "TeleportToPrivateServer") and sigmaTeleportArgs[2]) or nil;
			local sigmaIsRejoin = (type(sigmaTargetPlaceId) == "number") and (sigmaTargetPlaceId == game.PlaceId);
			local sigmaDetails = string.format("Target Place ID: %s", tostring(sigmaTargetPlaceId));
			if sigmaTargetInstanceId then
				sigmaDetails = sigmaDetails .. "\nTarget Instance ID: " .. tostring(sigmaTargetInstanceId);
			end
			if sigmaReservedAccessCode then
				sigmaDetails = sigmaDetails .. "\nUsing Reserved Server Code: " .. tostring(sigmaReservedAccessCode);
			end
			if sigmaIsRejoin then
				sigmaDetails = sigmaDetails .. "\nThis appears to be a REJOIN to the current game.";
			end
			local promptMessage = string.format([[
-- GAME TELEPORT / REJOIN ATTEMPT --
This script wants to: %s

-- DETAILS --
%s

-- WHAT THIS MEANS --
Safe Use: Legitimate game progression, joining friends, or moving between game areas. Rejoining can be for reconnecting after an issue.
Potential Risk: Teleporting you to a malicious game (e.g., one that steals items, scams, or has inappropriate content), or trapping you in a rejoin loop.

ALWAYS VERIFY THE TARGET PLACE ID if you don't recognize it or trust the script fully.
Allow this %s?]], (sigmaIsRejoin and "Rejoin the current game server.") or "Teleport you to a different game server.", sigmaDetails, (sigmaIsRejoin and "rejoin") or "teleport");
			local allowSigmaTeleport = getSigmaApproval(promptMessage);
			local log_message;
			if allowSigmaTeleport then
				log_message = string.format("[%s] ALLOWED TeleportService:%s to PlaceID %s (%s)", os.date("%H:%M:%S"), sigmaMethodName, tostring(sigmaTargetPlaceId), sigmaDetails);
				blastToSigmaLog(log_message);
				return originalSigmaTeleportMethod(TeleportService, unpack(sigmaTeleportArgs));
			else
				log_message = string.format("[%s] UltraSigmaGuard: Denied TeleportService:%s to PlaceID %s (%s)", os.date("%H:%M:%S"), sigmaMethodName, tostring(sigmaTargetPlaceId), sigmaDetails);
				blastToSigmaLog(log_message);
				warn(string.format("UltraSigmaGuard: Denied TeleportService:%s to PlaceID %s", sigmaMethodName, tostring(sigmaTargetPlaceId)));
			end
		end;
		print("UltraSigmaGuard: Hooked TeleportService:" .. sigmaMethodName);
	else
		print("UltraSigmaGuard: TeleportService:" .. sigmaMethodName .. " not found or not a function, cannot hook.");
	end
end
-- anti virus