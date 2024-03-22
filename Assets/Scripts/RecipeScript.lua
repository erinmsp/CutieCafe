--!SerializeField
local name : string = nil

--!SerializeField
local material : Material = nil

--!SerializeField
local ingredient1Material : Material = nil

--!SerializeField
local ingredient1Count : number = nil

--!SerializeField
local ingredient2Material : Material = nil

--!SerializeField
local ingredient2Count : number = nil

--!SerializeField
local ingredient3Material : Material = nil

--!SerializeField
local ingredient3Count : number = nil

function GetMaterial() : Material
    return material
end

function GetIngredient1Material() : Material
    return ingredient1Material
end

function GetIngredient1Count() : number
    return ingredient1Count
end

function GetIngredient2Material() : Material
    return ingredient2Material
end

function GetIngredient2Count() : number
    return ingredient2Count
end

function GetIngredient3Material() : Material
    return ingredient3Material
end

function GetIngredient3Count() : number
    return ingredient3Count
end

function GetIngredientCount() : number
    local count = 0

    if(ingredient1Count > 0) then
        count += 1
    end
    if(ingredient2Count > 0) then
        count += 1
    end
    if(ingredient3Count > 0) then
        count += 1
    end

    return count
end