autoclicker=false
autoupgrade=false

local upgrade_args = {
    [1] = game:GetService("Players").LocalPlayer.PlayerGui.GameGui.Upgrade
}

local function click()
	if autoclicker then
		game:GetService('ReplicatedStorage').Click:FireServer()
	end
end
local function upgrade()
	if autoupgrade then
		game:GetService("ReplicatedStorage").ClickUpgrade:InvokeServer(unpack(upgrade_args)) -- Click Upgrade
		for i=1,3 do -- Turtles
			game:GetService("ReplicatedStorage").IncomeEvent:FireServer(unpack({[1] = i, [2] = 0}))
		end
	end
end

local skala=window:CreateTab('Skala Simulator', tab_image)
skala:CreateSection('AutoFarm')
skala:CreateToggle({
	Name='AutoClicker',
	CurrentValue=false,
	Flag='skala_autoclicker',
	Callback=function(state)
		autoclicker=state
	end,
})
skala:CreateToggle({
	Name='AutoUpgrade',
	CurrentValue=false,
	Flag='skala_autoupgrade',
	Callback=function(state)
		autoupgrade=state
	end,
})
skala:CreateSection('Others')
skala:CreateButton({
	Name='Free Badge',
	Callback=function()
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack({[1]='42', [2]='All'}))
	end,
})

while wait(0.5) do
	for i=1,10 do
		click()
		wait(0.5)
	end
	upgrade()
end
