	minetest.register_biome({
		name = "tropics",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		node_riverbed = "tropical:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 31000,
		y_min = 4,
		heat_point = 90,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "tropics_beach",
		node_top = "tropical:sand",
		depth_top = 1,
		node_filler = "tropical:sand",
		depth_filler = 3,
		node_riverbed = "tropical:sand",
		depth_riverbed = 2,
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = 3,
		y_min = -1,
		heat_point = 90,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "tropics_ocean",
		node_top = "tropical:sand",
		depth_top = 1,
		node_filler = "tropical:sand",
		depth_filler = 3,
		node_riverbed = "tropical:sand",
		depth_riverbed = 2,
		node_cave_liquid = "default:water_source",
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		vertical_blend = 1,
		y_max = -2,
		y_min = -255,
		heat_point = 90,
		humidity_point = 75,
	})

	minetest.register_biome({
		name = "tropics_under",
		node_cave_liquid = {"default:water_source", "default:lava_source"},
		node_dungeon = "default:cobble",
		node_dungeon_alt = "default:mossycobble",
		node_dungeon_stair = "stairs:stair_cobble",
		y_max = -256,
		y_min = -31000,
		heat_point = 90,
		humidity_point = 75,
	})

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:gravel",
		wherein         = {"tropical:sand"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_max           = 0,
		y_min           = -15,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -32001,
			octaves = 1,
			persist = 0.0
		},
	})


if minetest.get_modpath("coconut_tree") then

	minetest.register_decoration({
		name = "tropical:coconut_tree",
		deco_type = "schematic",
		place_on = {"tropical:sand"},
		sidelen = 16,
		fill_ratio = 0.0005,
		biomes = {"tropics_beach"},
		y_max = 10,
		y_min = 1,
		schematic = minetest.get_modpath("coconut_tree") .. "/schematics/coconut_tree.mts",
		flags = "place_center_x, place_center_z, force_placement",
	})

end