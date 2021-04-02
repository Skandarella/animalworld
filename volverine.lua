mobs:register_mob("animalworld:volverine", {
stepheight = 3,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 12,
	hp_min = 15,
	hp_max = 45,
	armor = 100,
	collisionbox = {-0.6, -0.01, -0.6, 0.6, 0.95, 0.6},
	visual = "mesh",
	mesh = "Volverine.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturevolverine.png"},
	},
	sounds = {
		random = "animalworld_volverine",
	},
	makes_footstep_sound = true,
	walk_velocity = 3,
	run_velocity = 4,
	runaway = false,
	jump = true,
        jump_height = 6,
	stepheight = 3,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
		{name = "mobs:leather", chance = 1, min = 0, max = 2},
		{name = "animalworld:wolverinecorpse", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		walk_speed = 125,
		walk_start = 100,
		walk_end = 200,
		punch_speed = 100,
		punch_start = 200,
		punch_end = 300,
		-- 50-70 is slide/water idle
	},

	follow = {
		"animalworld:rawfish", "mobs:meat_raw", "animalworld:rabbit_raw", "animalworld:chicken_raw", "water_life:meat_raw"
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
	spawn_on = {"default:dirt_with_snow"}, {"default:permafrost_with_moss"}, {"default:snowblock"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:volverine",
	nodes = {"default:dirt_with_snow"}, {"default:permafrost_with_moss"}, {"default:snowblock"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 20,
	max_height = 60,
	day_toggle = false,

})
end

mobs:register_egg("animalworld:volverine", ("Wolverine"), "avolverine.png")
