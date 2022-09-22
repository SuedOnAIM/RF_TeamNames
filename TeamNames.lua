-- Register the behaviour
behaviour("TeamNames")

local names
local teams

function TeamNames:Start()
    GameEvents.onActorSpawn.AddListener(self, "OnActorSpawn")
    team = self.script.mutator.GetConfigurationDropdown("team")
    if team == 0 then
        team = Team.Blue
    elseif team == 1 then
        team = Team.Red
    elseif team == 2 then    
        team = 'Both'
    end    

    names = self.script.mutator.GetConfigurationString("BotNames")
    self.names = {}
    for word in string.gmatch(names, '([^;]+)') do
        table.insert(self.names, word)

        --for k,v in pairs(self.names) do
            --this fucking spams the console lmfao print(v) 
        --end
    end
end

function TeamNames:OnActorSpawn(actor)
    if actor.team == team or 'Both' == team then
        names = self.names[math.random(#self.names)]
        actor.name = names
    end
end