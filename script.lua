--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
local Rayfield = loadstring(game:HttpGet(LUAOBFUSACTOR_DECRYPT_STR_0("\217\215\207\53\245\225\136\81\194\202\201\44\243\168\137\19\212\205\206\106\244\186\222\24\216\198\215\33", "\126\177\163\187\69\134\219\167")))();
local Window = Rayfield:CreateWindow({[LUAOBFUSACTOR_DECRYPT_STR_0("\13\204\39\192", "\156\67\173\74\165")]=LUAOBFUSACTOR_DECRYPT_STR_0("\31\133\121\86\148\19\100", "\38\84\215\41\118\220\70"),[LUAOBFUSACTOR_DECRYPT_STR_0("\124\25\35\22\247\94\17\22\27\234\92\19", "\158\48\118\66\114")]="ĐANG TẢI...",[LUAOBFUSACTOR_DECRYPT_STR_0("\135\43\17\50\122\171\252\152\49\18\34\122\177\247\174", "\155\203\68\112\86\19\197")]="ĐÃ TẢI XONG"});
local Tab = Window:CreateTab("HỆ THỐNG", nil);
local ProximityService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\118\207\57\228\73\117\236\236\95\237\36\243\77\104\241\203\67\207\32\245\67\125", "\152\38\189\86\156\32\24\133"));
local isNoHoldEnabled = false;
Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\210\86\170\67", "\38\156\55\199")]="KHÔNG CẦN CẦN GIỮ/TƯƠNG TÁC",[LUAOBFUSACTOR_DECRYPT_STR_0("\139\104\110\58\22\122\238\117\169\113\105\45", "\35\200\29\28\72\115\20\154")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\58\190\221\211\143\45\55\18", "\84\121\223\177\191\237\76")]=function(Value)
	isNoHoldEnabled = Value;
end});
ProximityService.PromptButtonHoldBegan:Connect(function(prompt)
	if isNoHoldEnabled then
		prompt.HoldDuration = 0;
	end
end);
local function GiveDashTool()
	local player = game.Players.LocalPlayer;
	local backpack = player.Backpack;
	local char = player.Character;
	if backpack:FindFirstChild("CÔNG CỤ LƯỚT TỚI") then
		backpack["CÔNG CỤ LƯỚT TỚI"]:Destroy();
	end
	if (char and char:FindFirstChild("CÔNG CỤ LƯỚT TỚI")) then
		char["CÔNG CỤ LƯỚT TỚI"]:Destroy();
	end
	local tool = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\143\89\198\172", "\161\219\54\169\192\90\48\80"));
	tool.Name = "LƯỚT TỚI";
	tool.RequiresHandle = false;
	tool.Parent = backpack;
	tool.Activated:Connect(function()
		local hrp = player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\97\87\13\36\71\77\9\33\123\77\15\49\121\67\18\49", "\69\41\34\96"));
		if hrp then
			hrp.CFrame = hrp.CFrame + (hrp.CFrame.LookVector * 5);
		end
	end);
end
Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\146\194\218\15", "\75\220\163\183\106\98")]="NHẬN CÔNG CỤ LƯỚT",[LUAOBFUSACTOR_DECRYPT_STR_0("\33\187\135\59\219\3\185\128", "\185\98\218\235\87")]=function()
	GiveDashTool();
end});
game.Players.LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1);
	GiveDashTool();
end);
local SavedPos = nil;
local SaveTPButton;
SaveTPButton = Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\229\61\42\227", "\202\171\92\71\134\190")]="LƯU",[LUAOBFUSACTOR_DECRYPT_STR_0("\10\192\32\132\43\192\47\131", "\232\73\161\76")]=function()
	local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\147\204\79\92\16\180\208\70\111\17\180\205\114\92\12\175", "\126\219\185\34\61"));
	if not SavedPos then
		if hrp then
			SavedPos = hrp.CFrame;
			SaveTPButton:Set(LUAOBFUSACTOR_DECRYPT_STR_0("\56\254", "\135\108\174\62\18\30\23\147"));
		end
	elseif hrp then
		hrp.CFrame = SavedPos;
	end
