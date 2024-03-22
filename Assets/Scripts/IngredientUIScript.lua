--!SerializeField
local root : GameObject = nil

--!SerializeField
local renderer : MeshRenderer = nil

--!SerializeField
local check : GameObject = nil

function UpdateUI(hasIngredient, complete, material)
    if(not hasIngredient) then
        root:SetActive(false)
    else
        root:SetActive(true)

        check:SetActive(complete)

        renderer.sharedMaterial = material
    end
end
