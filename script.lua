-- KRP HUB FULL CODE
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/wally-rblx/RemoteSpy/main/main.lua"))()
local Window = Rayfield:CreateWindow({Name = "KRP HUB | ĐANG TẢI", LoadingTitle = "ĐÃ TẢI XONG", LoadingSubtitle = "Tối ưu cho A11"})
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- TAB 1: HỆ THỐNG
local Tab1 = Window:CreateTab("HỆ THỐNG", nil)

_G.NoHold = false
Tab1:CreateToggle({Name = "KHÔNG CẦN GIỮ/TƯƠNG TÁC", Callback = function(v) _G.NoHold = v end})
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(p) if _G.NoHold then p.HoldDuration = 0 end end)

_G.SpeedBoost = false
Tab1:CreateToggle({Name = "CHẠY NHANH", Callback = function(v) _G.SpeedBoost = v end})
RunService.Heartbeat:Connect(function() 
    if _G.SpeedBoost and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 80 
    end
end)

_G.JumpBoost = false
Tab1:CreateToggle({Name = "NHẢY CAO", Callback = function(v) _G.JumpBoost = v end})
RunService.Heartbeat:Connect(function() 
    if _G.JumpBoost and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.JumpPower = 60 
    end
end)

_G.SavedPos = nil
Tab1:CreateButton({Name = "LƯU VỊ TRÍ", Callback = function() _G.SavedPos = LocalPlayer.Character.HumanoidRootPart.CFrame end})
Tab1:CreateButton({Name = "DỊCH CHUYỂN ĐẾN VỊ TRÍ LƯU", Callback = function() if _G.SavedPos then LocalPlayer.Character.HumanoidRootPart.CFrame = _G.SavedPos end end})

-- TAB 2: GAME TURBO
local Tab2 = Window:CreateTab("GAME TURBO", nil)
Tab2:CreateButton({Name = "TỐI ƯN (CLEAR MAP)", Callback = function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("Sparkles") then obj:Destroy() end
    end
end})

-- 5 Nút FPS
for _, fps in pairs({60, 90, 120, 144, 244}) do
    Tab2:CreateButton({Name = "FPS: "..fps, Callback = function() setfpscap(fps) end})
end

-- TAB 3: GAME SÀN LÀ DUNG NHAM
local Tab3 = Window:CreateTab("GAME SÀN LÀ DUNG NHAM", nil)
_G.AutoHeal = false
Tab3:CreateToggle({Name = "AUTO HEAL", Callback = function(v) 
    _G.AutoHeal = v 
    task.spawn(function()
        while _G.AutoHeal do
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum and hum.Health < hum.MaxHealth then
                -- Bạn điền tên vật phẩm hồi máu hoặc Remote của game vào đây
                print("Đang hồi máu...")
            end
            task.wait(1)
        end
    end)
end})

_G.AutoFarm = false
Tab3:CreateToggle({Name = "AUTO FARM (BAY MỤC TIÊU)", Callback = function(v) _G.AutoFarm = v end})
RunService.Heartbeat:Connect(function()
    if _G.AutoFarm and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        hrp.Velocity = Vector3.new(0, 150, 0) -- Ép bay lên
    end
end)