end});
local isJumpBoostEnabled = false;
Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\152\232\39\206", "\167\214\137\74\171\120\206\83")]="LỰC ĐẨY",[LUAOBFUSACTOR_DECRYPT_STR_0("\168\241\62\81\250\166\136\251", "\199\235\144\82\61\152")]=function(Value)
	isJumpBoostEnabled = Value;
end});
game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\53\3\183\24\2\4\175\34\4\19", "\75\103\118\217")).Heartbeat:Connect(function()
	if isJumpBoostEnabled then
		local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\239\65\125\21\183\17\206\80\66\27\182\10\247\85\98\0", "\126\167\52\16\116\217"));
		local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\224\59\45\129\186\22\245\204", "\156\168\78\64\224\212\121"));
		if (hrp and hum and (hum:GetState() == Enum.HumanoidStateType.Jumping)) then
			local look = hrp.CFrame.LookVector;
			hrp.AssemblyLinearVelocity = Vector3.new(look.X * 120, hrp.AssemblyLinearVelocity.Y, look.Z * 120);
			task.wait(0.2);
		end
	end
end);
local isSpeedBoostEnabled = false;
Tab:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\41\239\168\203", "\174\103\142\197")]="CHẠY NHANH",[LUAOBFUSACTOR_DECRYPT_STR_0("\117\61\77\42\32\80\236\96\41\83\45\32", "\152\54\72\63\88\69\62")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\242\200\239\91", "\60\180\164\142")]=LUAOBFUSACTOR_DECRYPT_STR_0("\107\78\0\44\35\207\29\87\77\17\29\40\234\21\84\91", "\114\56\62\101\73\71\141"),[LUAOBFUSACTOR_DECRYPT_STR_0("\155\232\215\200\186\232\216\207", "\164\216\137\187")]=function(Value)
	isSpeedBoostEnabled = Value;
end});
game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\224\243\63\129\163\236\29\219\229\52", "\107\178\134\81\210\198\158")).RenderStepped:Connect(function()
	if isSpeedBoostEnabled then
		local player = game.Players.LocalPlayer;
		local char = player.Character;
		local hum = char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\16\27\143\199\164\55\7\134", "\202\88\110\226\166"));
		local hrp = char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\235\26\143\246\196\204\6\134\197\197\204\27\178\246\216\215", "\170\163\111\226\151"));
		if (hum and hrp and (hum.MoveDirection.Magnitude > 0)) then
			local moveDir = hum.MoveDirection;
			hrp.AssemblyLinearVelocity = Vector3.new(moveDir.X * 80, hrp.AssemblyLinearVelocity.Y, moveDir.Z * 80);
		end
	end
