mobs:register_mob("animalworld:blackbird", {
stepheight = 3,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 2,
        damage = 2,
	hp_min = 5,
	hp_max = 30,
	armor = 100,
	collisionbox = {-0.3, -0.01, -1, 0.3, 0.3, 0.3},
	visual = "mesh",
	mesh = "Blackbird.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureblackbird.png"},
	},
	sounds = {
		random = "animalworld_blackbird",
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "player"},
	jump = true,
        jump_height = 6,
	stepheight = 3,
	drops = {
		{name = "animalworld:chicken_raw", chance = 1, min = 1, max = 1},
	        {name = "animalworld:chicken_feather", chance = 1, min = 1, max = 1},
	
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 10,
	animation = {
		speed_normal = 100,
		stand_start = 100,
		stand_end = 200,
		walk_start = 0,
		walk_end = 100,
		fly_start = 250, -- swim animation
		fly_end = 350,
		punch_start = 100,
		punch_end = 200,
		-- 50-70 is slide/water idle
	},

fly_in = {"air"},
	floats = 0,
	follow = {
		"fishing:bait:worm", "farming:seed_wheat", "farming:seed_rice", "farming:seed_oat", "ethereal:pine_nuts", "ethereal:worm"
	},
	
view_range = 4,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "animalworld:blackbird",
	nodes = {"default:dirt_with_grass"}, 
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 100,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:blackbird", ("Blackbird"), "ablackbird.png")

-- egg
minetest.register_node(":mobs:egg", {
	description = ("Chicken Egg"),
	tiles = {"mobs_chicken_egg.png"},
	inventory_image  = "mobs_chicken_egg.png",
	visual_scale = 0.7,
	drawtype = "plantlike",
	wield_image = "mobs_chicken_egg.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {food_egg = 1, snappy = 2, dig_immediate = 3},
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "mobs:egg", param2 = 1})
		end
	end,
	on_use = mobs_shoot_egg
})


-- fried egg
minetest.register_craftitem(":animalworld:chicken_egg_fried", {
	description = ("Bird Egg"),
	inventory_image = "animalworld_chicken_egg_fried.png",
	on_use = minetest.item_eat(2),
	groups = {food_egg_fried = 1, flammable = 2},
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobs:egg",
	output = "animalworld:chicken_egg_fried",
})

-- raw chicken
minetest.register_craftitem(":animalworld:chicken_raw", {
description = ("Raw Bird Meat"),
	inventory_image = "animalworld_chicken_raw.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, food_chicken_raw = 1, flammable = 2},
})

-- cooked chicken
minetest.register_craftitem(":animalworld:chicken_cooked", {
description = ("Cooked Bird Meat"),
	inventory_image = "animalworld_chicken_cooked.png",
	on_use = minetest.item_eat(6),
	groups = {food_meat = 1, food_chicken = 1, flammable = 2},
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "animalworld:chicken_raw",
	output = "animalworld:chicken_cooked",
})

-- feather
minetest.register_craftitem(":animalworld:chicken_feather", {
	description = ("Bird Feather"),
	inventory_image = "animalworld_chicken_feather.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "fuel",
	recipe = "animalworld:chicken_feather",
	burntime = 1,
})

