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
local Lighting = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\253\202\220\45\242\178\201\25", "\126\177\163\187\69\134\219\167"));
local Terrain = workspace.Terrain;
Lighting.GlobalShadows = false;
Lighting.FogEnd = 8999999488;
Lighting.Brightness = 0;
Lighting.EnvironmentDiffuseScale = 0;
Lighting.EnvironmentSpecularScale = 0;
for _, v in pairs(Lighting:GetChildren()) do
	if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\16\198\51", "\156\67\173\74\165")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\22\187\70\25\177\3\64\50\178\74\2", "\38\84\215\41\118\220\70")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\99\3\44\32\255\73\5\7\20\248\85\21\54", "\158\48\118\66\114")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\136\43\28\57\97\134\244\185\54\21\53\103\172\244\165\1\22\48\118\166\239", "\155\203\68\112\86\19\197")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\98\216\38\232\72\87\227\222\79\216\58\248\101\126\227\253\69\201", "\152\38\189\86\156\32\24\133")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\222\91\178\84\217\81\161\67\255\67", "\38\156\55\199")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\137\105\113\39\0\100\242\70\186\120", "\35\200\29\28\72\115\20\154"))) then
		v:Destroy();
	end
end
for _, v in pairs(workspace:GetDescendants()) do
	if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\59\190\194\218\189\45\38\13", "\84\121\223\177\191\237\76")) then
		v.Material = Enum.Material.Plastic;
		v.Reflectance = 0;
		v.CastShadow = false;
	end
	if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\159\83\202\161\54", "\161\219\54\169\192\90\48\80")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\125\71\24\49\92\80\5", "\69\41\34\96")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\140\194\197\30\11\40\176\198\242\7\11\63\168\198\197", "\75\220\163\183\106\98")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\54\168\138\62\213", "\185\98\218\235\87")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\233\57\38\235", "\202\171\92\71\134\190")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\26\204\35\131\44", "\232\73\161\76")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\157\208\80\88", "\126\219\185\34\61")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\63\222\95\96\117\123\246\244", "\135\108\174\62\18\30\23\147"))) then
		v:Destroy();
	end
end
Terrain.WaterWaveSize = 0;
Terrain.WaterWaveSpeed = 0;
Terrain.WaterReflectance = 0;
Terrain.WaterTransparency = 1;
workspace.CurrentCamera.FieldOfView = 70;
print("FIX LAG MAX ĐÃ BẬT");
for _, v in ipairs(workspace:GetDescendants()) do
	if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\148\232\57\206\40\175\33\211", "\167\214\137\74\171\120\206\83")) then
		v.Material = Enum.Material.SmoothPlastic;
		v.Reflectance = 0;
		v.CastShadow = false;
	end
end
local function optimize(v)
	if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\187\241\32\73\241\164\135\245\23\80\241\179\159\245\32", "\199\235\144\82\61\152")) then
		v.Rate = math.max(1, math.floor(v.Rate * 0.1));
		v.Speed = NumberRange.new(0.1, 1);
		v.Lifetime = NumberRange.new(0.1, 0.3);
	end
	if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\37\19\184\38", "\75\103\118\217")) then
		v.Transparency = NumberSequence.new(0.9);
	end
	if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\243\70\113\29\181", "\126\167\52\16\116\217")) then
		v.Transparency = NumberSequence.new(0.9);
	end
	if (v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\248\33\41\142\160\53\245\207\38\52", "\156\168\78\64\224\212\121")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\52\254\170\218\43\231\162\198\19", "\174\103\142\197")) or v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\101\61\77\62\36\93\253\122\33\88\48\49", "\152\54\72\63\88\69\62"))) then
		v.Brightness = v.Brightness * 0.1;
		v.Range = math.max(1, v.Range * 0.1);
	end
	if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\231\201\225\87\209", "\60\180\164\142")) then
		v.Opacity = 0.1;
	end
	if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\126\87\23\44", "\114\56\62\101\73\71\141")) then
		v.Size = v.Size * 0.1;
		v.Heat = 0;
	end
	if v:IsA(LUAOBFUSACTOR_DECRYPT_STR_0("\139\249\218\214\179\229\222\215", "\164\216\137\187")) then
		v.Enabled = true;
	end
end
for _, v in ipairs(workspace:GetDescendants()) do
	optimize(v);
end
workspace.DescendantAdded:Connect(optimize);
local RunService = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\224\243\63\129\163\236\29\219\229\52", "\107\178\134\81\210\198\158"));
local Lighting = game:GetService(LUAOBFUSACTOR_DECRYPT_STR_0("\20\7\133\206\190\49\0\133", "\202\88\110\226\166"));
RunService.RenderStepped:Connect(function()
	if Lighting.GlobalShadows then
		Lighting.GlobalShadows = false;
	end
	if (Lighting.Brightness ~= 0) then
		Lighting.Brightness = 0;
	end
	if (Lighting.Ambient ~= Color3.fromRGB(255, 255, 255)) then
		Lighting.Ambient = Color3.fromRGB(255, 255, 255);
	end
end);
print("FIX LAG MAX: CHẾ ĐỘ ÁNH SÁNG ĐÃ BẬT");
