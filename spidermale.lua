mobs:register_mob("animalworld:spidermale", {
stepheight = 4,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	attack_animals = true,
	reach = 1,
        damage = 2,
	hp_min = 5,
	hp_max = 30,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.3, 0.3},
	visual = "mesh",
	mesh = "Spider.b3d",
	visual_size = {x = 0.1, y = 0.1},
	textures = {
		{"texturespider.png"},
	},
	sounds = {
		random = "animalworld_spider",
		attack = "animalworld_spider",
	},
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 0.5,
	run_velocity = 2,
	runaway = false,
	jump = true,
        jump_height = 0,
	stepheight = 4,
	drops = {
		{name = "animalworld:raw_athropod", chance = 1, min = 0, max = 2},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 8,
	animation = {
		speed_normal = 125,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 300,
		-- 50-70 is slide/water idle
	},
})


if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:spidermale",
	nodes = {"default:dry_dirt_with_dry_grass"}, {"default:dirt_with_rainforest_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = -10,
	max_height = 20,
	day_toggle = false,
})
end

mobs:register_egg("animalworld:spidermale", ("Spider Male"), "aspidermale.png")
