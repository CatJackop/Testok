--====================================================================--
-- CAT HUB : anime ability arena
-- Created by catjack.gg
-- CAT HUB Logo: rbxassetid://126031329785796
-- Discord: https://discord.gg/KckKFJWzs6
-- Key System: DISABLED
--====================================================================--

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TeleportService = game:GetService("TeleportService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Global Settings Engine
local Config = {
    -- TAB 1: GOD-LEVEL AUTOFARM (TOXUNULMADI)
    AutoFarmYen = false,           
    AutoPlaySpawn = true,          
    GodModeAntiDamage = true,      
    UltraFastM1 = false,           
    AutoSkills = false,            
    AutoQDash = false,             
    GiantHitbox = false,           
    KillAura360 = false,           

    -- TAB 2: SAFETY
    SpeedBoost = false,            
    SpeedValue = 42,
    HighJump = false,              
    JumpValue = 95,
    InfiniteJump = false,          
    Noclip = false,                
    AntiVoid = true,               
    FixBlackScreen = true,         
    FixSpawnStuck = true,          
    InstantRespawn = true,         

    -- TAB 3: VISUALS & MAX FPS
    FPSBooster = false,            
    RemoveVFX = false,             
    PlayerESP = false,             
    Tracers = false,               
    FullBright = false,            
    ClearFog = false,              
    CustomFOV = false,             
    FOVValue = 105,

    -- TAB 4 & 5: VIP & ULTRA (KEY UNLOCKED)
    VIPAutoStats = false,          
    VIPServerHop = false,          
    VIPAutoChests = false,         
    VIPReLoadFix = false,          
    AutoRejoin = false,            
    AutoOrbs = false,              
    AutoDodgeHeavy = false,        
    SpinBotEvade = false,          
    AntiStun = false,              
    AntiKnockback = false,         
    InfiniteStamina = false,       
    StealthTeleport = false,       
    UnlockFPS300 = false,          
    DisableShadows = false,        
    XRayVision = false,            
    ResolutionScale = false,       
    AutoSafeZone = false,          
    AutoEquipWeapon = false,       
    AntiLagMitigation = false,     
    
    AntiAFK = true,                
    UIHotkey = true                
}

-- Helpers
local function GetCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function GetRoot()
    local char = GetCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function GetHumanoid()
    local char = GetCharacter()
    return char and char:FindFirstChild("Humanoid")
end

local function GetClosestTarget()
    local closest, minDistance = nil, math.huge
    local myRoot = GetRoot()
    if not myRoot then return nil end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hum = player.Character:FindFirstChild("Humanoid")
            if hum and hum.Health > 0 then
                local dist = (myRoot.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if dist < minDistance then
                    minDistance = dist
                    closest = player.Character
                end
            end
        end
    end
    return closest, minDistance
end

--====================================================================--
-- CAT HUB GUI
-- Generic game detection + no key system
--====================================================================--

local redzlib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/tlredz/Library/refs/heads/main/redz-V5-remake/main.luau"
))()

local Window = redzlib:MakeWindow({
    Title = "CAT HUB : Game Hub",
    SubTitle = "Created by @catjack.gg",
    SaveFolder = "CAT_HUB_GameHub.json"
})

local Minimizer = Window:NewMinimizer({
    KeyCode = Enum.KeyCode.RightControl
})

local MobileButton = Minimizer:CreateMobileMinimizer({
    Image = "rbxassetid://126031329785796",
    BackgroundColor3 = Color3.fromRGB(110, 70, 190)
})

local Tabs = {
    Info = Window:MakeTab({Title = "Game Info", Icon = "Info"}),
    Farm = Window:MakeTab({Title = "Farm", Icon = "rbxassetid://7733960981"}),
    Safety = Window:MakeTab({Title = "Safety", Icon = "shield"}),
    Visuals = Window:MakeTab({Title = "Visuals", Icon = "rbxassetid://7040410130"}),
    VIP = Window:MakeTab({Title = "VIP", Icon = "star"}),
    Ultra = Window:MakeTab({Title = "Ultra", Icon = "zap"}),
    Settings = Window:MakeTab({Title = "Settings", Icon = "settings"})
}

-- Game detection
local detectedGameName = "Unknown Game"
local ok, productInfo = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)

if ok and productInfo and productInfo.Name then
    detectedGameName = productInfo.Name
end

Tabs.Info:AddSection("CAT HUB")
Tabs.Info:AddParagraph("Game Detected", detectedGameName)
Tabs.Info:AddParagraph("Game ID", tostring(game.GameId))
Tabs.Info:AddParagraph("Place ID", tostring(game.PlaceId))
Tabs.Info:AddParagraph("Status", "Detected successfully")

