--!SerializeField
local soundToPlay : AudioSource = nil

local recipes = nil

self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
    if(recipes == nil)then
        recipes = GameObject.FindGameObjectsWithTag("Recipe")
    end

    local inventory = client.localPlayer.character:GetComponent("PlayerInventoryScript")
    if(inventory.HasRecipe()) then
        print("already have a recipe")
        return
    end

    if(soundToPlay ~= nil) then
        soundToPlay:Play()
    end

    local chosenRecipe = recipes[math.random(#recipes)]
    inventory.SetRecipe(chosenRecipe)
end)