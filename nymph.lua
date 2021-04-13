mobs:register_mob("animalworld:nymph", {
	stepheight = 1,
	type = "animal",
	passive = true,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 0,
	hp_min = 5,
	hp_max = 15,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.3, 0.3},
	visual = "mesh",
	mesh = "Nymph.b3d",
	textures = {
		{"texturenymph.png"},
	},
	makes_footstep_sound = false,
	sounds = {
	},
	walk_velocity = 0.6,
	run_velocity = 2,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player"},
	jump = false,
	jump_height = 3,
	pushable = true,
	view_range = 6,
	drops = {
		{name = "animalworld:fishfood", chance = 1, min = 0, max = 2},
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {
	},
	water_damage = 0,
	lava_damage = 5,
        air_damage = 1,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,

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


if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:nymph",
	nodes = {"default:water_source", "default:river_water_source"},
	neighbors = {"flowers:waterlily_waving"},
	min_light = 0,
	interval = 30,
	active_object_count = 2,
	chance = 1, -- 15000
	min_height = -10,
	max_height = 30,
})
end

mobs:register_egg("animalworld:nymph", ("Dragonfly Nymph"), "anymph.png")


mobs:alias_mob("animalworld:nymph", "animalworld:nymph") -- compatibility

minetest.register_craftitem("animalworld:fishfood", {
	description = ("Fish Food"),
	inventory_image = "animalworld_fishfood.png",
})
