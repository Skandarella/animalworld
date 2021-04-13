mobs:register_mob("animalworld:goldenmole", {
	type = "animal",
	stepheight = 1,
	passive = true,
	attack_type = "dogfight",
	attack_npcs = false,
	group_attack = true,
	reach = 1,
	damage = 0,
	hp_min = 35,
	hp_max = 135,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.3, 0.3},
	visual = "mesh",
	mesh = "Goldenmole.b3d",
	textures = {
		{"texturegoldenmole.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "animalworld_goldenmole",
	},
	walk_velocity = 1,
	run_velocity = 3,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle"},
	jump = false,
	jump_height = 6,
	pushable = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},

	},
	water_damage = 5,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	animation = {
		stand_start = 100,
		stand_end = 300,
		stand_speed = 100,
		walk_start = 0,
		walk_end = 100,
		walk_speed = 300,


		die_start = 1, -- we dont have a specific death animation so we will
		die_end = 2, --   re-use 2 standing frames at a speed of 1 fps and
		die_speed = 1, -- have mob rotate when dying.
		die_loop = false,
		die_rotate = true,
	},
	follow = {"fishing:bait:worm", "bees:frame_full", "ethereal:worm", "animalworld:ant", "animalworld:termite"},
	view_range = 10,

})



if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:goldenmole",
	nodes = {"default:desert_sand"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 10,
	max_height = 55,

})
end


mobs:register_egg("animalworld:goldenmole", ("Golden Mole"), "agoldenmole.png")


mobs:alias_mob("animalworld:goldenmole", "animalworld:goldenmole") -- compatibility

