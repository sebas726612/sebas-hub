--=== CONFIGURACIÓN ===--
local SPEED_BOOST = 50
local JUMP_BOOST = 100

--=== CREAR GUI PRINCIPAL ===--
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

--=== CUERPO DEL GUI ===--
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 300, 0, 200)
Main.Position = UDim2.new(0.35, 0, 0.35, 0)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ZIndex = 999999
Main.Parent = ScreenGui

--=== BOTÓN CERRAR ===--
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.BackgroundColor3 = Color3.fromRGB(150,0,0)
CloseBtn.ZIndex = 999999
CloseBtn.Parent = Main

--=== BOTÓN MINIMIZAR ===--
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0, 5)
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.new(1,1,1)
MinBtn.BackgroundColor3 = Color3.fromRGB(0,100,150)
MinBtn.ZIndex = 999999
MinBtn.Parent = Main

--=== BOTÓN VELOCIDAD ===--
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.Size = UDim2.new(0, 120, 0, 40)
SpeedBtn.Position = UDim2.new(0, 20, 0, 60)
SpeedBtn.Text = "Velocidad"
SpeedBtn.TextColor3 = Color3.new(1,1,1)
SpeedBtn.BackgroundColor3 = Color3.fromRGB(50,150,50)
SpeedBtn.ZIndex = 999999
SpeedBtn.Parent = Main

--=== BOTÓN SALTO ===--
local JumpBtn = Instance.new("TextButton")
JumpBtn.Size = UDim2.new(0, 120, 0, 40)
JumpBtn.Position = UDim2.new(0, 20, 0, 110)
JumpBtn.Text = "Salto"
JumpBtn.TextColor3 = Color3.new(1,1,1)
JumpBtn.BackgroundColor3 = Color3.fromRGB(150,150,50)
JumpBtn.ZIndex = 999999
JumpBtn.Parent = Main

--=== CREAR CÍRCULO FLOTANTE (minimizado) ===--
local Circle = Instance.new("Frame")
Circle.Size = UDim2.new(0, 60, 0, 60)
Circle.Position = UDim2.new(0.05, 0, 0.6, 0)
Circle.BackgroundColor3 = Color3.fromRGB(70, 70, 255)
Circle.Visible = false
Circle.ZIndex = 999999
Circle.Active = true
Circle.Draggable = true
Circle.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Circle

--=== FUNCIONES ===--

-- CERRAR GUI
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- MINIMIZAR GUI
MinBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    Circle.Visible = true
end)

-- RESTAURAR GUI DESDE EL CÍRCULO
Circle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Main.Visible = true
        Circle.Visible = false
    end
end)

-- BOOST DE VELOCIDAD
SpeedBtn.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = SPEED_BOOST
    end
end)

-- BOOST DE SALTO
JumpBtn.MouseButton1Click:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = JUMP_BOOST
    end
end)
