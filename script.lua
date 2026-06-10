-- 1. Khởi tạo DUY NHẤT MỘT LẦN
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({Name = "KRP HUB", LoadingTitle = "ĐANG TẢI...", LoadingSubtitle = "ĐÃ TẢI XONG"})

-- 2. Tạo Tab 1
local Tab = Window:CreateTab("HỆ THỐNG", nil)

-- --- PHẦN NO HOLD ---
local ProximityService = game:GetService("ProximityPromptService")
local isNoHoldEnabled = false

Tab:CreateToggle({
Name = "No Hold (Bỏ giữ)",
CurrentValue = false,
Callback = function(Value)
isNoHoldEnabled = Value
end,
})

ProximityService.PromptButtonHoldBegan:Connect(function(prompt)
if isNoHoldEnabled then prompt.HoldDuration = 0 end
end)

-- --- PHẦN DASH TOOL ---
local function GiveDashTool()
local player = game.Players.LocalPlayer
local backpack = player.Backpack
local char = player.Character
if backpack:FindFirstChild("Dash Tool") then backpack["Dash Tool"]:Destroy() end
if char and char:FindFirstChild("Dash Tool") then char["Dash Tool"]:Destroy() end

local tool = Instance.new("Tool")  
tool.Name = "Dash Tool"  
tool.RequiresHandle = false  
tool.Parent = backpack  

tool.Activated:Connect(function()  
    local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")  
    if hrp then hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * 5) end  
end)

end

Tab:CreateButton({Name = "Nhận Dash Tool", Callback = function() GiveDashTool() end})
game.Players.LocalPlayer.CharacterAdded:Connect(function() task.wait(1) GiveDashTool() end)

-- --- PHẦN SAVE / TP ---
local SavedPos = nil
local SaveTPButton
SaveTPButton = Tab:CreateButton({
Name = "Save Tọa độ",
Callback = function()
local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if not SavedPos then
if hrp then SavedPos = hrp.CFrame; SaveTPButton:Set("TP Đến Tọa Độ") end
else
if hrp then hrp.CFrame = SavedPos end
end
end,
})

-- --- PHẦN JUMP BOOST (Đẩy 120) ---
local isJumpBoostEnabled = false
Tab:CreateToggle({Name = "Jump Boost (Nhảy 120)", Callback = function(Value) isJumpBoostEnabled = Value end})

game:GetService("RunService").Heartbeat:Connect(function()
if isJumpBoostEnabled then
local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
if hrp and hum and hum:GetState() == Enum.HumanoidStateType.Jumping then
local look = hrp.CFrame.LookVector
hrp.AssemblyLinearVelocity = Vector3.new(look.X * 120, hrp.AssemblyLinearVelocity.Y, look.Z * 120)
task.wait(0.2) -- Tăng độ trễ để không làm tụt FPS
end
end
end)
-- --- PHẦN SPEED BOOST (Đẩy khi di chuyển) ---
local isSpeedBoostEnabled = false

Tab:CreateToggle({
Name = "CHẠY NHANH",
CurrentValue = false,
Flag = "SpeedBoostToggle",
Callback = function(Value)
isSpeedBoostEnabled = Value
end,
})

-- Sử dụng RenderStepped để đẩy liên tục khi đang chạy
game:GetService("RunService").RenderStepped:Connect(function()
if isSpeedBoostEnabled then
local player = game.Players.LocalPlayer
local char = player.Character
local hum = char and char:FindFirstChild("Humanoid")
local hrp = char and char:FindFirstChild("HumanoidRootPart")

-- Kiểm tra nếu nhân vật đang có ý định di chuyển (MoveDirection > 0)  
    if hum and hrp and hum.MoveDirection.Magnitude > 0 then  
        -- Tính toán hướng di chuyển thực tế  
        local moveDir = hum.MoveDirection  
        -- Đẩy nhân vật với lực 80 theo hướng đang đi  
        hrp.AssemblyLinearVelocity = Vector3.new(moveDir.X * 80, hrp.AssemblyLinearVelocity.Y, moveDir.Z * 80)  
    end  
end

end)

-- --- TAB 2: GAME TURBO ---
local Tab2 = Window:CreateTab("GAME TURBO", nil)

