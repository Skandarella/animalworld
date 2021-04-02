mobs:register_mob("animalworld:seal", {
stepheight = 0.6,
	type = "animal",
	passive = true,
	reach = 1,
	hp_min = 20,
	hp_max = 55,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.8, 0.6, 0.4},
	visual = "mesh",
	mesh = "Seal.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureseal.png"},
	},
	sounds = {
		random = "animalworld_seal",
		attack = "animalworld_seal",
	},
	makes_footstep_sound = true,
	walk_velocity = 0.8,
	run_velocity = 1,
	runaway = true,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion"},
	jump = false,
	stepheight = 1.1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
		{name = "animalworld:sealcorpse", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 125,
		stand_start = 0,
		stand_end = 400,
		walk_start = 400,
		walk_end = 600,
		fly_start = 650, -- swim animation
		fly_end = 850,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:water_flowing", "default:river_water_flowing", "default:river_water"},
	floats = 0,
	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs_fish:clownfish_set", "mobs_fish:tropical_set", "xocean:fish_edible", "mobs:bluefish_raw"
	},
	view_range = 10,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if minetest.get_modpath("ethereal") then
	spawn_on = {"default:snowblock", "default_ice"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:seal",
	nodes = {"default:snowblock", "default_ice"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 0,
	max_height = 10,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:seal", ("Seal"), "aseal.png")
