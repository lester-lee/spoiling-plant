---@param item data.ItemPrototype
---@return data.RecipePrototype?
local function create_spoilage_recipe(item)
    if not item.spoil_result then return end
    return {
        type = "recipe",
        name = "spoil-" .. item.name,
        localised_name = { "", "Spoil ", { "item-name." .. item.name } },
        ingredients = {
            { type = "item", name = item.name, amount = 1 }
        },
        results = {
            { type = "item", name = item.spoil_result, amount = 1 }
        },
        category = "spoiling",
        icon = item.icon,
        icon_size = 64
    }
end

local function create_spoilage_recipes(source)
    for _, item in pairs(source) do
        local recipe = create_spoilage_recipe(item)
        if recipe then
            data:extend { recipe }
        end
    end
end


create_spoilage_recipes(data.raw.item)
create_spoilage_recipes(data.raw.capsule)
