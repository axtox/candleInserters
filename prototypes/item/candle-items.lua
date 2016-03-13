local next = next
local inserterItems = { 
	["basic"] = { 
		type = "item", 
		name = "candle-basic-inserter", 
		icon = "__K&L-Inserters__/graphics/icons/candle-basic-inserter.png", 
		flags = { "goes-to-quickbar" }, 
		subgroup = "inserter", 
		order = "x", 
		place_result = "candle-basic-inserter", 
		stack_size = 50
	},
	["fast"] = { 
		type = "item", 
		name = "candle-fast-inserter", 
		icon = "__K&L-Inserters__/graphics/icons/candle-fast-inserter.png", 
		flags = { "goes-to-quickbar" }, 
		subgroup = "inserter", 
		order = "x", 
		place_result = "candle-fast-inserter", 
		stack_size = 50
	},
	["smart"] = { 
		type = "item", 
		name = "candle-smart-inserter", 
		icon = "__K&L-Inserters__/graphics/icons/candle-smart-inserter.png", 
		flags = { "goes-to-quickbar" }, 
		subgroup = "inserter", 
		order = "x", 
		place_result = "candle-smart-inserter", 
		stack_size = 50
	},
	["basic-long"] = { 
		type = "item", 
		name = "candle-basic-long-inserter", 
		icon = "__K&L-Inserters__/graphics/icons/candle-basic-long-inserter.png", 
		flags = { "goes-to-quickbar" }, 
		subgroup = "inserter", 
		order = "x", 
		place_result = "candle-basic-long-inserter", 
		stack_size = 50
	},
	["fast-long"] = { 
		type = "item", 
		name = "candle-fast-long-inserter", 
		icon = "__K&L-Inserters__/graphics/icons/candle-fast-long-inserter.png", 
		flags = { "goes-to-quickbar" }, 
		subgroup = "inserter", 
		order = "x", 
		place_result = "candle-fast-long-inserter", 
		stack_size = 50
	},
	["smart-long"] = { 
		type = "item", 
		name = "candle-smart-long-inserter", 
		icon = "__K&L-Inserters__/graphics/icons/candle-smart-long-inserter.png", 
		flags = { "goes-to-quickbar" }, 
		subgroup = "inserter", 
		order = "x", 
		place_result = "candle-smart-long-inserter", 
		stack_size = 50
	},
	["advanced"] = { 
		type = "item", 
		name = "candle-advanced-inserter", 
		icon = "__K&L-Inserters__/graphics/icons/candle-advanced-inserter.png", 
		flags = { "goes-to-quickbar" }, 
		subgroup = "inserter", 
		order = "x", 
		place_result = "candle-advanced-inserter", 
		stack_size = 50
	}
}

for _, inserterItem in next, inserterItems do
	data.raw[inserterItem.type][inserterItem.name] = inserterItem
end