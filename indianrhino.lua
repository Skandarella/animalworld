mobs:register_mob("animalworld:indianrhino", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = false,
	attack_monsters = true,
	group_attack = true,
	reach = 3,
        damage = 14,
	hp_min = 90,
	hp_max = 140,
	armor = 100,
	collisionbox = {-1.2, -0.01, -0.8, 1.2, 1.5, 0.8},
	visual = "mesh",
	mesh = "Indianrhino.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureindianrhino.png"},
	},
	sounds = {
		random = "animalworld_rhino",
		attack = "animalworld_rhino2",
                distance = 13,
	},
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 3,
        walk_chance = 20,
	runaway = false,
	jump = true,
        jump_height = 6,
	stepheight = 1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	        {name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 3,
        pathfinding = true,
	animation = {
		speed_normal = 70,
		stand_start = 0,
		stand_end = 100,
		stand1_start = 100,
		stand1_end = 200,
		walk_start = 200,
		walk_end = 300,
		punch_start = 300,
		punch_end = 400,
		-- 50-70 is slide/water idle
	},

	follow = {"default:apple", "default:dry_dirt_with_dry_grass", "farming:seed_wheat", "default:junglegrass", "farming:seed_oat", "naturalbiomes:savannagrass", "naturalbiomes:savannagrassmall", "naturalbiomes:savanna_flowergrass"},
	view_range = 10,
	replace_rate = 10,
	replace_what = {"farming:soil", "farming:soil_wet"},
	replace_with = "default:dirt",
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"default:dirt_with_rainforest_litter", "ethereal:green_dirt", "ethereal:grass_grove"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:indianrhino",
	nodes = {"naturalbiomes:savannalitter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 5,
	max_height = 50,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:indianrhino", ("Indian Rhino"), "aindianrhino.png")