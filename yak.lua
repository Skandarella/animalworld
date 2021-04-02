mobs:register_mob("animalworld:yak", {
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = false,
	group_attack = true,
	reach = 2,
	damage = 8,
	hp_min = 5,
	hp_max = 55,
	armor = 100,
	collisionbox = {-0.6, -0.01, -0.4, 0.6, 1.2, 0.4},
	visual = "mesh",
	mesh = "Yak.b3d",
	textures = {
		{"textureyak.png"},
		{"textureyak.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "animalworld_yak",
		attack = "animalworld_yak",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	pushable = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "mobs:leather", chance = 1, min = 0, max = 2},
           	{name = "wool:brown", chance = 1, min = 0, max = 2},
		{name = "animalworld:yakcorpse", chance = 7, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	animation = {
		stand_start = 0,
		stand_end = 100,
		stand_speed = 75,
		stand1_start = 100,
		stand1_end = 200,
		stand1_speed = 75,
		walk_start = 150,
		walk_end = 250,
		walk_speed = 75,
		run_start = 150,
		run_end = 250,
		run_speed = 75,
		punch_start = 250,
		punch_end = 350,
		punch_speed = 75,


		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	follow = {
		"farming:wheat", "default:grass_1", "farming:barley",
		"farming:oat", "farming:rye", "farming:carrot", "farming:beans", "farming:lettuce"
	},
	view_range = 8,
	replace_rate = 10,
	replace_what = {
		{"group:grass", "air", 0},
		{"default:dirt_with_grass", "default:dirt", -1}
	},
--	stay_near = {"farming:straw", "group:grass"}, 10},
	fear_height = 2,
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 8, true, true) then

			-- if fed 7x wheat or grass then cow can be milked again
			if self.food and self.food > 6 then
				self.gotten = false
			end

			return
		end

		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 60, false, nil) then return end

		local tool = clicker:get_wielded_item()
		local name = clicker:get_player_name()

		-- milk cow with empty bucket
		if tool:get_name() == "bucket:bucket_empty" then

			--if self.gotten == true
			if self.child == true then
				return
			end

			if self.gotten == true then
				minetest.chat_send_player(name,
					("Cow already milked!"))
				return
			end

			local inv = clicker:get_inventory()

			tool:take_item()
			clicker:set_wielded_item(tool)

			if inv:room_for_item("main", {name = "animalworld:bucket_milk"}) then
				clicker:get_inventory():add_item("main", "animalworld:bucket_milk")
			else
				local pos = self.object:get_pos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "animalworld:bucket_milk"})
			end

			self.gotten = true -- milked

			return
		end
	end,

	on_replace = function(self, pos, oldnode, newnode)

		self.food = (self.food or 0) + 1

		-- if cow replaces 8x grass then it can be milked again
		if self.food >= 8 then
			self.food = 0
			self.gotten = false
		end
	end,
})


if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:yak",
	nodes = {"default:dirt_with_grass", "ethereal:green_dirt", "default:dirt_with_snow", "default:permafrost"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 50,
	max_height = 200,
	day_toggle = true,
})
end


mobs:register_egg("animalworld:yak", ("Yak"), "ayak.png")


mobs:alias_mob("animalworld:yak", "animalworld:yak") -- compatibility


-- bucket of milk
minetest.register_craftitem(":animalworld:bucket_milk", {
	description = ("Bucket of Milk"),
	inventory_image = "animalworld_bucket_milk.png",
	stack_max = 1,
	on_use = minetest.item_eat(8, "bucket:bucket_empty"),
	groups = {food_milk = 1, flammable = 3, drink = 1},
})

-- glass of milk
minetest.register_craftitem(":mobs:glass_milk", {
	description = ("Glass of Milk"),
	inventory_image = "mobs_glass_milk.png",
	on_use = minetest.item_eat(2, "vessels:drinking_glass"),
	groups = {food_milk_glass = 1, flammable = 3, vessel = 1, drink = 1},
})

minetest.register_craft({
	type = "shapeless",
	output = "mobs:glass_milk 4",
	recipe = {
		"vessels:drinking_glass", "vessels:drinking_glass",
		"vessels:drinking_glass", "vessels:drinking_glass",
		"animalworld:bucket_milk"
	},
	replacements = { {"animalworld:bucket_milk", "bucket:bucket_empty"} }
})

minetest.register_craft({
	type = "shapeless",
	output = "animalworld:bucket_milk",
	recipe = {
		"group:food_milk_glass", "group:food_milk_glass",
		"group:food_milk_glass", "group:food_milk_glass",
		"bucket:bucket_empty"
	},
	replacements = {
		{"group:food_milk_glass", "vessels:drinking_glass 4"},
	}
})


-- butter
minetest.register_craftitem(":animalworld:butter", {
	description = ("Butter"),
	inventory_image = "animalworld_butter.png",
	on_use = minetest.item_eat(1),
	groups = {food_butter = 1, flammable = 2},
})

if minetest.get_modpath("farming") and farming and farming.mod then
minetest.register_craft({
	type = "shapeless",
	output = "animalworld:butter",
	recipe = {"animalworld:bucket_milk", "farming:salt"},
	replacements = {{ "animalworld:bucket_milk", "bucket:bucket_empty"}}
})
else -- some saplings are high in sodium so makes a good replacement item
minetest.register_craft({
	type = "shapeless",
	output = "animalworld:butter",
	recipe = {"animalworld:bucket_milk", "default:sapling"},
	replacements = {{ "animalworld:bucket_milk", "bucket:bucket_empty"}}
})
end

-- cheese wedge
minetest.register_craftitem(":animalworld:cheese", {
	description = ("Cheese"),
	inventory_image = "animalworld_cheese.png",
	on_use = minetest.item_eat(4),
	groups = {food_cheese = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "animalworld:cheese",
	recipe = "animalworld:bucket_milk",
	cooktime = 5,
	replacements = {{ "animalworld:bucket_milk", "bucket:bucket_empty"}}
})

-- cheese block
minetest.register_node(":animalworld:cheeseblock", {
	description = ("Cheese Block"),
	tiles = {"animalworld_cheeseblock.png"},
	is_ground_content = false,
	groups = {crumbly = 3},
	sounds = default.node_sound_dirt_defaults()
})

minetest.register_craft({
	output = "animalworld:cheeseblock",
	recipe = {
		{"animalworld:cheese", "animalworld:cheese", "animalworld:cheese"},
		{"animalworld:cheese", "animalworld:cheese", "animalworld:cheese"},
		{"animalworld:cheese", "animalworld:cheese", "animalworld:cheese"},
	}
})

minetest.register_craft({
	output = "animalworld:cheese 9",
	recipe = {
		{"animalworld:cheeseblock"},
	}
})
