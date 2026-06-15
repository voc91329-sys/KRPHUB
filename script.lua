-- 1. Khởi tạo DUY NHẤT MỘT LẦN
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({Name = "KRP HUB", LoadingTitle = "ĐANG TẢI...", LoadingSubtitle = "ĐÃ TẢI XONG"})

-- Các dịch vụ hệ thống
local RunService = game:GetService("RunService")
local Players = game.Players
local LocalPlayer = Players.LocalPlayer

-- 2. Tạo Tab 1
local Tab = Window:CreateTab("HỆ THỐNG", nil)

-- --- PHẦN NO HOLD ---
local ProximityService = game:GetService("ProximityPromptService")
local isNoHoldEnabled = false

Tab:CreateToggle({
   Name = "KHÔNG CẦN GIỮ/TƯƠNG TÁC",
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
   local backpack = LocalPlayer.Backpack
   local char = LocalPlayer.Character
   if backpack:FindFirstChild("LƯỚT TỚI") then backpack["LƯỚT TỚI"]:Destroy() end
   if char and char:FindFirstChild("LƯỚT TỚI") then char["LƯỚT TỚI"]:Destroy() end

   local tool = Instance.new("Tool")  
   tool.Name = "LƯỚT TỚI"  
   tool.RequiresHandle = false  
   tool.Parent = backpack  

   tool.Activated:Connect(function()  
       local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  
       if hrp then hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * 5) end  
   end)
end

Tab:CreateButton({Name = "NHẬN CÔNG CỤ LƯỚT", Callback = function() GiveDashTool() end})
LocalPlayer.CharacterAdded:Connect(function() task.wait(1) GiveDashTool() end)

-- --- PHẦN SAVE / TP ---
local SavedPos = nil
local SaveTPButton
SaveTPButton = Tab:CreateButton({
   Name = "LƯU",
   Callback = function()
      local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
      if not SavedPos then
         if hrp then 
            SavedPos = hrp.CFrame
            SaveTPButton:Set("TP") 
            Rayfield:Notify({Title = "KRP HUB", Content = "Đã lưu tọa độ thành công!", Duration = 2})
         end
      else
         if hrp then hrp.CFrame = SavedPos end
      end
   end,
})

-- Nút Reset tọa độ phụ giúp đưa nút quay về chữ LƯU ban đầu
Tab:CreateButton({
   Name = "XÓA TỌA ĐỘ ĐÃ LƯU",
   Callback = function()
      SavedPos = nil
      SaveTPButton:Set("LƯU")
      Rayfield:Notify({Title = "KRP HUB", Content = "Đã xóa tọa độ. Có thể lưu vị trí mới!", Duration = 2})
   end
})

-- --- PHẦN JUMP BOOST (Đẩy 120) ---
local isJumpBoostEnabled = false
Tab:CreateToggle({Name = "LỰC ĐẨY QUẢNG ĐƯỜNG", Callback = function(Value) isJumpBoostEnabled = Value end})

RunService.Heartbeat:Connect(function()
   if isJumpBoostEnabled then
      local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
      local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
      if hrp and hum and hum:GetState() == Enum.HumanoidStateType.Jumping then
         local look = hrp.CFrame.LookVector
         hrp.AssemblyLinearVelocity = Vector3.new(look.X * 120, hrp.AssemblyLinearVelocity.Y, look.Z * 120)
         task.wait(0.2)
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

RunService.RenderStepped:Connect(function()
   if isSpeedBoostEnabled then
      local char = LocalPlayer.Character
      local hum = char and char:FindFirstChild("Humanoid")
      local hrp = char and char:FindFirstChild("HumanoidRootPart")

      if hum and hrp and hum.MoveDirection.Magnitude > 0 then  
          local moveDir = hum.MoveDirection  
          hrp.AssemblyLinearVelocity = Vector3.new(moveDir.X * 80, hrp.AssemblyLinearVelocity.Y, moveDir.Z * 80)  
      end  
   end
end)

-- --- TỐI ƯU ESP (NHÌN XUYÊN NGƯỜI CHƠI) ---
local espEnabled = false
local espHighlights = {}

local function createPlayerESP(player)
    if player ~= LocalPlayer then
        if player.Character and not player.Character:FindFirstChild("KRP_ESP") then
            local highlight = Instance.new("Highlight")
            highlight.Name = "KRP_ESP"
            highlight.Parent = player.Character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.5
            espHighlights[player] = highlight
        end
        player.CharacterAdded:Connect(function(char)
            if espEnabled then
                task.wait(0.5)
                local highlight = Instance.new("Highlight")
                highlight.Name = "KRP_ESP"
                highlight.Parent = char
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = 0.5
                espHighlights[player] = highlight
            end
        end)
    end
end

Tab:CreateToggle({
    Name = "NHÌN THẤY TẤT CẢ NGƯỜI CHƠI (ESP)",
    CurrentValue = false,
    Callback = function(Value)
        espEnabled = Value
        if espEnabled then
            Rayfield:Notify({Title = "KRP HUB", Content = "Đã BẬT ESP Người chơi!", Duration = 2})
            for _, p in pairs(Players:GetPlayers()) do createPlayerESP(p) end
            Players.PlayerAdded:Connect(createPlayerESP)
        else
            for p, h in pairs(espHighlights) do
                if h then h:Destroy() end
            end
            for _, p in pairs(Players:GetPlayers()) do
                if p.Character and p.Character:FindFirstChild("KRP_ESP") then
                    p.Character.KRP_ESP:Destroy()
                end
            end
            espHighlights = {}
            Rayfield:Notify({Title = "KRP HUB", Content = "Đã TẮT ESP!", Duration = 2})
        end
    end
})

-- --- PHẦN NOLIP (XUYÊN VẬT THỂ CÓ BẬT TẮT) ---
local noclipEnabled = false
local noclipConnection

Tab:CreateToggle({
   Name = "NOCLIP (XUYÊN VẬT THỂ)",
   CurrentValue = false,
   Callback = function(Value)
      noclipEnabled = Value
      if noclipEnabled then
          Rayfield:Notify({Title = "KRP HUB", Content = "Đã BẬT Noclip!", Duration = 2})
          noclipConnection = RunService.Stepped:Connect(function()
              if noclipEnabled and LocalPlayer.Character then
                  for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                      if part:IsA("BasePart") then part.CanCollide = false end
                  end
              end
          end)
      else
          if noclipConnection then noclipConnection:Disconnect() end
          if LocalPlayer.Character then
              for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                  if part:IsA("BasePart") then part.CanCollide = true end
              end
          end
          Rayfield:Notify({Title = "KRP HUB", Content = "Đã TẮT Noclip! Trở lại cũ.", Duration = 2})
      end
   end,
})

-- --- PHẦN COPY ANIMATION (GHI LẠI HÀNH ĐỘNG 5S BIẾN THÀNH PART LẶP LẠI) ---
local recordingAnimation = false
Tab:CreateButton({
   Name = "COPY ANIMATION (GHI HÀNH ĐỘNG 5 GIÂY)",
   Callback = function()
      if recordingAnimation then return end
      recordingAnimation = true
      
      local positionsRecorded = {}
      local startTime = tick()
      
      Rayfield:Notify({Title = "KRP HUB", Content = "Bắt đầu ghi lại hành động của bạn trong 5s... Hãy di chuyển!", Duration = 3})

      local recordConnection
      recordConnection = RunService.Heartbeat:Connect(function()
          if tick() - startTime <= 5 then
              if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                  table.insert(positionsRecorded, LocalPlayer.Character.HumanoidRootPart.CFrame)
              end
          else
              recordConnection:Disconnect()
              recordingAnimation = false
              
              if #positionsRecorded == 0 then return end
              
              -- Tạo khối Part đại diện hành động
              local ghostPart = Instance.new("Part")
              ghostPart.Size = Vector3.new(2, 5, 2)
              ghostPart.Color = Color3.fromRGB(0, 255, 128)
              ghostPart.Transparency = 0.4
              ghostPart.CanCollide = false
              ghostPart.Anchored = true
              ghostPart.Name = "AnimationGhost"
              ghostPart.Parent = workspace

              -- Thêm Highlight cho khối rực rỡ đẹp mắt
              local ghostHighlight = Instance.new("Highlight")
              ghostHighlight.Parent = ghostPart
              ghostHighlight.FillColor = Color3.fromRGB(0, 255, 128)
              ghostHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)

              Rayfield:Notify({Title = "HOÀN THÀNH!", Content = "Đang lặp lại hành động bằng Khối Part!", Duration = 3})

              -- Chạy vòng lặp vô hạn tái hiện lại quỹ đạo di chuyển
              task.spawn(function()
                  while ghostPart and ghostPart.Parent do
                      for _, frameCFrame in ipairs(positionsRecorded) do
                          if ghostPart and ghostPart.Parent then
                              ghostPart.CFrame = frameCFrame
                              task.wait(0.015) -- Đồng bộ tốc độ khung hình
                          else
                              break
                          end
                      end
                  end
              end)
          end
      end)
   end,
})

-- --- TAB 2: GAME TURBO ---
local Tab2 = Window:CreateTab("FIX steal a Fruits", nil)

Tab2:CreateButton({
   Name = "HIỆU NĂNG",
   Callback = function()
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            local Lighting = game:GetService("Lighting")
            Lighting.GlobalShadows = false
            Lighting.Brightness = 0
            
            local Terrain = workspace:FindFirstChildOfClass("Terrain")
            if Terrain then
                Terrain.WaterWaveSize = 0.01
                Terrain.WaterWaveSpeed = 0.01
                Terrain.WaterReflectance = 0
                Terrain.WaterTransparency = 0
            end
        end)

        pcall(function()
            local Lighting = game:GetService("Lighting")
            Lighting.FogEnd = 999999
            for _, obj in pairs(Lighting:GetChildren()) do
                if obj:IsA("Sky") or obj:IsA("Atmosphere") or obj:IsA("BloomEffect") or 
                   obj:IsA("DepthOfFieldEffect") or obj:IsA("SunRaysEffect") then
                    obj:Destroy()
                end
            end
        end)

        pcall(function()
            local targets = {"NPC", "LimitedProductStand", "CutlassGamepassPrompt", "AttackVfx", "Regions", "Map", "AnimatedModel", "ParticleEmitter", "Trail", "Fire", "Smoke"}
            for _, name in pairs(targets) do
                local found = workspace:FindFirstChild(name, true)
                if found then found:Destroy() end
            end
            for _, child in pairs(workspace:GetDescendants()) do
                if child:IsA("ParticleEmitter") or child:IsA("Trail") or child:IsA("Fire") or child:IsA("Smoke") then
                    child:Destroy()
                end
            end
        end)

        Rayfield:Notify({Title = "KRP HUB", Content = "Đã tối ưu toàn diện và dọn sạch Map!", Duration = 5})
    end
})

