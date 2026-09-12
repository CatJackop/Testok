-- This file was generated at discord.gg/syncrypt

local v1 = unpack or table.unpack
local u2 = true
local gmatch = string.gmatch
local v5 = gmatch
local u4 = false
if not pcall(function()
    u4 = true
end) then
end
local random = math.random
local _ = table.concat
local v8 = table and table.unpack or unpack
local v9 = random(3, 65)
local n1 = 0
local n2 = 0
local _, result = pcall(function()
    return "uG" / (10662913 - "e4Ndl7m" ^ 8568321)
end)
local num = tonumber(v5(tostring(result), ":(%d*):")())
for i = 1, v9 do
    local v16 = math.random(1, 100)
    local v17 = random(0, 255)
    local v18 = random(1, v16)
    local v19 = random(1, 2) == 1
    local v20 = result:gsub(":(%d*):", ":" .. tostring(random(0, 10000)) .. ":")
    local u21 = v20
    local t2 = { pcall(function()
        if random(1, 2) == 1 or i == v9 then
            local _tonumber = tonumber
            local v75 = v5
            local _tostring = tostring
            local _, result2 = pcall(function()
                return "xH" / (3211265 - "ILfh" ^ 15580161)
            end)
            local v79 = _tonumber(v75(_tostring(result2), ":(%d*):")())
            local v80 = u2

            if v80 then
                v80 = v79 == num
            end

            u2 = v80
        end

        if v19 then
            error(u21, 0)
        end

        local t1 = {}

        for j = 1, v16 do
            t1[j] = random(0, 255)
        end

        t1[v18] = v17

        return v8(t1)
    end) }
    if v19 then
        local v23 = u2

        if v23 then
            v23 = t2[1] == false and t2[2] == u21
        end

        u2 = v23
    else
        u2 = u2 and t2[1]
        n1 = (n1 + t2[v18 + 1]) % 256
        n2 = (n2 + v17) % 256
    end
