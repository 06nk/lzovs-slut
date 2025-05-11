local HttpService = game:GetService("HttpService")

-- hi porn
local function promptKey()
    if not game:GetService("Players").LocalPlayer then
        repeat wait() until game:GetService("Players").LocalPlayer
    end

    local InputGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    InputGui.Name = "KeyInput"

    local Frame = Instance.new("Frame", InputGui)
    Frame.Size = UDim2.new(0, 300, 0, 100)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -50)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local TextBox = Instance.new("TextBox", Frame)
    TextBox.Size = UDim2.new(1, -20, 0, 30)
    TextBox.Position = UDim2.new(0, 10, 0, 10)
    TextBox.PlaceholderText = "Enter your key"
    TextBox.Text = ""

    local Submit = Instance.new("TextButton", Frame)
    Submit.Size = UDim2.new(1, -20, 0, 30)
    Submit.Position = UDim2.new(0, 10, 0, 50)
    Submit.Text = "Submit"

    local Result = Instance.new("BoolValue")
    Result.Name = "Submitted"

    Submit.MouseButton1Click:Connect(function()
        Result.Value = true
    end)

    repeat wait() until Result.Value
    local enteredKey = TextBox.Text
    InputGui:Destroy()
    return enteredKey
end


local function validateKey(key)
    local success, result = pcall(function()
        return game:HttpGet("https://pastefy.app/NrqXSu66/raw")
    end)

    if success then
        for line in result:gmatch("[^\r\n]+") do
            if line == key then
                return true
            end
        end
    end

    return false
end


local key = promptKey()
if validateKey(key) then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/25f3c728d939976a1349d8602cdbbe2e.lua"))()
else
    game.Players.LocalPlayer:Kick("Invalid key SMD SKIDDDDDDDDDD")
end
