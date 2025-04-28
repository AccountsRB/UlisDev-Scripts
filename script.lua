-- UlisDev - Script

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "UlisDev - Script"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 120, 0, 160) -- Cortito de ancho, alto
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0, 255, 0)

local gradient = Instance.new("UIGradient", stroke)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,180,0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,255,0))
}
gradient.Rotation = 0

task.spawn(function()
    while true do
        gradient.Rotation += 1
        if gradient.Rotation >= 360 then
            gradient.Rotation = 0
        end
        task.wait(0.02)
    end
end)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40) -- Solo parte superior
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "UlisDev - Script"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.RichText = true

local baseText = "UlisDev - Script"

task.spawn(function()
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
