--!SerializeField
local scriptToAttach : LuaScript = nil

scene.PlayerJoined:Connect(function(scene, player)
    player.CharacterChanged:Connect(function(player, newCharacter, oldCharacter)
        newCharacter.gameObject:AddScript(scriptToAttach);
    end)
end)