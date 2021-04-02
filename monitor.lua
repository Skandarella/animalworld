mobs:register_mob("animalworld:monitor", {
stepheight = 1,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 8,
	hp_min = 20,
	hp_max = 55,
	armor = 100,
	collisionbox = {-0.6, -0.01, -0.6, 0.6, 0.95, 0.6},
	visual = "mesh",
	mesh = "Monitor.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturemonitor.png"},
	},
	sounds = {
		random = "animalworld_monitor",
		attack = "animalworld_monitor",
	},
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 2.5,
	runaway = false,
	jump = true,
        jump_height = 0.5,
	stepheight = 1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
		{name = "animalworld:monitorcorpse", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 75,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		fly_start = 350, -- swim animation
		fly_end = 450,
		punch_start = 200,
		punch_end = 300,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs:meat_raw", "animalworld:rabbit_raw", "xocean:fish_edible", "animalworld:chicken_raw", "water_life:meat_raw"
	},
	view_range = 8,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if minetest.get_modpath("ethereal") then
	spawn_on = {"default:desert_sand"}, {"default:desert_sandstone"}, {"default:sandstone"}, {"ethereal:dry_dirt"}, {"ethereal:fiery_dirt"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:monitor",
	nodes = {"default:desert_sand"}, {"default:desert_sandstone"}, {"default:sandstone"}, {"ethereal:dry_dirt"}, {"ethereal:fiery_dirt"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 20,
	max_height = 45,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:monitor", ("Monitor Lizard"), "amonitor.png")
