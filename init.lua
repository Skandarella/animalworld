
-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

local S = minetest.get_translator and minetest.get_translator("wildlife") or
		dofile(path .. "intllib.lua")

mobs.intllib = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_animal = true
	input:close()
	input = nil
end


-- Animals
dofile(path .. "seal.lua") -- 
dofile(path .. "hare.lua") -- 
dofile(path .. "moose.lua") -- 
dofile(path .. "crocodile.lua") -- 
dofile(path .. "manatee.lua") -- 
dofile(path .. "tiger.lua") -- 
dofile(path .. "camel.lua") -- 
dofile(path .. "elephant.lua") -- 
dofile(path .. "carp.lua") -- 
dofile(path .. "trout.lua") -- 
dofile(path .. "blackbird.lua") -- 
dofile(path .. "bear.lua") -- 
dofile(path .. "boar.lua") -- 
dofile(path .. "kangaroo.lua") -- 
dofile(path .. "tortoise.lua") -- 
dofile(path .. "hippo.lua") -- 


-- Load custom spawning
if mobs.custom_spawn_animal then
	dofile(path .. "spawn.lua")
end



print (S("[MOD] Mobs Redo Animals loaded"))
