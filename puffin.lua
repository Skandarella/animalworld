mobs:register_mob("animalworld:puffin", {
stepheight = 3,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 2,
        damage = 1,
	hp_min = 5,
	hp_max = 35,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.5, 0.3},
	visual = "mesh",
	mesh = "Puffin.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = multiply_texture("texturepuffin.png", 16),
	sounds = {
	},
	makes_footstep_sound = false,
	walk_velocity = 5,
	run_velocity = 6,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player"},
	fall_speed = 0,
	jump = true,
        jump_height = 6,
	fly = true,
	stepheight = 3,
	drops = {
		{name = "animalworld:chicken_raw", chance = 1, min = 1, max = 1},
	        {name = "animalworld:chicken_feather", chance = 1, min = 1, max = 1},

	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 0,
	animation = {
		speed_normal = 130,
		stand_start = 0,
		stand_end = 100,
		walk_start = 150,
		walk_end = 250,
		fly_start = 150, -- swim animation
		fly_end = 250,
		-- 50-70 is slide/water idle
	},

fly_in = {"air", "default:water_source", "default:river_water_source"},
	floats = 0,
	follow = {
		"animalworld:rawfish", "mobs:clownfish_raw", "mobs:bluefish_raw", "fishing:bait_worm", "fishing:clownfish_raw", "fishing:bluewhite_raw", "fishing:exoticfish_raw", "fishing:fish_raw", "fishing:carp_raw", "fishing:perch_raw", "xocean:fish_edible"
	},

view_range = 4,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if minetest.get_modpath("ethereal") then
	spawn_on = {"default:snowblock"}, {"default:ice"}, {"ethereal:crystal_dirt"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:puffin",
	nodes = {"default:snowblock"}, {"default:ice"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 10,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:puffin", ("Puffin"), "apuffin.png")
