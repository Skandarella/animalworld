mobs:register_mob("wildlife:tortoise", {
stepheight = 1,
	type = "monster",
	passive = false,
	reach = 1,
	attack_npcs = true,
	reach = 2,
	damage = 0,
	hp_min = 1,
	hp_max = 35,
	armor = 200,
	collisionbox = {-0.268, -0.01, -0.268,  0.268, 0.167, 0.268},
	visual = "mesh",
	mesh = "Tortoise.b3d",
	drawtype = "front",
	textures = {
		{"texturetortoise.png"},

	},
	sounds = {},
	makes_footstep_sound = false,
	walk_velocity = 0.2,
	run_velocity = 0.3,
	runaway = true,
        runaway_from = {"wildlife:bear", "wildlife:crocodile", "wildlife:tiger", "player"},
	jump = false,
	jump_height = 6,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 50,
		stand_start = 1,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 400,
	},
	follow = {"farming:carrot", "farming_plus:carrot_item", "default:marram_grass_2"},
	view_range = 4,
	replace_rate = 10,
	replace_what = {"farming:carrot_7", "farming:carrot_8", "farming_plus:carrot"},
	replace_with = "air",
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})


local spawn_on = "default:sand"

if minetest.get_modpath("ethereal") then
	spawn_on = "ethereal:prairie_dirt"
end

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "wildlife:tortoise",
	nodes = {"default:sand"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 5,
	max_height = 100,
	day_toggle = true,
})
end


mobs:register_egg("wildlife:tortoise", ("Tortoise"), "atortoise.png", 0)


mobs:alias_mob("wildlife:tortoise", "wildlife:tortoise") -- compatibility


