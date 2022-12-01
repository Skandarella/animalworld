mobs:register_mob("animalworld:wildboar", {
	stepheight = 2,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = true,
	reach = 2,
	damage = 6,
	hp_min = 35,
	hp_max = 85,
	armor = 100,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Wildboar.b3d",
	textures = {
		{"texturewildboar.png"},
		{"texturewildboar2.png"},
		{"texturewildboar3.png"},
	},
	child_texture = {
		{"texturewildboarbaby.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "animalworld_boar",
		attack = "animalworld_boar",
	},
	walk_velocity = 1,
	run_velocity = 2.5,
	jump = true,
	jump_height = 4,
	pushable = true,
	follow = {"default:apple", "farming:potato", "ethereal:banana_bread", "farming:melon_slice", "farming:carrot", "farming:seed_rice", "farming:corn"},
	view_range = 10,
	replace_rate = 10,
	replace_what = {"farming:soil", "farming:soil_wet"},
	replace_with = "default:dirt",
	drops = {
		{name = "animalworld:pork_raw", chance = 1, min = 1, max = 3},
	        {name = "mobs:leather", chance = 1, min = 0, max = 2},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	animation = {
		speed_normal = 80,
		stand_speed = 50,
		stand_start = 0,
		stand_end = 100,
		stand1_start = 100,
		stand1_end = 200,
		walk_start = 200,
		walk_end = 300,
	        jump_start = 300,
		jump_end = 400,
		punch_start = 400,
		punch_end = 500,

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

local spawn_on = {"default:dirt_with_coniferous_litter"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"default:dirt_with_dry_grass", "default:dirt_with_coniferous_litter"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:mushroom_dirt", "ethereal:bamboo_dirt", "ethereal:green_dirt", "ethereal:mushroom_dirt", "default:dirt_with_coniferous_litter", "default:dirt_gray"}
end

if not mobs.custom_spawn_animalworld then
mobs:spawn({
	name = "animalworld:wildboar",
	nodes = {"default:dirt_with_coniferous_litter", "default:dirt_gray", "naturalbiomes:mediterran_litter"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 3,
	min_height = 1,
	max_height = 80,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:wildboar", ("Wild Boar"), "awildboar.png")


mobs:alias_mob("animalworld:wildboar", "animalworld:wildboar") -- compatibility


