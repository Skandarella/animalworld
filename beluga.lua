mobs:register_mob("animalworld:beluga", {
	stepheight = 1,
	type = "animal",
	passive = true,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 1,
	hp_min = 250,
	hp_max = 455,
	armor = 100,
	collisionbox = {-0.8, -0.01, -0.8, 0.8, 1.2, 0.8},
	visual = "mesh",
	mesh = "Beluga.b3d",
	textures = {
		{"texturebeluga.png"},

	},
	makes_footstep_sound = true,
	sounds = {
                random = "animalworld_beluga",
		attack = "animalworld_beluga2",
                damage = "animalworld_beluga3",
		death = "animalworld_beluga4",
	},
	walk_velocity = 2,
	run_velocity = 5,
	fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing",
	fall_speed = 0,
	jump = true,
	jump_height = 0,
 runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle"},
	pushable = true,
	follow = {
		"mobs:meat_raw", "animalworld:rawfish", "xocean:fish_edible", "ethereal:fish_raw", "mobs:clownfish_raw", "mobs:bluefish_raw", "fishing:bait_worm", "fishing:clownfish_raw", "fishing:bluewhite_raw", "fishing:exoticfish_raw", "fishing:fish_raw", "fishing:carp_raw", "fishing:perch_raw", "water_life:meat_raw", "fishing:shark_raw", "fishing:pike_raw", "animalworld:rawmollusk", "nativevillages:catfish_raw"
	},
	view_range = 15,
	drops = {
		{name = "animalworld:whaleblubber", chance = 1, min = 3, max = 10},
		{name = "animalworld:whalemeat_raw", chance = 1, min = 3, max = 10},
	},
	water_damage = 0,
        air_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 0,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		fly_start = 150,
		fly_end = 250,
		fly2_start = 250,
		fly2_end = 350,


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
	name = "animalworld:beluga",
	nodes = {"default:water_source"},
	neighbors = {"default:ice", "default:snowblock"},
	min_light = 0,
	interval = 30,
	chance = 2, -- 15000
	active_object_count = 3,
	min_height = -15,
	max_height = 1,
})
end

mobs:register_egg("animalworld:beluga", ("Beluga Whale"), "abeluga.png")


mobs:alias_mob("animalworld:beluga", "animalworld:beluga") -- compatibility


-- raw whale
minetest.register_craftitem(":animalworld:whalemeat_raw", {
	description = ("Raw Whale Meat"),
	inventory_image = "animalworld_whalemeat_raw.png",
	on_use = minetest.item_eat(4),
	groups = {food_meat_raw = 1, flammable = 2},
})

-- cooked whale
minetest.register_craftitem(":animalworld:whalemeat_cooked", {
	description = ("Cooked Whale Meat"),
	inventory_image = "animalworld_whalemeat_cooked.png",
	on_use = minetest.item_eat(8),
	groups = {food_meat = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "animalworld:whalemeat_cooked",
	recipe = "animalworld:whalemeat_raw",
	cooktime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "animalworld:whaleblubber",
	burntime = 10,
})

minetest.register_craftitem("animalworld:whaleblubber", {
	description = ("Whale Blubber"),
	inventory_image = "animalworld_whaleblubber.png",
})