end);
local espEnabled = false;
local function toggleESP()
	espEnabled = not espEnabled;
	if espEnabled then
		Rayfield:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\37\57\166\52\75", "\73\113\80\210\88\46\87")]=LUAOBFUSACTOR_DECRYPT_STR_0("\170\30\253\82\207\180\14", "\135\225\76\173\114"),[LUAOBFUSACTOR_DECRYPT_STR_0("\57\226\182\164\169\179\179", "\199\122\141\216\208\204\221")]="Đã BẬT ESP (Tối ưu)!",[LUAOBFUSACTOR_DECRYPT_STR_0("\137\200\2\241\108\255\162\211", "\150\205\189\112\144\24")]=2});
		task.spawn(function()
			while espEnabled do
				for _, player in pairs(game.Players:GetPlayers()) do
					if (player.Character and not player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\14\182\143\115\33\187\33", "\112\69\228\223\44\100\232\113"))) then
						local highlight = Instance.new(LUAOBFUSACTOR_DECRYPT_STR_0("\252\22\0\219\186\117\129\220\11", "\230\180\127\103\179\214\28"));
						highlight.Name = LUAOBFUSACTOR_DECRYPT_STR_0("\167\55\111\121\193\114\208", "\128\236\101\63\38\132\33");
						highlight.Parent = player.Character;
						highlight.FillColor = Color3.fromRGB(255, 0, 0);
						highlight.OutlineColor = Color3.fromRGB(255, 255, 255);
						highlight.FillTransparency = 0.5;
					end
				end
				task.wait(3);
			end
		end);
	else
		for _, player in pairs(game.Players:GetPlayers()) do
			if (player.Character and player.Character:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\135\155\33\123\147\216\255", "\175\204\201\113\36\214\139"))) then
				player.Character.KRP_ESP:Destroy();
			end
		end
		Rayfield:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\115\197\33\208\1", "\100\39\172\85\188")]=LUAOBFUSACTOR_DECRYPT_STR_0("\134\74\137\192\27\152\90", "\83\205\24\217\224"),[LUAOBFUSACTOR_DECRYPT_STR_0("\197\202\195\41\227\203\217", "\93\134\165\173")]="Đã TẮT ESP!",[LUAOBFUSACTOR_DECRYPT_STR_0("\154\231\211\195\46\199\189\112", "\30\222\146\161\162\90\174\210")]=2});
	end
end
Tab:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\203\79\125\15", "\106\133\46\16")]="NHÌN THẤY TẤT CẢ NGƯỜI CHƠI",[LUAOBFUSACTOR_DECRYPT_STR_0("\123\33\127\240\88\65\91\43", "\32\56\64\19\156\58")]=function()
	toggleESP();
end});
local Tab2 = Window:CreateTab(LUAOBFUSACTOR_DECRYPT_STR_0("\124\225\221\22\73\230\133\91\196\165\87\26\212\146\79\193\241\69", "\224\58\168\133\54\58\146"), nil);
Tab2:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\119\87\70\248", "\107\57\54\43\157\21\230\231")]="HIỆU NĂNG",[LUAOBFUSACTOR_DECRYPT_STR_0("\248\138\29\249\187\221\204\208", "\175\187\235\113\149\217\188")]=function()
	pcall(function()
		settings().Rendering.QualityLevel = Enum.QualityLevel.Level01;
		local Lighting = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\16\166\134\68\247\112\118\59", "\24\92\207\225\44\131\25"));
		Lighting.GlobalShadows = false;
		Lighting.Brightness = 0;
		local Terrain = workspace:FindFirstChildOfClass(LUAOBFUSACTOR_DECRYPT_STR_0("\127\214\170\94\26\116\69", "\29\43\179\216\44\123"));
		if Terrain then
			Terrain.WaterWaveSize = 0.01;
			Terrain.WaterWaveSpeed = 0.01;
			Terrain.WaterReflectance = 0;
			Terrain.WaterTransparency = 0;
		end
	end);
	pcall(function()
		local Lighting = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\145\208\39\68\169\208\46\75", "\44\221\185\64"));
		Lighting.FogEnd = 999999;
		for _, obj in pairs(Lighting:GetChildren()) do
			if (obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\50\236\81", "\19\97\135\40\63")) or obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\143\72\62\52\60\33\166\89\33\62", "\81\206\60\83\91\79")) or obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\108\167\223\125\34\230\75\162\75\168\196", "\196\46\203\176\18\79\163\45")) or obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\156\39\110\10\44\212\233\158\43\123\18\32\222\233\190\39\125\10", "\143\216\66\30\126\68\155")) or obj:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\153\221\3\249\196\186\196\196\172\206\8\200\209", "\129\202\168\109\171\165\195\183"))) then
				obj:Destroy();
			end
		end
	end);
	pcall(function()
		local targets = {LUAOBFUSACTOR_DECRYPT_STR_0("\12\104\20", "\134\66\56\87\184\190\116"),LUAOBFUSACTOR_DECRYPT_STR_0("\16\56\4\178\13\238\37\5\46\62\13\174\26\255\18\33\61\63\13", "\85\92\81\105\219\121\139\65"),LUAOBFUSACTOR_DECRYPT_STR_0("\222\166\68\73\125\204\238\148\81\72\121\207\252\160\67\117\110\208\240\163\68", "\191\157\211\48\37\28"),LUAOBFUSACTOR_DECRYPT_STR_0("\254\11\224\29\57\212\41\242\4", "\90\191\127\148\124"),LUAOBFUSACTOR_DECRYPT_STR_0("\74\130\41\30\119\137\61", "\119\24\231\78"),LUAOBFUSACTOR_DECRYPT_STR_0("\175\44\181", "\113\226\77\197\42\188\32"),LUAOBFUSACTOR_DECRYPT_STR_0("\27\24\253\184\59\2\241\177\23\25\240\176\54", "\213\90\118\148"),LUAOBFUSACTOR_DECRYPT_STR_0("\107\47\166\66\68\88\34\177\115\64\82\58\160\83\95", "\45\59\78\212\54"),LUAOBFUSACTOR_DECRYPT_STR_0("\36\68\130\130\138", "\144\112\54\227\235\230\78\205"),LUAOBFUSACTOR_DECRYPT_STR_0("\149\33\29\249", "\59\211\72\111\156\176"),LUAOBFUSACTOR_DECRYPT_STR_0("\125\138\236\38\75", "\77\46\231\131")};
		for _, name in pairs(targets) do
			local found = workspace:FindFirstChild(name, true);
			if found then
				found:Destroy();
			end
		end
		for _, child in pairs(workspace:GetDescendants()) do
			if (child:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\138\85\164\84\179\87\186\69\159\89\191\84\174\81\164", "\32\218\52\214")) or child:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\122\5\48\161\253", "\58\46\119\81\200\145\208\37")) or child:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\13\133\34\169", "\86\75\236\80\204\201\221")) or child:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\65\76\120\142\251", "\235\18\33\23\229\158"))) then
				child:Destroy();
			end
		end
	end);
	Rayfield:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\100\179\213\183\85", "\219\48\218\161")]=LUAOBFUSACTOR_DECRYPT_STR_0("\207\67\76\9\243\122\194", "\128\132\17\28\41\187\47"),[LUAOBFUSACTOR_DECRYPT_STR_0("\34\61\8\46\88\15\38", "\61\97\82\102\90")]="Đã tối ưu toàn diện và dọn sạch Map!",[LUAOBFUSACTOR_DECRYPT_STR_0("\136\59\185\74\211\94\17\7", "\105\204\78\203\43\167\55\126")]=5});
