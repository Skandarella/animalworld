mobs:register_mob("animalworld:scorpion", {
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 10,
	hp_min = 5,
	hp_max = 30,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "Scorpion.b3d",
	visual_size = {x = 1, y = 1},
	textures = {
		{"texturescorpion.png"},
	},
	sounds = {
	},
	makes_footstep_sound = true,
	view_range = 5,
	walk_velocity = 0.5,
	run_velocity = 2,
	runaway = false,
	jump = true,
        jump_height = 0,
	stepheight = 3,
	drops = {
		{name = "animalworld:raw_athropod", chance = 1, min = 0, max = 2},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 75,
		stand_speed = 50,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_speed = 100,
		punch_start = 200,
		punch_end = 300,
		-- 50-70 is slide/water idle
	},
})


if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:scorpion",
	nodes = {"default:desert_sand"}, {"default:desert_sandstone"}, {"default:sandstone"}, {"ethereal:dry_dirt"}, {"ethereal:fiery_dirt"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = -20,
	max_height = 50,
	day_toggle = false,
})
end

mobs:register_egg("animalworld:scorpion", ("Scorpion"), "ascorpion.png")
