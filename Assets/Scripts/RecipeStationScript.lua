--!SerializeField
local soundToPlay : AudioShader = nil

--!SerializeField
local inventoryObject : GameObject = nil

local recipes = nil

self.gameObject:GetComponent(TapHandler).Tapped:Connect(function()
    if(recipes == nil)then
        -- a hack until custom tags work again, using default "Respawn" tag instead of custom "Recipe" tag
        recipes = GameObject.FindGameObjectsWithTag("Respawn")
    end

    local inventory = inventoryObject:GetComponent("PlayerInventoryScript")
    if(inventory == nil) then
        print("could not find inventory")
        return
    end

    if(inventory.HasRecipe()) then
        print("already have a recipe")
        return
    end

    if(soundToPlay ~= nil) then
        Audio:PlayShader(soundToPlay)
    end

    local chosenRecipe = recipes[math.random(#recipes)]
    inventory.SetRecipe(chosenRecipe)
end)

