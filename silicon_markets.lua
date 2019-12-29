-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

local default_items = {}
--[[
local default_items = {"default:axe_bronze","default:axe_diamond","default:axe_mese","default:axe_steel","default:axe_steel","default:axe_stone","default:axe_wood","default:pick_bronze","default:pick_diamond","default:pick_mese","default:pick_steel","default:pick_stone","default:pick_wood","default:shovel_bronze","default:shovel_diamond","default:shovel_mese","default:shovel_steel","default:shovel_stone","default:shovel_wood","default:sword_bronze","default:sword_diamond","default:sword_mese","default:sword_steel","default:sword_stone","default:sword_wood", "default:blueberries", "default:book", "default:bronze_ingot", "default:clay_brick", "default:clay_lump", "default:coal_lump", "default:copper_ingot", "default:copper_lump", "default:diamond", "default:flint", "default:gold_ingot", "default:gold_lump", "default:iron_lump", "default:mese_crystal", "default:mese_crystal_fragment", "default:obsidian_shard", "default:paper", "default:steel_ingot", "default:stick", "default:tin_ingot", "default:tin_lump", "default:acacia_tree", "default:acacia_wood", "default:apple", "default:aspen_tree", "default:aspen_wood", "default:blueberry_bush_sapling", "default:bookshelf", "default:brick", "default:bronzeblock", "default:bush_sapling", "default:cactus", "default:clay", "default:coalblock", "default:cobble", "default:copperblock", "default:desert_cobble", "default:desert_sand", "default:desert_sandstone", "default:desert_sandstone_block", "default:desert_sandstone_brick", "default:desert_stone", "default:desert_stone_block", "default:desert_stonebrick", "default:diamondblock", "default:dirt", "default:glass", "default:goldblock", "default:gravel", "default:ice", "default:junglegrass", "default:junglesapling", "default:jungletree", "default:junglewood", "default:ladder_steel", "default:ladder_wood", "default:large_cactus_seedling", "default:mese", "default:mese_post_light", "default:meselamp", "default:mossycobble", "default:obsidian", "default:obsidian_block", "default:obsidian_glass", "default:obsidianbrick", "default:papyrus", "default:pine_sapling", "default:pine_tree", "default:pine_wood", "default:sand", "default:sandstone", "default:sandstone_block", "default:sandstonebrick", "default:sapling", "default:silver_sand", "default:silver_sandstone", "default:silver_sandstone_block", "default:silver_sandstone_brick", "default:snow", "default:snowblock", "default:steelblock", "default:stone", "default:stone_block", "default:stonebrick", "default:tinblock", "default:tree", "default:wood",}
]]--

local gold_def = {
	description = S("Gold Market"),
	long_description = S("The Gold Market of Silicon Village. This Shop only accepts Gold-Coins as currency."),
	currency = {
		["coins:coin_gold"] = 1,
	},
	currency_symbol = "☼", -- "\u{263C}" Alchemical symbol for gold
	allow_item = function(item)
		if item:sub(1,13) == "default:sword" or item:sub(1,4) == "tnt:" then
			return false
		end
		return true
	end,
	inventory_limit = 100000,
	--sell_limit =, -- no sell limit for the King's Market
	initial_items = default_items,
}

commoditymarket.register_market("gold", gold_def)

minetest.register_node("commoditymarket:gold_market", {
	description = gold_def.description,
	_doc_items_longdesc = gold_def.long_description,
	_doc_items_usagehelp = usage_help,
	tiles = {"default_chest_top.png","default_chest_top.png",
		"default_chest_side.png","default_chest_side.png",
		"commoditymarket_empty_shelf.png","default_chest_side.png^commoditymarket_gold.png",},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1,},
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local timeofday =  minetest.get_timeofday()
		if timeofday > 0.2 and timeofday < 0.8 then
			commoditymarket.show_market("gold", clicker:get_player_name())
		else
			minetest.chat_send_player(clicker:get_player_name(), S("At this time of day the Gold Market is closed."))
			minetest.sound_play({name = "commoditymarket_error", gain = 0.1}, {to_player=clicker:get_player_name()})
		end
	end,
})


local silver_def = {
	description = S("Silver Market"),
	long_description = S("The Silver Market of Silicon Village. This Shop only accepts Silver-Coins as currency."),
	currency = {
		["coins:coin_silver"] = 1,
	},
	currency_symbol = "☼", -- "\u{263C}" Alchemical symbol for gold
	allow_item = function(item)
		if item:sub(1,13) == "default:sword" or item:sub(1,4) == "tnt:" then
			return false
		end
		return true
	end,
	inventory_limit = 100000,
	--sell_limit =, -- no sell limit for the King's Market
	initial_items = default_items,
}

commoditymarket.register_market("silver", silver_def)

minetest.register_node("commoditymarket:silver_market", {
	description = silver_def.description,
	_doc_items_longdesc = silver_def.long_description,
	_doc_items_usagehelp = usage_help,
	tiles = {"default_chest_top.png","default_chest_top.png",
		"default_chest_side.png","default_chest_side.png",
		"commoditymarket_empty_shelf.png","default_chest_side.png^commoditymarket_silver.png",},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1,},
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local timeofday =  minetest.get_timeofday()
		if timeofday > 0.2 and timeofday < 0.8 then
			commoditymarket.show_market("silver", clicker:get_player_name())
		else
			minetest.chat_send_player(clicker:get_player_name(), S("At this time of day the Silver Market is closed."))
			minetest.sound_play({name = "commoditymarket_error", gain = 0.1}, {to_player=clicker:get_player_name()})
		end
	end,
})

local copper_def = {
	description = S("Copper Market"),
	long_description = S("The Copper Market of Silicon Village. This Shop only accepts Copper-Coins as currency."),
	currency = {
		["coins:coin_copper"] = 1,
	},
	currency_symbol = "☼", -- "\u{263C}" Alchemical symbol for gold
	allow_item = function(item)
		if item:sub(1,13) == "default:sword" or item:sub(1,4) == "tnt:" then
			return false
		end
		return true
	end,
	inventory_limit = 100000,
	--sell_limit =, -- no sell limit for the King's Market
	initial_items = default_items,
}

commoditymarket.register_market("copper", copper_def)

minetest.register_node("commoditymarket:copper_market", {
	description = copper_def.description,
	_doc_items_longdesc = copper_def.long_description,
	_doc_items_usagehelp = usage_help,
	tiles = {"default_chest_top.png","default_chest_top.png",
		"default_chest_side.png","default_chest_side.png",
		"commoditymarket_empty_shelf.png","default_chest_side.png^commoditymarket_copper.png",},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {choppy = 2, oddly_breakable_by_hand = 1,},
	sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local timeofday =  minetest.get_timeofday()
		if timeofday > 0.2 and timeofday < 0.8 then
			commoditymarket.show_market("copper", clicker:get_player_name())
		else
			minetest.chat_send_player(clicker:get_player_name(), S("At this time of day the Copper Market is closed."))
			minetest.sound_play({name = "commoditymarket_error", gain = 0.1}, {to_player=clicker:get_player_name()})
		end
	end,
})
