mobs:register_mob("animalworld:dragonfly", {
stepheight = 3,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = true,
	owner_loyal = true,
	reach = 2,
        damage = 1,
	hp_min = 5,
	hp_max = 25,
	armor = 100,
	collisionbox = {-0.1, -0.01, -0.1, 0.1, 0.2, 0.1},
	visual = "mesh",
	mesh = "Dragonfly.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturedragonfly.png"},
	},
	sounds = {
		random = "animalworld_dragonfly",
	},
	makes_footstep_sound = false,
	walk_velocity = 5,
	run_velocity = 7,
        walk_chance = 15,
	fall_speed = 0,
	jump = true,
        jump_height = 6,
	stepheight = 3,
	fly = true,
	drops = {
	
	},
	water_damage = 4,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 0,
	animation = {
		speed_normal = 150,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		fly_start = 100, -- swim animation
		fly_end = 200,
	},

fly_in = {"air"},
	floats = 0,
	follow = {
		"animalworld:termitequeen", "animalworld:ant", "animalworld:termite" 
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
	name = "animalworld:dragonfly",
	nodes = {"air"},
	neighbors = {"flowers:waterlily_waving"},
	min_light = 0,
	interval = 30,
	active_object_count = 2,
	chance = 1, -- 15000
	min_height = 0,
	max_height = 40,
        day_toggle = true
})
end

mobs:register_egg("animalworld:dragonfly", ("Dragonfly"), "adragonfly.png")
