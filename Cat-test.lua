-- Decompiled from MoonSec V3 disassembly
-- (best-effort; control flow may need minor manual cleanup)
-- By ZeroVector101
loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local loadedFn = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local v = localPlayer.Name

if loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Blacklist.lua"))()[game.Players.LocalPlayer.Name] then
    loadedFn:Notify({
        Title = "Blacklist",
        Description = "Hey, " .. v .. "! You are blacklisted!",
    }, {
        OutlineColor = Color3.fromRGB(128, 187, 219),
        Time = 10,
        Type = "default",
    })

    return

end

GetAllPlayers = function(...)
    local config = {}
    local Players = game:GetService("Players")

    for v, v2 in pairs(Players:GetChildren()) do
        table.insert(config, v2.DisplayName .. " (@" .. v2.Name .. ")")
    end

    return config
end
SplitString = function(p0, p1)
    local config = {}
    local v = "%s"

    for v2 in string.gmatch(p0) do
        table.insert(config, v2)
    end

    return config
end
loadedFn:Notify({
    Title = "Welcome",
    Description = "Hey, " .. v .. "! Thanks for using Astral Hub!",
}, {
    OutlineColor = Color3.fromRGB(128, 187, 219),
    Time = 5,
    Type = "default",
})
wait(0.5)
local loadedFn2 = loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/UI-Library/main/Source/Kavo.lua"))()
local v2 = loadedFn2.CreateLib("Astral Hub | V3", "Ocean")
local screenGui = Instance.new("ScreenGui")
local textButton = Instance.new("TextButton")
screenGui.Name = "ToggleGui_V3"
screenGui.Parent = game.CoreGui
textButton.Name = "Toggle"
textButton.Parent = screenGui
textButton.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
textButton.BackgroundTransparency = 0.66
textButton.Position = UDim2.new(0, 0, 0.454706937, 0)
textButton.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
textButton.Font = Enum.Font.SourceSans
textButton.Text = "Toggle"
textButton.TextColor3 = Color3.fromRGB(128, 187, 219)
textButton.TextSize = 24
textButton.TextXAlignment = Enum.TextXAlignment.Left
textButton.Active = true
textButton.Draggable = true
textButton.MouseButton1Click:connect(function()
    loadedFn2:ToggleUI()
end)
local v3 = v2:NewTab("Home"):NewSection("Welcome, " .. v)
local v4 = v2:NewTab("Players"):NewSection("Player")
local v5 = v2:NewTab("Scripts"):NewSection("Scripts")
local v6 = v2:NewTab("FE Scripts"):NewSection("FE")
local v7 = v2:NewTab("Games"):NewSection("Games List:")
local v8 = v2:NewTab("Hubs"):NewSection("Hubs")
local v9 = v2:NewTab("Guis"):NewSection("Guis")
local v10 = v2:NewTab("Admins"):NewSection("Admins")
local v11 = v2:NewTab("Tools"):NewSection("Tools")
v2:NewTab("Credits"):NewSection("Credits to the Owner of Scripts")
v3:NewButton("User : " .. v .. " | " .. localPlayer.UserId)
v3:NewButton("Game : " .. MarketplaceService:GetProductInfo(game.PlaceId).Name .. " | " .. game.PlaceId)
v3:NewButton("Account Age : " .. localPlayer.AccountAge .. " Days")
v3:NewButton("Destroy Toggle GUI", "Destroy the toggle gui", function()
    local CoreGui = game:GetService("CoreGui")

    if CoreGui:FindFirstChild("ToggleGui_V3") then
        local CoreGui2 = game:GetService("CoreGui")
        CoreGui2:FindFirstChild("ToggleGui_V3"):Destroy()
    end
end)
v3:NewKeybind("Toggle Keybind", "Toggle", Enum.KeyCode.F, function()
    loadedFn2:ToggleUI()
end)
v3:NewLabel("Feedback")
v3:NewTextBox("Report Bugs", "No Info", function(p0)
    _G.Discord_UserID = "729262739490471976"
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local v = os.date("!*t", os.time() - localPlayer.AccountAge * 86400)

    if localPlayer.AccountAge <= 365 then
    else
        if 365 <= localPlayer.AccountAge then

            if true == true then
            else
            end

            local HttpService = game:GetService("HttpService")
            local config = {}
            config.username = "Astral Hub | Report Bugs"
            config.avatar_url = "https://cdn.discordapp.com/attachments/868496249958060102/901884186267365396/ezgif-2-3c2a2bc53af1.gif"

            if _G.Discord_UserID ~= "" and _G.Discord_UserID ~= nil then

                config.content = " "
                local config2 = {config3}
                local config3 = {}
                config3.color = tonumber(tostring("0x32CD32"))
                config3.title = "Report Bugs"
                config3.thumbnail = {
                    url = HttpService:JSONDecode(game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))).data[1].imageUrl,
                }
                local config5 = {
                    config6,
                    config7,
                    config8,
                    config9,
                    config10,
                    config11,
                    config12,
                    config13,
                    config14,
                    config15,
                }
                local config6 = {}
                config6.name = "Message"
                config6.value = p0
                config6.inline = true
                local config7 = {}
                config7.name = "Username"
                config7.value = "||" .. localPlayer.Name .. "||"
                config7.inline = true
                local config8 = {}
                config8.name = "Display Name"
                config8.value = localPlayer.DisplayName
                config8.inline = true
                local config9 = {}
                config9.name = "UID"
                config9.value = "||[" .. localPlayer.UserId .. "](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile") .. ")||"
                config9.inline = true
                local config10 = {}
                config10.name = "Game Id"
                config10.value = "[" .. game.PlaceId .. "](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) .. ")"
                config10.inline = true
                local config11 = {}
                config11.name = "Game Name"
                local MarketplaceService = game:GetService("MarketplaceService")
                config11.value = MarketplaceService:GetProductInfo(game.PlaceId).Name
                config11.inline = true
                local config12 = {}
                config12.name = "Executor Used"
                config12.value = "Unknown"
                config12.inline = true
                local config13 = {}
                config13.name = "Alt"
                config13.value = "Maybe"
                config13.inline = true
                local config14 = {}
                config14.name = "Account Age"
                config14.value = localPlayer.AccountAge .. " Day(s)"
                config14.inline = true
                local config15 = {}
                config15.name = "Date Joined"
                config15.value = v.day .. "/" .. v.month .. "/" .. v.year
                config15.inline = true
                config3.fields = config5
                config3.timestamp = os.date("%Y-%m-%dT%X.000Z")
                config.embeds = config2

                request = syn.request
                local config16 = {}
                config16.Url = "https://discord.com/api/webhooks/1077643957846159482/8zBO5JnpjEjVcR2EIxw-HIvCQ6OYcpVCkJ1rg6tJqHoPI4ALvtZmWf9Mkkg_2PJBZ75o"
                config16.Method = "POST"
                local config17 = {}
                config17["Content-Type"] = "application/json"
                config16.Headers = config17
                config16.Body = game.HttpService:JSONEncode(config)
                request(config16)

                return

            end
        end
    end
