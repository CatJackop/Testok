-- CAT HUB Aim Assist / Camera Lock
-- Credit: catjack.gg
-- Designed for use in your own Roblox Studio game.

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local CONFIG = {
    CameraLockRange = 1500,
    TracerRange = 1500,
    TeleportRange = 400,
    AimFOV = 150, -- pixels
    AimAssistStrength = 0.15,
    BehindDistance = 5,
    FPSBooster = true,
}

local state = {
    CameraLock = false,
    Tracer = false,
    AimAssist = false,
    NPCCameraLock = false,
    TeleportBehind = false,
    FlashStep = false,
    LockedTarget = nil,
}

local gui = Instance.new("ScreenGui")
gui.Name = "CAT_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.fromOffset(280, 420)
main.Position = UDim2.new(0.5, -140, 0.5, -187)
main.BackgroundColor3 = Color3.fromRGB(35, 25, 55)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundTransparency = 1
title.Text = "CAT HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.Parent = main

local credit = Instance.new("TextLabel")
credit.Position = UDim2.new(0, 0, 0, 39)
credit.Size = UDim2.new(1, 0, 0, 20)
credit.BackgroundTransparency = 1
credit.Text = "Credit: catjack.gg"
credit.TextColor3 = Color3.fromRGB(190, 180, 210)
credit.TextSize = 12
credit.Font = Enum.Font.Gotham
credit.Parent = main

local targetLabel = Instance.new("TextLabel")
targetLabel.Position = UDim2.new(0, 10, 0, 62)
targetLabel.Size = UDim2.new(1, -20, 0, 25)
targetLabel.BackgroundTransparency = 1
targetLabel.Text = "Target: None"
targetLabel.TextColor3 = Color3.new(1, 1, 1)
targetLabel.TextSize = 13
targetLabel.Font = Enum.Font.Gotham
targetLabel.Parent = main

local function createButton(text, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -30, 0, 38)
    button.Position = UDim2.new(0, 15, 0, y)
    button.BackgroundColor3 = Color3.fromRGB(70, 50, 100)
    button.BorderSizePixel = 0
    button.Text = text .. ": OFF"
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.Font = Enum.Font.GothamSemibold
    button.AutoButtonColor = true
    button.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 9)
    c.Parent = button

    button.Activated:Connect(function()
        local original = button.Size
        local pressed = UDim2.new(original.X.Scale, original.X.Offset - 4, original.Y.Scale, original.Y.Offset - 2)
        TweenService:Create(button, TweenInfo.new(0.07, Enum.EasingStyle.Quad), {Size = pressed}):Play()
        task.delay(0.07, function()
            TweenService:Create(button, TweenInfo.new(0.12, Enum.EasingStyle.Back), {Size = original}):Play()
        end)
    end)

    return button
end

local cameraButton = createButton("Camera Lock", 95)
local tracerButton = createButton("Tracer", 140)
local aimButton = createButton("Aim Assist", 185)
local npcCameraButton = createButton("NPC Camera Lock", 230)
local teleportButton = createButton("Teleport Behind", 275)
local flashButton = createButton("Flash Step", 320)
local fpsButton = createButton("FPS Booster", 365)

local function updateButton(button, name, enabled)
    button.Text = name .. ": " .. (enabled and "ON" or "OFF")
    button.BackgroundColor3 = enabled
        and Color3.fromRGB(95, 65, 135)
        or Color3.fromRGB(70, 50, 100)
end

local function getCharacter(plr)
    local character = plr.Character
    if not character then return nil end
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local root = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or humanoid.Health <= 0 or not root then return nil end
    return character, root
end

local function getNearestTarget(maxDistance)
    local _, myRoot = getCharacter(player)
    if not myRoot then return nil end

    local nearest, nearestDistance = nil, maxDistance

    for _, other in ipairs(Players:GetPlayers()) do
        if other ~= player then
            local character, root = getCharacter(other)
            if character and root then
                local distance = (root.Position - myRoot.Position).Magnitude
                if distance <= nearestDistance then
                    nearest = other
                    nearestDistance = distance
                end
            end
        end
    end

    return nearest
end

local function getNearestNPC(maxDistance)
    local _, myRoot = getCharacter(player)
    if not myRoot then return nil end
    local nearest, nearestDistance = nil, maxDistance

    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and not Players:GetPlayerFromCharacter(obj) then
            local humanoid = obj:FindFirstChildOfClass("Humanoid")
            local root = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart
            if humanoid and humanoid.Health > 0 and root and root:IsA("BasePart") then
                local distance = (root.Position - myRoot.Position).Magnitude
                if distance <= nearestDistance then
                    nearest, nearestDistance = obj, distance
                end
            end
        end
    end
    return nearest
end

local function getNPCRoot(npc)
    if not npc then return nil end
    local humanoid = npc:FindFirstChildOfClass("Humanoid")
    local root = npc:FindFirstChild("HumanoidRootPart") or npc.PrimaryPart
    if humanoid and humanoid.Health > 0 and root and root:IsA("BasePart") then
        return root
    end
    return nil
end

