

tropical.trees = {
	{"kapok",      "Kapok"},
	{"rainbow_eucalyptus",       "Rainbow Eucalyptus"},
	{"rosewood",       "Rosewood"},
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