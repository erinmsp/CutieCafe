--!SerializeField
local sitTransform : Transform = nil

local sitRequest = Event.new("SitRequest")
local sitEvent = Event.new("SitEvent")
local leaveRequest = Event.new("LeaveRequest")

local occupied : BoolValue = BoolValue.new("Occupied", false)

function Client()
    local localPlayerSitting : boolean

    self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
        if(occupied.value) then
            print("occupied")
            return
        end

        sitRequest:FireServer(client.localPlayer) 
    end)

    function OnSitComplete()
    end

    sitEvent:Connect(function(player : Player)
        localPlayerSitting = player == client.localPlayer
        player.character:PlayEmote("sit-idle", true, OnSitComplete)
        player.character.transform.position = sitTransform.position
        player.character.transform.rotation = sitTransform.rotation
    end)

    client.localPlayer.CharacterChanged:Connect(function(player, newCharacter, oldCharacter)
        newCharacter.StateChanged:Connect(function(newState, oldState)
            print(newState)
            if(localPlayerSitting and (newState == 5 or newState == 4)) then
                localPlayerSitting = false
                leaveRequest:FireServer(client.localPlayer) 
            end
        end)
    end)

end

function Server()
    local occupant

    sitRequest:Connect(function(player : Player)
        if(occupied.value) then
            print("occupied")
            return
        end

        print(player.name .. " is sitting")
        occupant = player
        occupied.value = true
        
        sitEvent:FireAllClients(player)
    end)

    leaveRequest:Connect(function(player : Player)
        if(not occupied.value) then
            print("not occupied")
            return
        end

        if(occupant ~= player) then
            print("not occupant")
        end

        print(player.name .. " is leaving")
        occupant = nil
        occupied.value = false
    end)
end

if server then
    Server()
else
    Client()
end