local next = next
local inserterRecipes = { 
	["basic"] = { 
		type = "recipe", 
		name = "candle-basic-inserter", 
		enabled = true, 
		ingredients = { { "basic-inserter", 1 } }, 
		result = "candle-basic-inserter"
	},
	["fast"] = { 
		type = "recipe", 
		name = "candle-fast-inserter", 
		enabled = false, 
		ingredients = { { "fast-inserter", 1 } }, 
		result = "candle-fast-inserter"
	},
	["smart"] = { 
		type = "recipe", 
		name = "candle-smart-inserter", 
		enabled = false, 
		ingredients = { { "smart-inserter", 1 } }, 
		result = "candle-smart-inserter"
	},
	["basic-long"] = { 
		type = "recipe", 
		name = "candle-basic-long-inserter", 
		enabled = false, 
		ingredients = { { "long-handed-inserter", 1 } }, 
		result = "candle-basic-long-inserter"
	},
	["fast-long"] = { 
		type = "recipe", 
		name = "candle-fast-long-inserter", 
		enabled = false, 
		ingredients = { { "fast-inserter", 1 }, { "long-handed-inserter", 1 } }, 
		result = "candle-fast-long-inserter"
	},
	["smart-long"] = { 
		type = "recipe", 
		name = "candle-smart-long-inserter", 
		enabled = false, 
		ingredients = { { "smart-inserter", 1 }, { "long-handed-inserter", 1 } }, 
		result = "candle-smart-long-inserter"
	},
	["advanced"] = { 
		type = "recipe", 
		name = "candle-advanced-inserter", 
		enabled = false, 
		ingredients = { { "candle-smart-inserter", 1 }, { "candle-smart-long-inserter", 1 } }, 
		result = "candle-advanced-inserter"
	},
}

for _, inserterRecipe in next, inserterRecipes do
	data.raw[inserterRecipe.type][inserterRecipe.name] = inserterRecipe
end