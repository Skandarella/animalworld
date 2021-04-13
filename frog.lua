mobs:register_mob("animalworld:frog", {
stepheight = 3,
	type = "animal",
	passive = true,
	reach = 1,
	attack_npcs = false,
	damage = 1,
	hp_min = 5,
	hp_max = 25,
	armor = 100,
	collisionbox = {-0.268, -0.01, -0.268,  0.268, 0.25, 0.268},
	visual = "mesh",
	mesh = "Frog.b3d",
	drawtype = "front",
	textures = {
		{"texturefrog.png"},

	},
sounds = {
		random = "animalworld_frog",},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 3,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player"},
	jump = true,
	jump_height = 6,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 100,
		stand_start = 1,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		fly_start = 250, -- swim animation
		fly_end = 350,
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {"fishing:bait:worm", "ethereal:worm", "animalworld:ant", "animalworld:termite"},
	view_range = 6,
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})


local spawn_on = "default:sand"

if minetest.get_modpath("ethereal") then
	spawn_on = "ethereal:prairie_dirt", "default:dirt_with_grass", "ethereal:green_dirt"
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:frog",
	nodes = {"default:dirt_with_grass"}, {"default:dirt_with_rainforest_litter"}, 
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 2,
	min_height = -10,
	max_height = 2,
})
end


mobs:register_egg("animalworld:frog", ("Frog"), "afrog.png", 0)


mobs:alias_mob("animalworld:frog", "animalworld:frog") -- compatibility


