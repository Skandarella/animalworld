mobs:register_mob("animalworld:crab", {
stepheight = 1,
	type = "animal",
	passive = true,
	reach = 1,
	attack_npcs = false,
	reach = 2,
	damage = 0,
	hp_min = 10,
	hp_max = 40,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4,  0.4, 0.4, 0.4},
	visual = "mesh",
	mesh = "Crab.b3d",
	drawtype = "front",
	textures = {
		{"texturecrab.png"},

	},
	sounds = {
		random = "animalworld_crab",
		attack = "animalworld_crab",
	},
	makes_footstep_sound = false,
	walk_velocity = 0.7,
	run_velocity = 1,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player"},
	jump = false,
	jump_height = 6,
	drops = {
		{name = "animalworld:raw_athropod", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 75,
		stand_start = 1,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 400,
	},
	fly_in = {"default:water_source", "default:water_flowing"},
	floats = 0,
	follow = {"animalworld:rawfish", "default:marram_grass_2"},
	view_range = 5,
	replace_rate = 10,
	replace_what = {"default:marram_grass_2", "ethereal:fish_raw", "fishing:fish_raw", "xocean:fish_edible", "water_life:meat_raw", "mobs:clownfish_raw"},
	replace_with = "air",
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})


local spawn_on = "default:sand"

if minetest.get_modpath("ethereal") then
	spawn_on = "default:sand"
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:crab",
	nodes = {"default:sand"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = 0,
	max_height = 2,
})
end


mobs:register_egg("animalworld:crab", ("Crab"), "acrab.png", 0)


mobs:alias_mob("animalworld:crab", "animalworld:crab") -- compatibility


