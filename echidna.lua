mobs:register_mob("animalworld:echidna", {
	stepheight = 1,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = true,
	reach = 3,
	damage = 15,
	hp_min = 25,
	hp_max = 65,
	armor = 100,
	collisionbox = {-0.2, -0.01, -0.2, 0.2, 0.95, 0.2},
	visual = "mesh",
	mesh = "Echidna.b3d",
	textures = {
		{"textureechidna.png"},
	},
	makes_footstep_sound = true,
	sounds = {

	},
	walk_velocity = 0.5,
	run_velocity = 0.5,
	runaway = false,
	jump = false,
	jump_height = 3,
	pushable = true,
	follow = {"fishing:bait:worm", "bees:frame_full", "ethereal:worm", "animalworld:ant", "animalworld:termite"},
	view_range = 3,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	        {name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
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

		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

local spawn_on = {"default:dirt_with_rainforest_litter"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"default:dirt_with_rainforest_litter", "default:dry_dirt_with_dry_grass"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:grass_grove", "ethereal:green_dirt", "default:dirt_with_rainforest_litter"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:echidna",
	nodes = {"naturalbiomes:outback_litter"},
	min_light = 0,
	interval = 1,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 5,
	max_height = 50,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:echidna", ("Echidna"), "aechidna.png")


mobs:alias_mob("animalworld:echidna", "animalworld:echidna") -- compatibility

