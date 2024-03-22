--!SerializeField
local scriptToAttach : LuaScript = nil

client.PlayerConnected:Connect(function(player)
    player.CharacterInstantiated:Connect(function(player, character)
        character.gameObject:AddScript(scriptToAttach);
    end)
end)