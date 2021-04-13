mobs:register_mob("animalworld:notoptera", {
	stepheight = 2,
	type = "animal",
	passive = true,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	reach = 2,
	damage = 1,
	hp_min = 20,
	hp_max = 35,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.2, 0.3, 0.3, 0.2},
	visual = "mesh",
	mesh = "Notoptera.b3d",
	textures = {
		{"texturenotoptera.png"},
	},
	makes_footstep_sound = true,
	sounds = {
	},
	walk_velocity = 0.5,
	run_velocity = 1,
        walk_chance = 50,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player"},
	jump = true,
	jump_height = 6,
	pushable = true,
	follow = {"default:junglegrass", "default:dry_shrub", "default:blueberry_bush_leaves", "default:grass", "farming:cabbage_6", "farming:lettuce_5", "farming:beetroot_5", "flowers:dandelion_yellow"},
	view_range = 5,
	drops = {
		{name = "animalworld:notoptera", chance = 1, min = 1, max = 1},
	},
	floats = 0,
	water_damage = 2,
	lava_damage = 5,
        air_damage = 0,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 100,
		stan2d_end = 200,
		walk_start = 200,
		walk_end = 300,

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
	name = "animalworld:notoptera",
	nodes = {"default:permafrost", "default:permafrost_with_moss"},
	min_light = 0,
	interval = 30,
	chance = 100, -- 15000
	active_object_count = 4,
	min_height = 5,
	max_height = 60,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:notoptera", ("Notoptera"), "anotoptera.png")


mobs:alias_mob("animalworld:notoptera", "animalworld:notoptera") -- compatibility

minetest.register_craftitem(":animalworld:bugice", {
	description = ("Bug on Ice"),
	inventory_image = "animalworld_bugice.png",
	on_use = minetest.item_eat(2),
	groups = {food_meat_raw = 1, flammable = 2},
})


minetest.register_craft({
	output = "animalworld:bugice",
	type = "shapeless",
	recipe = 
		{"animalworld:notoptera", "default:snow"}
})



