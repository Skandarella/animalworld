mobs:register_mob("animalworld:carp", {
stepheight = 0.0,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 1,
        damage = 1,
	hp_min = 5,
	hp_max = 25,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "Carp.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturecarp.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 2,
	run_velocity = 3,
	fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing",
	fall_speed = 0,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player"},
	jump = false,
	stepheight = 0.0,
	drops = {
		{name = "animalworld:rawfish", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
        air_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 100,
		walk_start = 150,
		walk_end = 250,
		fly_start = 150, -- swim animation
		fly_end = 250,
		punch_start = 100,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {
		"ethereal:worm", "seaweed", "fishing:bait_worm",
		"default:grass", "farming:cucumber", "farming:cabbage", "animalworld:ant", "animalworld:termite", "animalworld:fishfood"
	},
	view_range = 10,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:carp",
	nodes = {"default:water_source"}, {"default:river_water_source"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 0,
	max_height = 30,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:carp", ("Carp"), "acarp.png")

-- raw fish
minetest.register_craftitem(":animalworld:rawfish", {
	description = ("Raw Fish"),
	inventory_image = "animalworld_rawfish.png",
	on_use = minetest.item_eat(3),
	groups = {food_meat_raw = 1, flammable = 2},
})

-- cooked fish
minetest.register_craftitem(":animalworld:cookedfish", {
	description = ("Cooked Fish"),
	inventory_image = "animalworld_cookedfish.png",
	on_use = minetest.item_eat(5),
	groups = {food_meat = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "animalworld:cookedfish",
	recipe = "animalworld:rawfish",
	cooktime = 5,
})
