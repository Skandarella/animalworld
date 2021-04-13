mobs:register_mob("animalworld:nandu", {
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
	hp_max = 50,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.3, 0.4, 0.8, 0.4},
	visual = "mesh",
	mesh = "Nandu.b3d",
	textures = {
		{"texturenandu.png"}, -- white
		{"texturenandu.png"},
		{"texturenandu.png"},
	},
	child_texture = {
		{"texturenandu.png"},
	},
	makes_footstep_sound = true,
	walk_velocity = 0.7,
	run_velocity = 3,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle"},
	drops = {
		{name = "animalworld:chicken_raw", chance = 1, min = 1, max = 1},
		{name = "animalworld:chicken_feather", chance = 1, min = 0, max = 2},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 50,
		stand_start = 1,
		stand_end = 100,
		stand1_start = 1,
		stand1_end = 100,
		walk_start = 100,
		walk_end = 200,
		run_start = 100,
		run_end = 200,
		punch_start = 200,
		punch_end = 300,
	},
	follow = {
		"farming:seed_wheat", "farming:seed_cotton", "farming:seed_barley",
		"farming:seed_oat", "farming:seed_rye"
	},
	view_range = 10,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 30, 50, 80, false, nil) then return end
	end,

	do_custom = function(self, dtime)

		self.egg_timer = (self.egg_timer or 0) + dtime
		if self.egg_timer < 10 then
			return
		end
		self.egg_timer = 0

		if self.child
		or math.random(1, 100) > 1 then
			return
		end

		local pos = self.object:get_pos()

		minetest.add_item(pos, "mobs:egg")

		minetest.sound_play("default_place_node_hard", {
			pos = pos,
			gain = 1.0,
			max_hear_distance = 5,
		})
	end,
})


local spawn_on = {"default:dirt_with_grass"}

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:bamboo_dirt", "ethereal:prairie_dirt", "default:dirt_with_grass"}
end


if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:nandu",
	nodes = {"default:dirt_with_grass"}, 
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 10,
	max_height = 40,
	day_toggle = true,
})
end


mobs:register_egg("animalworld:nandu", ("Nandu"), "anandu.png", 0)


mobs:alias_mob("animalworld:andu", "animalworld:nandu") -- compatibility


-- egg entity

mobs:register_arrow("animalworld:egg_entity", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"mobs_chicken_egg.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(minetest.get_player_by_name(self.playername) or self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(minetest.get_player_by_name(self.playername) or self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 1},
		}, nil)
	end,

	hit_node = function(self, pos, node)

		if math.random(1, 10) > 1 then
			return
		end

		pos.y = pos.y + 1

		local nod = minetest.get_node_or_nil(pos)

		if not nod
		or not minetest.registered_nodes[nod.name]
		or minetest.registered_nodes[nod.name].walkable == true then
			return
		end

		local mob = minetest.add_entity(pos, "animalworld:nandu")
		local ent2 = mob:get_luaentity()

		mob:set_properties({
			textures = ent2.child_texture[1],
			visual_size = {
				x = ent2.base_size.x / 2,
				y = ent2.base_size.y / 2
			},
			collisionbox = {
				ent2.base_colbox[1] / 2,
				ent2.base_colbox[2] / 2,
				ent2.base_colbox[3] / 2,
				ent2.base_colbox[4] / 2,
				ent2.base_colbox[5] / 2,
				ent2.base_colbox[6] / 2
			},
		})

		ent2.child = true
		ent2.tamed = true
		ent2.owner = self.playername
	end
})


-- egg throwing item

local egg_GRAVITY = 9
local egg_VELOCITY = 19

-- shoot egg
local mobs_shoot_egg = function (item, player, pointed_thing)

	local playerpos = player:get_pos()

	minetest.sound_play("default_place_node_hard", {
		pos = playerpos,
		gain = 1.0,
		max_hear_distance = 5,
	})

	local obj = minetest.add_entity({
		x = playerpos.x,
		y = playerpos.y +1.5,
		z = playerpos.z
	}, "animalworld:egg_entity")

	local ent = obj:get_luaentity()
	local dir = player:get_look_dir()

	ent.velocity = egg_VELOCITY -- needed for api internal timing
	ent.switch = 1 -- needed so that egg doesn't despawn straight away

	obj:setvelocity({
		x = dir.x * egg_VELOCITY,
		y = dir.y * egg_VELOCITY,
		z = dir.z * egg_VELOCITY
	})

	obj:setacceleration({
		x = dir.x * -3,
		y = -egg_GRAVITY,
		z = dir.z * -3
	})

	-- pass player name to egg for chick ownership
	local ent2 = obj:get_luaentity()
	ent2.playername = player:get_player_name()

	item:take_item()

	return item
end


-- egg
minetest.register_node(":animalworld:egg", {
	description = ("Bird Egg"),
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
			minetest.set_node(pos, {name = "animalworld:egg", param2 = 1})
		end
	end,
	on_use = mobs_shoot_egg
})


-- fried egg
minetest.register_craftitem(":animalworld:chicken_egg_fried", {
	description = ("Fried Egg"),
	inventory_image = "animalworld_chicken_egg_fried.png",
	on_use = minetest.item_eat(2),
	groups = {food_egg_fried = 1, flammable = 2},
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "animalworld:egg",
	output = "animalworld:chicken_egg_fried",
})

-- raw chicken
minetest.register_craftitem(":animalworld:chicken_raw", {
description = ("Raw Birdmeat"),
	inventory_image = "animalworld_chicken_raw.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, food_chicken_raw = 1, flammable = 2},
})

-- cooked chicken
minetest.register_craftitem(":animalworld:chicken_cooked", {
description = ("Cooked Birdmeat"),
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
	description = ("Feather"),
	inventory_image = "animalworld_chicken_feather.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	type = "fuel",
	recipe = "animalworld:chicken_feather",
	burntime = 1,
})
