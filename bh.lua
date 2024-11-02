-- BrookHell by TinyTosha

local version = "v0.30637 diamond exp"

local LocalPlrName = game.Players.LocalPlayer.Character.Name

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "BrookHell by TinyTosha", HidePremium = false, SaveConfig = false, ConfigFolder = "Delete Me!"})


OrionLib:MakeNotification({
	Name = "BrookHell",
	Content = "Script by TinyTosha! UILib: Orion",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local CTab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local DevTab = Window:MakeTab({
	Name = "Dev Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CTab:AddLabel("BrookHell By TinyTosha")
CTab:AddLabel("Version: " ..version)

Tab:AddSection({
	Name = "House"
})

Tab:AddTextbox({
	Name = "Unban house (Write owner username)",
	Default = "",
	TextDisappear = false,
	Callback = function(name)
		local PlrName = name
        	local HouseNum = game.Workspace["001_Lots"][PlrName .."House"].Number.Number.Value

        	game.Workspace["001_Lots"][PlrName .."House"].HousePickedByPlayer.HouseModel["BannedBlock" ..HouseNum]:Destroy()

		OrionLib:MakeNotification({
			Name = "BrookHell",
			Content = "Unbanned (Owner: " ..PlrName .." House num: " ..HouseNum .." )!",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end	  
})
Tab:AddTextbox({
	Name = "Remove Doors (Write owner username)",
	Default = "",
	TextDisappear = false,
	Callback = function(name)
        	local PlrName = name
        	local HouseNum = game.Workspace["001_Lots"][PlrName .."House"].Number.Number.Value

        	local function deleteModule(namedmodule, module)
			local find = game.Workspace["001_Lots"][PlrName .."House"].HousePickedByPlayer.HouseModel:FindFirstChild(namedmodule ..module)
            		if find then

				find:Destroy()
					
			end
        	end

        	deleteModule("001_", "HouseDoors")
		deleteModule("", "HouseDoorNotLocking")
		deleteModule("", "FakeRoomDoor")
		

	
		OrionLib:MakeNotification({
			Name = "BrookHell",
			Content = "Removed doors (Owner: " ..PlrName .." House num: " ..HouseNum .." )!",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
			
	end	  
})

Tab:AddSection({
	Name = "Teleport"
})


Tab:AddTextbox({
	Name = "Player Name",
	Default = "",
	TextDisappear = false,
	Callback = function(name)
		local Player = game.Players.LocalPlayer
		Player.Character.HumanoidRootPart.CFrame = game.Workspace[name].HumanoidRootPart.CFrame

		OrionLib:MakeNotification({
			Name = "BrookHell",
			Content = "Teleported to " ..name .."!",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end	  
})


Tab:AddSection({
	Name = "Player"
})

Tab:AddSlider({
	Name = "Player speed",
	Min = 8,
	Max = 350,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Speed",
	Callback = function(Value)
		local Player = game.Players.LocalPlayer
		Player.Character.Humanoid.WalkSpeed = Value
	end    
})

Tab:AddButton({
	Name = "Reset player speed",
	Callback = function()
        local Player = game.Players.LocalPlayer
		Player.Character.Humanoid.WalkSpeed = 16
  	end    
})

Tab:AddSlider({
	Name = "Player Jump Power",
	Min = 25,
	Max = 500,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(Value)
		local Player = game.Players.LocalPlayer
		Player.Character.Humanoid.JumpPower = Value
	end    
})

Tab:AddButton({
	Name = "Reset Jump Power",
	Callback = function()
        local Player = game.Players.LocalPlayer
		Player.Character.Humanoid.JumpPower = 50
  	end    
})

DevTab:AddButton({
	Name = "Dark Dex v3",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/TinyTosha/BHScript/refs/heads/main/ddv3.lua'))()
  	end    
})

OrionLib:Init()
