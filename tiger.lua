mobs:register_mob("wildlife:tiger", {
stepheight = 1,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 2,
        damage = 6,
	hp_min = 5,
	hp_max = 25,
	armor = 200,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Tiger.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"texturetiger.png"},
	},
	sounds = {
		random = "wildlife_tiger",
		attack = "wildlife_tiger",
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	runaway = false,
	jump = true,
        jump_height = 6,
	stepheight = 1,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 300,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:fish_raw", "wildlife:rawfish", "mobs_fish:tropical",
		"mobs:meat_raw", "wildlife:rabbit_raw", "wildlife:pork_raw"
	},
	view_range = 15,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "wildlife:tiger",
	nodes = {"default:dry_dirt_with_dry_grass"}, {"default:dirt_with_rainforest_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 10,
	max_height = 50,

})
end

mobs:register_egg("wildlife:tiger", ("Tiger"), "atiger.png")
