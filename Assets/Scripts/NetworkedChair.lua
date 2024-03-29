--!SerializeField
local sitTransform : Transform = nil

local sitRequest = Event.new("SitRequest")
local sitEvent = Event.new("SitEvent")
local leaveRequest = Event.new("LeaveRequest")
local leaveEvent = Event.new("LeaveEvent")

local occupied : BoolValue = BoolValue.new("Occupied", false)

function Client()
    local occupant

    self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
        if(occupied.value) then
            return
        end

        sitRequest:FireServer(client.localPlayer) 
    end)

    function OnSitComplete()
    end

    sitEvent:Connect(function(player : Player)
        if(player == occupant) then
            return
        end

        occupant = player
        player.character:PlayEmote("sit-idle", true, OnSitComplete)
        player.character.transform.position = sitTransform.position
        player.character.transform.rotation = sitTransform.rotation
    end)

    leaveEvent:Connect(function(player : Player)
        occupant = nil
    end)

    client.localPlayer.CharacterChanged:Connect(function(player, newCharacter, oldCharacter)
        newCharacter.StateChanged:Connect(function(newState, oldState)
            if(occupant == client.localPlayer and (newState == 5 or newState == 4)) then
                occupant = nil
                leaveRequest:FireServer(client.localPlayer) 
            end
        end)
    end)

end

function Server()
    local occupant

    sitRequest:Connect(function(player : Player)
        if(occupied.value) then
            return
        end

        occupant = player
        occupied.value = true
        
        sitEvent:FireAllClients(player)
    end)

    leaveRequest:Connect(function(player : Player)
        if(not occupied.value) then
            return
        end

        if(occupant ~= player) then
        end

        occupant = nil
        occupied.value = false

        leaveEvent:FireAllClients(player)
    end)

    scene.PlayerJoined:Connect(function(scene, player)
        if(occupant ~= nil) then
            sitEvent:FireAllClients(occupant)
        end
    end)

    scene.PlayerLeft:Connect(function(scene, player)
        if(occupant ~= nil and occupant == player) then
            occupant = nil
            occupied.value = false

            leaveEvent:FireAllClients(player)
        end
    end)
end

if server then
    Server()
else
    Client()
end