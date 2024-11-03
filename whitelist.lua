getgenv().whitlist = {
  Load = {
    ["pA"] = "Arseny2501_NOTFAKE",
    ["pB"] = "Tiny2Tosha",
  }
}

if getgenv().whitlist.Load.pA  == LocalPlrName then
elseif getgenv().whitlist.Load.pB  == LocalPlrName then
else
    game.Players.LocalPlayer:Kick(LocalPlrName .." is not on whitelist!")
end
