mobs:register_mob("animalworld:rat", {
	type = "animal",
	stepheight = 3,
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	group_attack = true,
	reach = 2,
	damage = 3,
	hp_min = 5,
	hp_max = 35,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.6, 0.4},
	visual = "mesh",
	mesh = "Rat.b3d",
	textures = {
		{"texturerat.png"},
		{"texturerat.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "animalworld_rat",
		attack = "animalworld_rat",
	},
	walk_velocity = 2,
	run_velocity = 3,
	jump = true,
	jump_height = 6,
	pushable = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},

	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 6,
	animation = {
		stand_start = 0,
		stand_end = 100,
		stand_speed = 50,
		walk_start = 100,
		walk_end = 200,
		walk_speed = 130,
		punch_start = 250,
		punch_end = 350,
		punch_speed = 125,

		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	follow = {"farming:wheat", "farming:beans", "farming:barley", "farming:oat", "farming:rye", "mobs:cheese", "farming:bread", "ethereal:banana_bread"},
	view_range = 10,

})

if minetest.get_modpath("ethereal") then
	spawn_on = {"default:stone", "default:mossycobble", "ethereal:dry_dirt"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:rat",
	nodes = {"default:stone", "default:mossycobble", "default:dirt"},
	min_light = 0,
	interval = 60,
	chance = 2000, -- 15000
	active_object_count = 2,
	min_height = -100,
	max_height = 0,

})
end


mobs:register_egg("animalworld:rat", ("Rat"), "arat.png")


mobs:alias_mob("animalworld:rat", "animalworld:rat") -- compatibility

-- cooked rat, yummy!
minetest.register_craftitem(":animalworld:rat_cooked", {
	description = ("Cooked Rodent Meat"),
	inventory_image = "animalworld_cooked_rat.png",
	on_use = minetest.item_eat(3),
	groups = {food_rat = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "animalworld:rat_cooked",
	recipe = "animalworld:rat",
	cooktime = 5,
})


