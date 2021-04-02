mobs:register_mob("animalworld:crocodile", {
stepheight = 1,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 12,
	hp_min = 50,
	hp_max = 95,
	armor = 100,
	collisionbox = {-0.6, -0.01, -0.6, 0.6, 0.95, 0.6},
	visual = "mesh",
	mesh = "Crocodile.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturecrocodile.png"},
	},
	sounds = {
		random = "animalworld_crocodile",
		attack = "animalworld_crocodile",
	},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2,
	runaway = false,
	jump = true,
        jump_height = 0.5,
	stepheight = 1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
		{name = "animalworld:crocodilecorpse", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 75,
		stand_start = 0,
		stand_end = 100,
		walk_start = 250,
		walk_end = 350,
		fly_start = 400, -- swim animation
		fly_end = 500,
		punch_start = 100,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs:meat_raw", "animalworld:rabbit_raw", "xocean:fish_edible", "fishing:fish_raw", "water_life:meat_raw", "fishing:carp_raw", "animalworld:chicken_raw"
	},
	view_range = 12,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:grove_dirt", "default:dry_dirt_with_dry_grass", "default:dirt_with_rainforest_litter"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:crocodile",
	nodes = {"default:dry_dirt_with_dry_grass"}, {"default:dirt_with_rainforest_litter"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 0,
	max_height = 3,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:crocodile", ("Crocodile"), "acrocodile.png")
