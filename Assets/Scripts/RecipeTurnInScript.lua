--!SerializeField
local soundToPlay : AudioSource = nil

self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
    local inventory = client.localPlayer.character:GetComponent("PlayerInventoryScript")
    if(not inventory.HasRecipe() or not inventory.IsComplete()) then
        return
    end

    if(soundToPlay ~= nil) then
        soundToPlay:Play()
    end

    inventory.CompleteRecipe()
end)