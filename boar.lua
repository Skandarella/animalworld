mobs:register_mob("wwildlife:boar", {
	stepheight = 1,
	type = "animal",
	passive = false,
	attack_type = "dogfight",
	group_attack = true,
	owner_loyal = true,
	attack_npcs = true,
	reach = 2,
	damage = 2,
	hp_min = 5,
	hp_max = 15,
	armor = 200,
	collisionbox = {-0.5, -0.01, -0.5, 0.5, 0.95, 0.5},
	visual = "mesh",
	mesh = "Boar.b3d",
	textures = {
		{"textureboar.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "wwildlife_boar",
		attack = "wwildlife_boar",
	},
	walk_velocity = 1,
	run_velocity = 2,
	jump = true,
	jump_height = 6,
	pushable = true,
	follow = {"default:apple", "farming:potato"},
	view_range = 6,
	drops = {
		{name = "wwildlife:pork_raw", chance = 1, min = 1, max = 3},
	},
	water_damage = 0,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	animation = {
		speed_normal = 100,
		stand_start = 0,
		stand_end = 100,
		walk_start = 300,
		walk_end = 450,
		punch_start = 100,
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

local spawn_on = {"default:dirt_with_coniferous_litter"}

if minetest.get_mapgen_setting("mg_name") ~= "v6" then
	spawn_on = {"default:dirt_with_dry_grass", "default:dirt_with_coniferous_litter"}
end

if minetest.get_modpath("ethereal") then
	spawn_on = {"ethereal:mushroom_dirt", "ethereal:bamboo_dirt"}
end

if not mobs.custom_spawn_animal then
mobs:spawn({
	name = "wwildlife:boar",
	nodes = {"default:dirt_with_coniferous_litter", "default:dirt_gray"},
	min_light = 14,
	interval = 60,
	chance = 8000, -- 15000
	min_height = 1,
	max_height = 100,
	day_toggle = true,
})
end

mobs:register_egg("wwildlife:boar", ("Boar"), "aboar.png")


mobs:alias_mob("wwildlife:boar", "wwildlife:boa") -- compatibility


-- raw porkchop
minetest.register_craftitem(":wwildlife:pork_raw", {
	description = ("Raw Pork"),
	inventory_image = "wwildlife_pork_raw.png",
	on_use = minetest.item_eat(4),
	groups = {food_meat_raw = 1, food_pork_raw = 1, flammable = 2},
})

-- cooked porkchop
minetest.register_craftitem(":wwildlife:pork_cooked", {
	description = ("Cooked Pork"),
	inventory_image = "wwildlife_pork_cooked.png",
	on_use = minetest.item_eat(8),
	groups = {food_meat = 1, food_pork = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "wwildlife:pork_cooked",
	recipe = "wwildlife:pork_raw",
	cooktime = 5,
})