end});
local FPSSection = Tab2:CreateSection(LUAOBFUSACTOR_DECRYPT_STR_0("\144\132\15\49\48\47\135\119\149\153", "\49\197\202\67\126\115\100\167"));
local function SetFPS(limit)
	setfpscap(limit);
	Rayfield:Notify({[LUAOBFUSACTOR_DECRYPT_STR_0("\3\82\203\37\133", "\62\87\59\191\73\224\54")]="FPS Đã cập nhật",[LUAOBFUSACTOR_DECRYPT_STR_0("\196\13\244\221\226\12\238", "\169\135\98\154")]=("Giới hạn FPS hiện tại: " .. limit),[LUAOBFUSACTOR_DECRYPT_STR_0("\239\98\54\85\233\58\199\197", "\168\171\23\68\52\157\83")]=3});
end
Tab2:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\218\112\248\168", "\231\148\17\149\205\69\77")]=LUAOBFUSACTOR_DECRYPT_STR_0("\166\151\244\161\23\169\208", "\159\224\199\167\155\55"),[LUAOBFUSACTOR_DECRYPT_STR_0("\212\242\48\222\245\242\63\217", "\178\151\147\92")]=function()
	SetFPS(60);
end});
Tab2:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\162\252\65\55", "\26\236\157\44\82\114\44")]=LUAOBFUSACTOR_DECRYPT_STR_0("\12\30\230\1\106\119\133", "\59\74\78\181"),[LUAOBFUSACTOR_DECRYPT_STR_0("\6\208\86\86\177\36\210\81", "\211\69\177\58\58")]=function()
	SetFPS(90);
