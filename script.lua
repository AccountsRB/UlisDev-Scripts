-- UlisDev - Script

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "UlisDev - Script"

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

-- Ventana principal
local mainFrame = createStyledFrame("UlisDevMain", "UlisDev - Script")
mainFrame.Parent = screenGui

-- Botón "Dead Rails"
local button = Instance.new("TextButton", mainFrame)
button.Size = UDim2.new(1, -20, 0, 30)
button.Position = UDim2.new(0, 10, 0, 60)
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.TextColor3 = Color3.fromRGB(0, 255, 0)
button.Font = Enum.Font.SourceSans
button.TextSize = 16
button.Text = "Dead Rails"
button.BorderSizePixel = 0

local buttonStroke = Instance.new("UIStroke", button)
buttonStroke.Thickness = 2
buttonStroke.Color = Color3.fromRGB(0, 255, 0)
buttonStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

-- Segunda UI: Dead Rails
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

-- Mostrar/Ocultar Dead Rails UI
button.MouseButton1Click:Connect(function()
    buttonStroke.Color = Color3.fromRGB(255, 0, 0)
    deadRailsUI.Visible = not deadRailsUI.Visible
    task.delay(1, function()
        buttonStroke.Color = Color3.fromRGB(0, 255, 0)
    end)
end)
