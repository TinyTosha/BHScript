-- BrookHell by TinyTosha


local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "BrookHell by TinyTosha", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

OrionLib:MakeNotification({
	Name = "BrookHell",
	Content = "Script by TinyTosha! UILib: Orion",
	Image = "rbxassetid://4483345998",
	Time = 5
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


Tab:AddLabel("Script By TinyTosha")

Tab:AddTextbox({
	Name = "Unban house",
	Default = "Name",
	TextDisappear = false,
	Callback = function(name)
		local PlrName = name
        local HouseNum = game.Workspace["001_Lots"][PlrName .."House"].Number.Number.Value

        game.Workspace["001_Lots"][PlrName .."House"].HousePickedByPlayer.HouseModel["BannedBlock" ..HouseNum]:Destroy()
	end	  
})
Tab:AddTextbox({
	Name = "Remove Doors",
	Default = "Name",
	TextDisappear = false,
	Callback = function(name)
        local PlrName = name
        local HouseNum = game.Workspace["001_Lots"][PlrName .."House"].Number.Number.Value

        local function deleteModule(module)
            game.Workspace["001_Lots"][PlrName .."House"].HousePickedByPlayer.HouseModel["001_" ..module]:Destroy() 
        end

        deleteModule("HouseDoors")
	end	  
})

DevTab:AddButton({
	Name = "Dark Dex v3",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/TinyTosha/BHScript/refs/heads/main/ddv3.lua'))()
  	end    
})