end)
v3:NewTextBox("Suggestions", "No Info", function(p0)
    _G.Discord_UserID = "729262739490471976"
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local v = os.date("!*t", os.time() - localPlayer.AccountAge * 86400)

    if localPlayer.AccountAge <= 365 then
    else
        if 365 <= localPlayer.AccountAge then

            if true == true then
            else
            end

            local HttpService = game:GetService("HttpService")
            local config = {}
            config.username = "Astral Hub | Suggestions"
            config.avatar_url = "https://cdn.discordapp.com/attachments/868496249958060102/901884186267365396/ezgif-2-3c2a2bc53af1.gif"

            if _G.Discord_UserID ~= "" and _G.Discord_UserID ~= nil then

                config.content = " "
                local config2 = {config3}
                local config3 = {}
                config3.color = tonumber(tostring("0x32CD32"))
                config3.title = "Suggestions"
                config3.thumbnail = {
                    url = HttpService:JSONDecode(game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))).data[1].imageUrl,
                }
                local config5 = {
                    config6,
                    config7,
                    config8,
                    config9,
                    config10,
                    config11,
                    config12,
                    config13,
                    config14,
                    config15,
                }
                local config6 = {}
                config6.name = "Message"
                config6.value = p0
                config6.inline = true
                local config7 = {}
                config7.name = "Username"
                config7.value = "||" .. localPlayer.Name .. "||"
                config7.inline = true
                local config8 = {}
                config8.name = "Display Name"
                config8.value = localPlayer.DisplayName
                config8.inline = true
                local config9 = {}
                config9.name = "UID"
                config9.value = "||[" .. localPlayer.UserId .. "](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile") .. ")||"
                config9.inline = true
                local config10 = {}
                config10.name = "Game Id"
                config10.value = "[" .. game.PlaceId .. "](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) .. ")"
                config10.inline = true
                local config11 = {}
                config11.name = "Game Name"
                local MarketplaceService = game:GetService("MarketplaceService")
                config11.value = MarketplaceService:GetProductInfo(game.PlaceId).Name
                config11.inline = true
                local config12 = {}
                config12.name = "Executor Used"
                config12.value = "Unknown"
                config12.inline = true
                local config13 = {}
                config13.name = "Alt"
                config13.value = "Maybe"
                config13.inline = true
                local config14 = {}
                config14.name = "Account Age"
                config14.value = localPlayer.AccountAge .. " Day(s)"
                config14.inline = true
                local config15 = {}
                config15.name = "Date Joined"
                config15.value = v.day .. "/" .. v.month .. "/" .. v.year
                config15.inline = true
                config3.fields = config5
                config3.timestamp = os.date("%Y-%m-%dT%X.000Z")
                config.embeds = config2

                request = syn.request
                local config16 = {}
                config16.Url = "https://discord.com/api/webhooks/1077643957846159482/8zBO5JnpjEjVcR2EIxw-HIvCQ6OYcpVCkJ1rg6tJqHoPI4ALvtZmWf9Mkkg_2PJBZ75o"
                config16.Method = "POST"
                local config17 = {}
                config17["Content-Type"] = "application/json"
                config16.Headers = config17
                config16.Body = game.HttpService:JSONEncode(config)
                request(config16)

                return

            end
        end
    end
