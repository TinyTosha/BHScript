-- BrookHell by TinyTosha

local version = "v0.5250 gey exp"

local LocalPlrName = game.Players.LocalPlayer.Character.Name
local LocalPlr = game.Players.LocalPlayer.Character

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "BrookHell by TinyTosha", 
    HidePremium = false, 
    SaveConfig = false, 
    ConfigFolder = "Delete Me!",

    IntroText = " BrookHell " ..version,
})

getgenv().Username = ""



OrionLib:MakeNotification({
	Name = "BrookHell",
	Content = "Script by TinyTosha! UILib: Orion",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local CTab = Window:MakeTab({
	Name = "Info, Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab = Window:MakeTab({
	Name = "Main Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local ATTab = Window:MakeTab({
	Name = "Adv. Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local DevTab = Window:MakeTab({
	Name = "Dev Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

CTab:AddSection({Name = "Info"})

CTab:AddLabel("BrookHell By TinyTosha")
CTab:AddLabel("Version: " ..version)

CTab:AddSection({Name = "Settings"})

Tab:AddSection({
	Name = "Username"
})

Tab:AddTextbox({
	Name = "Enter Username",
	Default = "",
	TextDisappear = false,
	Callback = function(name)
		getgenv().Username = name

        OrionLib:MakeNotification({
	        Name = "BrookHell",
	        Content = "Username set " ..getgenv().Username .."!",
	        Image = "rbxassetid://4483345998",
	        Time = 5
        })
	end	  
})
Tab:AddButton({
	Name = "Unban",
	Callback = function()
        local PlrName = getgenv().Username
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

Tab:AddButton({
	Name = "Remove Doors",
	Callback = function()
        local PlrName = getgenv().Username
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

Tab:AddButton({
	Name = "Teleport",
	Callback = function()
        local Player = game.Players.LocalPlayer
		Player.Character.HumanoidRootPart.CFrame = game.Workspace[getgenv().Username].HumanoidRootPart.CFrame

		OrionLib:MakeNotification({
			Name = "BrookHell",
			Content = "Teleported to " ..getgenv().Username .."!",
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

ATTab:AddDropdown({
	Name = "Teleport Locatiom",
	Default = "In dev!",
	Options = {"In dev, ", "sorry"},
	Callback = function(Value)
		print(Value)
	end    
})

ATTab:AddBind({
	Name = "Kill (ShoppingCart)",
	Default = "Click to set",
	Hold = false,
	Callback = function()
        local expos = nil
        local Player = nil

        expos = LocalPlr.HumanoidRootPart.CFrame
        Player = game.Players.LocalPlayer


		Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, -385, 0)
        wait(0.2)
        Player.Character.Humanoid:UnequipTools()
        wait(0.4)
        Player.Character.HumanoidRootPart.CFrame = expos

        Player = nil
        expos = nil
	end    
})

DevTab:AddButton({
	Name = "Dark Dex v3",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/TinyTosha/BHScript/refs/heads/main/ddv3.lua'))()
  	end    
})

OrionLib:Init()
