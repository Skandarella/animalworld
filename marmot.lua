mobs:register_mob("animalworld:marmot", {
	stepheight = 2,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 1,
	hp_min = 10,
	hp_max = 30,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.95, 0.3},
	visual = "mesh",
	mesh = "Marmot.b3d",
	textures = {
		{"texturemarmot.png"},
	},
	makes_footstep_sound = true,
	sounds = {		
		random = "animalworld_marmot",
		damage = "animalworld_marmot2",
	},
	walk_velocity = 2,
	run_velocity = 3,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player", "animalworld:wolf", "animalworld:panda", "animalworld:stingray"},
	jump = false,
	jump_height = 6,
	pushable = true,
	follow = {"default:grass_3", "default:dry_grass_3", "ethereal:dry_shrub", "farming:lettuce", "farming:seed_wheat", "default:junglegrass", "naturalbiomes:alpine_grass1", "naturalbiomes:alpine_grass2", "naturalbiomes:alpine_grass3", "naturalbiomes:alpine_dandelion"},
	view_range = 10,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	        {name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 90,
		stand_start = 0,
		stand_end = 100,
		stand1_start = 100,
		stand1_end = 200,
		stand2_start = 350,
		stand2_end = 450,
		walk_start = 200,
		walk_end = 300,
		punch_start = 200,
		punch_end = 300,

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

local spawn_on = {"default:desert_sand", "default:dry_dirt_with_dry_grass"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"default:desert_sand", "default:dry_dirt_with_dry_grass"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:grass_grove", "default:desert_sand", "ethereal:dry_dirt"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:marmot",
	nodes = {"naturalbiomes:alpine_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 4,
	min_height = 30,
	max_height = 31000,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:marmot", ("Marmot"), "amarmot.png")


mobs:alias_mob("animalworld:marmot", "animalworld:marmot") -- compatibility