Tab2:CreateButton({
Name = "HIỆU NĂNG",
-- Premium Bulk Eraser V9: Full Optimization
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

local targets = {
    "NPC", 
    "LimitedProductStand", 
    "CutlassGamepassPrompt", 
    "AttackVfx", 
    "Regions", 
    "Map", 
    "AnimatedModel"
}

local function DeepBulkDelete()
    setfpscap(120) -- Ép 120 FPS
    
    -- 1. Ép vật liệu về 0.01%
    if Terrain then
        Terrain.WaterWaveSize = 0.01
        Terrain.WaterWaveSpeed = 0.01
        Terrain.WaterReflectance = 0.01
        Terrain.WaterTransparency = 0.01
    end

    -- 2. Giảm đồ họa 80% (Tắt đổ bóng và giảm chất lượng chi tiết)
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    Lighting.GlobalShadows = false
    Lighting.Brightness = 0

    -- 3. Xóa xương mù & Bầu trời
    Lighting.FogEnd = 999999
    for _, obj in pairs(Lighting:GetChildren()) do
        if obj:IsA("Sky") or obj:IsA("Atmosphere") or obj:IsA("BloomEffect") or 
           obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
            obj:Destroy()
        end
    end

    -- 4. Xóa danh sách vật thể gây lag (Đã loại bỏ Base và Model)
    local count = 0
    for _, obj in pairs(workspace:GetDescendants()) do
        for _, name in pairs(targets) do
            if obj.Name == name then
                obj:Destroy()
                count += 1
                break
            end
        end
    end
    print("--- DỌN DẸP HOÀN TẤT: Đã xóa " .. count .. " vật thể ---")
end

-- Tự động chạy lại khi nhân vật hồi sinh
game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    DeepBulkDelete()
end)

-- Chạy lần đầu
DeepBulkDelete()


-- --- PHẦN FPS UNLOCKER ---
local FPSSection = Tab2:CreateSection("UNLOCK FPS")

local function SetFPS(limit)
setfpscap(limit) -- Lệnh chính để mở khóa FPS
Rayfield:Notify({
Title = "FPS Đã cập nhật",
Content = "Giới hạn FPS hiện tại: " .. limit,
Duration = 3
})
end

Tab2:CreateButton({Name = "FPS: 60", Callback = function() SetFPS(60) end})
Tab2:CreateButton({Name = "FPS: 90", Callback = function() SetFPS(90) end})
Tab2:CreateButton({Name = "FPS: 120", Callback = function() SetFPS(120) end})
Tab2:CreateButton({Name = "FPS: 144", Callback = function() SetFPS(144) end})
Tab2:CreateButton({Name = "FPS: 244", Callback = function() SetFPS(244) end})
-- --- TAB 3: SÀN DUNG NHAM (BẢN FIX KẸT TUYỆT ĐỐI) ---
local Tab3 = Window:CreateTab("SÀN DUNG NHAM", nil)

_G.AutoLv1Enabled = false
local TargetPos = Vector3.new(3549, 89, 741)

Tab3:CreateToggle({
Name = "Auto Lv1 (Bay & Né Lava)",
CurrentValue = false,
Callback = function(Value)
_G.AutoLv1Enabled = Value
local char = game.Players.LocalPlayer.Character
local hum = char and char:FindFirstChild("Humanoid")
local hrp = char and char:FindFirstChild("HumanoidRootPart")

if Value then  
        if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end  
    else  
        -- 1. Trả lại trạng thái bình thường  
        if hum then hum:ChangeState(Enum.HumanoidStateType.GettingUp) end  
        for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = true end end  
          
        -- 2. Đẩy cưỡng bức (Không cần kiểm tra kẹt, cứ tắt là đẩy nhẹ để thoát kẹt cứng)  
        task.delay(0.2, function()  
            if hrp then  
                hrp.Velocity = Vector3.new(0, 200, 0) -- Tăng lực đẩy lên 200 cho mạnh  
                task.wait(0.3)  
                hrp.Velocity = Vector3.new(0, 0, 0)  
            end  
        end)  
    end  
end,

})

game:GetService("RunService").Heartbeat:Connect(function()
local char = game.Players.LocalPlayer.Character
local hrp = char and char:FindFirstChild("HumanoidRootPart")
local hum = char and char:FindFirstChild("Humanoid")

if _G.AutoLv1Enabled and hrp and hum then  
    -- Ép xuyên tường  
    for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end  
      
    -- Né Lava  
    if hum.Health < hum.MaxHealth then  
        hrp.Velocity = Vector3.new(0, 150, 0)  
    else  
        -- Bay tới tọa độ  
        local dir = (TargetPos - hrp.Position).Unit  
        if (TargetPos - hrp.Position).Magnitude > 5 then  
            hrp.Velocity = dir * 120  
        else  
            hrp.Velocity = Vector3.new(0, 0, 0)  
        end  
    end  
end

end)
