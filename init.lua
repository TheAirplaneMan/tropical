minetest.register_node("tropical:honey_source", {
	description = ("Honey Source"),
	drawtype = "liquid",
	tiles = {
		{
			name = "tropical_honey_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "tropical_honey_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "tropical:honey_flowing",
	liquid_alternative_source = "tropical:honey_source",
	liquid_viscosity = 1,
	-- Not renewable to avoid horizontal spread of water sources in sloping
	-- rivers that can cause water to overflow riverbanks and cause floods.
	-- River water source is instead made renewable by the 'force renew'
	-- option used in the 'bucket' mod by the river water bucket.
	liquid_renewable = false,
	liquid_range = 2,
	light_source = 9,
	post_effect_color = {a = 103, r = 255, g = 235, b = 49},
	groups = {honey = 3, liquid = 3, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("tropical:honey_flowing", {
	description = ("Flowing Honey"),
	drawtype = "flowingliquid",
	tiles = {"tropical_honey_source.png"},
	special_tiles = {
		{
			name = "tropical_honey_source_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2,
			},
		},
		{
			name = "tropical_honey_source_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "tropical:honey_flowing",
	liquid_alternative_source = "tropical:honey_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	light_source = 9,
	post_effect_color = {a = 103, r = 255, g = 235, b = 90},
	groups = {honey = 3, liquid = 3, not_in_creative_inventory = 1,
		cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})




minetest.register_node("tropical:hive", {
	description = ("Hive Block"),
	tiles = {"tropical_hive.png"},
	groups = {choppy = 3, snappy = 1, oddly_breakable_by_hand = 2, hive = 1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("tropical:paper_block", {
	description = ("Hive Paper Block"),
	tiles = {"tropical_hive_wall.png"},
	groups = {snappy = 2, oddly_breakable_by_hand = 2, hive = 1},
	sounds = default.node_sound_leaves_defaults(),
})






--Generate Schematic

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:stone"},
	sidelen = 100,
	fill_ratio = 0.00002,
	y_max = 0,
	y_min = -4000,
	biomes = {"rainforest_ocean", "rainforest_under"},
	schematic = minetest.get_modpath("tropical") .. "/schematics/hive_1.mts",
	flags = "place_center_x, place_center_z, force_placement, all_floors",
	rotation = "random",
})






-- Hive Paper

minetest.register_craftitem("tropical:hive_paper", {
	description = ("Bee Paper"),
	inventory_image = "tropical_hive_paper.png"
})

minetest.register_craft({
	output = "default:paper",
	recipe = {
		{"tropical:hive_paper", "tropical:hive_paper", "tropical:hive_paper"},
	}
})

minetest.register_craft({
	output = "tropical:hive_paper",
	recipe = {
		{"tropical:paper_block", "tropical:paper_block", "tropical:paper_block"},
	}
})