mobs:register_mob("animalworld:ibex", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	attack_animals = false,
	group_attack = true,
	reach = 3,
        damage = 9,
	hp_min = 45,
	hp_max = 60,
	armor = 100,
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.0, 0.4},
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
	stepheight = 5,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 6,
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
		-- 50-70 is slide/water idle
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
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})


if minetest.get_modpath("ethereal") then
	spawn_on = {"default:dirt_with_rainforest_litter", "ethereal:green_dirt", "ethereal:grass_grove"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:ibex",
	nodes = {"naturalbiomes:alpine_litter", "naturalbiomes:mediterran_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 30,
	max_height = 31000,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:ibex", ("Ibex"), "aibex.png")