mobs:register_mob("animalworld:wolf", {
stepheight = 2,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 9,
	hp_min = 25,
	hp_max = 45,
	armor = 100,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Wolf.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturewolf.png"},
		{"texturewolf2.png"},
		{"texturewolf.png"},
		{"texturewolf3.png"},
		{"texturewolf.png"},
		{"texturewolf.png"},
	},
	sounds = {
		random = "animalworld_wolf",
		attack = "animalworld_wolf2",
		damage = "animalworld_wolf3",
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
	runaway = false,
	jump = true,
        jump_height = 6,
	stepheight = 2,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	        {name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand_start = 100,
		stand_end = 200,
		walk_start = 200,
		walk_end = 300,
		punch_speed = 100,
		punch_start = 300,
		punch_end = 400,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:fish_raw", "animalworld:rawfish", "mobs_fish:tropical",
		"mobs:meat_raw", "animalworld:rabbit_raw", "animalworld:pork_raw", "water_life:meat_raw", "xocean:fish_edible", "animalworld:chicken_raw"
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
	spawn_on = {"ethereal:dry_dirt"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:wolf",
	nodes = {"default:dirt_with_coniferous_litter", "naturalbiomes:alpine_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 4,
	min_height = 30,
	max_height = 31000,
	day_toggle = false,
})
end

mobs:register_egg("animalworld:wolf", ("Wolf"), "awolf.png")
