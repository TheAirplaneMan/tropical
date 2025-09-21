

tropical.trees = {
	{"kapok",      "Kapok"},
	{"rainbow_eucalyptus",       "Rainbow Eucalyptus"},
	{"pink_ivory",       "Pink Ivory"},
}

local trees = tropical.trees

for i = 1, #trees do
	local name, desc = unpack(trees[i])

	minetest.register_node("tropical:" .. name .. "_leaves", {
		description = (desc .. " Leaves"),
		drawtype = "allfaces_optional",
		waving = 1,
		tiles = {"tropical_" .. name .. "_leaves.png"},
		special_tiles = {"tropical_" .. name .. "_leaves_simple.png"},
	        paramtype = "light",
		paramtype = "light",
		is_ground_content = false,
		drop = {
			max_items = 1,
			items = {
				{
					-- player will get sapling with 1/20 chance
					items = {"tropical:" .. name .. "_sapling"},
					rarity = 20,
				},
				{
					-- player will get leaves only if he get no saplings,
					-- this is because max_items is 1
					items = {"tropical:" .. name .. "_leaves"},
				}
			}
		},
		groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
		sounds = default.node_sound_leaves_defaults(),

	after_place_node = after_place_leaves,
	})

	minetest.register_node("tropical:" .. name .. "_sapling", {
		description = (desc .. " Sapling"),
		drawtype = "plantlike",
		tiles = {"tropical_" .. name .. "_sapling.png"},
		inventory_image = "tropical_" .. name .. "_sapling.png",
		wield_image = "tropical_" .. name .. "_sapling.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		on_timer = grow_sapling,
		selection_box = {
			type = "fixed",
			fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 7 / 16, 4 / 16}
		},
		groups = {snappy = 2, dig_immediate = 3, flammable = 2,
			attached_node = 1, sapling = 1},
		sounds = default.node_sound_leaves_defaults(),

		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,

		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
				"tropical:" .. name .. "_sapling",
				-- minp, maxp to be checked, relative to sapling pos
				-- minp_relative.y = 1 because sapling pos has been checked
				{x = -3, y = 1, z = -3},
				{x = 3, y = 6, z = 3},
				-- maximum interval of interior volume check
				4)

			return itemstack
		end,
	})

	minetest.register_node("tropical:" .. name .. "_tree", {
		description = (desc .. " Tree"),
		tiles = {"tropical_" .. name .. "_tree_top.png", "tropical_" .. name .. "_tree_top.png", "tropical_" .. name .. "_tree.png"},
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),

		on_place = minetest.rotate_node
	})

	minetest.register_node("tropical:" .. name .. "_wood", {
		description = (desc .. " Wood Planks"),
		paramtype2 = "facedir",
		place_param2 = 0,
		tiles = {"tropical_" .. name .. "_wood.png"},
		is_ground_content = false,
		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
		sounds = default.node_sound_wood_defaults(),
	})
end


















-- Treegen

	minetest.register_decoration({
		name = "tropical:pink_ivory_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		fill_ratio = 0.0005,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.65
		},
		biomes = {"tropics"},
		y_max = 31000,
		y_min = 1,
		schematic = minetest.get_modpath("tropical") .. "/schematics/pink_ivory_1.mts",
		flags = "place_center_x, place_center_z, force_placement",
		rotation = "random",
	})

local chunksize
	if core.get_mapgen_chunksize then
		local v = core.get_mapgen_chunksize()
		chunksize = math.max(v.x, v.y, v.z)
	else
		chunksize = tonumber(core.get_mapgen_setting("chunksize"))
	end
	if chunksize >= 5 then
		minetest.register_decoration({
			name = "tropical:emergent_kapok_tree",
			deco_type = "schematic",
			place_on = {"default:dirt_with_grass"},
			sidelen = 80,
			noise_params = {
				offset = 0.0,
				scale = 0.0025,
				spread = {x = 250, y = 250, z = 250},
				seed = 2685,
				octaves = 3,
				persist = 0.7
			},
			biomes = {"tropics"},
			y_max = 32,
			y_min = 1,
			schematic = minetest.get_modpath("tropical") ..
					"/schematics/emergent_kapok_tree.mts",
			flags = "place_center_x, place_center_z",
			rotation = "random",
			place_offset_y = -4,
		        rotation = "random",
		})
	end