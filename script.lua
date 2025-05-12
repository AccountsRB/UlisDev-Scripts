local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "UlisDev - Script"

-- Punto blanco en el centro
local dot = Instance.new("Frame")
dot.Size = UDim2.new(0, 4, 0, 4)
dot.Position = UDim2.new(0.5, -2, 0.5, -2)
dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
dot.BorderSizePixel = 0
dot.BackgroundTransparency = 0
dot.Name = "Crosshair"
dot.Parent = screenGui

-- Función para crear marcos con estilo UlisDev
local function createStyledFrame(name, titleText)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 120, 0, 160)
    frame.Position = UDim2.new(0, 20, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Name = name

    local stroke = Instance.new("UIStroke", frame)
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(0, 255, 0)

    local gradient = Instance.new("UIGradient", stroke)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0,255,0)),
        ColorSequenceKeypoint.new(0.45, Color3.fromRGB(0,255,0)),
        ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0,255,100)),
        ColorSequenceKeypoint.new(0.55, Color3.fromRGB(0,255,0)),
        ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0,255,0))
    }

    task.spawn(function()
        while true do
            gradient.Rotation += 1
            if gradient.Rotation >= 360 then
                gradient.Rotation = 0
            end
            task.wait(0.01)
        end
    end)

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18
    title.RichText = true

    task.spawn(function()
        local baseText = titleText
        while true do
            for i = 1, #baseText do
                local finalText = ""
                for j = 1, #baseText do
                    local letter = baseText:sub(j, j)
                    if j == i then
                        finalText = finalText .. "<font color='rgb(0,255,0)'>"..letter.."</font>"
                    else
                        finalText = finalText .. "<font color='rgb(255,255,255)'>"..letter.."</font>"
                    end
                end
                title.Text = finalText
                task.wait(0.1)
            end
        end
    end)

    return frame
end

-- Interfaz principal
local mainFrame = createStyledFrame("UlisDevMain", "UlisDev - Script")
mainFrame.Parent = screenGui

-- Botón Dead Rails
local button1 = Instance.new("TextButton", mainFrame)
button1.Size = UDim2.new(1, -20, 0, 30)
button1.Position = UDim2.new(0, 10, 0, 60)
button1.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button1.TextColor3 = Color3.fromRGB(0, 255, 0)
button1.Font = Enum.Font.SourceSans
button1.TextSize = 16
button1.Text = "Dead Rails"
button1.BorderSizePixel = 0

local buttonStroke1 = Instance.new("UIStroke", button1)
buttonStroke1.Thickness = 2
buttonStroke1.Color = Color3.fromRGB(0, 255, 0)
buttonStroke1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Botón No Mercy
local button2 = Instance.new("TextButton", mainFrame)
button2.Size = UDim2.new(1, -20, 0, 30)
button2.Position = UDim2.new(0, 10, 0, 100)
button2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button2.TextColor3 = Color3.fromRGB(0, 255, 0)
button2.Font = Enum.Font.SourceSans
button2.TextSize = 16
button2.Text = "No Mercy"
button2.BorderSizePixel = 0

local buttonStroke2 = Instance.new("UIStroke", button2)
buttonStroke2.Thickness = 2
buttonStroke2.Color = Color3.fromRGB(0, 255, 0)
buttonStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- UI Dead Rails
local deadRailsUI = createStyledFrame("DeadRailsUI", "Dead Rails")
deadRailsUI.Position = UDim2.new(0, 160, 0, 40)
deadRailsUI.Visible = false
deadRailsUI.Parent = screenGui

local autoBonesBtn = Instance.new("TextButton", deadRailsUI)
autoBonesBtn.Size = UDim2.new(1, -20, 0, 30)
autoBonesBtn.Position = UDim2.new(0, 10, 0, 60)
autoBonesBtn.Text = "Auto Bones #1"
autoBonesBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoBonesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoBonesBtn.Font = Enum.Font.SourceSansBold
autoBonesBtn.TextSize = 16
autoBonesBtn.BorderSizePixel = 0

autoBonesBtn.MouseButton1Down:Connect(function()
    autoBonesBtn:TweenSize(UDim2.new(1, -20, 0, 28), "Out", "Quad", 0.1, true)
end)