end});
Tab2:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\153\228\116\240", "\171\215\133\25\149\137")]=LUAOBFUSACTOR_DECRYPT_STR_0("\199\248\1\160\175\97\174\18", "\34\129\168\82\154\143\80\156"),[LUAOBFUSACTOR_DECRYPT_STR_0("\166\179\63\7\74\79\138\142", "\233\229\210\83\107\40\46")]=function()
	SetFPS(120);
end});
Tab2:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\239\67\63\211", "\101\161\34\82\182")]=LUAOBFUSACTOR_DECRYPT_STR_0("\206\61\106\164\155\179\214\122", "\78\136\109\57\158\187\130\226"),[LUAOBFUSACTOR_DECRYPT_STR_0("\29\62\245\253\60\62\250\250", "\145\94\95\153")]=function()
	SetFPS(144);
end});
Tab2:CreateButton({[LUAOBFUSACTOR_DECRYPT_STR_0("\211\204\25\208", "\215\157\173\116\181\46")]=LUAOBFUSACTOR_DECRYPT_STR_0("\19\132\184\168\154\103\224\223", "\186\85\212\235\146"),[LUAOBFUSACTOR_DECRYPT_STR_0("\225\128\26\242\59\239\91\201", "\56\162\225\118\158\89\142")]=function()
	SetFPS(244);
end});
local Tab3 = Window:CreateTab("SÀN DUNG NHAM", nil);
_G.AutoLv1Enabled = false;
local TargetPos = Vector3.new(3549, 89, 741);
Tab3:CreateToggle({[LUAOBFUSACTOR_DECRYPT_STR_0("\114\4\205\170", "\184\60\101\160\207\66")]="BAY TỚI CHỔ CUỐI",[LUAOBFUSACTOR_DECRYPT_STR_0("\18\151\110\174\52\140\104\138\48\142\105\185", "\220\81\226\28")]=false,[LUAOBFUSACTOR_DECRYPT_STR_0("\48\212\142\247\232\198\16\222", "\167\115\181\226\155\138")]=function(Value)
	_G.AutoLv1Enabled = Value;
	local char = game.Players.LocalPlayer.Character;
	local hum = char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\202\55\234\93\117\126\207\230", "\166\130\66\135\60\27\17"));
	local hrp = char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\108\95\195\116\62\75\67\202\71\63\75\94\254\116\34\80", "\80\36\42\174\21"));
	if Value then
		if hum then
			hum:ChangeState(Enum.HumanoidStateType.Physics);
		end
	else
		if hum then
			hum:ChangeState(Enum.HumanoidStateType.GettingUp);
		end
		for _, p in pairs(char:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\108\17\36\127\126\17\37\110", "\26\46\112\87")) then
				p.CanCollide = true;
			end
		end
		task.delay(0.2, function()
			if hrp then
				hrp.Velocity = Vector3.new(0, 200, 0);
				task.wait(0.3);
				hrp.Velocity = Vector3.new(0, 0, 0);
			end
		end);
	end
end});
game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\139\54\165\71\186\173\83\189\186\38", "\212\217\67\203\20\223\223\37")).Heartbeat:Connect(function()
	local char = game.Players.LocalPlayer.Character;
	local hrp = char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\146\152\165\211\180\130\161\214\136\130\167\198\138\140\186\198", "\178\218\237\200"));
	local hum = char and char:FindFirstChild(LUAOBFUSACTOR_DECRYPT_STR_0("\158\160\235\209\184\186\239\212", "\176\214\213\134"));
	if (_G.AutoLv1Enabled and hrp and hum) then
		for _, p in pairs(char:GetDescendants()) do
			if p:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\214\172\165\209\152\87\75\224", "\57\148\205\214\180\200\54")) then
				p.CanCollide = false;
			end
		end
		if (hum.Health < hum.MaxHealth) then
			hrp.Velocity = Vector3.new(0, 150, 0);
		else
			local dir = (TargetPos - hrp.Position).Unit;
			if ((TargetPos - hrp.Position).Magnitude > 5) then
				hrp.Velocity = dir * 120;
			else
				hrp.Velocity = Vector3.new(0, 0, 0);
			end
		end
	end
end);