end)
v3:NewTextBox("Feedback", "No Info", function(p0)
    _G.Discord_UserID = "729262739490471976"
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local v = os.date("!*t", os.time() - localPlayer.AccountAge * 86400)

    if localPlayer.AccountAge <= 365 then
    else
        if 365 <= localPlayer.AccountAge then

            if true == true then
            else
            end

            local HttpService = game:GetService("HttpService")
            local config = {}
            config.username = "Astral Hub | Feedback"
            config.avatar_url = "https://cdn.discordapp.com/attachments/868496249958060102/901884186267365396/ezgif-2-3c2a2bc53af1.gif"

            if _G.Discord_UserID ~= "" and _G.Discord_UserID ~= nil then

                config.content = " "
                local config2 = {config3}
                local config3 = {}
                config3.color = tonumber(tostring("0x32CD32"))
                config3.title = "Feedback"
                config3.thumbnail = {
                    url = HttpService:JSONDecode(game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))).data[1].imageUrl,
                }
                local config5 = {
                    config6,
                    config7,
                    config8,
                    config9,
                    config10,
                    config11,
                    config12,
                    config13,
                    config14,
                    config15,
                }
                local config6 = {}
                config6.name = "Message"
                config6.value = p0
                config6.inline = true
                local config7 = {}
                config7.name = "Username"
                config7.value = "||" .. localPlayer.Name .. "||"
                config7.inline = true
                local config8 = {}
                config8.name = "Display Name"
                config8.value = localPlayer.DisplayName
                config8.inline = true
                local config9 = {}
                config9.name = "UID"
                config9.value = "||[" .. localPlayer.UserId .. "](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile") .. ")||"
                config9.inline = true
                local config10 = {}
                config10.name = "Game Id"
                config10.value = "[" .. game.PlaceId .. "](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) .. ")"
                config10.inline = true
                local config11 = {}
                config11.name = "Game Name"
                local MarketplaceService = game:GetService("MarketplaceService")
                config11.value = MarketplaceService:GetProductInfo(game.PlaceId).Name
                config11.inline = true
                local config12 = {}
                config12.name = "Executor Used"
                config12.value = "Unknown"
                config12.inline = true
                local config13 = {}
                config13.name = "Alt"
                config13.value = "Maybe"
                config13.inline = true
                local config14 = {}
                config14.name = "Account Age"
                config14.value = localPlayer.AccountAge .. " Day(s)"
                config14.inline = true
                local config15 = {}
                config15.name = "Date Joined"
                config15.value = v.day .. "/" .. v.month .. "/" .. v.year
                config15.inline = true
                config3.fields = config5
                config3.timestamp = os.date("%Y-%m-%dT%X.000Z")
                config.embeds = config2

                request = syn.request
                local config16 = {}
                config16.Url = "https://discord.com/api/webhooks/1077643957846159482/8zBO5JnpjEjVcR2EIxw-HIvCQ6OYcpVCkJ1rg6tJqHoPI4ALvtZmWf9Mkkg_2PJBZ75o"
                config16.Method = "POST"
                local config17 = {}
                config17["Content-Type"] = "application/json"
                config16.Headers = config17
                config16.Body = game.HttpService:JSONEncode(config)
                request(config16)

                return

            end
        end
    end