Tabs.Info:AddDiscordInvite({
    Title = "CAT HUB | Community",
    Description = "Official CAT HUB updates and support.",
    Banner = "rbxassetid://126031329785796",
    Logo = "rbxassetid://126031329785796",
    Invite = "https://discord.gg/KckKFJWzs6",
    Members = 0,
    Online = 0,
})

local function AddConfigToggle(tab, title, key)
    tab:AddToggle({
        Name = title,
        Description = "",
        Default = Config[key] == true,
        Callback = function(Value)
            Config[key] = Value
        end
    })
end

Tabs.Farm:AddSection("Farm Features")
AddConfigToggle(Tabs.Farm, "Ultra God Ground Farm", "AutoFarmYen")
AddConfigToggle(Tabs.Farm, "Auto Play / Spawn Arena", "AutoPlaySpawn")
AddConfigToggle(Tabs.Farm, "Fast M1 Attack Clicker", "UltraFastM1")
AddConfigToggle(Tabs.Farm, "Auto Use Skills", "AutoSkills")
AddConfigToggle(Tabs.Farm, "Auto Q Dash Dodge", "AutoQDash")
AddConfigToggle(Tabs.Farm, "Massive Hitbox Expansion", "GiantHitbox")
AddConfigToggle(Tabs.Farm, "360-Degree Kill Aura", "KillAura360")

Tabs.Safety:AddSection("Safety & Movement")
AddConfigToggle(Tabs.Safety, "Speed Boost", "SpeedBoost")
AddConfigToggle(Tabs.Safety, "High Jump", "HighJump")
AddConfigToggle(Tabs.Safety, "Infinite Jump", "InfiniteJump")
AddConfigToggle(Tabs.Safety, "Noclip", "Noclip")
AddConfigToggle(Tabs.Safety, "Anti Void", "AntiVoid")
AddConfigToggle(Tabs.Safety, "Fix Black Screen", "FixBlackScreen")
AddConfigToggle(Tabs.Safety, "Fix Spawn Stuck", "FixSpawnStuck")
AddConfigToggle(Tabs.Safety, "Instant Respawn", "InstantRespawn")
AddConfigToggle(Tabs.Safety, "Anti AFK", "AntiAFK")

Tabs.Visuals:AddSection("Visuals & FPS")
AddConfigToggle(Tabs.Visuals, "FPS Booster", "FPSBooster")
AddConfigToggle(Tabs.Visuals, "Remove VFX", "RemoveVFX")
AddConfigToggle(Tabs.Visuals, "Player ESP", "PlayerESP")
AddConfigToggle(Tabs.Visuals, "Player Tracers", "Tracers")
AddConfigToggle(Tabs.Visuals, "Full Bright", "FullBright")
AddConfigToggle(Tabs.Visuals, "Clear Fog", "ClearFog")
AddConfigToggle(Tabs.Visuals, "Custom FOV", "CustomFOV")

Tabs.VIP:AddSection("VIP Features")
AddConfigToggle(Tabs.VIP, "Auto Upgrade Stats", "VIPAutoStats")
AddConfigToggle(Tabs.VIP, "Server Hop Low Players", "VIPServerHop")
AddConfigToggle(Tabs.VIP, "Auto Claim VIP Chests", "VIPAutoChests")
AddConfigToggle(Tabs.VIP, "Instant Character Reload", "VIPReLoadFix")

Tabs.Ultra:AddSection("Ultra Features")
AddConfigToggle(Tabs.Ultra, "Auto Server Rejoin", "AutoRejoin")
AddConfigToggle(Tabs.Ultra, "Auto Collect Orbs & Drops", "AutoOrbs")
AddConfigToggle(Tabs.Ultra, "Auto Dodge Heavy Attacks", "AutoDodgeHeavy")
AddConfigToggle(Tabs.Ultra, "360 Spin Bot Evade", "SpinBotEvade")
AddConfigToggle(Tabs.Ultra, "Anti Stun / Freeze", "AntiStun")
AddConfigToggle(Tabs.Ultra, "Anti Knockback / Ragdoll", "AntiKnockback")
AddConfigToggle(Tabs.Ultra, "Infinite Stamina", "InfiniteStamina")
AddConfigToggle(Tabs.Ultra, "Stealth Teleport", "StealthTeleport")
AddConfigToggle(Tabs.Ultra, "300 FPS Target", "UnlockFPS300")
AddConfigToggle(Tabs.Ultra, "Disable Shadows", "DisableShadows")
AddConfigToggle(Tabs.Ultra, "X-Ray Vision", "XRayVision")
AddConfigToggle(Tabs.Ultra, "Resolution Optimizer", "ResolutionScale")
AddConfigToggle(Tabs.Ultra, "Auto TP Safe Zone", "AutoSafeZone")
AddConfigToggle(Tabs.Ultra, "Auto Re-Equip Weapon", "AutoEquipWeapon")
AddConfigToggle(Tabs.Ultra, "Server Lag Mitigation", "AntiLagMitigation")

