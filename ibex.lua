local S = minetest.get_translator("animalworld")
local random = math.random

mobs:register_mob("animalworld:ibex", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = false,
	attack_npcs = false,
	group_attack = true,
	reach = 3,
        damage = 9,
	hp_min = 45,
	hp_max = 60,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 0.5, 0.4},
	visual = "mesh",
	mesh = "Ibex.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureibex.png"},
	},
	sounds = {
		random = "animalworld_ibex",
		damage = "animalworld_ibex",
                distance = 13,
	},
	makes_footstep_sound = true,
	walk_velocity = 1.5,
	run_velocity = 3,
        walk_chance = 20,
	runaway = false,
	jump = true,
        jump_height = 6,
	stepheight = 3,
        stay_near = {{"naturalbiomes:alpine_grass1", "naturalbiomes:alpine_grass2", "naturalbiomes:alpine_grass3", "naturalbiomes:alpine_dandelion", "naturalbiomes:alpine_edelweiss", "naturalbiomes:med_flower2", "naturalbiomes:med_grass1", "naturalbiomes:med_grass2", "naturalbiomes:med_flower3"}, 6},
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
        pathfinding = true,
	animation = {
		speed_normal = 50,
		stand_start = 0,
		stand_end = 100,
		stand1_start = 100,
		stand1_end = 200,
		walk_start = 200,
		walk_end = 300,
		punch_start = 300,
		punch_end = 400,
		die_start = 300,
		die_end = 400,
		die_speed = 50,
		die_loop = false,
		die_rotate = true,
	},

	follow = {"default:apple", "default:dry_dirt_with_dry_grass", "farming:seed_wheat", "default:junglegrass", "farming:seed_oat", "naturalbiomes:savannagrass", "naturalbiomes:savannagrassmall", "naturalbiomes:savanna_flowergrass", "naturalbiomes:alpine_grass1", "naturalbiomes:alpine_grass2", "naturalbiomes:alpine_grass3", "naturalbiomes:alpine_dandelion", "naturalbiomes:med_flower1", "naturalbiomes:med_flower3", "naturalbiomes:med_flower2", "naturalbiomes:med_grass1", "naturalbiomes:med_grass2"},
	view_range = 10,
	replace_rate = 10,
	replace_what = {"farming:soil", "farming:soil_wet"},
	replace_with = "default:dirt",
	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 0, 25, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"default:dirt_with_rainforest_litter", "ethereal:green_dirt", "ethereal:grass_grove"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:ibex",
	nodes = {"naturalbiomes:alpine_litter", "naturalbiomes:mediterran_litter"},
	neighbors = {"naturalbiomes:med_grass1", "naturalbiomes:med_grass2", "naturalbiomes:med_grass3", "naturalbiomes:med_grass4", "naturalbiomes:med_flower1", "naturalbiomes:med_flower3", "naturalbiomes:alpine_grass1", "naturalbiomes:alpine_grass2", "naturalbiomes:alpine_grass3"},
	min_light = 0,
	interval = 60,
	chance = 2000, -- 15000
	active_object_count = 3,
	min_height = 30,
	max_height = 31000,
	day_toggle = true,

		on_spawn = function(self, pos)

			local nods = minetest.find_nodes_in_area_under_air(
				{x = pos.x - 4, y = pos.y - 3, z = pos.z - 4},
				{x = pos.x + 4, y = pos.y + 3, z = pos.z + 4},
				{"naturalbiomes:alpine_litter", "naturalbiomes:mediterran_litter"})

			if nods and #nods > 0 then

				-- min herd of 3
				local iter = math.min(#nods, 3)

-- print("--- ibex at", minetest.pos_to_string(pos), iter)

				for n = 1, iter do

					local pos2 = nods[random(#nods)]
					local kid = random(4) == 1 and true or nil

					pos2.y = pos2.y + 2

					if minetest.get_node(pos2).name == "air" then

						mobs:add_mob(pos2, {
							name = "animalworld:ibex", child = kid})
					end
				end
			end
		end
	})
end

mobs:register_egg("animalworld:ibex", S("Ibex"), "aibex.png")