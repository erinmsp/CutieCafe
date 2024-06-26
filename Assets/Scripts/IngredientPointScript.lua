--!SerializeField
local inventoryObject : GameObject = nil

--!SerializeField
local emoteToPlay : string = nil

--!SerializeField
local ingredientToAdd : Material = nil

--!SerializeField
local soundToPlay : AudioSource = nil

function OnEmoteComplete()
    AddIngredient()
end

function AddIngredient()
    inventoryObject:GetComponent("PlayerInventoryScript").AddIngredient(ingredientToAdd)

    if(soundToPlay ~= nil) then
        soundToPlay:Play()
    end
end

self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
    print("Tapped")

    local inventory = inventoryObject:GetComponent("PlayerInventoryScript")
    if(inventory.IsComplete()) then
        print("complete")
        return
    end

    if(not inventory.NeedsIngredient(ingredientToAdd)) then
        print("does not need ingredient")
        return
    end

    if(emoteToPlay ~= nil and emoteToPlay ~= "") then
        print("playing emote")
        client.localPlayer.character:PlayEmote(emoteToPlay, false, OnEmoteComplete)
    else
        AddIngredient()
    end

end)