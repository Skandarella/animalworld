
mobs:register_mob("animalworld:termite", {
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	reach = 1,
        damage = 1,
	hp_min = 1,
	hp_max = 10,
	armor = 100,
	collisionbox = {-0.1, -0.01, -0.1, 0.1, 0.1, 0.1},
	visual = "mesh",
	mesh = "Termite.b3d",
	visual_size = {x = 1, y = 1},
	textures = {
		{"texturetermite.png"},
	},
	sounds = {
		random = "animalworld_termite",
		attack = "animalworld_termite",
	},
	makes_footstep_sound = true,
	stay_near = {"animalworld:termitemould", 5},
	view_range = 3,
	walk_velocity = 0.5,
        walk_chance = 70,
	run_velocity = 0.7,
	runaway = false,
	jump = false,
        jump_height = 0,
	stepheight = 3,
	drops = {
		{name = "animalworld:termite", chance = 1, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 200,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 100,
		punch_start = 100,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},
})


if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:termite",
	nodes = {"default:dry_dirt_with_dry_grass"},
	neighbors = {"animalworld:termitemould"},
	min_light = 0,
	interval = 30,
	chance = 1, -- 15000
	active_object_count = 7,
	min_height = 0,
	max_height = 50,
})
end

mobs:register_egg("animalworld:termite", ("Termite"), "atermite.png")

mobs:alias_mob("animalworld:termite", "animalworld:Termite")


minetest.register_craftitem(":animalworld:termitequeen", {
	description = ("Termite Queen"),
	inventory_image = "animalworld_termitequeen.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, flammable = 2},
})



	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dry_dirt_with_dry_grass"},
	        neighbors = {"default:acacia_bush_leaves"},
		sidelen = 16,
		noise_params = {
			offset = 0.0012,
			scale = 0.0007,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		y_max = 50,
		y_min = 0,
		decoration = "animalworld:termitemould"
	})

minetest.register_node("animalworld:termitemould", {
    description = "Termite Mound",
    visual_scale = 1,
    mesh = "Termitemould.b3d",
    tiles = {"texturetermitemould.png"},
    inventory_image = "atermitemould.png",
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy = 3},
    drawtype = "mesh",
    collision_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
            --[[{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}]]
        }
    },
    selection_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
        }
    },
	drop = "animalworld:termiteconcrete", 
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node("animalworld:termiteconcrete", {
	description = ("Termite Concrete"),
	tiles = {"termiteconcrete.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	type = "cooking",
	output = "animalworld:termitequeen",
	recipe = "animalworld:termiteconcrete",
})

minetest.register_node("animalworld:termiteconcreteblue", {
	description = ("Termite Concrete Blue"),
	tiles = {"termiteconcreteblue.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	output = "animalworld:termiteconcreteblue 6",
	type = "shapeless",
	recipe = 
		{"animalworld:termiteconcrete", "flowers:geranium"}

	
})

minetest.register_node("animalworld:termiteconcretegreen", {
	description = ("Termite Concrete Green"),
	tiles = {"termiteconcretegreen.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	output = "animalworld:termiteconcretegreen 6",
	type = "shapeless",
	recipe = 
		{"animalworld:termiteconcrete", "flowers:chrysanthemum_green"}

	
})

minetest.register_node("animalworld:termiteconcreteyellow", {
	description = ("Termite Concrete Yellow"),
	tiles = {"termiteconcreteyellow.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	output = "animalworld:termiteconcreteyellow 6",
	type = "shapeless",
	recipe = 
		{"animalworld:termiteconcrete", "flowers:dandelion_yellow"}

	
})

minetest.register_node("animalworld:termiteconcretered", {
	description = ("Termite Concrete Red"),
	tiles = {"termiteconcretered.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	output = "animalworld:termiteconcretered 6",
	type = "shapeless",
	recipe = 
		{"animalworld:termiteconcrete", "flowers:rose"}

	
})

minetest.register_node("animalworld:termiteconcreteorange", {
	description = ("Termite Concrete Orange"),
	tiles = {"termiteconcreteorange.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	output = "animalworld:termiteconcreteorange 6",
	type = "shapeless",
	recipe = 
		{"animalworld:termiteconcrete", "flowers:tulip"}

	
})

minetest.register_node("animalworld:termiteconcreteviolet", {
	description = ("Termite Concrete Violet"),
	tiles = {"termiteconcreteviolet.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	output = "animalworld:termiteconcreteviolet 6",
	type = "shapeless",
	recipe = 
		{"animalworld:termiteconcrete", "flowers:viola"}

	
})

minetest.register_node("animalworld:termiteconcretewhite", {
	description = ("Termite Concrete White"),
	tiles = {"termiteconcretewhite.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_craft({
	output = "animalworld:termiteconcretewhite 6",
	type = "shapeless",
	recipe = 
		{"animalworld:termiteconcrete", "flowers:dandelion_white"}

	
})