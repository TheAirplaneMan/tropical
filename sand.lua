minetest.register_node("tropical:sand", {
	description = ("Tropics Sand"),
	tiles = {"tropical_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
	_tnt_loss = 2,
})

minetest.register_node("tropical:sandstone", {
	description = ("Tropics Sandstone"),
	tiles = {"tropical_sandstone.png"},
	groups = {crumbly = 1, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("tropical:sandstone_brick", {
	description = ("Tropics Sandstone Brick"),
	paramtype2 = "facedir",
	place_param2 = 0,
	tiles = {"tropical_sandstone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("tropical:sandstone_block", {
	description = ("Tropics Sandstone Block"),
	tiles = {"tropical_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "tropical:sandstone",
	recipe = {
		{"tropical:sand", "tropical:sand"},
		{"tropical:sand", "tropical:sand"},
	}
})

minetest.register_craft({
	output = "tropical:sand 4",
	recipe = {
		{"tropical:sandstone"},
	}
})

minetest.register_craft({
	output = "tropical:sandstone_brick 4",
	recipe = {
		{"tropical:sandstone", "tropical:sandstone"},
		{"tropical:sandstone", "tropical:sandstone"},
	}
})

minetest.register_craft({
	output = "tropical:sandstone_block 9",
	recipe = {
		{"tropical:sandstone", "tropical:sandstone", "tropical:sandstone"},
		{"tropical:sandstone", "tropical:sandstone", "tropical:sandstone"},
		{"tropical:sandstone", "tropical:sandstone", "tropical:sandstone"},
	}
})


-- Register Stairs

if core.get_modpath("stairs") then

	stairs.register_stair_and_slab("tropical_sandstone", "tropical:sandstone",
		{crumbly = 1, cracky = 3},
		{"tropical_sandstone.png"},
		("Tropics Sandstone Stair"),
		("Tropics Sandstone Slab"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("tropical_sandstone_brick", "tropical:sandstone_brick",
		{cracky = 2},
		{"tropical_sandstone_brick.png"},
		("Tropics Sandstone Brick Stair"),
		("Tropics Sandstone Brick Slab"),
		default.node_sound_stone_defaults())

	stairs.register_stair_and_slab("tropical_sandstone_block", "tropical:sandstone_block",
		{cracky = 2},
		{"tropical_sandstone_block.png"},
		("Tropics Sandstone Block Stair"),
		("Tropics Sandstone Block Slab"),
		default.node_sound_stone_defaults())

end