end
u2 = u2 and n1 == n2
if u2 then
    repeat
        task.wait()
    until game:IsLoaded()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local t3 = {
		Title = "WELCOME, %s!",
		Sub = "@%s | uid:%s",
		V1_TAG = "Redz",
		V2_TAG = "Banana",
		V3_TAG = "Maru",
		V4_TAG = "Premium",
		ANIME_IMG = "rbxassetid://85276513122834",
		V1_URL = "https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/MainV1.lua",
		V2_URL = "https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/MainV2.lua",
		V3_URL = "https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/MainV3.lua",
		V4_URL = "https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/MainPremium.lua"
	}
    local PMT_SelectUI = PlayerGui:FindFirstChild("PMT_SelectUI")
    if PMT_SelectUI then
        PMT_SelectUI:Destroy()
    end
    local function u30(p1, p2, p3)
        return Color3.fromRGB(p1, p2, p3)
    end
    local function v31(p4, p5)
        local v96 = Instance.new(p4)

        for k, v in pairs(p5) do
            v96[k] = v
        end

        return v96
    end
    local function v32(p6, p7)
        local UICorner = Instance.new("UICorner")

        UICorner.CornerRadius = UDim.new(0, p7 or 10)
        UICorner.Parent = p6

        return UICorner
    end
    local function v33(p8, p9, p10, p11)
        local UIStroke = Instance.new("UIStroke")

        UIStroke.Thickness = p9 or 1

        if not p10 then
            p10 = u30(255, 80, 160)
        end

        UIStroke.Color = p10
        UIStroke.Transparency = p11 or 0
        UIStroke.Parent = p8

        return UIStroke
    end
    local function v34(p12, p13, p14, p15, p16)
        local v109 = TweenService
        local new = TweenInfo.new

        if not p15 then
            p15 = Enum.EasingStyle.Quad
        end

        local v111 = v109:Create(p12, new(p13, p15, p16 or Enum.EasingDirection.Out), p14)

        v111:Play()

        return v111
    end
    local Arcade = Enum.Font.Arcade
    local v36 = v31("ScreenGui", {
		Name = "PMT_SelectUI",
		ResetOnSpawn = false,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = PlayerGui
	})
    local v37 = v31("Frame", {
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 1),
		Parent = v36
	})
    local v38 = v31("Frame", {
		Name = "Main",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.53),
		Size = UDim2.new(0, 500, 0, 320),
		BackgroundColor3 = u30(10, 10, 14),
		BackgroundTransparency = 0.05,
		BorderSizePixel = 0,
		Parent = v36
	})
    v32(v38, 16)
    v33(v38, 2, u30(255, 70, 170), 0.12);
    (function(p17, p18, p19, p20)
        local UIGradient = Instance.new("UIGradient")

        UIGradient.Color = ColorSequence.new(p18, p19)
        UIGradient.Rotation = p20 or 0
        UIGradient.Parent = p17

        return UIGradient
    end)(v38, u30(18, 18, 28), u30(6, 6, 10), 90)
    local v39 = v31("UIScale", {
		Scale = 0.9,
		Parent = v38
	})
    local v40 = v31("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 14, 0, 12),
		Size = UDim2.new(1, -28, 0, 54),
		Parent = v38
	})
    local v41 = u30(18, 18, 24)
    local uDim2 = UDim2.new(0, 42, 0, 42)
    local uDim2_2 = UDim2.new(0, 0, 0, 6)
    local UserId = LocalPlayer.UserId
    local v45 = v31("ImageLabel", {
		BackgroundColor3 = v41,
		BorderSizePixel = 0,
		Size = uDim2,
		Position = uDim2_2,
		Image = ("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150").format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", UserId),
		Parent = v40
	})
    v32(v45, 12)
    v33(v45, 1, u30(255, 70, 170), 0.35)
    local uDim2_3 = UDim2.new(0, 54, 0, 2)
    local uDim2_4 = UDim2.new(1, -54, 0, 26)
    local Left = Enum.TextXAlignment.Left
    local v49 = u30(240, 240, 255)
    local LocalPlayerName = LocalPlayer.Name
    v31("TextLabel", {
		BackgroundTransparency = 1,
		Position = uDim2_3,
		Size = uDim2_4,
		Font = Arcade,
		TextSize = 18,
		TextXAlignment = Left,
		TextColor3 = v49,
		Text = ("WELCOME, %s!"):format(LocalPlayerName),
		Parent = v40
	})
    local uDim2_5 = UDim2.new(0, 54, 0, 26)
    local uDim2_6 = UDim2.new(1, -54, 0, 22)
    local Left2 = Enum.TextXAlignment.Left
    local v54 = u30(170, 170, 190)
    local LocalPlayerName2 = LocalPlayer.Name
    local t4 = { (tostring(LocalPlayer.UserId)) }
    v31("TextLabel", {
		BackgroundTransparency = 1,
		Position = uDim2_5,
		Size = uDim2_6,
		Font = Arcade,
		TextSize = 12,
		TextXAlignment = Left2,
		TextColor3 = v54,
		Text = ("@%s | uid:%s"):format(LocalPlayerName2, v1(t4)),
		Parent = v40
	})
    v31("ImageButton", {
		Name = "CATHAB_HideShow",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -10, 0, 10),
		Size = UDim2.new(0, 110, 0, 70),
		Image = "rbxassetid://126031329785796",
		ScaleType = Enum.ScaleType.Fit,
		AutoButtonColor = false,
		Parent = v36
	})
    local CATHAB_HideShow = v36:FindFirstChild("CATHAB_HideShow")
    local CATHAB_Visible = true
    if CATHAB_HideShow then
        CATHAB_HideShow.MouseButton1Click:Connect(function()
            CATHAB_Visible = not CATHAB_Visible
            v38.Visible = CATHAB_Visible
        end)
    end

    v31("TextLabel", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 14, 0, 70),
		Size = UDim2.new(1, -28, 0, 18),
		Font = Arcade,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextColor3 = u30(220, 220, 235),
		Text = ">> SELECT MODE",
		Parent = v38
	})
    local v57 = v31("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 14, 0, 95),
		Size = UDim2.new(1, -28, 0, 140),
		Parent = v38
	})
    v31("UIGridLayout", {
		CellPadding = UDim2.new(0, 10, 0, 10),
		CellSize = UDim2.new(0.5, -5, 0.5, -5),
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = v57
	})
    local t5 = {}
    local u59
    local function v60(p21, p22)
        local v114 = v31("Frame", {
			BackgroundColor3 = u30(14, 14, 20),
			BorderSizePixel = 0,
			Parent = v57
		})

        v32(v114, 12)

        local v115 = v33(v114, 2, u30(120, 90, 255), 0.72)

        v31("TextButton", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			Font = Arcade,
			TextSize = 16,
			TextColor3 = u30(255, 255, 255),
			Text = p22:upper(),
			AutoButtonColor = false,
			Parent = v114
		}).MouseButton1Click:Connect(function()
            u59 = p21

            for _, v in pairs(t5) do
                local Stroke = v.Stroke
                local t6 = {
					Transparency = 0.72,
					Color = u30(120, 90, 255)
				}

                TweenService:Create(Stroke, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t6):Play()

                local Card = v.Card
                local t7 = {
					BackgroundColor3 = u30(14, 14, 20)
				}

                TweenService:Create(Card, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t7):Play()
            end

            local v140 = v34
            local v141 = v115
            local v142 = u30(255, 70, 170)

            v140(v141, 0.12, {
				Transparency = 0,
				Color = v142
			})
            v34(v114, 0.12, {
				BackgroundColor3 = u30(20, 20, 30)
			})
            v38.Parent.Main.TextButton.Text = "START: " .. p22:upper()
        end)
        t5[p21] = {
			Card = v114,
			Stroke = v115
		}
    end
    v60("V1", "Redz")
    v60("V2", "Banana")
    v60("V3", "Maru")
    v60("V4", "Premium")
    local v61 = u30(255, 50, 140)
    local vector2 = Vector2.new(0.5, 1)
    local uDim2_7 = UDim2.new(0.5, 0, 1, -10)
    local uDim2_8 = UDim2.new(1, -28, 0, 44)
    local v65 = v31("TextButton", {
		BackgroundColor3 = v61,
		BorderSizePixel = 0,
		AnchorPoint = vector2,
		Position = uDim2_7,
		Size = uDim2_8,
		Font = Arcade,
		TextSize = 14,
		TextColor3 = u30(255, 255, 255),
		Text = "SELECT SCRIPT TO START",
		AutoButtonColor = false,
		Parent = v38
	})
    v32(v65, 14)
    local function v66(p23)
        if p23 == "" then
            return
        end

        local ok, result3 = pcall(function()
            return game:HttpGet(p23)
        end)

        if ok then
            ok = type(result3) == "string" and #result3 > 0
        end

        if ok then
            local v119 = loadstring(result3)

            if v119 then
                v119()
            end
        end
    end
    local function v67(p24)
        local v121 = v37
        local t8 = {
			BackgroundTransparency = 1
		}

        TweenService:Create(v121, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t8):Play()

        local v123 = v39
        local t9 = {
			Scale = 0.92
		}

        TweenService:Create(v123, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t9):Play()

        local v125 = v38
        local t10 = {
			Position = UDim2.fromScale(0.5, 1.2)
		}
        local Quad = Enum.EasingStyle.Quad
        local In = Enum.EasingDirection.In
        local v129 = TweenService
        local new = TweenInfo.new

        if not Quad then
            Quad = Enum.EasingStyle.Quad
        end

        v129:Create(v125, new(0.3, Quad, In or Enum.EasingDirection.Out), t10):Play()
        task.delay(0.32, function()
            if v36 then
                v36:Destroy()
            end

            if p24 then
                p24()
            end
        end)
    end
    v65.MouseButton1Click:Connect(function()
        if not u59 then
            return
        end

        local v131 = t3[u59 .. "_URL"]

        if v131 and v131 ~= "" then
            v67(function()
                v66(v131)
            end)

            return
        end

        v65.Text = "NOT AVAILABLE YET"
        task.delay(1, function()
            v65.Text = "SELECT SCRIPT TO START"
        end)
    end)
    local t11 = {
		BackgroundTransparency = 0.45
	}
    TweenService:Create(v37, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t11):Play()
    local t12 = {
		Scale = 1
	}
    TweenService:Create(v39, TweenInfo.new(0.28, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t12):Play()
    local t13 = {
		Position = UDim2.fromScale(0.5, 0.5)
	}
    local Back = Enum.EasingStyle.Back
    local Out = Enum.EasingDirection.Out
    local new = TweenInfo.new
    if not Back then
        Back = Enum.EasingStyle.Quad
    end
    TweenService:Create(v38, new(0.36, Back, Out or Enum.EasingDirection.Out), t13):Play()

    return
end
return (function()
    while true do
        local _l2 = l2
        local _l1 = l1

        l1 = _l2
        l2 = _l1
        error("You Are Lost!")
    end
end)()