local function setTarget(target)
    state.LockedTarget = target
    targetLabel.Text = "Target: " .. (target and target.Name or "None")
end

cameraButton.Activated:Connect(function()
    state.CameraLock = not state.CameraLock
    if state.CameraLock then
        setTarget(getNearestTarget(CONFIG.CameraLockRange))
    else
        setTarget(nil)
    end
    updateButton(cameraButton, "Camera Lock", state.CameraLock)
end)

aimButton.Activated:Connect(function()
    state.AimAssist = not state.AimAssist
    updateButton(aimButton, "Aim Assist", state.AimAssist)
end)

npcCameraButton.Activated:Connect(function()
    state.NPCCameraLock = not state.NPCCameraLock
    updateButton(npcCameraButton, "NPC Camera Lock", state.NPCCameraLock)
end)

tracerButton.Activated:Connect(function()
    state.Tracer = not state.Tracer
    updateButton(tracerButton, "Tracer", state.Tracer)
end)

teleportButton.Activated:Connect(function()
    state.TeleportBehind = not state.TeleportBehind
    updateButton(teleportButton, "Teleport Behind", state.TeleportBehind)

    if state.TeleportBehind then
        local target = state.LockedTarget or getNearestTarget(CONFIG.TeleportRange)
        local _, myRoot = getCharacter(player)
        local _, targetRoot = target and getCharacter(target)

        if myRoot and targetRoot then
            local distance = (targetRoot.Position - myRoot.Position).Magnitude
            if distance <= CONFIG.TeleportRange then
                myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, CONFIG.BehindDistance)
            end
        end
    end
end)

flashButton.Activated:Connect(function()
    state.FlashStep = not state.FlashStep
    updateButton(flashButton, "Flash Step", state.FlashStep)
    -- Connect this toggle to your own game's Flash Step RemoteEvent/ability here.
end)

local dragging = false
local dragStart
local startPos

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        local targetPosition = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        TweenService:Create(
            main,
            TweenInfo.new(0.06, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = targetPosition}
        ):Play()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

workspace.DescendantAdded:Connect(function(obj)
    if not fpsEnabled then
        return
    end

    if obj:IsA("ParticleEmitter")
        or obj:IsA("Trail")
        or obj:IsA("Beam")
        or obj:IsA("PostEffect") then
        obj.Enabled = false
    end
end)

local tracerFolder = Instance.new("Folder")
tracerFolder.Name = "CAT_HUB_Tracers"
tracerFolder.Parent = workspace

local function makeTracer(fromPos, toPos)
    local distance = (toPos - fromPos).Magnitude
    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.CanQuery = false
    part.CanTouch = false
    part.Size = Vector3.new(0.08, 0.08, distance)
    part.CFrame = CFrame.lookAt((fromPos + toPos) / 2, toPos)
    part.Material = Enum.Material.Neon
    part.Transparency = 0.15
    part.Parent = tracerFolder
    return part
end

RunService.RenderStepped:Connect(function()
    if state.NPCCameraLock then
        local npc = getNearestNPC(CONFIG.CameraLockRange)
        local root = getNPCRoot(npc)
        if root then
            local desired = CFrame.lookAt(camera.CFrame.Position, root.Position)
            camera.CFrame = camera.CFrame:Lerp(desired, CONFIG.AimAssistStrength)
            targetLabel.Text = "NPC Target: " .. npc.Name
        else
            targetLabel.Text = "NPC Target: None"
        end
    end

    if state.CameraLock then
        local target = state.LockedTarget
        local _, targetRoot = target and getCharacter(target)

        if not targetRoot then
            target = getNearestTarget(CONFIG.CameraLockRange)
            setTarget(target)
            _, targetRoot = target and getCharacter(target)
        end

        if targetRoot then
            camera.CFrame = CFrame.lookAt(camera.CFrame.Position, targetRoot.Position)
        end
    end

    if state.AimAssist then
        local target = state.LockedTarget or getNearestTarget(CONFIG.CameraLockRange)
        local character, targetRoot = target and getCharacter(target)

        if character and targetRoot then
            local screenPoint, onScreen = camera:WorldToViewportPoint(targetRoot.Position)
            if onScreen then
                local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - center).Magnitude

                if distance <= CONFIG.AimFOV then
                    local desired = CFrame.lookAt(camera.CFrame.Position, targetRoot.Position)
                    camera.CFrame = camera.CFrame:Lerp(desired, CONFIG.AimAssistStrength)
                end
            end
        end
    end

    if state.Tracer then
        for _, obj in ipairs(tracerFolder:GetChildren()) do
            obj:Destroy()
        end

        local _, myRoot = getCharacter(player)
        if myRoot then
            for _, other in ipairs(Players:GetPlayers()) do
                if other ~= player then
                    local _, root = getCharacter(other)
                    if root and (root.Position - myRoot.Position).Magnitude <= CONFIG.TracerRange then
                        makeTracer(myRoot.Position, root.Position)
                    end
                end
            end
        end
    else
        for _, obj in ipairs(tracerFolder:GetChildren()) do
            obj:Destroy()
        end
    end
end)
