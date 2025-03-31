data:extend { {
    type = "recipe",
    name = "spoiling-plant",
    ingredients = {
        { type = "item", name = "steel-plate", amount = 30 },
        { type = "item", name = "heat-pipe",   amount = 10 },
        { type = "item", name = "concrete",    amount = 10 }
    },
    results = { { type = "item", name = "spoiling-plant", amount = 1 } }
} }

do
    local item = table.deepcopy(data.raw.item['electric-furnace'])
    item.name = "spoiling-plant"
    item.order = "c[spoiling-plant]"
    item.place_result = "spoiling-plant"
    item.icon = "__spoiling-plant__/graphics/icons/spoiling-plant.png"
    data:extend { item }
end

do
    local spoiling_plant = table.deepcopy(data.raw.furnace['electric-furnace'])
    spoiling_plant.name = "spoiling-plant"
    spoiling_plant.minable.result = "spoiling-plant"

    local graphics = {
        icon = "__spoiling-plant__/graphics/icons/spoiling-plant.png",
        collision_box = { { -2.4, -2.4 }, { 2.4, 2.4 } },
        selection_box = { { -2.5, -2.5 }, { 2.5, 2.5 } },
        drawing_box_vertical_extension = 1,
        graphics_set = {
            animation = {
                layers = {
                    {
                        filename = "__spoiling-plant__/graphics/entity/spoiling-plant/shadow.png",
                        priority = "high",
                        width = 900,
                        height = 500,
                        frame_count = 1,
                        line_length = 1,
                        repeat_count = 80,
                        animation_speed = 0.3,
                        draw_as_shadow = true,
                        scale = 0.5,
                        shift = { 0, -1 },
                    },
                    {
                        priority = "high",
                        width = 330,
                        height = 410,
                        frame_count = 80,
                        animation_speed = 0.3,
                        scale = 0.5,
                        shift = { 0, -1 },
                        stripes = {
                            {
                                filename = "__spoiling-plant__/graphics/entity/spoiling-plant/spoiling-plant-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename = "__spoiling-plant__/graphics/entity/spoiling-plant/spoiling-plant-2.png",
                                width_in_frames = 8,
                                height_in_frames = 2,
                            },
                        },
                    },
                },
            },
            working_visualisations = {
                {
                    fadeout = true,
                    secondary_draw_order = 1,
                    animation = {
                        priority = "high",
                        size = { 330, 410 },
                        frame_count = 80,
                        draw_as_glow = true,
                        scale = 0.5,
                        animation_speed = 0.3,
                        blend_mode = "additive",
                        shift = { 0, -1 },
                        stripes = {
                            {
                                filename =
                                "__spoiling-plant__/graphics/entity/spoiling-plant/spoiling-plant-emission-1.png",
                                width_in_frames = 8,
                                height_in_frames = 8,
                            },
                            {
                                filename =
                                "__spoiling-plant__/graphics/entity/spoiling-plant/spoiling-plant-emission-2.png",
                                width_in_frames = 8,
                                height_in_frames = 2,
                            },
                        },
                    },
                }
            },
            reset_animation_when_frozen = true
        }
    }

    for k, v in pairs(graphics) do
        spoiling_plant[k] = v
    end


    spoiling_plant.crafting_categories = { "spoiling" }
    spoiling_plant.module_slots = 4

    data:extend { { type = "recipe-category", name = "spoiling" } }
    data:extend { spoiling_plant }
end
