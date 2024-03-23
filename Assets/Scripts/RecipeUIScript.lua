--!SerializeField
local root : GameObject = nil

--!SerializeField
local offsetTransform : Transform = nil

--!SerializeField
local recipeRenderer : MeshRenderer = nil

--!SerializeField
local ingredient1 : GameObject = nil

--!SerializeField
local ingredient2 : GameObject = nil

--!SerializeField
local ingredient3 : GameObject = nil

--!SerializeField
local finalNote : GameObject = nil

function UpdateUI(recipeGO, count1, count2, count3)
    if(recipeGO == nil) then
        root:SetActive(false)
    else
        root:SetActive(true)

        local recipe = recipeGO:GetComponent("RecipeScript")
        recipeRenderer.sharedMaterial = recipe.GetMaterial()

        local ingredientCount = recipe.GetIngredientCount()
        ingredient1:GetComponent("IngredientUIScript").UpdateUI(ingredientCount > 0, count1 >= recipe.GetIngredient1Count(), recipe.GetIngredient1Material());
        ingredient2:GetComponent("IngredientUIScript").UpdateUI(ingredientCount > 1, count2 >= recipe.GetIngredient2Count(), recipe.GetIngredient2Material());
        ingredient3:GetComponent("IngredientUIScript").UpdateUI(ingredientCount > 2, count3 >= recipe.GetIngredient3Count(), recipe.GetIngredient3Material());

    end
end

function ShowFinalNote()
   finalNote:SetActive(true) 
end

