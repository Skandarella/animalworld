mobs:register_mob("animalworld:divingbeetle", {
	stepheight = 1,
	type = "monster",
	passive = false,
	attack_type = "dogfight",
	attack_npcs = true,
	reach = 2,
	damage = 1,
	hp_min = 5,
	hp_max = 25,
	armor = 100,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 0.3, 0.3},
	visual = "mesh",
	mesh = "Divingbeetle.b3d",
	textures = {
		{"texturedivingbeetle.png"},
	},
	makes_footstep_sound = false,
	sounds = {
	},
	walk_velocity = 1,
	run_velocity = 2,
	runaway = false,
	jump = false,
	jump_height = 3,
	pushable = true,
	view_range = 6,
	drops = {
		{name = "animalworld:fishfood", chance = 1, min = 0, max = 2},
	},
	fly_in = {"default:water_source", "default:river_water_source", "default:water_flowing", "default:river_water_flowing"},
	floats = 0,
	follow = {
	},
	water_damage = 0,
	lava_damage = 5,
        air_damage = 1,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
                stand_speed = 50,
		stand_start = 100,
		stand_end = 300,
		walk_start = 0,
		walk_end = 100,

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
	name = "animalworld:divingbeetle",
	nodes = {"default:water_source", "default:river_water_source"},
	neighbors = {"default:papyrus"},
	min_light = 0,
	interval = 30,
	active_object_count = 2,
	chance = 1, -- 15000
	min_height = -10,
	max_height = 30,
})
end

mobs:register_egg("animalworld:divingbeetle", ("Diving Beetle"), "adivingbeetle.png")


mobs:alias_mob("animalworld:divingbeetle", "animalworld:divingbeetle") -- compatibility

