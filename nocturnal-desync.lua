 --uhh??????   --yo nigga
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))

local Players, Workspace, RS, Camera, HttpService, GuiService, VirtualInputManager, TweenService, CoreGui, Lighting, Uis, SoundService, LogService = game:GetService("Players"), cloneref(game:GetService("Workspace")), cloneref(game:GetService("RunService")), cloneref(game:GetService("Workspace").CurrentCamera), cloneref(game:GetService("HttpService")), cloneref(game:GetService("GuiService")), cloneref(game:GetService("VirtualInputManager")), cloneref(game:GetService("TweenService")), cloneref(game:GetService("CoreGui")), cloneref(game:GetService("Lighting")), cloneref(game:GetService("UserInputService")), cloneref(game:GetService("SoundService")), cloneref(game:GetService("LogService"))

-- // Vars
local Client, Mouse, GuiOffset = Players.LocalPlayer, Players.LocalPlayer:GetMouse(), GuiService:GetGuiInset().Y
local Script = {Variables = {}, Connections = {}, Desync = {}}
local Target = nil

Script.Variables.AuthEndpoint = "https://pastebin.com/raw/11BGqp2y.txt" -- todo: add--??? ok ill syd
-- im trying to make this free but if an endpoint returns false then it just doesnt work, ok?
Script.Variables.AuthCheckInterval = 60
Script.Variables.IsAuthorized = false
Script.Variables.LastAuthCheck = 0

local function CheckAuthorization()
    local success, result = pcall(function()
        return HttpService:GetAsync(Script.Variables.AuthEndpoint)
    end)
    if success then
        Script.Variables.IsAuthorized = string.lower(result) == "true"
    else
        Script.Variables.IsAuthorized = false
    end
-- eating --cvr ok pookie love you -- look at the bottom niga -ur just 
-- are you fucking speedrunnig it lmao check out the keysystem it is named porno.lua
-- yes ofc
-- i pulled chatgpt cus i forgot how to use pcall np np use cursor next time its better for luaHOW THE FUCK
-- i got banned from it LMAOO ur a war criminal? fr
-- i know right

    Script.Variables.LastAuthCheck = tick()
    return Script.Variables.IsAuthorized
end

CheckAuthorization()

-- how do i make this work only if IsAuthorized is true
-- what are u tryna make i am lost mb i didnt looked at it?
-- keysystem? steal it hmm ohh well its a weird way to make an uhh keysystem i would just use an basic keysystem works with 1 key and 
-- no if the endpoint returns false it just wont work, thats what it should do
-- so skids dont steal it
-- even though its free and obfuscated
-- skids can still use it
-- this isnt a keysystem though

-- it just pings the endpoint and if it returns true it works 

Script.Connections["Csync"] = RS.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(deltatime)

    if tick() - Script.Variables.LastAuthCheck > Script.Variables.AuthCheckInterval then
        CheckAuthorization()
    end
    
    if not Script.Variables.IsAuthorized then
        return
    end

    -- not yet yea
    -- check ms annc
--lol niga tbh this would not work  macsploit? WTFFF AWRWAODJAS WHAT THE FUCK NEXUS RAPE ME IN THE ASS LOLLL
-- just use an basic keysystem make the key named Nocturnal thats all check out porno.lua rq
    -- i love auto complete
    local Character = Client and Client.Character
    if not Character then return end

    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not RootPart then return end
    Script.Desync["Old_CFrame"] = RootPart.CFrame
    local DesyncPos
    local Debug = ""-- so ? wyw to do??? i can  -- see and learn well ask anything  can answer

    if flags["Destroy Cheaters"] then
        local CurrentTime = tick()
        local LastToggle = CurrentTime - Script.Variables.LastTickInVoid
        local Delay
        if Script.Variables.InVoid then
            Delay = flags["DC delay2"] -- Out of void
        else
            Delay = flags["DC delay1"] -- In void
        end
        if LastToggle >= Delay then
            if flags["AlternateDC"] then
                Script.Variables.InVoid = not Script.Variables.InVoid
            else
                Script.Variables.InVoid = true
            end
            Script.Variables.LastTickInVoid = CurrentTime
        end
        
        if Script.Variables.InVoid then
            DesyncPos = CFrame.new(math.random(-2147483647, 2147483647), -math.huge, math.random(-2147483647, 2147483647))
        else
            DesyncPos = Script.Desync["Old_CFrame"]
        end
        Debug = "Destroy Cheaters"
    end


    if DesyncPos then
        Script.Desync["Real_Pos"] = DesyncPos
        RootPart.CFrame = DesyncPos
        RS.RenderStepped:Wait()
        RootPart.CFrame = Script.Desync["Old_CFrame"]
    end
end))
-- this hook is corrupted dont use it
--i sent it broken
-- the other part the up o
--stfu the uhh up part works fine mb its the magic bullets hook its not desync go on i deleted the magic 
-- fml
-- wym? its desync works fine go to desync lab to test it out when u do something or want to test it look to the server rootpart
-- desync lab?
--yea i test or reverse engineer desyncs in there
-- there is some luarph macros delete thoose
-- like lph ect ect.

--hii
-- hello -- hiii 
-- im using vsc insiders
-- its so different
--- nigga