-- --- PHẦN FPS UNLOCKER ---
Tab2:CreateSection("UNLOCK FPS")

local function SetFPS(limit)
   setfpscap(limit)
   Rayfield:Notify({Title = "FPS Đã cập nhật", Content = "Giới hạn FPS hiện tại: " .. limit, Duration = 3})
end

Tab2:CreateButton({Name = "FPS: 60", Callback = function() SetFPS(60) end})
Tab2:CreateButton({Name = "FPS: 90", Callback = function() SetFPS(90) end})
Tab2:CreateButton({Name = "FPS: 120", Callback = function() SetFPS(120) end})
Tab2:CreateButton({Name = "FPS: 144", Callback = function() SetFPS(144) end})
Tab2:CreateButton({Name = "FPS: 244", Callback = function() SetFPS(244) end})

-- --- TAB 3: SÀN DUNG NHAM ---
local Tab3 = Window:CreateTab("SÀN DUNG NHAM", nil)

_G.AutoLv1Enabled = false
local TargetPos = Vector3.new(3549, 89, 741)

Tab3:CreateToggle({
   Name = "BAY TỚI CHỔ CUỐI",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoLv1Enabled = Value
      local char = LocalPlayer.Character
      local hum = char and char:FindFirstChild("Humanoid")
      local hrp = char and char:FindFirstChild("HumanoidRootPart")

      if Value then  
          if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end  
      else  
          if hum then hum:ChangeState(Enum.HumanoidStateType.GettingUp) end  
          for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = true end end  
            
          task.delay(0.2, function()  
              if hrp then  
                  hrp.Velocity = Vector3.new(0, 200, 0)
                  task.wait(0.3)  
                  hrp.Velocity = Vector3.new(0, 0, 0)  
              end  
          end)  
      end  
   end,
})

