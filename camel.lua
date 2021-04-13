mobs:register_mob("animalworld:camel", {
	stepheight = 1,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 5,
	hp_min = 20,
	hp_max = 60,
	armor = 100,
	collisionbox = {-1, -0.01, -0.6, 1, 2, 0.6},
	visual = "mesh",
	mesh = "Camel.b3d",
	textures = {
		{"texturecamel.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "animalworld_camel",
		attack = "animalworld_camel",
	},
	walk_velocity = 2,
	run_velocity = 5,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle"},
	jump = false,
	jump_height = 3,
	pushable = true,
	follow = {"default:dry_shrub ", "default:grass_1", "ethereal:dry_shrub", "farming:seed_wheat", "farming:seed_rye", "default:junglegrass"},
	view_range = 7,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
		{name = "animalworld:camelcorpse", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 35,
		stand_start = 0,
		stand_end = 100,
		walk_start = 200,
		walk_end = 300,
		punch_start = 100,
		punch_end = 200,

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

local spawn_on = {"default:desert_sand", "default:sandstone"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"default:desert_sand", "default:sandstone"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"default:desert_sand", "ethereal:dry_dirt"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:camel",
	nodes = {"default:desert_sand", "default:sandstone"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 0,
	max_height = 40,
})
end

mobs:register_egg("animalworld:camel", ("Camel"), "acamel.png")


mobs:alias_mob("animalworld:camel", "animalworld:camel") -- compatibility

