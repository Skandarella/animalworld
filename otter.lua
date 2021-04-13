mobs:register_mob("animalworld:otter", {
	type = "animal",
	passive = true,
	reach = 1,
	hp_min = 20,
	hp_max = 55,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.4, 0.4},
	visual = "mesh",
	mesh = "Otter.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureotter.png"},
	},
	sounds = {
		random = "animalworld_otter",
		attack = "animalworld_otter2",
                damage = "animalworld_otter3",
	},
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 2,
	runaway = true,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle"},
	jump = false,
	stepheight = 1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
		{name = "mobs:leather", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
                stand_speed = 70,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		fly_start = 250, -- swim animation
		fly_end = 350,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:water_flowing", "default:river_water_flowing", "default:river_water"},
	floats = 0,
	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs_fish:clownfish_set", "mobs_fish:tropical_set", "xocean:fish_edible", "mobs:bluefish_raw", "nativevillages:catfish_raw"
	},
	view_range = 10,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:otter",
	nodes = {"default:water_source", "default:river_water_source"},
	neighbors = {"flowers:waterlily_waving"},
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	active_object_count = 2,
	min_height = -5,
	max_height = 10,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:otter", ("Otter"), "aotter.png")
