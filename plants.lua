minetest.register_node("tropical:fly_trap", {
	description = ("Venus Fly-Trap"),
	tiles = {"tropical_fly_trap.png"},
	inventory_image = "tropical_fly_trap.png",
	wield_image = "tropical_fly_trap.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {mushroom = 1, carnivorous_plant = 1, snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	damage_per_second = 2,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
	}
})