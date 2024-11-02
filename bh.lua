-- BrookHell by TinyTosha

local version = "v0.2121 gold exp"

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

Tab:AddTextbox({
	Name = "Unban house",
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
	Name = "Remove Doors",
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

Tab:AddTextbox({
	Name = "Go to Player",
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
})
DevTab:AddButton({
	Name = "Dark Dex v3",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/TinyTosha/BHScript/refs/heads/main/ddv3.lua'))()
  	end    
})

OrionLib:Init()