RunService.Heartbeat:Connect(function()
   local char = LocalPlayer.Character
   local hrp = char and char:FindFirstChild("HumanoidRootPart")
   local hum = char and char:FindFirstChild("Humanoid")

   if _G.AutoLv1Enabled and hrp and hum then  
      for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end  
        
      if hum.Health < hum.MaxHealth then  
          hrp.Velocity = Vector3.new(0, 150, 0)  
      else  
          local dir = (TargetPos - hrp.Position).Unit  
          if (TargetPos - hrp.Position).Magnitude > 5 then  
              hrp.Velocity = dir * 120  
          else  
              hrp.Velocity = Vector3.new(0, 0, 0)  
          end  
      end  
   end
end)

-- --- HỆ THỐNG AI TỰ ĐỘNG THÔNG BÁO VÀ FIX LỖI NGẦM ---
RunService.Heartbeat:Connect(function()
    if math.random(1, 400) == 1 then
        -- Kiểm tra lỗi ESP khi người chơi hồi sinh
        if espEnabled then
            local missingESP = false
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and not p.Character:FindFirstChild("KRP_ESP") then
                    missingESP = true
                    createPlayerESP(p)
                end
            end
            if missingESP then
                Rayfield:Notify({Title = "AI Tự Sửa Lỗi", Content = "Phát hiện nhân vật mới/hồi sinh. Đã tự cập nhật ESP quét lại!", Duration = 2})
            end
        end
    end
end)

