mobs:register_mob("animalworld:muskox", {
	stepheight = 1,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = true,
	reach = 2,
	damage = 8,
	hp_min = 25,
	hp_max = 75,
	armor = 100,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Muskox.b3d",
	textures = {
		{"texturemuskox.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "animalworld_muskox",
		attack = "animalworld_muskox2",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	jump_height = 6,
	pushable = true,
	follow = {"default:apple", "farming:potato", "ethereal:banana_bread", "farming:melon_slice", "farming:carrot", "farming:seed_rice", "farming:corn", "ethereal:snowygrass", "ethereal:crystalgrass"},
	view_range = 6,
	replace_rate = 10,
	replace_what = {"farming:soil", "farming:soil_wet"},
	replace_with = "default:dirt",
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
		{name = "animalworld:muskoxcorpse", chance = 7, min = 1, max = 1},
	},
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 50,
		stand_speed = 50,
		stand_start = 0,
		stand_end = 100,
		stand2_start = 100,
		stand2_end = 200,
		walk_start = 200,
		walk_end = 300,
                punch_speed = 100,
		punch_start = 300,
		punch_end = 400,

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
	name = "animalworld:muskox",
        nodes = {"default:permafrost", "default:permafrost_with_moss", "default:permafrost_with_stones"},
	neighbors = {"animalworld:animalworld_tundrashrub1"},
	min_light = 0,
	interval = 60,
	chance = 2, -- 15000
	active_object_count = 5,
	min_height = 10,
	max_height = 60,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:muskox", ("Musk Ox"), "amuskox.png")


mobs:alias_mob("animalworld:muskox", "animalworld:muskox") -- compatibility

