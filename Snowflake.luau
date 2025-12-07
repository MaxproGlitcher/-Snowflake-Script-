local baseplate = workspace:FindFirstChild("Baseplate")
if baseplate then
    baseplate.BrickColor = BrickColor.new("Institutional white")
    baseplate.Material = Enum.Material.Snow
end


-- Beaucoup plus de neige + loop massif

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

local snowflakeTexture = "rbxassetid://412284862"

local function createSnowflake()
    local s = Instance.new("Part")
    s.Size = Vector3.new(0.2, 0.2, 0.2)
    s.Anchored = true
    s.CanCollide = false
    s.Transparency = 0.5
    s.BrickColor = BrickColor.new("White")

    local d = Instance.new("Decal")
    d.Texture = snowflakeTexture
    d.Face = Enum.NormalId.Top
    d.Parent = s

    s.Position = Vector3.new(math.random(-200, 200), 100, math.random(-200, 200))
    s.Parent = workspace

    TweenService:Create(s, TweenInfo.new(6), {
        Position = Vector3.new(s.Position.X, -10, s.Position.Z)
    }):Play()

    Debris:AddItem(s, 12)
end

-- Spawning massif Neige 
task.spawn(function()
    while true do
        for i = 1, 30 do
            createSnowflake()
        end
        task.wait(0.1)
    end
end)
