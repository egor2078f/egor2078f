local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local PhantomForcesWindow = Library:NewWindow("Survive 100 days")

local FoodCheats = PhantomForcesWindow:NewSection("Food")

FoodCheats:CreateButton("Beans", function()
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = game:GetService("Workspace").Food.Beans.CFrame
    print("Teleported to Beans")
end)

FoodCheats:CreateButton("Bloxy Cola", function()
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    rootPart.CFrame = game:GetService("Workspace").Food["Bloxy Cola"].CFrame
    print("Teleported to Bloxy Cola")
end)

local WeaponCheats = PhantomForcesWindow:NewSection("Weapons")

local function teleportToWeapon(weaponName)
    local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
    local weapons = game:GetService("Workspace").Weapons:GetChildren()
    
    for _, weaponModel in ipairs(weapons) do
        local namePart = weaponModel:FindFirstChild("Weapon_Name")
        
        if namePart and namePart.Value == weaponName then
            rootPart.CFrame = weaponModel.PrimaryPart.CFrame
            print("Teleported to " .. weaponName)
            return
        end
    end
    
    print(weaponName .. " not found!")
end

WeaponCheats:CreateButton("Get Grenade", function()
    teleportToWeapon("Grenade")
end)

WeaponCheats:CreateButton("Get Katana", function()
    teleportToWeapon("Katana")
end)

WeaponCheats:CreateButton("Get MP7", function()
    teleportToWeapon("MP7")
end)

WeaponCheats:CreateButton("Get Pistol", function()
    teleportToWeapon("Pistol")
end)

WeaponCheats:CreateButton("Get Shovel", function()
    teleportToWeapon("Shovel")
end)

WeaponCheats:CreateButton("Get Shotgun", function()
    teleportToWeapon("Shotgun")
end)

local OtherCheats = PhantomForcesWindow:NewSection("Other")

local espEnabled = false
OtherCheats:CreateToggle("ESP (Wallhack)", function(state)
    espEnabled = state
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local highlight = player.Character:FindFirstChildOfClass("Highlight")
            if espEnabled then
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.Adornee = player.Character
                    highlight.FillColor = Color3.new(1, 0, 0)
                    highlight.OutlineColor = Color3.new(0, 0, 0)
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
            else
                if highlight then
                    highlight:Destroy()
                end
            end
        end
    end
    
    if espEnabled then
        print("ESP Activated")
    else
        print("ESP Deactivated")
    end
end)

OtherCheats:CreateButton("Teleport to Spawn", function()
    local player = game.Players.LocalPlayer
    local spawnLocation = game:GetService("Workspace"):FindFirstChild("SpawnLocation")
    
    if spawnLocation then
        player.Character.HumanoidRootPart.CFrame = spawnLocation.CFrame
        print("Teleported to Spawn")
    else
        print("Spawn Location not found!")
    end
end)

OtherCheats:CreateButton("Delete Mutants", function()
    local mutantsFolder = game:GetService("Workspace"):FindFirstChild("Mutants")
    
    if mutantsFolder then
        mutantsFolder:Destroy()
        print("Mutants folder deleted")
    else
        print("Mutants folder not found!")
    end
end)
