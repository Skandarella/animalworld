-- Tundra Shrub4

minetest.register_node("animalworld:animalworld_tundrashrub4", {
	description = ("Tundra Shrub"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"animalworld_tundrashrub4.png"},
	inventory_image = "animalworld_tundrashrub4.png",
	wield_image = "animalworld_tundrashrub4.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
	},
})

	minetest.register_decoration({
		name = "animalworld:animalworld_tundrashrub4",
		deco_type = "simple",
		place_on = {"default:permafrost", "default:permafrost_with_stones"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"tundra_highland", "tundra_beach", "tundra", "default:permafrost_with_moss"},
		y_max = 31000,
		y_min = 2,
		decoration = "animalworld:animalworld_tundrashrub4",
		param2 = 4,
	})

-- Tundra Shrub2

minetest.register_node("animalworld:animalworld_tundrashrub2", {
	description = ("Tundra Shrub"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"animalworld_tundrashrub2.png"},
	inventory_image = "animalworld_tundrashrub2.png",
	wield_image = "animalworld_tundrashrub2.png",
	paramtype = "light",
	paramtype2 = "meshoptions",
	place_param2 = 4,
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, 4 / 16, 6 / 16},
	},
})

	minetest.register_decoration({
		name = "animalworld:animalworld_tundrashrub2",
		deco_type = "simple",
		place_on = {"default:permafrost", "default:permafrost_with_stones"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.1,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"tundra_highland", "tundra_beach", "tundra"},
		y_max = 31000,
		y_min = 2,
		decoration = "animalworld:animalworld_tundrashrub2",
		param2 = 4,
	})

	-- Tundra Shrubs

	minetest.register_node("animalworld:animalworld_tundrashrub1", {
		description = ("Tundra Shrub"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 2,
		tiles = {"animalworld_tundrashrub1.png"},
		inventory_image = "animalworld_tundrashrub1.png",
		wield_image = "animalworld_tundrashrub1.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory=1},
		drop = "animalworld:animalworld_tundrashrub1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})

	-- Tundra Shrubs

	minetest.register_node("animalworld:animalworld_tundrashrub3", {
		description = ("Tundra Shrub"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 2,
		tiles = {"animalworld_tundrashrub3.png"},
		inventory_image = "animalworld_tundrashrub3.png",
		wield_image = "animalworld_tundrashrub3.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory=1},
		drop = "animalworld:animalworld_tundrashrub3",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})

-- Tundra Shrubs

	minetest.register_node("animalworld:animalworld_tundrashrub5", {
		description = ("Tundra Shrub"),
		drawtype = "plantlike",
		waving = 1,
		visual_scale = 2,
		tiles = {"animalworld_tundrashrub5.png"},
		inventory_image = "animalworld_tundrashrub5.png",
		wield_image = "animalworld_tundrashrub5.png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1,
			not_in_creative_inventory=1},
		drop = "animalworld:animalworld_tundrashrub5",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-6 / 16, -0.5, -6 / 16, 6 / 16, -0.25, 6 / 16},
		},
	})

	-- Tundra Shrubs

minetest.register_decoration({
		name = "animalworld:animalworld_tundrashrub5",
		deco_type = "simple",
		place_on = {"default:permafrost", "default:permafrost_with_stones"},
		sidelen = 4,
		noise_params = {
			offset = -0.7,
			scale = 4.0,
			spread = {x = 16, y = 16, z = 16},
			seed = 513337,
			octaves = 1,
			persist = 0.0,
			flags = "absvalue, eased"
		},
		biomes = {"tundra_highland", "tundra_beach", "tundra"},
		y_max = 3000,
		y_min = 4,
		decoration = {
			"animalworld:animalworld_tundrashrub5",
		},
	})


	minetest.register_decoration({
		name = "animalworld:animalworld_tundrashrub",
		deco_type = "simple",
		place_on = {"default:permafrost", "default:permafrost_with_stones"},
		sidelen = 4,
		noise_params = {
			offset = -0.7,
			scale = 4.0,
			spread = {x = 16, y = 16, z = 16},
			seed = 513337,
			octaves = 1,
			persist = 0.0,
			flags = "absvalue, eased"
		},
		biomes = {"tundra_highland", "tundra_beach", "tundra"},
		y_max = 3000,
		y_min = 4,
		decoration = {
			"animalworld:animalworld_tundrashrub5",
			"animalworld:animalworld_tundrashrub3",
			"animalworld:animalworld_tundrashrub1",
		},
	})

minetest.register_craft({
	type = "fuel",
	recipe = "animalworld:animalworld_tundrashrub",
	burntime = 0.1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "animalworld:animalworld_tundrashrub2",
	burntime = 0.1,
})


minetest.register_craft({
	type = "fuel",
	recipe = "animalworld:animalworld_tundrashrub3",
	burntime = 0.1,
})


minetest.register_craft({
	type = "fuel",
	recipe = "animalworld:animalworld_tundrashrub4",
	burntime = 0.1,
})


minetest.register_craft({
	type = "fuel",
	recipe = "animalworld:animalworld_tundrashrub5",
	burntime = 0.1,
})

