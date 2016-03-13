local next = next
local inserterTechnologies = { 
	normal = {
		type = "technology",
		name = "candle-normal",
		icon = "__K&L-Inserters__/graphics/technology/candle-inserters.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "candle-basic-inserter" },
			{ type = "unlock-recipe", recipe = "candle-fast-inserter" },
			{ type = "unlock-recipe", recipe = "candle-smart-inserter" }
		}, 
		unit = { 
			count = 20,
			ingredients = { {"science-pack-1", 1}, {"science-pack-2", 1} },
			time = 5
		},
		order = "x-a",
		prerequisites = {"automation", "electronics", "logistics"}
	},
	long = {
		type = "technology",
		name = "candle-long",
		icon = "__K&L-Inserters__/graphics/technology/candle-long-inserters.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "candle-basic-long-inserter" },
			{ type = "unlock-recipe", recipe = "candle-fast-long-inserter" },
			{ type = "unlock-recipe", recipe = "candle-smart-long-inserter" }
		}, 
		unit = { 
			count = 30,
			ingredients = { {"science-pack-1", 1}, {"science-pack-2", 1} },
			time = 5
		},
		order = "x-b",
		prerequisites = {"automation", "electronics", "logistics"}
	},
	advanced = {
		type = "technology",
		name = "candle-advanced",
		icon = "__K&L-Inserters__/graphics/technology/candle-advanced-inserters.png",
		icon_size = 128,
		effects = {
			{ type = "unlock-recipe", recipe = "candle-advanced-inserter" }
		}, 
		unit = { 
			count = 10,
			ingredients = { {"science-pack-1", 1}, {"science-pack-2", 1}, {"science-pack-3", 1} },
			time = 5
		},
		order = "x-c",
		prerequisites = {"candle-normal", "candle-long"}
	}
}

for _, inserterTechnology in next, inserterTechnologies do
	data.raw[inserterTechnology.type][inserterTechnology.name] = inserterTechnology
end