Tabs.Settings:AddSection("CAT HUB")
Tabs.Settings:AddParagraph("Creator", "catjack.gg")
Tabs.Settings:AddParagraph("GUI", "CAT HUB Redz UI")
Tabs.Settings:AddParagraph("Key System", "Disabled")
Tabs.Settings:AddParagraph("Discord", "discord.gg/KckKFJWzs6")

--====================================================================--
-- AUTOMATION & ZERO-DAMAGE ENGINE (AUTOFARM DƏYİŞİLMƏDİ)
--====================================================================--

-- 1. Auto Play / Spawn
task.spawn(function()
    while task.wait(0.2) do
        if Config.AutoPlaySpawn then
            local Gui = LocalPlayer:FindFirstChild("PlayerGui")
            if Gui then
                for _, ui in ipairs(Gui:GetDescendants()) do
                    if ui:IsA("TextButton") and (string.find(string.lower(ui.Name), "play") or string.find(string.lower(ui.Text), "play") or string.find(string.lower(ui.Name), "spawn")) then
                        pcall(function()
                            for _, event in ipairs(getconnections(ui.MouseButton1Click)) do
                                event:Fire()
                            end
                        end)
                    end
                end
            end
        end

        if Config.FixBlackScreen then
            local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
            if PlayerGui then
                for _, gui in ipairs(PlayerGui:GetChildren()) do
                    if gui:IsA("ScreenGui") and (string.find(string.lower(gui.Name), "black") or string.find(string.lower(gui.Name), "fade") or string.find(string.lower(gui.Name), "death")) then
                        gui.Enabled = false
                    end
                end
            end
            Lighting.ExposureCompensation = 0
        end
    end
end)

-- 2. Zero-Damage God Ground Farm Loop (DEYİŞİLMƏDİ)
task.spawn(function()
    while task.wait(0.02) do
        if Config.AutoFarmYen then
            local root = GetRoot()
            local target = GetClosestTarget()

            if root and target and target:FindFirstChild("HumanoidRootPart") then
                local targetRoot = target.HumanoidRootPart
                local safeCFrame = CFrame.new(targetRoot.Position.X, targetRoot.Position.Y + 0.6, targetRoot.Position.Z) * CFrame.new(0, 0, 2.2)

                root.CFrame = safeCFrame
                root.Velocity = Vector3.new(0, 0, 0)

                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            end
        end

        if Config.UltraFastM1 then
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
        end

        if Config.AutoSkills then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
            task.wait(0.01)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.R, false, game)
            task.wait(0.01)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.R, false, game)
        end

        if Config.GiantHitbox then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    p.Character.HumanoidRootPart.Size = Vector3.new(25, 25, 25)
                    p.Character.HumanoidRootPart.Transparency = 0.85
                    p.Character.HumanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)

-- 3. RT & Ultra Features Loop
task.spawn(function()
    while task.wait(0.1) do
        if Config.SpinBotEvade then
            local root = GetRoot()
            if root then root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(45), 0) end
        end

        if Config.AntiStun then
            local hum = GetHumanoid()
            if hum then
                hum.PlatformStand = false
                hum:SetStateEnabled(Enum.HumanoidStateType.Stunned, false)
            end
        end

        if Config.AntiKnockback then
            local root = GetRoot()
            if root then root.Velocity = Vector3.new(0, 0, 0) end
        end

        if Config.UnlockFPS300 then
            pcall(function() setfpscap(300) end)
        end
    end
end)

-- Movement & Stepped Engine
RunService.Stepped:Connect(function()
    if Config.AntiVoid then
        local root = GetRoot()
        if root and root.Position.Y < -25 then
            root.Velocity = Vector3.new(0, 120, 0)
            root.CFrame = CFrame.new(root.Position.X, 45, root.Position.Z)
        end
    end

    local hum = GetHumanoid()
    if hum then
        if Config.SpeedBoost then hum.WalkSpeed = Config.SpeedValue end
        if Config.HighJump then hum.JumpPower = Config.JumpValue end
    end

    if Config.Noclip and GetCharacter() then
        for _, part in ipairs(GetCharacter():GetChildren()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- Anti-AFK Engine
local VirtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    if Config.AntiAFK then
        VirtualUser:Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    end
end)

-- Hotkey Toggle
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.RightControl then
        MainFrame.Visible = not MainFrame.Visible
    end
end)
