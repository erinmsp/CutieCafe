local currentRecipe = nil
local ingredient1Count : number = 0
local ingredient2Count : number = 0
local ingredient3Count : number = 0

function SetRecipe(recipe)
    print("set recipe " .. recipe.name)
    currentRecipe = recipe
    ingredient1Count = 0
    ingredient2Count = 0
    ingredient3Count = 0

    UpdateUI()
end

function HasRecipe() : boolean
    return currentRecipe ~= nil
end

function AddIngredient(ingredient)
    if(not HasRecipe())then
        return
    end

    print("adding " .. ingredient.name)

    local recipe = currentRecipe:GetComponent("RecipeScript")
    if(ingredient == recipe.GetIngredient1Material())then
        print("adding to 1")
        ingredient1Count += 1
    elseif(ingredient == recipe.GetIngredient2Material())then
        print("adding to 2")
        ingredient2Count += 1
    elseif(ingredient == recipe.GetIngredient3Material())then
        print("adding to 3")
        ingredient3Count += 1
    end

    UpdateUI()
end

function HasIngredient(ingredient) : boolean
    if(not HasRecipe())then
        return false
    end

    local recipe = currentRecipe:GetComponent("RecipeScript")
    return recipe.GetIngredient1Material() == ingredient or recipe.GetIngredient2Material() == ingredient or recipe.GetIngredient3Material() == ingredient;
end

function NeedsIngredient(ingredient) : boolean
    if(not HasRecipe())then
        return false
    end

    local recipe = currentRecipe:GetComponent("RecipeScript")
    if(ingredient == recipe.GetIngredient1Material())then
        return not Ingredient1Complete()
    elseif(ingredient == recipe.GetIngredient2Material())then
        return not Ingredient2Complete()
    elseif(ingredient == recipe.GetIngredient3Material())then
        return not Ingredient3Complete()
    end

    return false
end

function Ingredient1Complete() : boolean
    if(not HasRecipe())then
        return false
    end

    return ingredient1Count >= currentRecipe:GetComponent("RecipeScript").GetIngredient1Count()
end

function Ingredient2Complete() : boolean
    if(not HasRecipe())then
        return false
    end

    return ingredient2Count >= currentRecipe:GetComponent("RecipeScript").GetIngredient2Count()
end

function Ingredient3Complete() : boolean
    if(not HasRecipe())then
        return false
    end

    return ingredient3Count >= currentRecipe:GetComponent("RecipeScript").GetIngredient3Count()
end

function IsComplete() : boolean
    if(not HasRecipe())then
        return false
    end

    local recipe = currentRecipe:GetComponent("RecipeScript")
    return Ingredient1Complete() and Ingredient2Complete() and Ingredient3Complete()
end

function CompleteRecipe()
    if(not IsComplete()) then
        return
    end

    currentRecipe = nil
    UpdateUI()

    client.mainCamera:GetComponent("RecipeUIScript").ShowFinalNote()
end

function UpdateUI()
    client.mainCamera:GetComponent("RecipeUIScript").UpdateUI(currentRecipe, ingredient1Count, ingredient2Count, ingredient3Count)
end