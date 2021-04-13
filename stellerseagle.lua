mobs:register_mob("animalworld:stellerseagle", {
stepheight = 3,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	owner_loyal = true,
	reach = 2,
        damage = 6,
	hp_min = 25,
	hp_max = 45,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.5, 0.3},
	visual = "mesh",
	mesh = "Stellerseagle.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturestellerseagle.png"},
	},
	sounds = {
		random = "animalworld_stellerseagle",
                attack = "animalworld_stellerseagle2",
	},
	makes_footstep_sound = false,
	walk_velocity = 5,
	run_velocity = 5,
	fall_speed = 0,
	jump = true,
        jump_height = 6,
	stepheight = 3,
	fly = true,
	drops = {
		{name = "animalworld:chicken_raw", chance = 1, min = 1, max = 1},
	        {name = "animalworld:chicken_feather", chance = 1, min = 1, max = 1},
	
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 0,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 100,
		fly_start = 150, -- swim animation
		fly_end = 250,
		punch_start = 250,
		punch_end = 350,
		-- 50-70 is slide/water idle
	},

fly_in = {"air"},
	floats = 0,
	follow = {
		"animalworld:rabbit_raw", "mobs:meat_raw", "animalworld:chicken_raw", "water_life:meat_raw", "ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs_fish:clownfish_set", "mobs_fish:tropical_set", "xocean:fish_edible", "mobs:bluefish_raw", "animalworld:rawmollusk", "nativevillages:catfish_raw"
	},
	
view_range = 16,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:stellerseagle",
	nodes = {"default:permafrost", "default:permafrost_with_moss", "default:permafrost_with_stones"},
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	active_object_count = 2,
	min_height = 30,
	max_height = 100,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:stellerseagle", ("Stellers Sea Eagle"), "astellerseagle.png")
