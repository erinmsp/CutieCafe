
self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
    local inventory = client.localPlayer.character:GetComponent("PlayerInventoryScript")
    if(not inventory.HasRecipe() or not inventory.IsComplete()) then
        return
    end

    inventory.CompleteRecipe()
end)