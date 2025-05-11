-- here

_G.req = (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or request;
local player = game:GetService("Players").LocalPlayer;
local coreGui = game:GetService("CoreGui");
local screenGui = Instance.new("ScreenGui");
screenGui.Name = "ExecutorUI";
screenGui.Parent = coreGui;
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
local themes = {Default={primary=Color3.fromRGB(0, 0, 0),secondary=Color3.fromRGB(40, 40, 40),selected=Color3.fromRGB(60, 60, 60),accent=Color3.fromRGB(255, 255, 255),text=Color3.fromRGB(255, 255, 255)},Crimson={primary=Color3.fromRGB(0, 0, 0),secondary=Color3.fromRGB(40, 40, 40),selected=Color3.fromRGB(60, 60, 60),accent=Color3.fromRGB(220, 20, 60),text=Color3.fromRGB(255, 255, 255)},Elite={primary=Color3.fromRGB(0, 0, 0),secondary=Color3.fromRGB(40, 40, 40),selected=Color3.fromRGB(60, 60, 60),accent=Color3.fromRGB(255, 215, 0),text=Color3.fromRGB(255, 255, 255)}};
local currentTheme = themes.Default;
local frame = Instance.new("Frame");
frame.Size = UDim2.new(0, 650, 0, 380);
frame.Position = UDim2.new(0.5, -325, 0.5, -190);
frame.BackgroundColor3 = currentTheme.primary;
frame.BorderSizePixel = 0;
frame.Parent = screenGui;
local frameCorner = Instance.new("UICorner");
frameCorner.CornerRadius = UDim.new(0, 8);
frameCorner.Parent = frame;
local frameBorder = Instance.new("UIStroke");
frameBorder.Color = currentTheme.accent;
frameBorder.Thickness = 1;
frameBorder.Parent = frame;
local suggestionDisplay = Instance.new("Frame");
suggestionDisplay.Name = "SuggestionDisplay";
suggestionDisplay.Size = UDim2.new(1, 0, 0, 30);
suggestionDisplay.Position = UDim2.new(0, 0, 0, -35);
suggestionDisplay.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
suggestionDisplay.BorderSizePixel = 0;
suggestionDisplay.Visible = false;
suggestionDisplay.ZIndex = 10;
suggestionDisplay.Parent = frame;
local suggestionDisplayCorner = Instance.new("UICorner");
suggestionDisplayCorner.CornerRadius = UDim.new(0, 6);
suggestionDisplayCorner.Parent = suggestionDisplay;
local suggestionDisplayBorder = Instance.new("UIStroke");
suggestionDisplayBorder.Color = currentTheme.accent;
suggestionDisplayBorder.Thickness = 1;
suggestionDisplayBorder.Parent = suggestionDisplay;
local suggestionText = Instance.new("TextLabel");
suggestionText.Name = "SuggestionText";
suggestionText.Size = UDim2.new(1, -16, 1, 0);
suggestionText.Position = UDim2.new(0, 8, 0, 0);
suggestionText.BackgroundTransparency = 1;
suggestionText.Text = "";
suggestionText.Font = Enum.Font.Code;
suggestionText.TextSize = 18;
suggestionText.TextTransparency = 0.4;
suggestionText.TextColor3 = Color3.fromRGB(180, 180, 180);
suggestionText.TextXAlignment = Enum.TextXAlignment.Left;
suggestionText.TextYAlignment = Enum.TextYAlignment.Center;
suggestionText.ZIndex = 11;
suggestionText.Parent = suggestionDisplay;
local title = Instance.new("TextLabel");
title.Size = UDim2.new(1, 0, 0, 30);
title.BackgroundTransparency = 1;
title.Text = "Nocturnal";
title.Font = Enum.Font.GothamBold;
title.TextSize = 24;
title.TextColor3 = currentTheme.text;
title.Position = UDim2.new(0, 0, 0, 15);
title.Parent = frame;
title.TextXAlignment = Enum.TextXAlignment.Center;
local subTitle = Instance.new("TextLabel");
subTitle.Size = UDim2.new(1, 0, 0, 20);
subTitle.Position = UDim2.new(0, 0, 0, 40);
subTitle.Text = "Executor";
subTitle.Font = Enum.Font.Gotham;
subTitle.TextSize = 14;
subTitle.TextColor3 = currentTheme.text;
subTitle.BackgroundTransparency = 1;
subTitle.TextXAlignment = Enum.TextXAlignment.Center;
subTitle.Parent = frame;
local tabsContainer = Instance.new("Frame");
tabsContainer.Name = "TabsContainer";
tabsContainer.Size = UDim2.new(0, 420, 0, 30);
tabsContainer.Position = UDim2.new(0, 25, 0, 70);
tabsContainer.BackgroundColor3 = currentTheme.primary;
tabsContainer.BackgroundTransparency = 1;
tabsContainer.BorderSizePixel = 0;
tabsContainer.Parent = frame;
local mainTab = Instance.new("TextButton");
mainTab.Size = UDim2.new(0.22, 0, 1, 0);
mainTab.Position = UDim2.new(0.01, 0, 0, 0);
mainTab.Text = "Main";
mainTab.Font = Enum.Font.GothamBold;
mainTab.TextSize = 14;
mainTab.TextColor3 = currentTheme.text;
mainTab.BackgroundColor3 = currentTheme.selected;
mainTab.BorderSizePixel = 0;
mainTab.Parent = tabsContainer;
mainTab.ZIndex = 2;
local mainTabCorner = Instance.new("UICorner");
mainTabCorner.CornerRadius = UDim.new(0, 6);
mainTabCorner.Parent = mainTab;
local creditsTab = Instance.new("TextButton");
creditsTab.Size = UDim2.new(0.22, 0, 1, 0);
creditsTab.Position = UDim2.new(0.26, 0, 0, 0);
creditsTab.Text = "Credits";
creditsTab.Font = Enum.Font.GothamBold;
creditsTab.TextSize = 14;
creditsTab.TextColor3 = currentTheme.text;
creditsTab.BackgroundColor3 = currentTheme.secondary;
creditsTab.BorderSizePixel = 0;
creditsTab.Parent = tabsContainer;
creditsTab.ZIndex = 2;
local creditsTabCorner = Instance.new("UICorner");
creditsTabCorner.CornerRadius = UDim.new(0, 6);
creditsTabCorner.Parent = creditsTab;
local themesTab = Instance.new("TextButton");
themesTab.Size = UDim2.new(0.22, 0, 1, 0);
themesTab.Position = UDim2.new(0.51, 0, 0, 0);
themesTab.Text = "Themes";
themesTab.Font = Enum.Font.GothamBold;
themesTab.TextSize = 14;
themesTab.TextColor3 = currentTheme.text;
themesTab.BackgroundColor3 = currentTheme.secondary;
themesTab.BorderSizePixel = 0;
themesTab.Parent = tabsContainer;
themesTab.ZIndex = 2;
local themesTabCorner = Instance.new("UICorner");
themesTabCorner.CornerRadius = UDim.new(0, 6);
themesTabCorner.Parent = themesTab;
local settingsTab = Instance.new("TextButton");
settingsTab.Size = UDim2.new(0.22, 0, 1, 0);
settingsTab.Position = UDim2.new(0.76, 0, 0, 0);
settingsTab.Text = "Settings";
settingsTab.Font = Enum.Font.GothamBold;
settingsTab.TextSize = 14;
settingsTab.TextColor3 = currentTheme.text;
settingsTab.BackgroundColor3 = currentTheme.secondary;
settingsTab.BorderSizePixel = 0;
settingsTab.Parent = tabsContainer;
settingsTab.ZIndex = 2;
local settingsTabCorner = Instance.new("UICorner");
settingsTabCorner.CornerRadius = UDim.new(0, 6);
settingsTabCorner.Parent = settingsTab;
local mainContentArea = Instance.new("Frame");
mainContentArea.Name = "MainContent";
mainContentArea.Size = UDim2.new(1, -40, 0, 260);
mainContentArea.Position = UDim2.new(0, 20, 0, 110);
mainContentArea.BackgroundTransparency = 1;
mainContentArea.Visible = true;
mainContentArea.Parent = frame;
local creditsArea = Instance.new("Frame");
creditsArea.Name = "CreditsContent";
creditsArea.Size = UDim2.new(1, -40, 0, 260);
creditsArea.Position = UDim2.new(0, 20, 0, 110);
creditsArea.BackgroundTransparency = 1;
creditsArea.Visible = false;
creditsArea.Parent = frame;
local settingsArea = Instance.new("Frame");
settingsArea.Name = "SettingsContent";
settingsArea.Size = UDim2.new(1, -40, 0, 260);
settingsArea.Position = UDim2.new(0, 20, 0, 110);
settingsArea.BackgroundTransparency = 1;
settingsArea.Visible = false;
settingsArea.Parent = frame;
local configSettingsArea = Instance.new("Frame");
configSettingsArea.Name = "ConfigSettingsContent";
configSettingsArea.Size = UDim2.new(1, -40, 0, 260);
configSettingsArea.Position = UDim2.new(0, 20, 0, 110);
configSettingsArea.BackgroundTransparency = 1;
configSettingsArea.Visible = false;
configSettingsArea.Parent = frame;
local configSettingsTitleText = Instance.new("TextLabel", configSettingsArea);
configSettingsTitleText.Name = "SettingsTitle";
configSettingsTitleText.Size = UDim2.new(1, 0, 0, 40);
configSettingsTitleText.Position = UDim2.new(0, 0, 0, 0);
configSettingsTitleText.Text = "SETTINGS";
configSettingsTitleText.Font = Enum.Font.GothamBold;
configSettingsTitleText.TextSize = 24;
configSettingsTitleText.TextColor3 = currentTheme.text;
configSettingsTitleText.BackgroundTransparency = 1;
configSettingsTitleText.TextXAlignment = Enum.TextXAlignment.Center;
local intelliSenseToggleContainer = Instance.new("Frame", configSettingsArea);
intelliSenseToggleContainer.Name = "IntelliSenseToggleContainer";
intelliSenseToggleContainer.Size = UDim2.new(0.9, 0, 0, 40);
intelliSenseToggleContainer.Position = UDim2.new(0.05, 0, 0, 50);
intelliSenseToggleContainer.BackgroundColor3 = currentTheme.secondary;
intelliSenseToggleContainer.BorderSizePixel = 0;
local toggleContainerCorner = Instance.new("UICorner");
toggleContainerCorner.CornerRadius = UDim.new(0, 6);
toggleContainerCorner.Parent = intelliSenseToggleContainer;
local toggleContainerBorder = Instance.new("UIStroke");
toggleContainerBorder.Color = currentTheme.accent;
toggleContainerBorder.Thickness = 1;
toggleContainerBorder.Parent = intelliSenseToggleContainer;
local toggleLabel = Instance.new("TextLabel", intelliSenseToggleContainer);
toggleLabel.Size = UDim2.new(0.7, 0, 1, 0);
toggleLabel.Position = UDim2.new(0, 10, 0, 0);
toggleLabel.BackgroundTransparency = 1;
toggleLabel.Text = "IntelliSense";
toggleLabel.Font = Enum.Font.Gotham;
toggleLabel.TextSize = 16;
toggleLabel.TextColor3 = currentTheme.text;
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left;
local intelliSenseEnabled = true;
local toggleButton = Instance.new("TextButton", intelliSenseToggleContainer);
toggleButton.Name = "ToggleButton";
toggleButton.Size = UDim2.new(0, 50, 0, 26);
toggleButton.Position = UDim2.new(1, -60, 0.5, -13);
toggleButton.BackgroundColor3 = Color3.fromRGB(40, 160, 90);
toggleButton.BorderSizePixel = 0;
toggleButton.Text = "";
toggleButton.AutoButtonColor = false;
toggleButton.ZIndex = 10;
local toggleButtonCorner = Instance.new("UICorner");
toggleButtonCorner.CornerRadius = UDim.new(0, 13);
toggleButtonCorner.Parent = toggleButton;
local toggleContainerButton = Instance.new("TextButton", intelliSenseToggleContainer);
toggleContainerButton.Size = UDim2.new(1, 0, 1, 0);
toggleContainerButton.BackgroundTransparency = 1;
toggleContainerButton.Text = "";
toggleContainerButton.ZIndex = 9;
local toggleIndicator = Instance.new("Frame", toggleButton);
toggleIndicator.Name = "Indicator";
toggleIndicator.Size = UDim2.new(0, 20, 0, 20);
toggleIndicator.Position = UDim2.new(1, -23, 0.5, -10);
toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
toggleIndicator.BorderSizePixel = 0;
local toggleIndicatorCorner = Instance.new("UICorner");
toggleIndicatorCorner.CornerRadius = UDim.new(0, 10);
toggleIndicatorCorner.Parent = toggleIndicator;
local stateLabel = Instance.new("TextLabel", intelliSenseToggleContainer);
stateLabel.Name = "StateLabel";
stateLabel.Size = UDim2.new(0, 60, 0, 20);
stateLabel.Position = UDim2.new(1, -120, 0.5, -10);
stateLabel.BackgroundTransparency = 1;
stateLabel.Text = "ON";
stateLabel.Font = Enum.Font.GothamBold;
stateLabel.TextSize = 12;
stateLabel.TextColor3 = Color3.fromRGB(40, 160, 90);
local function updateToggleState()
	if intelliSenseEnabled then
		toggleButton.BackgroundColor3 = Color3.fromRGB(40, 160, 90);
		toggleIndicator.Position = UDim2.new(1, -23, 0.5, -10);
		stateLabel.Text = "ON";
		stateLabel.TextColor3 = Color3.fromRGB(40, 160, 90);
	else
		toggleButton.BackgroundColor3 = Color3.fromRGB(160, 40, 40);
		toggleIndicator.Position = UDim2.new(0, 3, 0.5, -10);
		stateLabel.Text = "OFF";
		stateLabel.TextColor3 = Color3.fromRGB(160, 40, 40);
	end
end
updateToggleState();
toggleButton.MouseButton1Click:Connect(function()
	intelliSenseEnabled = not intelliSenseEnabled;
	updateToggleState();
	if not intelliSenseEnabled then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
	end
	print("Toggle button clicked! IntelliSense enabled:", intelliSenseEnabled);
end);
toggleContainerButton.MouseButton1Click:Connect(function()
	intelliSenseEnabled = not intelliSenseEnabled;
	updateToggleState();
	if not intelliSenseEnabled then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
	end
	print("Toggle container clicked! IntelliSense enabled:", intelliSenseEnabled);
end);
local keybindContainer = Instance.new("Frame", configSettingsArea);
keybindContainer.Name = "KeybindContainer";
keybindContainer.Size = UDim2.new(0.9, 0, 0, 40);
keybindContainer.Position = UDim2.new(0.05, 0, 0, 100);
keybindContainer.BackgroundColor3 = currentTheme.secondary;
keybindContainer.BorderSizePixel = 0;
local keybindContainerCorner = Instance.new("UICorner");
keybindContainerCorner.CornerRadius = UDim.new(0, 6);
keybindContainerCorner.Parent = keybindContainer;
local keybindContainerBorder = Instance.new("UIStroke");
keybindContainerBorder.Color = currentTheme.accent;
keybindContainerBorder.Thickness = 1;
keybindContainerBorder.Parent = keybindContainer;
local keybindLabel = Instance.new("TextLabel", keybindContainer);
keybindLabel.Size = UDim2.new(0.7, 0, 1, 0);
keybindLabel.Position = UDim2.new(0, 10, 0, 0);
keybindLabel.BackgroundTransparency = 1;
keybindLabel.Text = "Toggle UI Keybind";
keybindLabel.Font = Enum.Font.Gotham;
keybindLabel.TextSize = 16;
keybindLabel.TextColor3 = currentTheme.text;
keybindLabel.TextXAlignment = Enum.TextXAlignment.Left;
local currentKeybind = Enum.KeyCode.RightShift;
local keybindButton = Instance.new("TextButton", keybindContainer);
keybindButton.Name = "KeybindButton";
keybindButton.Size = UDim2.new(0, 100, 0, 26);
keybindButton.Position = UDim2.new(1, -110, 0.5, -13);
keybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
keybindButton.BorderSizePixel = 0;
keybindButton.Text = "RightShift";
keybindButton.Font = Enum.Font.Code;
keybindButton.TextSize = 14;
keybindButton.TextColor3 = Color3.fromRGB(255, 255, 255);
keybindButton.AutoButtonColor = true;
keybindButton.ZIndex = 10;
local keybindButtonCorner = Instance.new("UICorner");
keybindButtonCorner.CornerRadius = UDim.new(0, 4);
keybindButtonCorner.Parent = keybindButton;
local isChangingKeybind = false;
keybindButton.MouseButton1Click:Connect(function()
	isChangingKeybind = true;
	keybindButton.Text = "Press any key...";
	keybindButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
end);
local codeBox = Instance.new("TextBox");
codeBox.PlaceholderText = "-- type your scripts here!";
codeBox.TextEditable = true;
codeBox.ClearTextOnFocus = false;
codeBox.TextWrapped = true;
codeBox.MultiLine = true;
codeBox.Size = UDim2.new(1, 0, 1, -60);
codeBox.Position = UDim2.new(0, 0, 0, 0);
codeBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
codeBox.TextColor3 = currentTheme.text;
codeBox.Font = Enum.Font.Code;
codeBox.TextSize = 18;
codeBox.Parent = mainContentArea;
codeBox.Text = "-- Nocturnal Internal Ui!";
codeBox.CursorPosition = #codeBox.Text + 1;
codeBox.SelectionStart = #codeBox.Text + 1;
codeBox.TextXAlignment = Enum.TextXAlignment.Left;
codeBox.TextYAlignment = Enum.TextYAlignment.Top;
local codeBoxPadding = Instance.new("UIPadding");
codeBoxPadding.PaddingLeft = UDim.new(0, 10);
codeBoxPadding.PaddingRight = UDim.new(0, 10);
codeBoxPadding.PaddingTop = UDim.new(0, 10);
codeBoxPadding.PaddingBottom = UDim.new(0, 10);
codeBoxPadding.Parent = codeBox;
local codeBoxCorner = Instance.new("UICorner");
codeBoxCorner.CornerRadius = UDim.new(0, 6);
codeBoxCorner.Parent = codeBox;
local ghostText = Instance.new("TextLabel");
ghostText.Name = "GhostText";
ghostText.BackgroundTransparency = 1;
ghostText.Size = UDim2.new(1, 0, 1, 0);
ghostText.Position = UDim2.new(0, 0, 0, 0);
ghostText.TextXAlignment = Enum.TextXAlignment.Left;
ghostText.TextYAlignment = Enum.TextYAlignment.Top;
ghostText.TextColor3 = Color3.fromRGB(120, 120, 120);
ghostText.Font = Enum.Font.Code;
ghostText.TextSize = 18;
ghostText.TextTransparency = 0.5;
ghostText.Text = "";
ghostText.ZIndex = 3;
ghostText.Parent = codeBox;
local currentSuggestions = {};
local selectedSuggestionIndex = 1;
local isShowingGhostText = false;
local intelliSenseFrame = Instance.new("Frame");
intelliSenseFrame.Name = "IntelliSenseFrame";
intelliSenseFrame.Size = UDim2.new(0, 300, 1, 0);
intelliSenseFrame.Position = UDim2.new(1, 10, 0, 0);
intelliSenseFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
intelliSenseFrame.BorderSizePixel = 0;
intelliSenseFrame.Visible = false;
intelliSenseFrame.ZIndex = 10;
intelliSenseFrame.Parent = frame;
local intelliSenseCorner = Instance.new("UICorner");
intelliSenseCorner.CornerRadius = UDim.new(0, 4);
intelliSenseCorner.Parent = intelliSenseFrame;
local intelliSenseBorder = Instance.new("UIStroke");
intelliSenseBorder.Color = currentTheme.accent;
intelliSenseBorder.Thickness = 1;
intelliSenseBorder.Parent = intelliSenseFrame;
local suggestionList = Instance.new("ScrollingFrame");
suggestionList.Name = "SuggestionList";
suggestionList.Size = UDim2.new(1, -10, 1, -10);
suggestionList.Position = UDim2.new(0, 5, 0, 5);
suggestionList.BackgroundTransparency = 1;
suggestionList.BorderSizePixel = 0;
suggestionList.ScrollBarThickness = 4;
suggestionList.ZIndex = 10;
suggestionList.Parent = intelliSenseFrame;
local suggestionLayout = Instance.new("UIListLayout");
suggestionLayout.SortOrder = Enum.SortOrder.LayoutOrder;
suggestionLayout.Padding = UDim.new(0, 2);
suggestionLayout.Parent = suggestionList;
local luaKeywords = {"and","break","do","else","elseif","end","false","for","function","if","in","local","nil","not","or","repeat","return","then","true","until","while"};
local coreLuaFunctions = {{text="print()",desc="Outputs text to the console"},{text="warn()",desc="Outputs a warning to the console"},{text="error()",desc="Throws an error"},{text="assert()",desc="Asserts that a condition is true"},{text="pcall()",desc="Protected function call - catches errors"},{text="xpcall()",desc="Extended protected call with error handler"},{text="select()",desc="Selects elements from a vararg list"},{text="tonumber()",desc="Converts value to a number"},{text="tostring()",desc="Converts value to a string"},{text="type()",desc="Returns the type of a value"},{text="unpack()",desc="Unpacks a table into individual values"},{text="getfenv()",desc="Gets the environment of a function"},{text="setfenv()",desc="Sets the environment of a function"},{text="next()",desc="Gets the next key in a table"},{text="pairs()",desc="Iterates through a table's key-value pairs"},{text="ipairs()",desc="Iterates through a table's array portion"},{text="rawequal()",desc="Compares two values without metamethods"},{text="rawset()",desc="Sets a table value without metamethods"},{text="rawget()",desc="Gets a table value without metamethods"},{text="collectgarbage()",desc="Controls the garbage collector"},{text="getmetatable()",desc="Gets a table's metatable"},{text="setmetatable()",desc="Sets a table's metatable"},{text="require()",desc="Loads a module"},{text="loadstring()",desc="Loads Lua code from a string"},{text="dofile()",desc="Executes a file"},{text="typeof()",desc="Returns Roblox specific type information"}};
local stringFunctions = {{text="string.byte()",desc="Returns numeric code of a character"},{text="string.char()",desc="Returns string from character codes"},{text="string.dump()",desc="Returns binary representation of a function"},{text="string.find()",desc="Finds pattern in a string"},{text="string.format()",desc="Formats a string using patterns"},{text="string.gsub()",desc="Global string replacement"},{text="string.len()",desc="Returns string length"},{text="string.lower()",desc="Converts string to lowercase"},{text="string.match()",desc="Pattern matching in a string"},{text="string.rep()",desc="Repeats a string multiple times"},{text="string.reverse()",desc="Reverses a string"},{text="string.sub()",desc="Returns substring"},{text="string.upper()",desc="Converts string to uppercase"}};
local tableFunctions = {{text="table.concat()",desc="Concatenates table elements into string"},{text="table.insert()",desc="Inserts a value into a table"},{text="table.maxn()",desc="Returns largest numerical index"},{text="table.remove()",desc="Removes a value from a table"},{text="table.sort()",desc="Sorts a table"},{text="table.create()",desc="Creates table with preallocated elements"},{text="table.find()",desc="Finds a value in an array table"},{text="table.move()",desc="Moves elements between tables"},{text="table.foreach()",desc="Legacy method to iterate through a table"}};
local mathFunctions = {{text="math.abs()",desc="Absolute value"},{text="math.acos()",desc="Arc cosine"},{text="math.asin()",desc="Arc sine"},{text="math.atan()",desc="Arc tangent"},{text="math.atan2()",desc="Arc tangent of two variables"},{text="math.ceil()",desc="Rounds up to nearest integer"},{text="math.cos()",desc="Cosine"},{text="math.cosh()",desc="Hyperbolic cosine"},{text="math.deg()",desc="Converts radians to degrees"},{text="math.exp()",desc="Exponential function"},{text="math.floor()",desc="Rounds down to nearest integer"},{text="math.fmod()",desc="Floating-point remainder"},{text="math.frexp()",desc="Extracts mantissa and exponent"},{text="math.huge",desc="A value larger than any other number"},{text="math.ldexp()",desc="Multiplies by a power of 2"},{text="math.log()",desc="Natural logarithm"},{text="math.log10()",desc="Base-10 logarithm"},{text="math.max()",desc="Returns maximum value"},{text="math.min()",desc="Returns minimum value"},{text="math.modf()",desc="Returns integer and fractional parts"},{text="math.pi",desc="The value of pi"},{text="math.pow()",desc="Raises to a power"},{text="math.rad()",desc="Converts degrees to radians"},{text="math.random()",desc="Generates a random number"},{text="math.randomseed()",desc="Sets random seed"},{text="math.sin()",desc="Sine"},{text="math.sinh()",desc="Hyperbolic sine"},{text="math.sqrt()",desc="Square root"},{text="math.tan()",desc="Tangent"},{text="math.tanh()",desc="Hyperbolic tangent"}};
local ioFunctions = {{text="io.close()",desc="Closes a file"},{text="io.flush()",desc="Flushes the output buffer"},{text="io.input()",desc="Sets the default input file"},{text="io.lines()",desc="Iterates over lines in a file"},{text="io.open()",desc="Opens a file"},{text="io.output()",desc="Sets the default output file"},{text="io.popen()",desc="Starts a program and returns a file handle"},{text="io.read()",desc="Reads from a file"},{text="io.tmpfile()",desc="Creates a temporary file"},{text="io.type()",desc="Gets the type of a file handle"},{text="io.write()",desc="Writes to a file"}};
local osFunctions = {{text="os.clock()",desc="Returns CPU time used"},{text="os.date()",desc="Returns date/time as a string or table"},{text="os.difftime()",desc="Returns time difference between timestamps"},{text="os.execute()",desc="Executes system command"},{text="os.exit()",desc="Terminates host program"},{text="os.getenv()",desc="Gets environment variable"},{text="os.remove()",desc="Deletes a file"},{text="os.rename()",desc="Renames a file"},{text="os.setlocale()",desc="Sets current locale"},{text="os.time()",desc="Returns current time as timestamp"},{text="os.tmpname()",desc="Generates temporary filename"}};
local commonFunctions = {{text="wait()",desc="Yields the script for a specified time"},{text="delay()",desc="Schedules a function call after a delay"},{text="spawn()",desc="Creates a new thread to run a function"},{text="tick()",desc="Returns the time in seconds since the epoch"},{text="Instance.new()",desc="Creates a new Roblox instance"},{text="Vector3.new()",desc="Creates a 3D vector"},{text="CFrame.new()",desc="Creates a coordinate frame"}};
local executorFunctions = {{text="getgenv()",desc="Gets the global environment for executor scripts"},{text="getrenv()",desc="Gets the Roblox global environment"},{text="getrawmetatable()",desc="Gets the raw metatable of an object"},{text="setrawmetatable()",desc="Sets the raw metatable of an object"},{text="hookfunction()",desc="Hooks a function to intercept calls"},{text="hookmetamethod()",desc="Hooks a metamethod in a metatable"},{text="islclosure()",desc="Checks if a function is a Lua closure"},{text="iscclosure()",desc="Checks if a function is a C closure"},{text="newcclosure()",desc="Creates a new C closure"},{text="checkcaller()",desc="Checks if function was called by the executor"},{text="getupvalue()",desc="Gets an upvalue from a function"},{text="setupvalue()",desc="Sets an upvalue in a function"},{text="getupvalues()",desc="Gets all upvalues from a function"},{text="getconstants()",desc="Gets constants from a function"},{text="setconstant()",desc="Sets a constant in a function"},{text="getnamecallmethod()",desc="Gets the current namecall method"},{text="setnamecallmethod()",desc="Sets the current namecall method"},{text="isexecutorclosure()",desc="Checks if a function is from the executor"},{text="identifyexecutor()",desc="Returns the name of the executor"},{text="setreadonly()",desc="Sets whether a table is read-only"},{text="getscripts()",desc="Gets all scripts in the game"},{text="firesignal()",desc="Fires a signal with custom arguments"},{text="gethui()",desc="Gets hidden UI container"},{text="hookamethod()",desc="Hooks an instance method"},{text="fireclickdetector()",desc="Fires a ClickDetector instance"},{text="fireproximityprompt()",desc="Fires a ProximityPrompt instance"},{text="firetouchinterest()",desc="Simulates touch between parts"},{text="fireremote()",desc="Fires a remote event with arguments"}};
local fileSystemFunctions = {{text="readfile()",desc="Reads the contents of a file"},{text="writefile()",desc="Writes data to a file"},{text="appendfile()",desc="Appends data to a file"},{text="loadfile()",desc="Loads a file as a function"},{text="listfiles()",desc="Lists files in a directory"},{text="isfile()",desc="Checks if a file exists"},{text="isfolder()",desc="Checks if a folder exists"},{text="makefolder()",desc="Creates a new folder"},{text="delfolder()",desc="Deletes a folder"},{text="delfile()",desc="Deletes a file"}};
local debugFunctions = {{text="debug.getregistry()",desc="Gets the registry table"},{text="debug.getupvalues()",desc="Gets all upvalues from a function"},{text="debug.getmetatable()",desc="Gets the metatable of an object"},{text="debug.setmetatable()",desc="Sets the metatable of an object"},{text="debug.getconstants()",desc="Gets constants from a function"},{text="debug.setconstant()",desc="Sets a constant in a function"},{text="debug.getupvalue()",desc="Gets an upvalue from a function"},{text="debug.setupvalue()",desc="Sets an upvalue in a function"},{text="debug.getprotos()",desc="Gets subfunctions from a function"},{text="debug.getinfo()",desc="Gets information about a function"},{text="debug.traceback()",desc="Gets a stack traceback"}};
local drawingFunctions = {{text="Drawing.new()",desc="Creates a new drawing object"},{text="Drawing.Clear()",desc="Clears all drawing objects"},{text="Drawing.isDrawing()",desc="Checks if an object is a drawing"}};
local robloxClasses = {{text="game",desc="Root of the Roblox game hierarchy"},{text="workspace",desc="Contains all physical objects in the game"},{text="script",desc="Current script instance"},{text="player",desc="Player instance"},{text="_G",desc="Global shared table across all scripts"},{text="math",desc="Library for mathematical operations"},{text="string",desc="Library for string manipulation"},{text="table",desc="Library for table manipulation"},{text="task",desc="Library for task scheduling"},{text="Vector2",desc="2D vector representation"},{text="Vector3",desc="3D vector representation"},{text="CFrame",desc="Coordinate frame for 3D transformations"},{text="Color3",desc="RGB color representation"},{text="Enum",desc="Enumeration types"},{text="Instance",desc="Base class for all Roblox objects"},{text="Ray",desc="Mathematical ray for raycasting"},{text="Region3",desc="3D region for spatial queries"},{text="UDim",desc="1D dimension with scale and offset"},{text="UDim2",desc="2D dimension with scale and offset"},{text="Rect",desc="2D rectangle representation"},{text="BrickColor",desc="Legacy color system for parts"},{text="TweenInfo",desc="Configuration for tweens and animations"},{text="NumberSequence",desc="Sequence of number keypoints"},{text="ColorSequence",desc="Sequence of color keypoints"},{text="NumberRange",desc="Range between two numbers"},{text="Path",desc="Pathfinding path object"}};
local function createSuggestion(text, description, index)
	local suggestion = Instance.new("TextButton");
	suggestion.Name = "Suggestion_" .. text;
	suggestion.Size = UDim2.new(1, -8, 0, 55);
	suggestion.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
	suggestion.Text = "";
	suggestion.AutoButtonColor = true;
	suggestion.ZIndex = 11;
	suggestion.LayoutOrder = index;
	local suggestionCorner = Instance.new("UICorner");
	suggestionCorner.CornerRadius = UDim.new(0, 3);
	suggestionCorner.Parent = suggestion;
	local textLabel = Instance.new("TextLabel");
	textLabel.Size = UDim2.new(1, -10, 0, 25);
	textLabel.Position = UDim2.new(0, 5, 0, 0);
	textLabel.BackgroundTransparency = 1;
	textLabel.Text = text;
	textLabel.Font = Enum.Font.Code;
	textLabel.TextSize = 16;
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
	textLabel.TextXAlignment = Enum.TextXAlignment.Left;
	textLabel.ZIndex = 12;
	textLabel.Parent = suggestion;
	if description then
		local descLabel = Instance.new("TextLabel");
		descLabel.Size = UDim2.new(1, -10, 0, 30);
		descLabel.Position = UDim2.new(0, 5, 0, 25);
		descLabel.BackgroundTransparency = 1;
		descLabel.Text = description;
		descLabel.Font = Enum.Font.Gotham;
		descLabel.TextSize = 14;
		descLabel.TextColor3 = Color3.fromRGB(180, 180, 180);
		descLabel.TextXAlignment = Enum.TextXAlignment.Left;
		descLabel.TextWrapped = true;
		descLabel.ZIndex = 12;
		descLabel.Parent = suggestion;
	end
	suggestion.MouseButton1Click:Connect(function()
		local currentText = codeBox.Text;
		local cursorPos = codeBox.CursorPosition;
		local lineStart = cursorPos;
		while (lineStart > 1) and string.sub(currentText, lineStart - 1, lineStart - 1):match("[%w_]") do
			lineStart = lineStart - 1;
		end
		local currentWord = string.sub(currentText, lineStart, cursorPos - 1);
		local insertText = text;
		if string.match(text, "%(%)$") then
			insertText = string.sub(text, 1, -2);
		end
		local newText = string.sub(currentText, 1, lineStart - 1) .. insertText .. string.sub(currentText, cursorPos);
		codeBox.Text = newText;
		if string.match(text, "%(%)$") then
			codeBox.CursorPosition = lineStart + #insertText;
		else
			codeBox.CursorPosition = lineStart + #insertText;
		end
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
	end);
	return suggestion;
end
local function updateGhostText()
	if not intelliSenseEnabled then
		ghostText.Text = "";
		suggestionDisplay.Visible = false;
		isShowingGhostText = false;
		return;
	end
	if (not intelliSenseFrame.Visible or (#currentSuggestions == 0)) then
		ghostText.Text = "";
		suggestionDisplay.Visible = false;
		isShowingGhostText = false;
		return;
	end
	local currentText = codeBox.Text;
	local cursorPos = codeBox.CursorPosition;
	local lineStart = cursorPos;
	while (lineStart > 1) and string.sub(currentText, lineStart - 1, lineStart - 1):match("[%w_]") do
		lineStart = lineStart - 1;
	end
	local currentWord = string.sub(currentText, lineStart, cursorPos - 1);
	if (#currentWord < 1) then
		ghostText.Text = "";
		suggestionDisplay.Visible = false;
		isShowingGhostText = false;
		return;
	end
	local suggestion = currentSuggestions[selectedSuggestionIndex].text;
	local suggestionSuffix = suggestion:sub(#currentWord + 1);
	suggestionText.Text = "Suggestion: " .. currentWord .. suggestionSuffix;
	suggestionDisplay.Visible = true;
	ghostText.Text = "";
	isShowingGhostText = true;
end
local function updateSuggestions()
	if not intelliSenseEnabled then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
		return;
	end
	for _, child in pairs(suggestionList:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy();
		end
	end
	currentSuggestions = {};
	selectedSuggestionIndex = 1;
	local currentText = codeBox.Text;
	local cursorPos = codeBox.CursorPosition;
	local lineStart = cursorPos;
	while (lineStart > 1) and string.sub(currentText, lineStart - 1, lineStart - 1):match("[%w_.]") do
		lineStart = lineStart - 1;
	end
	local currentWord = string.sub(currentText, lineStart, cursorPos - 1);
	if (#currentWord < 1) then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
		return;
	end
	local suggestions = {};
	for _, keyword in ipairs(luaKeywords) do
		if string.find(keyword, "^" .. currentWord) then
			table.insert(suggestions, {text=keyword,desc="Lua keyword"});
		end
	end
	for _, func in ipairs(coreLuaFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(stringFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(tableFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(mathFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(ioFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(osFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(commonFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, class in ipairs(robloxClasses) do
		if string.find(class.text, "^" .. currentWord) then
			table.insert(suggestions, {text=class.text,desc=class.desc});
		end
	end
	for _, func in ipairs(executorFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(fileSystemFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(debugFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(drawingFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	if (#suggestions == 0) then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
		return;
	end
	table.sort(suggestions, function(a, b)
		local aExact = a.text:sub(1, #currentWord) == currentWord;
		local bExact = b.text:sub(1, #currentWord) == currentWord;
		if (aExact and not bExact) then
			return true;
		elseif (not aExact and bExact) then
			return false;
		else
			return a.text < b.text;
		end
	end);
	if (#suggestions > 30) then
		local trimmedSuggestions = {};
		for i = 1, 30 do
			table.insert(trimmedSuggestions, suggestions[i]);
		end
		suggestions = trimmedSuggestions;
	end
	currentSuggestions = suggestions;
	for i, suggestion in ipairs(suggestions) do
		local suggestionButton = createSuggestion(suggestion.text, suggestion.desc, i);
		suggestionButton.Parent = suggestionList;
		if (i == 1) then
			suggestionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100);
		end
	end
	suggestionList.CanvasSize = UDim2.new(0, 0, 0, #suggestions * 60);
	intelliSenseFrame.Visible = true;
	suggestionDisplay.Visible = true;
	if not intelliSenseFrame:FindFirstChild("TitleLabel") then
		local titleLabel = Instance.new("TextLabel");
		titleLabel.Name = "TitleLabel";
		titleLabel.Size = UDim2.new(1, 0, 0, 30);
		titleLabel.Position = UDim2.new(0, 0, 0, 0);
		titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
		titleLabel.BorderSizePixel = 0;
		titleLabel.Text = "IntelliSense";
		titleLabel.Font = Enum.Font.GothamBold;
		titleLabel.TextSize = 16;
		titleLabel.TextColor3 = currentTheme.text;
		titleLabel.ZIndex = 11;
		titleLabel.Parent = intelliSenseFrame;
		suggestionList.Position = UDim2.new(0, 5, 0, 35);
		suggestionList.Size = UDim2.new(1, -10, 1, -40);
	end
	updateGhostText();
end
local function selectSuggestion(index)
	if (#currentSuggestions == 0) then
		return;
	end
	index = math.max(1, math.min(index, #currentSuggestions));
	for i, child in pairs(suggestionList:GetChildren()) do
		if child:IsA("TextButton") then
			if (i == index) then
				child.BackgroundColor3 = Color3.fromRGB(60, 60, 100);
			else
				child.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
			end
		end
	end
	selectedSuggestionIndex = index;
	updateGhostText();
end
local function acceptSuggestion()
	if not intelliSenseEnabled then
		return;
	end
	if (not isShowingGhostText or (#currentSuggestions == 0)) then
		return;
	end
	local currentText = codeBox.Text;
	local cursorPos = codeBox.CursorPosition;
	local lineStart = cursorPos;
	while (lineStart > 1) and string.sub(currentText, lineStart - 1, lineStart - 1):match("[%w_]") do
		lineStart = lineStart - 1;
	end
	local currentWord = string.sub(currentText, lineStart, cursorPos - 1);
	local suggestion = currentSuggestions[selectedSuggestionIndex].text;
	local insertText = suggestion;
	if string.match(suggestion, "%(%)$") then
		insertText = string.sub(suggestion, 1, -2);
	end
	local newText = string.sub(currentText, 1, lineStart - 1) .. insertText .. string.sub(currentText, cursorPos);
	codeBox.Text = newText;
	if string.match(suggestion, "%(%)$") then
		codeBox.CursorPosition = lineStart + #insertText;
	else
		codeBox.CursorPosition = lineStart + #insertText;
	end
	intelliSenseFrame.Visible = false;
	suggestionDisplay.Visible = false;
	ghostText.Text = "";
	isShowingGhostText = false;
end
codeBox.Changed:Connect(function(property)
	if ((property == "Text") or (property == "CursorPosition")) then
		if intelliSenseEnabled then
			updateSuggestions();
		else
			intelliSenseFrame.Visible = false;
			suggestionDisplay.Visible = false;
			ghostText.Text = "";
			isShowingGhostText = false;
		end
	end
end);
codeBox.InputBegan:Connect(function(input)
	if not intelliSenseEnabled then
		return;
	end
	if (not intelliSenseFrame.Visible and not suggestionDisplay.Visible) then
		return;
	end
	if (input.KeyCode == Enum.KeyCode.Down) then
		selectSuggestion(selectedSuggestionIndex + 1);
	elseif (input.KeyCode == Enum.KeyCode.Up) then
		selectSuggestion(selectedSuggestionIndex - 1);
	elseif (input.KeyCode == Enum.KeyCode.Tab) then
		acceptSuggestion();
	elseif ((input.KeyCode == Enum.KeyCode.Return) or (input.KeyCode == Enum.KeyCode.Space)) then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
	end
end);
local function applySyntaxHighlighting()
	local text = codeBox.Text;
end
applySyntaxHighlighting();
local buttonContainer = Instance.new("Frame");
buttonContainer.Name = "ButtonContainer";
buttonContainer.Size = UDim2.new(1, 0, 0, 50);
buttonContainer.Position = UDim2.new(0, 0, 1, -50);
buttonContainer.BackgroundTransparency = 1;
buttonContainer.Parent = mainContentArea;
local execBtn = Instance.new("TextButton");
execBtn.Size = UDim2.new(0.48, 0, 1, 0);
execBtn.Position = UDim2.new(0.51, 0, 0, 0);
execBtn.Text = "Execute";
execBtn.Font = Enum.Font.GothamBold;
execBtn.TextSize = 18;
execBtn.BackgroundColor3 = currentTheme.secondary;
execBtn.TextColor3 = currentTheme.text;
execBtn.Parent = buttonContainer;
local execBtnCorner = Instance.new("UICorner");
execBtnCorner.CornerRadius = UDim.new(0, 8);
execBtnCorner.Parent = execBtn;
local clearBtn = Instance.new("TextButton");
clearBtn.Size = UDim2.new(0.48, 0, 1, 0);
clearBtn.Position = UDim2.new(0.01, 0, 0, 0);
clearBtn.Text = "Clear";
clearBtn.Font = Enum.Font.GothamBold;
clearBtn.TextSize = 18;
clearBtn.BackgroundColor3 = currentTheme.secondary;
clearBtn.TextColor3 = currentTheme.text;
clearBtn.Parent = buttonContainer;
local clearBtnCorner = Instance.new("UICorner");
clearBtnCorner.CornerRadius = UDim.new(0, 8);
clearBtnCorner.Parent = clearBtn;
local creditsListLayout = Instance.new("UIListLayout", creditsArea);
creditsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
creditsListLayout.VerticalAlignment = Enum.VerticalAlignment.Top;
creditsListLayout.Padding = UDim.new(0, 15);
creditsListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
local creditsTitleText = Instance.new("TextLabel", creditsArea);
creditsTitleText.Name = "CreditsTitle";
creditsTitleText.Size = UDim2.new(1, 0, 0, 40);
creditsTitleText.Text = "CREDITS";
creditsTitleText.Font = Enum.Font.GothamBold;
creditsTitleText.TextSize = 24;
creditsTitleText.TextColor3 = currentTheme.text;
creditsTitleText.BackgroundTransparency = 1;
creditsTitleText.TextXAlignment = Enum.TextXAlignment.Center;
creditsTitleText.LayoutOrder = 1;
local devInfoBox = Instance.new("Frame", creditsArea);
devInfoBox.Name = "DeveloperInfo";
devInfoBox.Size = UDim2.new(0.9, 0, 0, 50);
devInfoBox.BackgroundTransparency = 1;
devInfoBox.LayoutOrder = 2;
local devAvatar = Instance.new("ImageLabel", devInfoBox);
devAvatar.Size = UDim2.new(0, 30, 0, 30);
devAvatar.Position = UDim2.new(0.5, -145, 0, 5);
devAvatar.BackgroundTransparency = 1;
devAvatar.Image = "rbxassetid://70602183475196";
local devAvatarCorner = Instance.new("UICorner");
devAvatarCorner.CornerRadius = UDim.new(0, 6);
devAvatarCorner.Parent = devAvatar;
local devNameText = Instance.new("TextLabel", devInfoBox);
devNameText.Size = UDim2.new(0, 220, 0, 30);
devNameText.Position = UDim2.new(0.5, -100, 0, 5);
devNameText.Text = "MainDeveloper/Scripter: CoverEu";
devNameText.Font = Enum.Font.Gotham;
devNameText.TextSize = 14;
devNameText.TextColor3 = currentTheme.text;
devNameText.BackgroundTransparency = 1;
devNameText.TextXAlignment = Enum.TextXAlignment.Left;
local settingsTitleText = Instance.new("TextLabel", settingsArea);
settingsTitleText.Name = "SettingsTitle";
settingsTitleText.Size = UDim2.new(1, 0, 0, 40);
settingsTitleText.Position = UDim2.new(0, 0, 0, 0);
settingsTitleText.Text = "THEMES";
settingsTitleText.Font = Enum.Font.GothamBold;
settingsTitleText.TextSize = 24;
settingsTitleText.TextColor3 = currentTheme.text;
settingsTitleText.BackgroundTransparency = 1;
settingsTitleText.TextXAlignment = Enum.TextXAlignment.Center;
local themeButtonsContainer = Instance.new("Frame", settingsArea);
themeButtonsContainer.Name = "ThemeButtonsContainer";
themeButtonsContainer.Size = UDim2.new(1, 0, 0, 110);
themeButtonsContainer.Position = UDim2.new(0, 0, 0, 45);
themeButtonsContainer.BackgroundTransparency = 1;
local function fixTabCorners()
end
local function createThemeButton(name, position)
	local button = Instance.new("TextButton", themeButtonsContainer);
	button.Name = name .. "ThemeButton";
	button.Size = UDim2.new(0.8, 0, 0, 30);
	button.Position = position;
	button.Text = name;
	button.Font = Enum.Font.GothamBold;
	button.TextSize = 14;
	button.TextColor3 = currentTheme.text;
	button.BackgroundColor3 = currentTheme.secondary;
	local buttonCorner = Instance.new("UICorner");
	buttonCorner.CornerRadius = UDim.new(0, 6);
	buttonCorner.Parent = button;
	button.MouseButton1Click:Connect(function()
		applyTheme(name);
	end);
	return button;
end
function applyTheme(themeName)
	local theme = themes[themeName];
	currentTheme = theme;
	frame.BackgroundColor3 = theme.primary;
	frameBorder.Color = theme.accent;
	suggestionDisplay.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
	suggestionDisplayBorder.Color = theme.accent;
	suggestionText.TextColor3 = theme.text;
	tabsContainer.BackgroundColor3 = theme.primary;
	local selectedTab = nil;
	if mainContentArea.Visible then
		selectedTab = mainTab;
	elseif creditsArea.Visible then
		selectedTab = creditsTab;
	elseif settingsArea.Visible then
		selectedTab = themesTab;
	elseif configSettingsArea.Visible then
		selectedTab = settingsTab;
	end
	mainTab.BackgroundColor3 = ((selectedTab == mainTab) and theme.selected) or theme.secondary;
	creditsTab.BackgroundColor3 = ((selectedTab == creditsTab) and theme.selected) or theme.secondary;
	themesTab.BackgroundColor3 = ((selectedTab == themesTab) and theme.selected) or theme.secondary;
	settingsTab.BackgroundColor3 = ((selectedTab == settingsTab) and theme.selected) or theme.secondary;
	title.TextColor3 = theme.text;
	subTitle.TextColor3 = theme.text;
	mainTab.TextColor3 = theme.text;
	creditsTab.TextColor3 = theme.text;
	themesTab.TextColor3 = theme.text;
	settingsTab.TextColor3 = theme.text;
	creditsTitleText.TextColor3 = theme.text;
	settingsTitleText.TextColor3 = theme.text;
	configSettingsTitleText.TextColor3 = theme.text;
	intelliSenseToggleContainer.BackgroundColor3 = theme.secondary;
	toggleContainerBorder.Color = theme.accent;
	toggleLabel.TextColor3 = theme.text;
	execBtn.BackgroundColor3 = theme.secondary;
	execBtn.TextColor3 = theme.text;
	clearBtn.BackgroundColor3 = theme.secondary;
	clearBtn.TextColor3 = theme.text;
	for _, child in pairs(themeButtonsContainer:GetChildren()) do
		if child:IsA("TextButton") then
			child.BackgroundColor3 = theme.secondary;
			child.TextColor3 = theme.text;
		end
	end
	codeBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
	intelliSenseFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
	intelliSenseBorder.Color = theme.accent;
	local titleLabel = intelliSenseFrame:FindFirstChild("TitleLabel");
	if titleLabel then
		titleLabel.TextColor3 = theme.text;
		titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
	end
	for _, child in pairs(suggestionList:GetChildren()) do
		if child:IsA("TextButton") then
			if (child.BackgroundColor3 ~= Color3.fromRGB(60, 60, 100)) then
				child.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
			end
			for _, textLabel in pairs(child:GetChildren()) do
				if textLabel:IsA("TextLabel") then
					if (textLabel.TextSize == 16) then
						textLabel.TextColor3 = theme.text;
					else
						textLabel.TextColor3 = Color3.fromRGB(180, 180, 180);
					end
				end
			end
		end
	end
	keybindContainer.BackgroundColor3 = theme.secondary;
	keybindContainerBorder.Color = theme.accent;
	keybindLabel.TextColor3 = theme.text;
end
local defaultButton = createThemeButton("Default", UDim2.new(0.1, 0, 0, 0));
local crimsonButton = createThemeButton("Crimson", UDim2.new(0.1, 0, 0, 40));
local eliteButton = createThemeButton("Elite", UDim2.new(0.1, 0, 0, 80));
local function setActiveTab(selectedTab)
	mainContentArea.Visible = selectedTab == mainTab;
	creditsArea.Visible = selectedTab == creditsTab;
	settingsArea.Visible = selectedTab == themesTab;
	configSettingsArea.Visible = selectedTab == settingsTab;
	mainTab.BackgroundColor3 = ((selectedTab == mainTab) and currentTheme.selected) or currentTheme.secondary;
	creditsTab.BackgroundColor3 = ((selectedTab == creditsTab) and currentTheme.selected) or currentTheme.secondary;
	themesTab.BackgroundColor3 = ((selectedTab == themesTab) and currentTheme.selected) or currentTheme.secondary;
	settingsTab.BackgroundColor3 = ((selectedTab == settingsTab) and currentTheme.selected) or currentTheme.secondary;
	for _, tab in pairs({mainTab,creditsTab,themesTab,settingsTab}) do
		for _, child in pairs(tab:GetChildren()) do
			if child:IsA("Frame") then
				child.BackgroundColor3 = tab.BackgroundColor3;
			end
		end
	end
end
fixTabCorners();
mainTab.MouseButton1Click:Connect(function()
	setActiveTab(mainTab);
end);
creditsTab.MouseButton1Click:Connect(function()
	setActiveTab(creditsTab);
end);
themesTab.MouseButton1Click:Connect(function()
	setActiveTab(themesTab);
end);
settingsTab.MouseButton1Click:Connect(function()
	setActiveTab(settingsTab);
end);
clearBtn.MouseButton1Click:Connect(function()
	codeBox.Text = "";
end);
execBtn.MouseButton1Click:Connect(function()
	local snippet = codeBox.Text;
	local func, err = loadstring(snippet);
	if not func then
		warn("🔴 Load error:", err);
		return;
	end
	local success, runErr = pcall(func);
	if not success then
		warn("🔴 Runtime error:", runErr);
	end
end);
frame.Active = true;
frame.Draggable = true;
codeBox.FocusLost:Connect(function()
	intelliSenseFrame.Visible = false;
	suggestionDisplay.Visible = false;
	ghostText.Text = "";
	isShowingGhostText = false;
end);
local isUIVisible = true;
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if isChangingKeybind then
		if ((input.KeyCode ~= Enum.KeyCode.Unknown) and (input.KeyCode ~= Enum.KeyCode.W) and (input.KeyCode ~= Enum.KeyCode.A) and (input.KeyCode ~= Enum.KeyCode.S) and (input.KeyCode ~= Enum.KeyCode.D) and (input.KeyCode ~= Enum.KeyCode.Space)) then
			currentKeybind = input.KeyCode;
			keybindButton.Text = input.KeyCode.Name;
			keybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
			isChangingKeybind = false;
		end
		return;
	end
	if (input.KeyCode == currentKeybind) then
		isUIVisible = not isUIVisible;
		screenGui.Enabled = isUIVisible;
	end
end);
_G.req = (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or request;
local player = game:GetService("Players").LocalPlayer;
local coreGui = game:GetService("CoreGui");
local screenGui = Instance.new("ScreenGui");
screenGui.Name = "ExecutorUI";
screenGui.Parent = coreGui;
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
local themes = {Default={primary=Color3.fromRGB(0, 0, 0),secondary=Color3.fromRGB(40, 40, 40),selected=Color3.fromRGB(60, 60, 60),accent=Color3.fromRGB(255, 255, 255),text=Color3.fromRGB(255, 255, 255)},Crimson={primary=Color3.fromRGB(0, 0, 0),secondary=Color3.fromRGB(40, 40, 40),selected=Color3.fromRGB(60, 60, 60),accent=Color3.fromRGB(220, 20, 60),text=Color3.fromRGB(255, 255, 255)},Elite={primary=Color3.fromRGB(0, 0, 0),secondary=Color3.fromRGB(40, 40, 40),selected=Color3.fromRGB(60, 60, 60),accent=Color3.fromRGB(255, 215, 0),text=Color3.fromRGB(255, 255, 255)}};
local currentTheme = themes.Default;
local frame = Instance.new("Frame");
frame.Size = UDim2.new(0, 650, 0, 380);
frame.Position = UDim2.new(0.5, -325, 0.5, -190);
frame.BackgroundColor3 = currentTheme.primary;
frame.BorderSizePixel = 0;
frame.Parent = screenGui;
local frameCorner = Instance.new("UICorner");
frameCorner.CornerRadius = UDim.new(0, 8);
frameCorner.Parent = frame;
local frameBorder = Instance.new("UIStroke");
frameBorder.Color = currentTheme.accent;
frameBorder.Thickness = 1;
frameBorder.Parent = frame;
local suggestionDisplay = Instance.new("Frame");
suggestionDisplay.Name = "SuggestionDisplay";
suggestionDisplay.Size = UDim2.new(1, 0, 0, 30);
suggestionDisplay.Position = UDim2.new(0, 0, 0, -35);
suggestionDisplay.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
suggestionDisplay.BorderSizePixel = 0;
suggestionDisplay.Visible = false;
suggestionDisplay.ZIndex = 10;
suggestionDisplay.Parent = frame;
local suggestionDisplayCorner = Instance.new("UICorner");
suggestionDisplayCorner.CornerRadius = UDim.new(0, 6);
suggestionDisplayCorner.Parent = suggestionDisplay;
local suggestionDisplayBorder = Instance.new("UIStroke");
suggestionDisplayBorder.Color = currentTheme.accent;
suggestionDisplayBorder.Thickness = 1;
suggestionDisplayBorder.Parent = suggestionDisplay;
local suggestionText = Instance.new("TextLabel");
suggestionText.Name = "SuggestionText";
suggestionText.Size = UDim2.new(1, -16, 1, 0);
suggestionText.Position = UDim2.new(0, 8, 0, 0);
suggestionText.BackgroundTransparency = 1;
suggestionText.Text = "";
suggestionText.Font = Enum.Font.Code;
suggestionText.TextSize = 18;
suggestionText.TextTransparency = 0.4;
suggestionText.TextColor3 = Color3.fromRGB(180, 180, 180);
suggestionText.TextXAlignment = Enum.TextXAlignment.Left;
suggestionText.TextYAlignment = Enum.TextYAlignment.Center;
suggestionText.ZIndex = 11;
suggestionText.Parent = suggestionDisplay;
local title = Instance.new("TextLabel");
title.Size = UDim2.new(1, 0, 0, 30);
title.BackgroundTransparency = 1;
title.Text = "Nocturnal";
title.Font = Enum.Font.GothamBold;
title.TextSize = 24;
title.TextColor3 = currentTheme.text;
title.Position = UDim2.new(0, 0, 0, 15);
title.Parent = frame;
title.TextXAlignment = Enum.TextXAlignment.Center;
local subTitle = Instance.new("TextLabel");
subTitle.Size = UDim2.new(1, 0, 0, 20);
subTitle.Position = UDim2.new(0, 0, 0, 40);
subTitle.Text = "Executor";
subTitle.Font = Enum.Font.Gotham;
subTitle.TextSize = 14;
subTitle.TextColor3 = currentTheme.text;
subTitle.BackgroundTransparency = 1;
subTitle.TextXAlignment = Enum.TextXAlignment.Center;
subTitle.Parent = frame;
local tabsContainer = Instance.new("Frame");
tabsContainer.Name = "TabsContainer";
tabsContainer.Size = UDim2.new(0, 420, 0, 30);
tabsContainer.Position = UDim2.new(0, 25, 0, 70);
tabsContainer.BackgroundColor3 = currentTheme.primary;
tabsContainer.BackgroundTransparency = 1;
tabsContainer.BorderSizePixel = 0;
tabsContainer.Parent = frame;
local mainTab = Instance.new("TextButton");
mainTab.Size = UDim2.new(0.22, 0, 1, 0);
mainTab.Position = UDim2.new(0.01, 0, 0, 0);
mainTab.Text = "Main";
mainTab.Font = Enum.Font.GothamBold;
mainTab.TextSize = 14;
mainTab.TextColor3 = currentTheme.text;
mainTab.BackgroundColor3 = currentTheme.selected;
mainTab.BorderSizePixel = 0;
mainTab.Parent = tabsContainer;
mainTab.ZIndex = 2;
local mainTabCorner = Instance.new("UICorner");
mainTabCorner.CornerRadius = UDim.new(0, 6);
mainTabCorner.Parent = mainTab;
local creditsTab = Instance.new("TextButton");
creditsTab.Size = UDim2.new(0.22, 0, 1, 0);
creditsTab.Position = UDim2.new(0.26, 0, 0, 0);
creditsTab.Text = "Credits";
creditsTab.Font = Enum.Font.GothamBold;
creditsTab.TextSize = 14;
creditsTab.TextColor3 = currentTheme.text;
creditsTab.BackgroundColor3 = currentTheme.secondary;
creditsTab.BorderSizePixel = 0;
creditsTab.Parent = tabsContainer;
creditsTab.ZIndex = 2;
local creditsTabCorner = Instance.new("UICorner");
creditsTabCorner.CornerRadius = UDim.new(0, 6);
creditsTabCorner.Parent = creditsTab;
local themesTab = Instance.new("TextButton");
themesTab.Size = UDim2.new(0.22, 0, 1, 0);
themesTab.Position = UDim2.new(0.51, 0, 0, 0);
themesTab.Text = "Themes";
themesTab.Font = Enum.Font.GothamBold;
themesTab.TextSize = 14;
themesTab.TextColor3 = currentTheme.text;
themesTab.BackgroundColor3 = currentTheme.secondary;
themesTab.BorderSizePixel = 0;
themesTab.Parent = tabsContainer;
themesTab.ZIndex = 2;
local themesTabCorner = Instance.new("UICorner");
themesTabCorner.CornerRadius = UDim.new(0, 6);
themesTabCorner.Parent = themesTab;
local settingsTab = Instance.new("TextButton");
settingsTab.Size = UDim2.new(0.22, 0, 1, 0);
settingsTab.Position = UDim2.new(0.76, 0, 0, 0);
settingsTab.Text = "Settings";
settingsTab.Font = Enum.Font.GothamBold;
settingsTab.TextSize = 14;
settingsTab.TextColor3 = currentTheme.text;
settingsTab.BackgroundColor3 = currentTheme.secondary;
settingsTab.BorderSizePixel = 0;
settingsTab.Parent = tabsContainer;
settingsTab.ZIndex = 2;
local settingsTabCorner = Instance.new("UICorner");
settingsTabCorner.CornerRadius = UDim.new(0, 6);
settingsTabCorner.Parent = settingsTab;
local mainContentArea = Instance.new("Frame");
mainContentArea.Name = "MainContent";
mainContentArea.Size = UDim2.new(1, -40, 0, 260);
mainContentArea.Position = UDim2.new(0, 20, 0, 110);
mainContentArea.BackgroundTransparency = 1;
mainContentArea.Visible = true;
mainContentArea.Parent = frame;
local creditsArea = Instance.new("Frame");
creditsArea.Name = "CreditsContent";
creditsArea.Size = UDim2.new(1, -40, 0, 260);
creditsArea.Position = UDim2.new(0, 20, 0, 110);
creditsArea.BackgroundTransparency = 1;
creditsArea.Visible = false;
creditsArea.Parent = frame;
local settingsArea = Instance.new("Frame");
settingsArea.Name = "SettingsContent";
settingsArea.Size = UDim2.new(1, -40, 0, 260);
settingsArea.Position = UDim2.new(0, 20, 0, 110);
settingsArea.BackgroundTransparency = 1;
settingsArea.Visible = false;
settingsArea.Parent = frame;
local configSettingsArea = Instance.new("Frame");
configSettingsArea.Name = "ConfigSettingsContent";
configSettingsArea.Size = UDim2.new(1, -40, 0, 260);
configSettingsArea.Position = UDim2.new(0, 20, 0, 110);
configSettingsArea.BackgroundTransparency = 1;
configSettingsArea.Visible = false;
configSettingsArea.Parent = frame;
local configSettingsTitleText = Instance.new("TextLabel", configSettingsArea);
configSettingsTitleText.Name = "SettingsTitle";
configSettingsTitleText.Size = UDim2.new(1, 0, 0, 40);
configSettingsTitleText.Position = UDim2.new(0, 0, 0, 0);
configSettingsTitleText.Text = "SETTINGS";
configSettingsTitleText.Font = Enum.Font.GothamBold;
configSettingsTitleText.TextSize = 24;
configSettingsTitleText.TextColor3 = currentTheme.text;
configSettingsTitleText.BackgroundTransparency = 1;
configSettingsTitleText.TextXAlignment = Enum.TextXAlignment.Center;
local intelliSenseToggleContainer = Instance.new("Frame", configSettingsArea);
intelliSenseToggleContainer.Name = "IntelliSenseToggleContainer";
intelliSenseToggleContainer.Size = UDim2.new(0.9, 0, 0, 40);
intelliSenseToggleContainer.Position = UDim2.new(0.05, 0, 0, 50);
intelliSenseToggleContainer.BackgroundColor3 = currentTheme.secondary;
intelliSenseToggleContainer.BorderSizePixel = 0;
local toggleContainerCorner = Instance.new("UICorner");
toggleContainerCorner.CornerRadius = UDim.new(0, 6);
toggleContainerCorner.Parent = intelliSenseToggleContainer;
local toggleContainerBorder = Instance.new("UIStroke");
toggleContainerBorder.Color = currentTheme.accent;
toggleContainerBorder.Thickness = 1;
toggleContainerBorder.Parent = intelliSenseToggleContainer;
local toggleLabel = Instance.new("TextLabel", intelliSenseToggleContainer);
toggleLabel.Size = UDim2.new(0.7, 0, 1, 0);
toggleLabel.Position = UDim2.new(0, 10, 0, 0);
toggleLabel.BackgroundTransparency = 1;
toggleLabel.Text = "IntelliSense";
toggleLabel.Font = Enum.Font.Gotham;
toggleLabel.TextSize = 16;
toggleLabel.TextColor3 = currentTheme.text;
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left;
local intelliSenseEnabled = true;
local toggleButton = Instance.new("TextButton", intelliSenseToggleContainer);
toggleButton.Name = "ToggleButton";
toggleButton.Size = UDim2.new(0, 50, 0, 26);
toggleButton.Position = UDim2.new(1, -60, 0.5, -13);
toggleButton.BackgroundColor3 = Color3.fromRGB(40, 160, 90);
toggleButton.BorderSizePixel = 0;
toggleButton.Text = "";
toggleButton.AutoButtonColor = false;
toggleButton.ZIndex = 10;
local toggleButtonCorner = Instance.new("UICorner");
toggleButtonCorner.CornerRadius = UDim.new(0, 13);
toggleButtonCorner.Parent = toggleButton;
local toggleContainerButton = Instance.new("TextButton", intelliSenseToggleContainer);
toggleContainerButton.Size = UDim2.new(1, 0, 1, 0);
toggleContainerButton.BackgroundTransparency = 1;
toggleContainerButton.Text = "";
toggleContainerButton.ZIndex = 9;
local toggleIndicator = Instance.new("Frame", toggleButton);
toggleIndicator.Name = "Indicator";
toggleIndicator.Size = UDim2.new(0, 20, 0, 20);
toggleIndicator.Position = UDim2.new(1, -23, 0.5, -10);
toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
toggleIndicator.BorderSizePixel = 0;
local toggleIndicatorCorner = Instance.new("UICorner");
toggleIndicatorCorner.CornerRadius = UDim.new(0, 10);
toggleIndicatorCorner.Parent = toggleIndicator;
local stateLabel = Instance.new("TextLabel", intelliSenseToggleContainer);
stateLabel.Name = "StateLabel";
stateLabel.Size = UDim2.new(0, 60, 0, 20);
stateLabel.Position = UDim2.new(1, -120, 0.5, -10);
stateLabel.BackgroundTransparency = 1;
stateLabel.Text = "ON";
stateLabel.Font = Enum.Font.GothamBold;
stateLabel.TextSize = 12;
stateLabel.TextColor3 = Color3.fromRGB(40, 160, 90);
local function updateToggleState()
	if intelliSenseEnabled then
		toggleButton.BackgroundColor3 = Color3.fromRGB(40, 160, 90);
		toggleIndicator.Position = UDim2.new(1, -23, 0.5, -10);
		stateLabel.Text = "ON";
		stateLabel.TextColor3 = Color3.fromRGB(40, 160, 90);
	else
		toggleButton.BackgroundColor3 = Color3.fromRGB(160, 40, 40);
		toggleIndicator.Position = UDim2.new(0, 3, 0.5, -10);
		stateLabel.Text = "OFF";
		stateLabel.TextColor3 = Color3.fromRGB(160, 40, 40);
	end
end
updateToggleState();
toggleButton.MouseButton1Click:Connect(function()
	intelliSenseEnabled = not intelliSenseEnabled;
	updateToggleState();
	if not intelliSenseEnabled then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
	end
	print("Toggle button clicked! IntelliSense enabled:", intelliSenseEnabled);
end);
toggleContainerButton.MouseButton1Click:Connect(function()
	intelliSenseEnabled = not intelliSenseEnabled;
	updateToggleState();
	if not intelliSenseEnabled then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
	end
	print("Toggle container clicked! IntelliSense enabled:", intelliSenseEnabled);
end);
local keybindContainer = Instance.new("Frame", configSettingsArea);
keybindContainer.Name = "KeybindContainer";
keybindContainer.Size = UDim2.new(0.9, 0, 0, 40);
keybindContainer.Position = UDim2.new(0.05, 0, 0, 100);
keybindContainer.BackgroundColor3 = currentTheme.secondary;
keybindContainer.BorderSizePixel = 0;
local keybindContainerCorner = Instance.new("UICorner");
keybindContainerCorner.CornerRadius = UDim.new(0, 6);
keybindContainerCorner.Parent = keybindContainer;
local keybindContainerBorder = Instance.new("UIStroke");
keybindContainerBorder.Color = currentTheme.accent;
keybindContainerBorder.Thickness = 1;
keybindContainerBorder.Parent = keybindContainer;
local keybindLabel = Instance.new("TextLabel", keybindContainer);
keybindLabel.Size = UDim2.new(0.7, 0, 1, 0);
keybindLabel.Position = UDim2.new(0, 10, 0, 0);
keybindLabel.BackgroundTransparency = 1;
keybindLabel.Text = "Toggle UI Keybind";
keybindLabel.Font = Enum.Font.Gotham;
keybindLabel.TextSize = 16;
keybindLabel.TextColor3 = currentTheme.text;
keybindLabel.TextXAlignment = Enum.TextXAlignment.Left;
local currentKeybind = Enum.KeyCode.RightShift;
local keybindButton = Instance.new("TextButton", keybindContainer);
keybindButton.Name = "KeybindButton";
keybindButton.Size = UDim2.new(0, 100, 0, 26);
keybindButton.Position = UDim2.new(1, -110, 0.5, -13);
keybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
keybindButton.BorderSizePixel = 0;
keybindButton.Text = "RightShift";
keybindButton.Font = Enum.Font.Code;
keybindButton.TextSize = 14;
keybindButton.TextColor3 = Color3.fromRGB(255, 255, 255);
keybindButton.AutoButtonColor = true;
keybindButton.ZIndex = 10;
local keybindButtonCorner = Instance.new("UICorner");
keybindButtonCorner.CornerRadius = UDim.new(0, 4);
keybindButtonCorner.Parent = keybindButton;
local isChangingKeybind = false;
keybindButton.MouseButton1Click:Connect(function()
	isChangingKeybind = true;
	keybindButton.Text = "Press any key...";
	keybindButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100);
end);
local codeBox = Instance.new("TextBox");
codeBox.PlaceholderText = "-- type your scripts here!";
codeBox.TextEditable = true;
codeBox.ClearTextOnFocus = false;
codeBox.TextWrapped = true;
codeBox.MultiLine = true;
codeBox.Size = UDim2.new(1, 0, 1, -60);
codeBox.Position = UDim2.new(0, 0, 0, 0);
codeBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
codeBox.TextColor3 = currentTheme.text;
codeBox.Font = Enum.Font.Code;
codeBox.TextSize = 18;
codeBox.Parent = mainContentArea;
codeBox.Text = "-- Nocturnal Internal Ui!";
codeBox.CursorPosition = #codeBox.Text + 1;
codeBox.SelectionStart = #codeBox.Text + 1;
codeBox.TextXAlignment = Enum.TextXAlignment.Left;
codeBox.TextYAlignment = Enum.TextYAlignment.Top;
local codeBoxPadding = Instance.new("UIPadding");
codeBoxPadding.PaddingLeft = UDim.new(0, 10);
codeBoxPadding.PaddingRight = UDim.new(0, 10);
codeBoxPadding.PaddingTop = UDim.new(0, 10);
codeBoxPadding.PaddingBottom = UDim.new(0, 10);
codeBoxPadding.Parent = codeBox;
local codeBoxCorner = Instance.new("UICorner");
codeBoxCorner.CornerRadius = UDim.new(0, 6);
codeBoxCorner.Parent = codeBox;
local ghostText = Instance.new("TextLabel");
ghostText.Name = "GhostText";
ghostText.BackgroundTransparency = 1;
ghostText.Size = UDim2.new(1, 0, 1, 0);
ghostText.Position = UDim2.new(0, 0, 0, 0);
ghostText.TextXAlignment = Enum.TextXAlignment.Left;
ghostText.TextYAlignment = Enum.TextYAlignment.Top;
ghostText.TextColor3 = Color3.fromRGB(120, 120, 120);
ghostText.Font = Enum.Font.Code;
ghostText.TextSize = 18;
ghostText.TextTransparency = 0.5;
ghostText.Text = "";
ghostText.ZIndex = 3;
ghostText.Parent = codeBox;
local currentSuggestions = {};
local selectedSuggestionIndex = 1;
local isShowingGhostText = false;
local intelliSenseFrame = Instance.new("Frame");
intelliSenseFrame.Name = "IntelliSenseFrame";
intelliSenseFrame.Size = UDim2.new(0, 300, 1, 0);
intelliSenseFrame.Position = UDim2.new(1, 10, 0, 0);
intelliSenseFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
intelliSenseFrame.BorderSizePixel = 0;
intelliSenseFrame.Visible = false;
intelliSenseFrame.ZIndex = 10;
intelliSenseFrame.Parent = frame;
local intelliSenseCorner = Instance.new("UICorner");
intelliSenseCorner.CornerRadius = UDim.new(0, 4);
intelliSenseCorner.Parent = intelliSenseFrame;
local intelliSenseBorder = Instance.new("UIStroke");
intelliSenseBorder.Color = currentTheme.accent;
intelliSenseBorder.Thickness = 1;
intelliSenseBorder.Parent = intelliSenseFrame;
local suggestionList = Instance.new("ScrollingFrame");
suggestionList.Name = "SuggestionList";
suggestionList.Size = UDim2.new(1, -10, 1, -10);
suggestionList.Position = UDim2.new(0, 5, 0, 5);
suggestionList.BackgroundTransparency = 1;
suggestionList.BorderSizePixel = 0;
suggestionList.ScrollBarThickness = 4;
suggestionList.ZIndex = 10;
suggestionList.Parent = intelliSenseFrame;
local suggestionLayout = Instance.new("UIListLayout");
suggestionLayout.SortOrder = Enum.SortOrder.LayoutOrder;
suggestionLayout.Padding = UDim.new(0, 2);
suggestionLayout.Parent = suggestionList;
local luaKeywords = {"and","break","do","else","elseif","end","false","for","function","if","in","local","nil","not","or","repeat","return","then","true","until","while"};
local coreLuaFunctions = {{text="print()",desc="Outputs text to the console"},{text="warn()",desc="Outputs a warning to the console"},{text="error()",desc="Throws an error"},{text="assert()",desc="Asserts that a condition is true"},{text="pcall()",desc="Protected function call - catches errors"},{text="xpcall()",desc="Extended protected call with error handler"},{text="select()",desc="Selects elements from a vararg list"},{text="tonumber()",desc="Converts value to a number"},{text="tostring()",desc="Converts value to a string"},{text="type()",desc="Returns the type of a value"},{text="unpack()",desc="Unpacks a table into individual values"},{text="getfenv()",desc="Gets the environment of a function"},{text="setfenv()",desc="Sets the environment of a function"},{text="next()",desc="Gets the next key in a table"},{text="pairs()",desc="Iterates through a table's key-value pairs"},{text="ipairs()",desc="Iterates through a table's array portion"},{text="rawequal()",desc="Compares two values without metamethods"},{text="rawset()",desc="Sets a table value without metamethods"},{text="rawget()",desc="Gets a table value without metamethods"},{text="collectgarbage()",desc="Controls the garbage collector"},{text="getmetatable()",desc="Gets a table's metatable"},{text="setmetatable()",desc="Sets a table's metatable"},{text="require()",desc="Loads a module"},{text="loadstring()",desc="Loads Lua code from a string"},{text="dofile()",desc="Executes a file"},{text="typeof()",desc="Returns Roblox specific type information"}};
local stringFunctions = {{text="string.byte()",desc="Returns numeric code of a character"},{text="string.char()",desc="Returns string from character codes"},{text="string.dump()",desc="Returns binary representation of a function"},{text="string.find()",desc="Finds pattern in a string"},{text="string.format()",desc="Formats a string using patterns"},{text="string.gsub()",desc="Global string replacement"},{text="string.len()",desc="Returns string length"},{text="string.lower()",desc="Converts string to lowercase"},{text="string.match()",desc="Pattern matching in a string"},{text="string.rep()",desc="Repeats a string multiple times"},{text="string.reverse()",desc="Reverses a string"},{text="string.sub()",desc="Returns substring"},{text="string.upper()",desc="Converts string to uppercase"}};
local tableFunctions = {{text="table.concat()",desc="Concatenates table elements into string"},{text="table.insert()",desc="Inserts a value into a table"},{text="table.maxn()",desc="Returns largest numerical index"},{text="table.remove()",desc="Removes a value from a table"},{text="table.sort()",desc="Sorts a table"},{text="table.create()",desc="Creates table with preallocated elements"},{text="table.find()",desc="Finds a value in an array table"},{text="table.move()",desc="Moves elements between tables"},{text="table.foreach()",desc="Legacy method to iterate through a table"}};
local mathFunctions = {{text="math.abs()",desc="Absolute value"},{text="math.acos()",desc="Arc cosine"},{text="math.asin()",desc="Arc sine"},{text="math.atan()",desc="Arc tangent"},{text="math.atan2()",desc="Arc tangent of two variables"},{text="math.ceil()",desc="Rounds up to nearest integer"},{text="math.cos()",desc="Cosine"},{text="math.cosh()",desc="Hyperbolic cosine"},{text="math.deg()",desc="Converts radians to degrees"},{text="math.exp()",desc="Exponential function"},{text="math.floor()",desc="Rounds down to nearest integer"},{text="math.fmod()",desc="Floating-point remainder"},{text="math.frexp()",desc="Extracts mantissa and exponent"},{text="math.huge",desc="A value larger than any other number"},{text="math.ldexp()",desc="Multiplies by a power of 2"},{text="math.log()",desc="Natural logarithm"},{text="math.log10()",desc="Base-10 logarithm"},{text="math.max()",desc="Returns maximum value"},{text="math.min()",desc="Returns minimum value"},{text="math.modf()",desc="Returns integer and fractional parts"},{text="math.pi",desc="The value of pi"},{text="math.pow()",desc="Raises to a power"},{text="math.rad()",desc="Converts degrees to radians"},{text="math.random()",desc="Generates a random number"},{text="math.randomseed()",desc="Sets random seed"},{text="math.sin()",desc="Sine"},{text="math.sinh()",desc="Hyperbolic sine"},{text="math.sqrt()",desc="Square root"},{text="math.tan()",desc="Tangent"},{text="math.tanh()",desc="Hyperbolic tangent"}};
local ioFunctions = {{text="io.close()",desc="Closes a file"},{text="io.flush()",desc="Flushes the output buffer"},{text="io.input()",desc="Sets the default input file"},{text="io.lines()",desc="Iterates over lines in a file"},{text="io.open()",desc="Opens a file"},{text="io.output()",desc="Sets the default output file"},{text="io.popen()",desc="Starts a program and returns a file handle"},{text="io.read()",desc="Reads from a file"},{text="io.tmpfile()",desc="Creates a temporary file"},{text="io.type()",desc="Gets the type of a file handle"},{text="io.write()",desc="Writes to a file"}};
local osFunctions = {{text="os.clock()",desc="Returns CPU time used"},{text="os.date()",desc="Returns date/time as a string or table"},{text="os.difftime()",desc="Returns time difference between timestamps"},{text="os.execute()",desc="Executes system command"},{text="os.exit()",desc="Terminates host program"},{text="os.getenv()",desc="Gets environment variable"},{text="os.remove()",desc="Deletes a file"},{text="os.rename()",desc="Renames a file"},{text="os.setlocale()",desc="Sets current locale"},{text="os.time()",desc="Returns current time as timestamp"},{text="os.tmpname()",desc="Generates temporary filename"}};
local commonFunctions = {{text="wait()",desc="Yields the script for a specified time"},{text="delay()",desc="Schedules a function call after a delay"},{text="spawn()",desc="Creates a new thread to run a function"},{text="tick()",desc="Returns the time in seconds since the epoch"},{text="Instance.new()",desc="Creates a new Roblox instance"},{text="Vector3.new()",desc="Creates a 3D vector"},{text="CFrame.new()",desc="Creates a coordinate frame"}};
local executorFunctions = {{text="getgenv()",desc="Gets the global environment for executor scripts"},{text="getrenv()",desc="Gets the Roblox global environment"},{text="getrawmetatable()",desc="Gets the raw metatable of an object"},{text="setrawmetatable()",desc="Sets the raw metatable of an object"},{text="hookfunction()",desc="Hooks a function to intercept calls"},{text="hookmetamethod()",desc="Hooks a metamethod in a metatable"},{text="islclosure()",desc="Checks if a function is a Lua closure"},{text="iscclosure()",desc="Checks if a function is a C closure"},{text="newcclosure()",desc="Creates a new C closure"},{text="checkcaller()",desc="Checks if function was called by the executor"},{text="getupvalue()",desc="Gets an upvalue from a function"},{text="setupvalue()",desc="Sets an upvalue in a function"},{text="getupvalues()",desc="Gets all upvalues from a function"},{text="getconstants()",desc="Gets constants from a function"},{text="setconstant()",desc="Sets a constant in a function"},{text="getnamecallmethod()",desc="Gets the current namecall method"},{text="setnamecallmethod()",desc="Sets the current namecall method"},{text="isexecutorclosure()",desc="Checks if a function is from the executor"},{text="identifyexecutor()",desc="Returns the name of the executor"},{text="setreadonly()",desc="Sets whether a table is read-only"},{text="getscripts()",desc="Gets all scripts in the game"},{text="firesignal()",desc="Fires a signal with custom arguments"},{text="gethui()",desc="Gets hidden UI container"},{text="hookamethod()",desc="Hooks an instance method"},{text="fireclickdetector()",desc="Fires a ClickDetector instance"},{text="fireproximityprompt()",desc="Fires a ProximityPrompt instance"},{text="firetouchinterest()",desc="Simulates touch between parts"},{text="fireremote()",desc="Fires a remote event with arguments"}};
local fileSystemFunctions = {{text="readfile()",desc="Reads the contents of a file"},{text="writefile()",desc="Writes data to a file"},{text="appendfile()",desc="Appends data to a file"},{text="loadfile()",desc="Loads a file as a function"},{text="listfiles()",desc="Lists files in a directory"},{text="isfile()",desc="Checks if a file exists"},{text="isfolder()",desc="Checks if a folder exists"},{text="makefolder()",desc="Creates a new folder"},{text="delfolder()",desc="Deletes a folder"},{text="delfile()",desc="Deletes a file"}};
local debugFunctions = {{text="debug.getregistry()",desc="Gets the registry table"},{text="debug.getupvalues()",desc="Gets all upvalues from a function"},{text="debug.getmetatable()",desc="Gets the metatable of an object"},{text="debug.setmetatable()",desc="Sets the metatable of an object"},{text="debug.getconstants()",desc="Gets constants from a function"},{text="debug.setconstant()",desc="Sets a constant in a function"},{text="debug.getupvalue()",desc="Gets an upvalue from a function"},{text="debug.setupvalue()",desc="Sets an upvalue in a function"},{text="debug.getprotos()",desc="Gets subfunctions from a function"},{text="debug.getinfo()",desc="Gets information about a function"},{text="debug.traceback()",desc="Gets a stack traceback"}};
local drawingFunctions = {{text="Drawing.new()",desc="Creates a new drawing object"},{text="Drawing.Clear()",desc="Clears all drawing objects"},{text="Drawing.isDrawing()",desc="Checks if an object is a drawing"}};
local robloxClasses = {{text="game",desc="Root of the Roblox game hierarchy"},{text="workspace",desc="Contains all physical objects in the game"},{text="script",desc="Current script instance"},{text="player",desc="Player instance"},{text="_G",desc="Global shared table across all scripts"},{text="math",desc="Library for mathematical operations"},{text="string",desc="Library for string manipulation"},{text="table",desc="Library for table manipulation"},{text="task",desc="Library for task scheduling"},{text="Vector2",desc="2D vector representation"},{text="Vector3",desc="3D vector representation"},{text="CFrame",desc="Coordinate frame for 3D transformations"},{text="Color3",desc="RGB color representation"},{text="Enum",desc="Enumeration types"},{text="Instance",desc="Base class for all Roblox objects"},{text="Ray",desc="Mathematical ray for raycasting"},{text="Region3",desc="3D region for spatial queries"},{text="UDim",desc="1D dimension with scale and offset"},{text="UDim2",desc="2D dimension with scale and offset"},{text="Rect",desc="2D rectangle representation"},{text="BrickColor",desc="Legacy color system for parts"},{text="TweenInfo",desc="Configuration for tweens and animations"},{text="NumberSequence",desc="Sequence of number keypoints"},{text="ColorSequence",desc="Sequence of color keypoints"},{text="NumberRange",desc="Range between two numbers"},{text="Path",desc="Pathfinding path object"}};
local function createSuggestion(text, description, index)
	local suggestion = Instance.new("TextButton");
	suggestion.Name = "Suggestion_" .. text;
	suggestion.Size = UDim2.new(1, -8, 0, 55);
	suggestion.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
	suggestion.Text = "";
	suggestion.AutoButtonColor = true;
	suggestion.ZIndex = 11;
	suggestion.LayoutOrder = index;
	local suggestionCorner = Instance.new("UICorner");
	suggestionCorner.CornerRadius = UDim.new(0, 3);
	suggestionCorner.Parent = suggestion;
	local textLabel = Instance.new("TextLabel");
	textLabel.Size = UDim2.new(1, -10, 0, 25);
	textLabel.Position = UDim2.new(0, 5, 0, 0);
	textLabel.BackgroundTransparency = 1;
	textLabel.Text = text;
	textLabel.Font = Enum.Font.Code;
	textLabel.TextSize = 16;
	textLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
	textLabel.TextXAlignment = Enum.TextXAlignment.Left;
	textLabel.ZIndex = 12;
	textLabel.Parent = suggestion;
	if description then
		local descLabel = Instance.new("TextLabel");
		descLabel.Size = UDim2.new(1, -10, 0, 30);
		descLabel.Position = UDim2.new(0, 5, 0, 25);
		descLabel.BackgroundTransparency = 1;
		descLabel.Text = description;
		descLabel.Font = Enum.Font.Gotham;
		descLabel.TextSize = 14;
		descLabel.TextColor3 = Color3.fromRGB(180, 180, 180);
		descLabel.TextXAlignment = Enum.TextXAlignment.Left;
		descLabel.TextWrapped = true;
		descLabel.ZIndex = 12;
		descLabel.Parent = suggestion;
	end
	suggestion.MouseButton1Click:Connect(function()
		local currentText = codeBox.Text;
		local cursorPos = codeBox.CursorPosition;
		local lineStart = cursorPos;
		while (lineStart > 1) and string.sub(currentText, lineStart - 1, lineStart - 1):match("[%w_]") do
			lineStart = lineStart - 1;
		end
		local currentWord = string.sub(currentText, lineStart, cursorPos - 1);
		local insertText = text;
		if string.match(text, "%(%)$") then
			insertText = string.sub(text, 1, -2);
		end
		local newText = string.sub(currentText, 1, lineStart - 1) .. insertText .. string.sub(currentText, cursorPos);
		codeBox.Text = newText;
		if string.match(text, "%(%)$") then
			codeBox.CursorPosition = lineStart + #insertText;
		else
			codeBox.CursorPosition = lineStart + #insertText;
		end
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
	end);
	return suggestion;
end
local function updateGhostText()
	if not intelliSenseEnabled then
		ghostText.Text = "";
		suggestionDisplay.Visible = false;
		isShowingGhostText = false;
		return;
	end
	if (not intelliSenseFrame.Visible or (#currentSuggestions == 0)) then
		ghostText.Text = "";
		suggestionDisplay.Visible = false;
		isShowingGhostText = false;
		return;
	end
	local currentText = codeBox.Text;
	local cursorPos = codeBox.CursorPosition;
	local lineStart = cursorPos;
	while (lineStart > 1) and string.sub(currentText, lineStart - 1, lineStart - 1):match("[%w_]") do
		lineStart = lineStart - 1;
	end
	local currentWord = string.sub(currentText, lineStart, cursorPos - 1);
	if (#currentWord < 1) then
		ghostText.Text = "";
		suggestionDisplay.Visible = false;
		isShowingGhostText = false;
		return;
	end
	local suggestion = currentSuggestions[selectedSuggestionIndex].text;
	local suggestionSuffix = suggestion:sub(#currentWord + 1);
	suggestionText.Text = "Suggestion: " .. currentWord .. suggestionSuffix;
	suggestionDisplay.Visible = true;
	ghostText.Text = "";
	isShowingGhostText = true;
end
local function updateSuggestions()
	if not intelliSenseEnabled then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
		return;
	end
	for _, child in pairs(suggestionList:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy();
		end
	end
	currentSuggestions = {};
	selectedSuggestionIndex = 1;
	local currentText = codeBox.Text;
	local cursorPos = codeBox.CursorPosition;
	local lineStart = cursorPos;
	while (lineStart > 1) and string.sub(currentText, lineStart - 1, lineStart - 1):match("[%w_.]") do
		lineStart = lineStart - 1;
	end
	local currentWord = string.sub(currentText, lineStart, cursorPos - 1);
	if (#currentWord < 1) then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
		return;
	end
	local suggestions = {};
	for _, keyword in ipairs(luaKeywords) do
		if string.find(keyword, "^" .. currentWord) then
			table.insert(suggestions, {text=keyword,desc="Lua keyword"});
		end
	end
	for _, func in ipairs(coreLuaFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(stringFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(tableFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(mathFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(ioFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(osFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(commonFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, class in ipairs(robloxClasses) do
		if string.find(class.text, "^" .. currentWord) then
			table.insert(suggestions, {text=class.text,desc=class.desc});
		end
	end
	for _, func in ipairs(executorFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(fileSystemFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(debugFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	for _, func in ipairs(drawingFunctions) do
		if string.find(func.text, "^" .. currentWord) then
			table.insert(suggestions, {text=func.text,desc=func.desc});
		end
	end
	if (#suggestions == 0) then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
		return;
	end
	table.sort(suggestions, function(a, b)
		local aExact = a.text:sub(1, #currentWord) == currentWord;
		local bExact = b.text:sub(1, #currentWord) == currentWord;
		if (aExact and not bExact) then
			return true;
		elseif (not aExact and bExact) then
			return false;
		else
			return a.text < b.text;
		end
	end);
	if (#suggestions > 30) then
		local trimmedSuggestions = {};
		for i = 1, 30 do
			table.insert(trimmedSuggestions, suggestions[i]);
		end
		suggestions = trimmedSuggestions;
	end
	currentSuggestions = suggestions;
	for i, suggestion in ipairs(suggestions) do
		local suggestionButton = createSuggestion(suggestion.text, suggestion.desc, i);
		suggestionButton.Parent = suggestionList;
		if (i == 1) then
			suggestionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 100);
		end
	end
	suggestionList.CanvasSize = UDim2.new(0, 0, 0, #suggestions * 60);
	intelliSenseFrame.Visible = true;
	suggestionDisplay.Visible = true;
	if not intelliSenseFrame:FindFirstChild("TitleLabel") then
		local titleLabel = Instance.new("TextLabel");
		titleLabel.Name = "TitleLabel";
		titleLabel.Size = UDim2.new(1, 0, 0, 30);
		titleLabel.Position = UDim2.new(0, 0, 0, 0);
		titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
		titleLabel.BorderSizePixel = 0;
		titleLabel.Text = "IntelliSense";
		titleLabel.Font = Enum.Font.GothamBold;
		titleLabel.TextSize = 16;
		titleLabel.TextColor3 = currentTheme.text;
		titleLabel.ZIndex = 11;
		titleLabel.Parent = intelliSenseFrame;
		suggestionList.Position = UDim2.new(0, 5, 0, 35);
		suggestionList.Size = UDim2.new(1, -10, 1, -40);
	end
	updateGhostText();
end
local function selectSuggestion(index)
	if (#currentSuggestions == 0) then
		return;
	end
	index = math.max(1, math.min(index, #currentSuggestions));
	for i, child in pairs(suggestionList:GetChildren()) do
		if child:IsA("TextButton") then
			if (i == index) then
				child.BackgroundColor3 = Color3.fromRGB(60, 60, 100);
			else
				child.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
			end
		end
	end
	selectedSuggestionIndex = index;
	updateGhostText();
end
local function acceptSuggestion()
	if not intelliSenseEnabled then
		return;
	end
	if (not isShowingGhostText or (#currentSuggestions == 0)) then
		return;
	end
	local currentText = codeBox.Text;
	local cursorPos = codeBox.CursorPosition;
	local lineStart = cursorPos;
	while (lineStart > 1) and string.sub(currentText, lineStart - 1, lineStart - 1):match("[%w_]") do
		lineStart = lineStart - 1;
	end
	local currentWord = string.sub(currentText, lineStart, cursorPos - 1);
	local suggestion = currentSuggestions[selectedSuggestionIndex].text;
	local insertText = suggestion;
	if string.match(suggestion, "%(%)$") then
		insertText = string.sub(suggestion, 1, -2);
	end
	local newText = string.sub(currentText, 1, lineStart - 1) .. insertText .. string.sub(currentText, cursorPos);
	codeBox.Text = newText;
	if string.match(suggestion, "%(%)$") then
		codeBox.CursorPosition = lineStart + #insertText;
	else
		codeBox.CursorPosition = lineStart + #insertText;
	end
	intelliSenseFrame.Visible = false;
	suggestionDisplay.Visible = false;
	ghostText.Text = "";
	isShowingGhostText = false;
end
codeBox.Changed:Connect(function(property)
	if ((property == "Text") or (property == "CursorPosition")) then
		if intelliSenseEnabled then
			updateSuggestions();
		else
			intelliSenseFrame.Visible = false;
			suggestionDisplay.Visible = false;
			ghostText.Text = "";
			isShowingGhostText = false;
		end
	end
end);
codeBox.InputBegan:Connect(function(input)
	if not intelliSenseEnabled then
		return;
	end
	if (not intelliSenseFrame.Visible and not suggestionDisplay.Visible) then
		return;
	end
	if (input.KeyCode == Enum.KeyCode.Down) then
		selectSuggestion(selectedSuggestionIndex + 1);
	elseif (input.KeyCode == Enum.KeyCode.Up) then
		selectSuggestion(selectedSuggestionIndex - 1);
	elseif (input.KeyCode == Enum.KeyCode.Tab) then
		acceptSuggestion();
	elseif ((input.KeyCode == Enum.KeyCode.Return) or (input.KeyCode == Enum.KeyCode.Space)) then
		intelliSenseFrame.Visible = false;
		suggestionDisplay.Visible = false;
		ghostText.Text = "";
		isShowingGhostText = false;
	end
end);
local function applySyntaxHighlighting()
	local text = codeBox.Text;
end
applySyntaxHighlighting();
local buttonContainer = Instance.new("Frame");
buttonContainer.Name = "ButtonContainer";
buttonContainer.Size = UDim2.new(1, 0, 0, 50);
buttonContainer.Position = UDim2.new(0, 0, 1, -50);
buttonContainer.BackgroundTransparency = 1;
buttonContainer.Parent = mainContentArea;
local execBtn = Instance.new("TextButton");
execBtn.Size = UDim2.new(0.48, 0, 1, 0);
execBtn.Position = UDim2.new(0.51, 0, 0, 0);
execBtn.Text = "Execute";
execBtn.Font = Enum.Font.GothamBold;
execBtn.TextSize = 18;
execBtn.BackgroundColor3 = currentTheme.secondary;
execBtn.TextColor3 = currentTheme.text;
execBtn.Parent = buttonContainer;
local execBtnCorner = Instance.new("UICorner");
execBtnCorner.CornerRadius = UDim.new(0, 8);
execBtnCorner.Parent = execBtn;
local clearBtn = Instance.new("TextButton");
clearBtn.Size = UDim2.new(0.48, 0, 1, 0);
clearBtn.Position = UDim2.new(0.01, 0, 0, 0);
clearBtn.Text = "Clear";
clearBtn.Font = Enum.Font.GothamBold;
clearBtn.TextSize = 18;
clearBtn.BackgroundColor3 = currentTheme.secondary;
clearBtn.TextColor3 = currentTheme.text;
clearBtn.Parent = buttonContainer;
local clearBtnCorner = Instance.new("UICorner");
clearBtnCorner.CornerRadius = UDim.new(0, 8);
clearBtnCorner.Parent = clearBtn;
local creditsListLayout = Instance.new("UIListLayout", creditsArea);
creditsListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
creditsListLayout.VerticalAlignment = Enum.VerticalAlignment.Top;
creditsListLayout.Padding = UDim.new(0, 15);
creditsListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
local creditsTitleText = Instance.new("TextLabel", creditsArea);
creditsTitleText.Name = "CreditsTitle";
creditsTitleText.Size = UDim2.new(1, 0, 0, 40);
creditsTitleText.Text = "CREDITS";
creditsTitleText.Font = Enum.Font.GothamBold;
creditsTitleText.TextSize = 24;
creditsTitleText.TextColor3 = currentTheme.text;
creditsTitleText.BackgroundTransparency = 1;
creditsTitleText.TextXAlignment = Enum.TextXAlignment.Center;
creditsTitleText.LayoutOrder = 1;
local devInfoBox = Instance.new("Frame", creditsArea);
devInfoBox.Name = "DeveloperInfo";
devInfoBox.Size = UDim2.new(0.9, 0, 0, 50);
devInfoBox.BackgroundTransparency = 1;
devInfoBox.LayoutOrder = 2;
local devAvatar = Instance.new("ImageLabel", devInfoBox);
devAvatar.Size = UDim2.new(0, 30, 0, 30);
devAvatar.Position = UDim2.new(0.5, -145, 0, 5);
devAvatar.BackgroundTransparency = 1;
devAvatar.Image = "rbxassetid://70602183475196";
local devAvatarCorner = Instance.new("UICorner");
devAvatarCorner.CornerRadius = UDim.new(0, 6);
devAvatarCorner.Parent = devAvatar;
local devNameText = Instance.new("TextLabel", devInfoBox);
devNameText.Size = UDim2.new(0, 220, 0, 30);
devNameText.Position = UDim2.new(0.5, -100, 0, 5);
devNameText.Text = "MainDeveloper/Scripter: CoverEu";
devNameText.Font = Enum.Font.Gotham;
devNameText.TextSize = 14;
devNameText.TextColor3 = currentTheme.text;
devNameText.BackgroundTransparency = 1;
devNameText.TextXAlignment = Enum.TextXAlignment.Left;
local settingsTitleText = Instance.new("TextLabel", settingsArea);
settingsTitleText.Name = "SettingsTitle";
settingsTitleText.Size = UDim2.new(1, 0, 0, 40);
settingsTitleText.Position = UDim2.new(0, 0, 0, 0);
settingsTitleText.Text = "THEMES";
settingsTitleText.Font = Enum.Font.GothamBold;
settingsTitleText.TextSize = 24;
settingsTitleText.TextColor3 = currentTheme.text;
settingsTitleText.BackgroundTransparency = 1;
settingsTitleText.TextXAlignment = Enum.TextXAlignment.Center;
local themeButtonsContainer = Instance.new("Frame", settingsArea);
themeButtonsContainer.Name = "ThemeButtonsContainer";
themeButtonsContainer.Size = UDim2.new(1, 0, 0, 110);
themeButtonsContainer.Position = UDim2.new(0, 0, 0, 45);
themeButtonsContainer.BackgroundTransparency = 1;
local function fixTabCorners()
end
local function createThemeButton(name, position)
	local button = Instance.new("TextButton", themeButtonsContainer);
	button.Name = name .. "ThemeButton";
	button.Size = UDim2.new(0.8, 0, 0, 30);
	button.Position = position;
	button.Text = name;
	button.Font = Enum.Font.GothamBold;
	button.TextSize = 14;
	button.TextColor3 = currentTheme.text;
	button.BackgroundColor3 = currentTheme.secondary;
	local buttonCorner = Instance.new("UICorner");
	buttonCorner.CornerRadius = UDim.new(0, 6);
	buttonCorner.Parent = button;
	button.MouseButton1Click:Connect(function()
		applyTheme(name);
	end);
	return button;
end
function applyTheme(themeName)
	local theme = themes[themeName];
	currentTheme = theme;
	frame.BackgroundColor3 = theme.primary;
	frameBorder.Color = theme.accent;
	suggestionDisplay.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
	suggestionDisplayBorder.Color = theme.accent;
	suggestionText.TextColor3 = theme.text;
	tabsContainer.BackgroundColor3 = theme.primary;
	local selectedTab = nil;
	if mainContentArea.Visible then
		selectedTab = mainTab;
	elseif creditsArea.Visible then
		selectedTab = creditsTab;
	elseif settingsArea.Visible then
		selectedTab = themesTab;
	elseif configSettingsArea.Visible then
		selectedTab = settingsTab;
	end
	mainTab.BackgroundColor3 = ((selectedTab == mainTab) and theme.selected) or theme.secondary;
	creditsTab.BackgroundColor3 = ((selectedTab == creditsTab) and theme.selected) or theme.secondary;
	themesTab.BackgroundColor3 = ((selectedTab == themesTab) and theme.selected) or theme.secondary;
	settingsTab.BackgroundColor3 = ((selectedTab == settingsTab) and theme.selected) or theme.secondary;
	title.TextColor3 = theme.text;
	subTitle.TextColor3 = theme.text;
	mainTab.TextColor3 = theme.text;
	creditsTab.TextColor3 = theme.text;
	themesTab.TextColor3 = theme.text;
	settingsTab.TextColor3 = theme.text;
	creditsTitleText.TextColor3 = theme.text;
	settingsTitleText.TextColor3 = theme.text;
	configSettingsTitleText.TextColor3 = theme.text;
	intelliSenseToggleContainer.BackgroundColor3 = theme.secondary;
	toggleContainerBorder.Color = theme.accent;
	toggleLabel.TextColor3 = theme.text;
	execBtn.BackgroundColor3 = theme.secondary;
	execBtn.TextColor3 = theme.text;
	clearBtn.BackgroundColor3 = theme.secondary;
	clearBtn.TextColor3 = theme.text;
	for _, child in pairs(themeButtonsContainer:GetChildren()) do
		if child:IsA("TextButton") then
			child.BackgroundColor3 = theme.secondary;
			child.TextColor3 = theme.text;
		end
	end
	codeBox.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
	intelliSenseFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
	intelliSenseBorder.Color = theme.accent;
	local titleLabel = intelliSenseFrame:FindFirstChild("TitleLabel");
	if titleLabel then
		titleLabel.TextColor3 = theme.text;
		titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
	end
	for _, child in pairs(suggestionList:GetChildren()) do
		if child:IsA("TextButton") then
			if (child.BackgroundColor3 ~= Color3.fromRGB(60, 60, 100)) then
				child.BackgroundColor3 = Color3.fromRGB(40, 40, 40);
			end
			for _, textLabel in pairs(child:GetChildren()) do
				if textLabel:IsA("TextLabel") then
					if (textLabel.TextSize == 16) then
						textLabel.TextColor3 = theme.text;
					else
						textLabel.TextColor3 = Color3.fromRGB(180, 180, 180);
					end
				end
			end
		end
	end
	keybindContainer.BackgroundColor3 = theme.secondary;
	keybindContainerBorder.Color = theme.accent;
	keybindLabel.TextColor3 = theme.text;
end
local defaultButton = createThemeButton("Default", UDim2.new(0.1, 0, 0, 0));
local crimsonButton = createThemeButton("Crimson", UDim2.new(0.1, 0, 0, 40));
local eliteButton = createThemeButton("Elite", UDim2.new(0.1, 0, 0, 80));
local function setActiveTab(selectedTab)
	mainContentArea.Visible = selectedTab == mainTab;
	creditsArea.Visible = selectedTab == creditsTab;
	settingsArea.Visible = selectedTab == themesTab;
	configSettingsArea.Visible = selectedTab == settingsTab;
	mainTab.BackgroundColor3 = ((selectedTab == mainTab) and currentTheme.selected) or currentTheme.secondary;
	creditsTab.BackgroundColor3 = ((selectedTab == creditsTab) and currentTheme.selected) or currentTheme.secondary;
	themesTab.BackgroundColor3 = ((selectedTab == themesTab) and currentTheme.selected) or currentTheme.secondary;
	settingsTab.BackgroundColor3 = ((selectedTab == settingsTab) and currentTheme.selected) or currentTheme.secondary;
	for _, tab in pairs({mainTab,creditsTab,themesTab,settingsTab}) do
		for _, child in pairs(tab:GetChildren()) do
			if child:IsA("Frame") then
				child.BackgroundColor3 = tab.BackgroundColor3;
			end
		end
	end
end
fixTabCorners();
mainTab.MouseButton1Click:Connect(function()
	setActiveTab(mainTab);
end);
creditsTab.MouseButton1Click:Connect(function()
	setActiveTab(creditsTab);
end);
themesTab.MouseButton1Click:Connect(function()
	setActiveTab(themesTab);
end);
settingsTab.MouseButton1Click:Connect(function()
	setActiveTab(settingsTab);
end);
clearBtn.MouseButton1Click:Connect(function()
	codeBox.Text = "";
end);
execBtn.MouseButton1Click:Connect(function()
	local snippet = codeBox.Text;
	local func, err = loadstring(snippet);
	if not func then
		warn("🔴 Load error:", err);
		return;
	end
	local success, runErr = pcall(func);
	if not success then
		warn("🔴 Runtime error:", runErr);
	end
end);
frame.Active = true;
frame.Draggable = true;
codeBox.FocusLost:Connect(function()
	intelliSenseFrame.Visible = false;
	suggestionDisplay.Visible = false;
	ghostText.Text = "";
	isShowingGhostText = false;
end);
local isUIVisible = true;
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
	if isChangingKeybind then
		if ((input.KeyCode ~= Enum.KeyCode.Unknown) and (input.KeyCode ~= Enum.KeyCode.W) and (input.KeyCode ~= Enum.KeyCode.A) and (input.KeyCode ~= Enum.KeyCode.S) and (input.KeyCode ~= Enum.KeyCode.D) and (input.KeyCode ~= Enum.KeyCode.Space)) then
			currentKeybind = input.KeyCode;
			keybindButton.Text = input.KeyCode.Name;
			keybindButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
			isChangingKeybind = false;
		end
		return;
	end
	if (input.KeyCode == currentKeybind) then
		isUIVisible = not isUIVisible;
		screenGui.Enabled = isUIVisible;
	end
end);