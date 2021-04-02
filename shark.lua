mobs:register_mob("animalworld:shark", {
stepheight = 0.0,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 14,
	hp_min = 30,
	hp_max = 95,
	armor = 100,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 0.95, 0.7},
	visual = "mesh",
	mesh = "Shark.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureshark.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	sounds = {
		attack = "animalworld_shark",
	},
	walk_velocity = 2,
	run_velocity = 4,
        fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing",
	fall_speed = 0,
	runaway = false,
	jump = false,
	stepheight = 0.0,
	drops = {
		{name = "animalworld:rawfish", chance = 1, min = 1, max = 1},
		{name = "animalworld:sharkcorpse", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
        air_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 100,
		fly_start = 0, -- swim animation
		fly_end = 100,
		punch_start = 100,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing"},
	floats = 0,
	follow = {
		"mobs:meat_raw", "xocean:fish_edible", "ethereal:fish_raw", "mobs:clownfish_raw", "mobs:bluefish_raw", "fishing:bait_worm", "fishing:clownfish_raw", "fishing:bluewhite_raw", "fishing:exoticfish_raw", "fishing:fish_raw", "fishing:carp_raw", "fishing:perch_raw", "water_life:meat_raw", "fishing:shark_raw", "fishing:pike_raw"
	},
	view_range = 17,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:shark",
	nodes = {"default:water_source"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 10,
	day_toggle = false,
})
end

mobs:register_egg("animalworld:shark", ("Shark"), "ashark.png")
