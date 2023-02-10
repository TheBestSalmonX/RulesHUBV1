local settings = {
    Team = "Marines", --[Marines, Pirates] ChooseTeam Default.
    AlwaysOnline = true --Anti AFK Function.
}

function LoadSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfolder("RulesX Hub Premium Scripts") then
            makefolder("RulesX Hub Premium Scripts")
        end
        if not isfolder("RulesX Hub Premium Scripts/Blox Fruits/") then
            makefolder("RulesX Hub Premium Scripts/Blox Fruits/")
        end
        if not isfile("RulesX Hub Premium Scripts/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
            writefile("RulesX Hub Premium Scripts/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(settings.SaveSetting))\
        else
            local Decode = game:GetService("HttpService"):JSONDecode(readfile("RulesX Hub Premium Scripts/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
            for i,v in pairs(Decode) do
                settings[i] = v
            end
        end
    end
end

function SaveSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfile("RulesX Hub Premium Scripts/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
            LoadSettings()
        else
            local Decode = game:GetService("HttpService"):JSONDecode(readfile("RulesX Hub Premium Scripts/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
            local Array = {}
            for i,v in pairs(settings) do
                Array[i] = v
            end
            writefile("RulesX Hub Premium Scripts/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(Array))
        end
    else
        return warn("Status : Undetected Executor")
    end
end

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat wait()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible then
            if settings.Team == "Pirate" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
                    v.Function()
                end
            elseif settings.Team == "Marines" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do
                    v.Function()
                end
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end