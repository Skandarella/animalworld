mobs:register_mob("animalworld:reindeer", {
	stepheight = 1,
	type = "animal",
	passive = true,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 2,
	hp_min = 25,
	hp_max = 50,
	armor = 100,
	collisionbox = {-0.6, -0.01, -0.6, 0.6, 0.95, 0.6},
	visual = "mesh",
	mesh = "Reindeer.b3d",
	textures = {
		{"texturereindeer.png"},
	},
	makes_footstep_sound = true,
	sounds = {

	},
	walk_velocity = 1,
	run_velocity = 3,
	runaway = true,
        runaway_from = {"animalworld:bear", "animalworld:crocodile", "animalworld:tiger", "animalworld:spider", "animalworld:spidermale", "animalworld:shark", "animalworld:hyena", "animalworld:kobra", "animalworld:monitor", "animalworld:snowleopard", "animalworld:volverine", "player"},
	jump = false,
	jump_height = 3,
	pushable = true,
	follow = {"default:apple", "default:permafrost_with_moss", "ethereal:snowygrass", "ethereal:crystalgrass"},
	view_range = 10,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 70,
		stand_start = 0,
		stand_end = 100,
		walk_start = 100,
		walk_end = 200,
		punch_start = 200,
		punch_end = 300,

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

local spawn_on = {"default:permafrost_with_moss", "default:dirt_with_snow"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"default:dirt_with_snow", "default:permafrost_with_moss"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"default:dirt_with_snow"}
end

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "animalworld:reindeer",
	nodes = {"default:dirt_with_snow", "default:permafrost_with_moss", "ethereal:crystal_dirt"},
	min_light = 0,
	interval = 60,
	chance = 8000, -- 15000
	active_object_count = 4,
	min_height = 20,
	max_height = 80,
	day_toggle = true,
})
end

mobs:register_egg("animalworld:reindeer", ("Reindeer"), "areindeer.png")


mobs:alias_mob("animalworld:moose", "animalworld:reindeer") -- compatibility

