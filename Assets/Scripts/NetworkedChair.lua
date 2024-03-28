--!SerializeField
local sitTransform : Transform = nil

local sitRequest = Event.new("SitRequest")
local sitEvent = Event.new("SitEvent")

local occupied : BoolValue

local occupant : Player

function Client()

    self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
        print(client.localPlayer.character.name)
        sitRequest:FireServer(client.localPlayer) 
    end)

    function OnSitComplete()
    end

    sitEvent:Connect(function(player : Player)
        occupant = player
        occupant.character:PlayEmote("sit-idle", true, OnSitComplete)
        
        player.character.transform.rotation = sitTransform.rotation
    end)

end

function Server()
    sitRequest:Connect(function(player : Player)
        print(player.name)
        sitEvent:FireAllClients(player)
    end)
end

if server then
    Server()
else
    Client()
end