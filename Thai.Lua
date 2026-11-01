local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ThaiiiiHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(280, 330)
main.Position = UDim2.new(0.5, -140, 0.5, -165)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
title.Text = "🔥 THAIII HUB V2"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = main

local function createButton(name, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -30, 0, 42)
    button.Position = UDim2.fromOffset(15, y)
    button.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 15
    button.Font = Enum.Font.GothamBold
    button.Text = name
    button.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    return button
end

local leviathan = createButton("🚀 Leviathan: OFF", 65)
local marauder = createButton("🚀 Marauder: OFF", 115)
local delayButton = createButton("⏱️ Delay: 0.5s", 165)
local close = createButton("❌ Close GUI", 215)

local runningLeviathan = false
local runningMarauder = false
local delay = 0.5

leviathan.MouseButton1Click:Connect(function()
    runningLeviathan = not runningLeviathan
    leviathan.Text = runningLeviathan
        and "🚀 Leviathan: ON"
        or "🚀 Leviathan: OFF"
end)

marauder.MouseButton1Click:Connect(function()
    runningMarauder = not runningMarauder
    marauder.Text = runningMarauder
        and "🚀 Marauder: ON"
        or "🚀 Marauder: OFF"
end)

delayButton.MouseButton1Click:Connect(function()
    delay = delay == 0.5 and 0.1 or 0.5
    delayButton.Text = "⏱️ Delay: " .. delay .. "s"
end)

close.MouseButton1Click:Connect(function()
    runningLeviathan = false
    runningMarauder = false
    gui:Destroy()
end)