end)
v3:NewLabel("Updates!")
v3:NewButton("[+] More Games")
v4:NewToggle("Character Highlight", "No Info", function(p0)
    getgenv().enabled = p0
    getgenv().filluseteamcolor = true
    getgenv().outlineuseteamcolor = true
    getgenv().fillcolor = Color3.new(0, 0, 0)
    getgenv().outlinecolor = Color3.new(1, 1, 1)
    getgenv().filltrans = 0.5
    getgenv().outlinetrans = 0.5
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/Highlight-ESP.lua"))()
end)
v4:NewTextBox("Hitbox Size", "No Info", function(p0)
    getgenv().HitboxSize = p0
end)
v4:NewToggle("Hitbox (Everyone)", "No Info", function(p0)
    getgenv().HitboxEveryone = p0
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:connect(function(...)
        if HitboxEveryone == true then
            local Players = game:GetService("Players")

            for v, v2 in next(Players:GetPlayers) do
                local Players2 = game:GetService("Players")

                if v2.Name ~= Players2.LocalPlayer.Name then
                    pcall(function(...)
                        v2.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                        v2.Character.HumanoidRootPart.Transparency = 0.7
                        v2.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                        v2.Character.HumanoidRootPart.Material = "Neon"
                        v2.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        else
            local Players3 = game:GetService("Players")

            for v3, v4 in next(Players3:GetPlayers) do
                local Players4 = game:GetService("Players")

                if v4.Name ~= Players4.LocalPlayer.Name then
                    pcall(function(...)
                        v4.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        v4.Character.HumanoidRootPart.Transparency = 1
                        v4.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
                        v4.Character.HumanoidRootPart.Material = "Plastic"
                        v4.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
v4:NewToggle("Hitbox (Enemy Only)", "No Info", function(p0)
    getgenv().HitboxEnemyOnly = p0
    local RunService = game:GetService("RunService")
    RunService.RenderStepped:connect(function(...)
        if HitboxEnemyOnly == true then
            local Players = game:GetService("Players")

            for v, v2 in next(Players:GetPlayers) do
                local Players2 = game:GetService("Players")

                if Players2.LocalPlayer.Team ~= v2.Team then
                    pcall(function(...)
                        v2.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                        v2.Character.HumanoidRootPart.Transparency = 0.7
                        v2.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                        v2.Character.HumanoidRootPart.Material = "Neon"
                        v2.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        else
            local Players3 = game:GetService("Players")

            for v3, v4 in next(Players3:GetPlayers) do
                local Players4 = game:GetService("Players")

                if v4.Name ~= Players4.LocalPlayer.Name then
                    pcall(function(...)
                        v4.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                        v4.Character.HumanoidRootPart.Transparency = 1
                        v4.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
                        v4.Character.HumanoidRootPart.Material = "Plastic"
                        v4.Character.HumanoidRootPart.CanCollide = false
                    end)
                end
            end
        end
    end)
end)
local v12 = v4:NewDropdown("Teleport To A Player", "No Info", GetAllPlayers(), function(p0)
    pcall(function()
        local Players = game:GetService("Players")
        localPlayer.Character.HumanoidRootPart.CFrame = Players[SplitString(p0, " ")[1]].Character.HumanoidRootPart.CFrame
    end)
end)
local Players2 = game:GetService("Players")
Players2.PlayerAdded:Connect(function(p0)
    v12:Refresh()
end)
local Players3 = game:GetService("Players")
Players3.PlayerRemoving:Connect(function(p0)
    v12:Refresh()
end)
v4:NewLabel("LocalPlayer")
v4:NewTextBox("Set WalkSpeed", "WalkSpeed", function(p0)
    pcall(function()
        localPlayer.Character.Humanoid.WalkSpeed = p0
    end)
end)
v4:NewTextBox("Set JumpPower", "JumpPower", function(p0)
    localPlayer.Character.Humanoid.JumpPower = p0
end)
v4:NewSlider("Fov", "Field Of View", 120, 70, function(p0)
    game.Workspace.CurrentCamera.FieldOfView = p0
end)
v4:NewToggle("Noclip", "can go through wall", function(p0)
    _G.Noclip = p0

    while true do

        if _G.Noclip == true then
            local RunService = game:GetService("RunService")
            RunService.Stepped:wait()
            game.Players.LocalPlayer.Character.Head.CanCollide = false
            game.Players.LocalPlayer.Character.Torso.CanCollide = false
        end
    end
end)
v4:NewToggle("Infinite Jump", "Infinite Jump", function(p0)
    _G.InfJ = p0
    local UserInputService = game:GetService("UserInputService")
    UserInputService.JumpRequest:connect(function()
        if _G.InfJ == true then
            local Players = game:GetService("Players")
            Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)
v5:NewButton("Anti Fling", "Anti fling", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/B2DCzPeD"))()
end)
v5:NewButton("Anti Attach", "Remove Your Right Arm", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/VcskV/main/Scripts/Anti-Attach"))()
end)
v5:NewButton("Shiftlock For Mobile", "Shiftlock", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/WQ9NPeDS"))()
end)
v5:NewButton("Hitbox Expander", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
end)
v5:NewButton("Effects Disabler (Anti Lag)", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/EffectsDisabler.lua"))()
end)
v5:NewButton("FE Yeet Gui V4", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/FEYeetGuiV4.lua"))()
end)
v5:NewButton("Give Tools", "No Info", function()
    func_d854d2fd(Lighting)
    func_1ca320ab(ReplicatedStorage)
end)
v5:NewButton("Mobile Fly", "No Info", function()
    if game.PlaceId == 2788229376 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/DaHood/AntiCheatBypass.lua"))()
    end

    loadstring(game:HttpGet("https://gist.githubusercontent.com/meozoneYT/949a2c8c33bfff565b6ad58c1fb47dea/raw/9212fadff6799ba58dd1d507d3fcadadaeb3bec9/arceus%2520x%2520fly2.1", true))()
end)
v5:NewButton("Mobile Fly (Better)", "No Info", function()
    if game.PlaceId == 2788229376 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/DaHood/AntiCheatBypass.lua"))()
    end

    loadstring(game:HttpGet("https://pastebin.com/raw/gaz0U0XX"))()
end)
v5:NewButton("R15 To R6", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/Scripts/main/R15-To-R6.lua"))()
end)
v5:NewButton("Walk On Walls", "No Info", function()
    loadstring(game:HttpGetAsync("https://pastebin.com/raw/RY9cBbdG"))()
end)
v5:NewButton("Keyboard", "Credits to the Owner", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
end)
v5:NewButton("Keyboard(2)", "Credits to the Owner", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/SxgKjiRT", true))()
end)
v5:NewButton("Simple Spy", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/SimpleSpy.lua"))()
end)
v5:NewButton("Remote Spy", "Credits to the Owner", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/harisprofanny/d/main/Protected.lua%20(22).txt"))()
end)
v5:NewButton("Netless", "No Info", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/vf1d0baT"))()
end)
v6:NewButton("FE VR(Execute Netless First)", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/Test-3/main/Test-3"))()
end)
v6:NewButton("FE Cat", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/FE-Cat/main/FE-Cat"))()
end)
v6:NewButton("FE SCP-096", "Hats Needed", function()
    loadstring(game:HttpGet("https://pastebin.com/EM3gWpGZ"))()
end)
v6:NewButton("FE Baller V2", "Hat : Red Stickman Head//Credits - scriptifer#9511", function()
    loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Lowerrated/roblox-fe-baller-script/main/main"))()
end)
v6:NewButton("FE Snake", "No Hats Needed!", function()
    loadstring(game:HttpGet("https://pastefy.ga/tWBTcE4R/raw", true))()
end)
v6:NewButton("FE Fake Gorilla Tag V1", "Work for R6/R15 | Controls : z x c q", function()
    loadstring(game:HttpGet("https://pastefy.ga/osEThPw1/raw", true))()
end)
local _upv0 = localPlayer.Character
v6:NewButton("FE Hats On A Leash", "No Info", function(...)
    for v, v2 in pairs(_upv0:getChildren()) do

        if v2.ClassName == "Accessory" then

            for v3, v4 in pairs(v2:GetDescendants()) do

                if v4.ClassName == "Attachment" then
                    local ropeConstraint = Instance.new("RopeConstraint")
                    s = ropeConstraint
                    v4.Parent.CanCollide = true
                    s.Parent = _upv0.HumanoidRootPart
                    s.Attachment1 = v4
                    s.Attachment0 = _upv0.Head.FaceCenterAttachment
                    s.Visible = true
                    s.Length = 10
                    v2.Handle.AccessoryWeld:Destroy()
                end
            end
        end
    end
end)
v6:NewButton("FE Fake Lag", "FE", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/VM3b0Thg"))()
end)
v6:NewButton("FE Free Tools Gamepass", "No Info", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/h1MBUTui", true))()
end)
v7:NewButton("Rejoin", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Server Hop", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/ServerHop.lua"))()
end)
v7:NewLabel("Arsenal")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(286090429)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("PWNERS HUB", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Maikderninja/Maikderninja/main/PWNERHUB.lua"))()
end)
v7:NewButton("Darkrai X", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Arsenal/LessLaggy"))()
end)
v7:NewLabel("BedWars")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(6872265039)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Vape V4 + Infinite Jumps", "Credits - 7GrandDad and Vcsk0", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/VcskV/main/Games/Bedwars/b.lua", true))()
end)
v7:NewLabel("Blox Fruits")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(2753915549)
end)
v7:NewButton("HoHo Hub", "Also Works On Other Supported Games!", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
end)
v7:NewButton("ThunderZ", "Credits to the Owner", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/StringV2/StringHub/main/BF.txt", true))()
end)
v7:NewLabel("Brookhaven������RP")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(4924922222)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Ice Hub", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
end)
v7:NewLabel("Combat Warriors")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(4282985734)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("nova.xyz", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/NEW_NOVA"))()
end)
v7:NewLabel("Chaos")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(6441847031)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Chaos", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/1111-ssss/Chaos_Script/main/Chaos_script.txt"))()
end)
v7:NewLabel("DOORS ������️")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(6516141723)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Darkrai X", "Credits - GamingScripter", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Doors"))()
end)
v7:NewLabel("Da Hood")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(2788229376)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("SwagMode", "Credits to the Owner", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002"))()
end)
v7:NewButton("NukerMode", "Credits to the Owner", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Allvideo/test/main/Whitelist.txt"))()
end)
v7:NewButton("SPACEX", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/spacexrandom/Lua/main/DaHood", true))()
end)
v7:NewLabel("����� Evade")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(9872472334)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Darkrai X", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/Darkrai-X/main/Games/Evade"))()
end)
v7:NewLabel("Murder Mystery 2")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(142823291)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Ski Hub", "No Info", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/mT10xnt7"))()
end)
v7:NewLabel("No-Scope Arcade")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(6407649031)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("soon maybe", "No Info", function()
    print("No.")
end)
v7:NewLabel("Pet Simulator X")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(7722306047)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Project WD (Key needed)", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Muhammad6196/Project-WD/main/Mainstring.lua"))()
end)
v7:NewButton("Trade Scam (ONLY USE ON ALT)", "No Info", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/TPEPQ2Eu"))()
end)
v7:NewLabel("Phantom Forces")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(292439477)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Ski Hub", "No Info", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/mT10xnt7"))()
end)
v7:NewLabel("Pop It Trading")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(7346416636)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("Astral Hub", "Made by !vcsk0#1516", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Games/Pop-It-Trading/main.lua"))()
end)
v7:NewButton("Shield", "Made by iShield", function()
    hookfunction(game.Players.LocalPlayer.IsInGroup, function()
        return true
    end)
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Bypassed",
        Text = "Bypassed group!",
        Duration = 4,
    })
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iShield2005/scripts/master/ppt"))()
end)
v7:NewLabel("Prison Life")
v7:NewButton("Teleport to the game", "No Info", function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(155615604)
    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("PRISONWARE v1.3", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
end)
v7:NewButton("SeptexAdmin", "Credits to the Owner", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/XTheMasterX/Scripts/Main/PrisonLife", true))()
end)
v7:NewLabel("Strucid")
v7:NewButton("Teleport to the game", "No Info", function()
    local UserInputService = game:GetService("UserInputService")

    if UserInputService.TouchEnabled then
        local TeleportService = game:GetService("TeleportService")
        TeleportService:Teleport(3632132819)
    else
        local TeleportService2 = game:GetService("TeleportService")
        TeleportService2:Teleport(2377868063)
    end

    queue_on_teleport("
loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua"))()
")
end)
v7:NewButton("DARKHUB (Key Needed)", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomAdamYT/DarkHub/master/Init", true))()
end)
v7:NewButton("Copy Key Link", "No Info", function(...)
    setclipboard("https://darkhub-v4.maxt.church/")
end)
v8:NewButton("Universal FE", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/Script"))()
end)
v8:NewButton("Games HUB V5", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TakeModzz/Games-Hub-V5-Selector-Fixed/main/Games"))()
end)
v8:NewButton("Ice Hub", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
end)
v8:NewButton("Fire X Hub (No Hat Version)", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tyreltrijo/firex/main/firex"))()
end)
v8:NewButton("HUBZ", "FE R6 Animation", function()
    loadstring(game:HttpGet("https://textbin.net/raw/k3sjvw3vrq"))()
end)
v8:NewButton("Hat Hub", "No Info", function()
    loadstring(game:HttpGet("https://textbin.net/raw/rvohv1nvuf"))()
end)
v8:NewButton("HoHo Hub", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
end)
v8:NewButton("B_Genesis", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/raw/main/B_Genesis"))()
end)
v8:NewButton("RedGhost Hub", "No Info", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/WFKSRG6m"))()
end)
v8:NewButton("BritishHub V6", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YourLocalNzi/Ye/main/BHob6", true))()
end)
v8:NewButton("Pendulum Hub", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua"))()
end)
v8:NewButton("VHub", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Quan8008/V-Hub/Master/Launch-Screen.lua"))()
end)
v8:NewButton("DarkX Hub", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/test-2/main/Test-2"))()
end)
v8:NewButton("DarkGhost Hub", "Password : GhostPlayer", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/PY9SMdpY"))()
end)
v8:NewButton("DomainX Hub", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/DomainX/main/source", true))()
end)
v8:NewButton("FEBoomboxHub", "No Info", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/0QYXRcnm"))()
end)
v9:NewButton("RTX Gui | V3.1.1", "Credits - ImPatrick", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/0G3C94Aw", true))()
end)
v9:NewButton("Free gamepasses gui", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/Scripts/main/Free-gamepasses-gui.lua"))()
end)
v9:NewButton("FEAG", "No Info", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/Scripts/main/FEAG.lua"))()
end)
v10:NewButton("Infinite Yield", "Fe", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
v10:NewButton("Fates Admin", "Fe", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
end)
v10:NewButton("IV AdminV2.6.0", "Fe", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BloodyBurns/Hexx/main/Iv%20Admin/Admin%202.lua"))()
end)
v10:NewButton("Reviz Admin", "Fe", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N", true))()
end)
v10:NewButton("FrostMare v1", "No Info", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Lqmx6Eiy", true))()
end)
v11:NewButton("Punch Tool (Fling)", "No Info", function()
    loadstring(game:HttpGet("https://pastefy.ga/GvnHVjT5/raw", true))()
end)
v11:NewButton("Super Tools", "Tools", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/sQWeMuB0"))()
end)
v11:NewButton("F3X", "Not FE", function()
    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)
v11:NewButton("Telekinesis", "FE", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/b/main/Test"))()
end)
v11:NewButton("Invisible Tools", "invisible", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
end)
_G.Discord_UserID = "729262739490471976"
local Players4 = game:GetService("Players")
local localPlayer2 = Players4.LocalPlayer
local v13 = os.date("!*t", os.time() - localPlayer2.AccountAge * 86400)

if localPlayer2.AccountAge <= 365 then
else
    if 365 <= localPlayer2.AccountAge then

        if true == true then
        else
        end

        local HttpService = game:GetService("HttpService")
        local config5 = {}
        config5["username"] = "Astral Hub"
        config5["avatar_url"] = "https://cdn.discordapp.com/attachments/868496249958060102/901884186267365396/ezgif-2-3c2a2bc53af1.gif"

        if _G.Discord_UserID ~= "" and _G.Discord_UserID ~= nil then

            config5["content"] = " "
            local config6 = {config7}
            local config7 = {}
            config7["color"] = tonumber(tostring("0x32CD32"))
            config7["title"] = "This guy execute your script."
            local config8 = {}
            config8["url"] = HttpService:R49(game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))).data[1].imageUrl
            config7["thumbnail"] = config8
            local config9 = {
                config10,
                config11,
                config12,
                config13,
                config14,
                config15,
                config16,
                config17,
                config18,
            }
            local config10 = {}
            config10["name"] = "Username"
            config10["value"] = "||" .. localPlayer2.Name .. "||"
            config10["inline"] = true
            local config11 = {}
            config11["name"] = "Display Name"
            config11["value"] = localPlayer2.DisplayName
            config11["inline"] = true
            local config12 = {}
            config12["name"] = "UID"
            config12["value"] = "||[" .. localPlayer2.UserId .. "](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile") .. ")||"
            config12["inline"] = true
            local config13 = {}
            config13["name"] = "Game Id"
            config13["value"] = "[" .. game.PlaceId .. "](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) .. ")"
            config13["inline"] = true
            local config14 = {}
            config14["name"] = "Game Name"
            local MarketplaceService2 = game:GetService("MarketplaceService")
            config14["value"] = MarketplaceService2:GetProductInfo(game.PlaceId).Name
            config14["inline"] = true
            local config15 = {}
            config15["name"] = "Executor Used"
            config15["value"] = "Unknown"
            config15["inline"] = true
            local config16 = {}
            config16["name"] = "Alt"
            config16["value"] = "Maybe"
            config16["inline"] = true
            local config17 = {}
            config17["name"] = "Account Age"
            config17["value"] = localPlayer2.AccountAge .. " Day(s)"
            config17["inline"] = true
            local config18 = {}
            config18["name"] = "Date Joined"
            config18["value"] = v13.day .. "/" .. v13.month .. "/" .. v13.year
            config18["inline"] = true
            config7["fields"] = config9
            config7["timestamp"] = os.date("%Y-%m-%dT%X.000Z")
            config5["embeds"] = config6

            request = syn.request
            local config19 = {}
            config19["Url"] = "https://discord.com/api/webhooks/1063715649580449812/MVErQxKIRwnR-V2gQcMpDm0tCJJQRD0FCsb7FE0nGgBKnkh7A3bRO1yf8SsLHeoBrkp7"
            config19["Method"] = "POST"
            local config20 = {}
            config20["Content-Type"] = "application/json"
            config19["Headers"] = config20
            config19["Body"] = game.HttpService:R54(config5)
            request(config19)

            return

        end
    end
end

local function func_1ca320ab(p0)

    for v, v2 in pairs(p0:GetChildren()) do

        if not (v2:IsA("Tool")) then

            if v2:IsA("HopperBin") then
                local Players = game:GetService("Players")
                v2:Clone().Parent = Players.LocalPlayer:FindFirstChildOfClass("Backpack")
            end

            func_d854d2fd(v2)
        end

        return

    end
end

local function func_d854d2fd(p0)

    for v, v2 in pairs(p0:GetChildren()) do

        if not (v2:IsA("Tool")) then

            if v2:IsA("HopperBin") then
                local Players = game:GetService("Players")
                v2:Clone().Parent = Players.LocalPlayer:FindFirstChildOfClass("Backpack")
            end

            v0(v2)
        end

        return

    end
end
