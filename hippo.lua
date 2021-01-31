mobs:register_mob("wildlife:hippo", {
stepheight = 1,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 3,
        damage = 6,
	hp_min = 5,
	hp_max = 35,
	armor = 200,
	collisionbox = {-1.4, -0.01, -1.4, 1.4, 1.4, 1.4},
	visual = "mesh",
	mesh = "Hippo2.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturehippo.png"},
	},
	sounds = {
		random = "wildlife_hippo",
		attack = "wildlife_hippo",
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
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		walk_start = 250,
		walk_end = 350,
		fly_start = 250, -- swim animation
		fly_end = 350,
		punch_start = 100,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},

fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing"},
	floats = 0,
	follow = {
		"ethereal:banana_single", "farming:corn_cob", "farming:cabbage",
		"default:apple"
	},
	
view_range = 6,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "wildlife:hippo",
	nodes = {"default:dry_dirt_with_dry_grass"}, {"default:dirt_with_rainforest_litter"},
	min_light = 0,
	interval = 40,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 5,
	day_toggle = true,
})
end

mobs:register_egg("wildlife:hippo", ("Hippo"), "ahippo.png")
