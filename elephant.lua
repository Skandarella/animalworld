mobs:register_mob("wwildlife:elephant", {
stepheight = 2,
	type = "monster",
	passive = false,
        attack_type = "dogfight",
	attack_animals = true,
	reach = 3,
        damage = 8,
	hp_min = 5,
	hp_max = 45,
	armor = 200,
	collisionbox = {-2, -0.01, -2, 2, 2, 2},
	visual = "mesh",
	mesh = "Elephant.b3d",
	visual_size = {x = 1.0, y = 1.0},
	textures = {
		{"textureelephant.png"},
	},
	sounds = {
		random = "wwildlife_elephant",
		attack = "wwildlife_elephant",
	},
	makes_footstep_sound = true,
	walk_velocity = 2,
	run_velocity = 4,
	runaway = false,
	jump = false,
        jump_height = 6,
	stepheight = 2,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	animation = {
		speed_normal = 80,
		stand_start = 0,
		stand_end = 100,
		walk_start = 300,
		walk_end = 450,
		punch_start = 100,
		punch_end = 300,
		-- 50-70 is slide/water idle
	},

	follow = {
		"ethereal:banana_single", "farming:corn_cob", "farming:cabbage",
		"default:apple"
	},
	view_range = 6,

	on_rightclick = function(self, clicker)

		-- feed or tame
		if mobs:feed_tame(self, clicker, 4, false, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 5, 50, 80, false, nil) then return end
	end,
})

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "wwildlife:elephant",
	nodes = {"default:dry_dirt_with_dry_grass"}, {"default:dirt_with_rainforest_litter"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 0,
	max_height = 65,
	day_toggle = true,
})
end

mobs:register_egg("wwildlife:elephant", ("Elephant"), "aelephant.png")
