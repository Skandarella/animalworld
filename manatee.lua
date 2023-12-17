local S = minetest.get_translator("animalworld")
local random = math.random

mobs:register_mob("animalworld:manatee", {
stepheight = 0.0,
	type = "animal",
	passive = true,
        attack_type = "dogfight",
	attack_animals = false,
	reach = 1,
        damage = 1,
	hp_min = 50,
	hp_max = 80,
	armor = 100,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 0.95, 0.7},
	visual = "mesh",
	mesh = "Manatee.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturemanatee.png"},
	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.5,
	run_velocity = 2,
        fly = true,
	fly_in = "default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing",
	fall_speed = 0,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "livingfloatlands:deinotherium", "livingfloatlands:carnotaurus", "livingfloatlands:lycaenops", "livingfloatlands:smilodon", "livingfloatlands:tyrannosaurus", "livingfloatlands:velociraptor", "animalworld:divingbeetle", "animalworld:scorpion", "animalworld:polarbear", "animalworld:leopardseal", "animalworld:stellerseagle", "player", "animalworld:wolf", "animalworld:panda", "animalworld:stingray", "marinaramobs:jellyfish", "marinaramobs:octopus", "livingcavesmobs:biter", "livingcavesmobs:flesheatingbacteria"},
	jump = false,
	stepheight = 0.0,
        stay_near = {{"marinara:sand_with_alage", "marinara:sand_with_seagrass", "default:sand_with_kelp", "marinara:sand_with_kelp", "marinara:reed_root", "flowers:waterlily_waving", "naturalbiomes:waterlily", "default:clay"}, 5},
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 75,
		stand_speed = 40,
		stand_start = 0,
		stand_end = 100,
		fly_start = 100, -- swim animation
		fly_end = 250,
		punch_start = 100,
		punch_end = 200,
		die_start = 100,
		die_end = 200,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing"},
	floats = 0,
	follow = {
		"default:kelp", "seaweed", "marinara:sand_with_seagrass", "marinara:sand_with_seagrass2", "xocean:kelp",
		"default:grass", "farming:cucumber", "farming:cabbage", "xocean:seagrass", "farming:lettuce", "default:junglegrass", "group:grass", "group:normal_grass"
	},
	view_range = 10,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 15, 25, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:manatee",
	nodes = {"mcl_core:water_source", "default:water_source"}, {"default:river_water_source"},
	neighbors = {"marinara:sand_with_seagrass", "default:sand_with_kelp", "marinara:sand_with_kelp"},
	min_light = 0,
	interval = 30,
	chance = 2000, -- 15000
	active_object_count = 2,
	min_height = -10,
	max_height = 10,
	day_toggle = true,

		on_spawn = function(self, pos)

			local nods = minetest.find_nodes_in_area_under_air(
				{x = pos.x - 4, y = pos.y - 3, z = pos.z - 4},
				{x = pos.x + 4, y = pos.y + 3, z = pos.z + 4},
				{"default:water_source", "default:river_water_source"})

			if nods and #nods > 0 then

				-- min herd of 2
				local iter = math.min(#nods, 2)

-- print("--- manatee at", minetest.pos_to_string(pos), iter)

				for n = 1, iter do

					local pos2 = nods[random(#nods)]
					local kid = random(4) == 1 and true or nil

					pos2.y = pos2.y + 2

					if minetest.get_node(pos2).name == "air" then

						mobs:add_mob(pos2, {
							name = "animalworld:manatee", child = kid})
					end
				end
			end
		end
	})
end

mobs:register_egg("animalworld:manatee", S("Manatee"), "amanatee.png")