autoBonesBtn.MouseButton1Up:Connect(function()
    autoBonesBtn:TweenSize(UDim2.new(1, -20, 0, 30), "Out", "Quad", 0.1, true)
end)

-- UI No Mercy
local noMercyUI = createStyledFrame("NoMercyUI", "No Mercy")
noMercyUI.Position = UDim2.new(0, 290, 0, 40)
noMercyUI.Visible = false
noMercyUI.Parent = screenGui

-- No Clip Button
local noClipBtn = Instance.new("TextButton", noMercyUI)
noClipBtn.Size = UDim2.new(1, -20, 0, 30)
noClipBtn.Position = UDim2.new(0, 10, 0, 60)
noClipBtn.Text = "No Clip"
noClipBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
noClipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
noClipBtn.Font = Enum.Font.SourceSansBold
noClipBtn.TextSize = 16
noClipBtn.BorderSizePixel = 0

noClipBtn.MouseButton1Down:Connect(function()
    noClipBtn:TweenSize(UDim2.new(1, -20, 0, 28), "Out", "Quad", 0.1, true)
end)

noClipBtn.MouseButton1Up:Connect(function()
    noClipBtn:TweenSize(UDim2.new(1, -20, 0, 30), "Out", "Quad", 0.1, true)
end)

local noclip = false
noClipBtn.MouseButton1Click:Connect(function()
    noclip = not noclip
    noClipBtn.Text = noclip and "No Clip: ON" or "No Clip: OFF"
    game:GetService("RunService").Stepped:Connect(function()
        if noclip and player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end)

-- Aimbot
local aimbotBtn = Instance.new("TextButton", noMercyUI)
aimbotBtn.Size = UDim2.new(1, -20, 0, 30)
aimbotBtn.Position = UDim2.new(0, 10, 0, 100)
aimbotBtn.Text = "Aimbot"
aimbotBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
aimbotBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotBtn.Font = Enum.Font.SourceSansBold
aimbotBtn.TextSize = 16
aimbotBtn.BorderSizePixel = 0

aimbotBtn.MouseButton1Down:Connect(function()
    aimbotBtn:TweenSize(UDim2.new(1, -20, 0, 28), "Out", "Quad", 0.1, true)
end)

aimbotBtn.MouseButton1Up:Connect(function()
    aimbotBtn:TweenSize(UDim2.new(1, -20, 0, 30), "Out", "Quad", 0.1, true)
end)

-- Aimbot funcional
local aimbotEnabled = false
local lockedTarget = nil
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local camera = workspace.CurrentCamera

local function getPlayerUnderCrosshair()
    local radius = 30
    local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
    local target = nil
    local shortestDistance = radius

    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
            local head = plr.Character.Head
            local screenPos, onScreen = camera:WorldToViewportPoint(head.Position)
            if onScreen then
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    target = head
                end
            end
        end
    end

    return target
end

local function toggleAimbot()
    aimbotEnabled = not aimbotEnabled
    if aimbotEnabled then
        lockedTarget = getPlayerUnderCrosshair()
        aimbotBtn.Text = lockedTarget and "Aimbot: ON" or "Aimbot: NONE"
    else
        lockedTarget = nil
        aimbotBtn.Text = "Aimbot: OFF"
    end
end

aimbotBtn.MouseButton1Click:Connect(toggleAimbot)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F5 then
        toggleAimbot()
    end
end)

RunService.RenderStepped:Connect(function()
    if aimbotEnabled and lockedTarget then
        camera.CFrame = CFrame.new(camera.CFrame.Position, lockedTarget.Position)
    end
end)

-- Mostrar/ocultar ventanas
button1.MouseButton1Click:Connect(function()
    buttonStroke1.Color = Color3.fromRGB(255, 0, 0)
    deadRailsUI.Visible = not deadRailsUI.Visible
    task.delay(1, function()
        buttonStroke1.Color = Color3.fromRGB(0, 255, 0)
    end)
end)

button2.MouseButton1Click:Connect(function()
    buttonStroke2.Color = Color3.fromRGB(255, 0, 0)
    noMercyUI.Visible = not noMercyUI.Visible
    task.delay(1, function()
        buttonStroke2.Color = Color3.fromRGB(0, 255, 0)
    end)
end)
