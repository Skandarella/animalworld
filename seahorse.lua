mobs:register_mob("animalworld:seahorse", {
stepheight = 0.0,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 1,
        damage = 0,
	hp_min = 5,
	hp_max = 5,
	armor = 100,
	collisionbox = {-0.1, 0, -0.1, 0.1, 0.6, 0.1},
	visual = "mesh",
	mesh = "Seahorse.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = multiply_texture({
		{"textureseahorse.png"},
		{"textureseahorse2.png"},
	}, 13),
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.25,
	run_velocity = 0.5,
	fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing",
	fall_speed = 0,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player"},
	jump = false,
	stepheight = 0.0,
	drops = {
	},
	water_damage = 0,
        air_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 0,
		stand2_end = 1,
		walk_start = 100,
		walk_end = 200,
                walk_speed = 30,
                fly_speed = 30,
		fly_start = 100, -- swim animation
		fly_end = 200,

		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {
		 "animalworld:fishfood"
	},
	view_range = 5,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:seahorse",
	nodes = {"default:water_source"},
	neighbors = {"default:sand_with_kelp"},
	min_light = 0,
	interval = 30,
	chance = 2, -- 15000
	active_object_count = 4,
	min_height = -15,
	max_height = 0,
})
end

mobs:register_egg("animalworld:seahorse", ("Seahorse"), "aseahorse.png")
