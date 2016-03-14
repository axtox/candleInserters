local next = next
local pickupTable = { {-2, -2}, {-1, -2}, {0, -2}, {1, -2}, {2, -2}, {-2, -1}, {-1, -1}, {0, -1}, {1, -1}, {2, -1}, {-2, 0}, {-1, 0}, {0, 0}, {1, 0}, {2, 0}, {-2, 1}, {-1, 1}, {0, 1}, {1, 1}, {2, 1}, {-2, 2}, {-1, 2}, {0, 2}, {1, 2}, {2, 2} }
local insertTables = { 
	near = { {-1.8, -1.8}, {-0.8, -1.8}, {0, -1.8}, {0.8, -1.8}, {1.8, -1.8}, {-1.8, -0.8}, {-0.8, -0.8}, {0, -0.8}, {0.8, -0.8}, {1.8, -0.8}, {-1.8, 0}, {-0.8, 0}, {0, 0}, {0.8, 0}, {1.8, 0}, {-1.8, 0.8}, {-0.8, 0.8}, {0, 0.8}, {0.8, 0.8}, {1.8, 0.8}, {-1.8, 1.8}, {-0.8, 1.8}, {0, 1.8}, {0.8, 1.8}, {1.8, 1.8} },
	far = { {-2.2, -2.2}, {-1.2, -2.2}, {0, -2.2}, {1.2, -2.2}, {2.2, -2.2}, {-2.2, -1.2}, {-1.2, -1.2}, {0, -1.2}, {1.2, -1.2}, {2.2, -1.2}, {-2.2, 0}, {-1.2, 0}, {0, 0}, {1.2, 0}, {2.2, 0}, {-2.2, 1.2}, {-1.2, 1.2}, {0, 1.2}, {1.2, 1.2}, {2.2, 1.2}, {-2.2, 2.2}, {-1.2, 2.2}, {0, 2.2}, {1.2, 2.2}, {2.2, 2.2} }
}
local gridTables = { 
	advanced = { true, true, true, true, true, true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, true, true, true, true },
	long = { true, true, true, true, true, true, false, false, false, true, true, false, false, false, true, true, false, false, false, true, true, true, true, true, true },
	normal = { false, false, false, false, false, false, true, true, true, false, false, true, false, true, false, false, true, true, true, false, false, false, false, false, false }
}
local inserterTables = { 
	["candle-basic-inserter"] = {
		entity = { 
			type = "inserter", 
			name = "candle-basic-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-basic-inserter.png", 
			flags = { "placeable-neutral", "placeable-player", "player-creation" }, 
			minable = { hardness = 0.2, mining_time = 0.5, result = "candle-basic-inserter" }, 
			max_health = 40, 
			corpse = "small-remnants", 
			resistances = { { type = "fire", percent = 90 } }, 
			vehicle_impact_sound ={ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }, 
			working_sound = { match_progress_to_activity = true, 
				sound = { 
					{ filename = "__base__/sound/inserter-basic-1.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-basic-2.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-basic-3.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-basic-4.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-basic-5.ogg", volume = 0.75 }
				}
			}, 
			collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } }, 
			selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } }, 
			pickup_position = {0, 0}, 
			insert_position = {0, 0}, 
			energy_per_movement = 5000, 
			energy_per_rotation = 5000, 
			energy_source = { type = "electric", usage_priority = "secondary-input", drain = "0.4kW" }, 
			extension_speed = 0.03, 
			rotation_speed = 0.014, 
			fast_replaceable_group = "inserter", 
			hand_base_picture = { filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-base.png", priority = "extra-high", width = 8, height = 33 }, 
			hand_closed_picture = { filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-closed.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_picture = { filename = "__base__/graphics/entity/basic-inserter/basic-inserter-hand-open.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_base_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			platform_picture = { sheet = { filename = "__base__/graphics/entity/basic-inserter/basic-inserter-platform.png", priority = "extra-high", width = 46, height = 46 } }
		},
		item = { 
			type = "item", 
			name = "candle-basic-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-basic-inserter.png", 
			flags = { "goes-to-quickbar" }, 
			subgroup = "inserter", 
			order = "x-c-a", 
			place_result = "candle-basic-inserter", 
			stack_size = 50
		},
		recipe = { 
			type = "recipe", 
			name = "candle-basic-inserter", 
			enabled = true, 
			ingredients = { { "basic-inserter", 1 } }, 
			result = "candle-basic-inserter"
		},
		type = "normal"
	},
	["candle-fast-inserter"] = {
		entity = { 
			type = "inserter", 
			name = "candle-fast-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-fast-inserter.png", 
			flags = { "placeable-neutral", "placeable-player", "player-creation" }, 
			minable = { hardness = 0.2, mining_time = 0.5, result = "candle-fast-inserter" }, 
			max_health = 40, 
			corpse = "small-remnants", 
			resistances = { { type = "fire", percent = 90 } }, 
			vehicle_impact_sound ={ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }, 
			working_sound = { match_progress_to_activity = true, 
				sound = { 
					{ filename = "__base__/sound/inserter-fast-1.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-2.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-3.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-4.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-5.ogg", volume = 0.75 }
				}
			},
			collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } }, 
			selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } }, 
			pickup_position = {0, 0}, 
			insert_position = {0, 0}, 
			energy_per_movement = 5000, 
			energy_per_rotation = 5000, 
			energy_source = { type = "electric", usage_priority = "secondary-input", drain = "0.4kW" }, 
			extension_speed = 0.07, 
			rotation_speed = 0.04, 
			fast_replaceable_group = "inserter", 
			hand_base_picture = { filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-base.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_picture = { filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-closed.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_picture = { filename = "__base__/graphics/entity/fast-inserter/fast-inserter-hand-open.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_base_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			platform_picture = { sheet = { filename = "__base__/graphics/entity/fast-inserter/fast-inserter-platform.png", priority = "extra-high", width = 46, height = 46 } }, 
		},
		item = { 
			type = "item", 
			name = "candle-fast-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-fast-inserter.png", 
			flags = { "goes-to-quickbar" }, 
			subgroup = "inserter", 
			order = "x-c-c", 
			place_result = "candle-fast-inserter", 
			stack_size = 50
		},
		recipe = { 
			type = "recipe", 
			name = "candle-fast-inserter", 
			enabled = false, 
			ingredients = { { "fast-inserter", 1 } }, 
			result = "candle-fast-inserter"
		},
		type = "normal"
	},
	["candle-smart-inserter"] = {
		entity = { 
			type = "inserter", 
			name = "candle-smart-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-smart-inserter.png", 
			flags = { "placeable-neutral", "placeable-player", "player-creation" }, 
			minable = { hardness = 0.2, mining_time = 0.5, result = "candle-smart-inserter" }, 
			max_health = 40, 
			corpse = "small-remnants", 
			resistances = { { type = "fire", percent = 90 } }, 
			vehicle_impact_sound ={ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }, 
			working_sound = { match_progress_to_activity = true, 
				sound = { 
					{ filename = "__base__/sound/inserter-fast-1.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-2.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-3.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-4.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-5.ogg", volume = 0.75 }
				}
			},
			collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } }, 
			selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } }, 
			pickup_position = {0, 0}, 
			insert_position = {0, 0}, 
			energy_per_movement = 7000, 
			energy_per_rotation = 7000, 
			energy_source = { type = "electric", usage_priority = "secondary-input", drain = "0.4kW" }, 
			extension_speed = 0.07, 
			rotation_speed = 0.04, 
			fast_replaceable_group = "inserter", 
			hand_base_picture = { filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-base.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_picture = { filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-closed.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_picture = { filename = "__base__/graphics/entity/smart-inserter/smart-inserter-hand-open.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_base_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			platform_picture = { sheet = { filename = "__base__/graphics/entity/smart-inserter/smart-inserter-platform.png", priority = "extra-high", width = 46, height = 46 } }, 
			filter_count = 5, 
			programmable = true, 
			circuit_wire_connection_point = {shadow = {red = {0, 0}, green = {0, 0}}, wire = {red = {0, 0}, green = {0, 0}}}, 
			circuit_wire_max_distance = 7.5
		},
		item = { 
			type = "item", 
			name = "candle-smart-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-smart-inserter.png", 
			flags = { "goes-to-quickbar" }, 
			subgroup = "inserter", 
			order = "x-c-e", 
			place_result = "candle-smart-inserter", 
			stack_size = 50
		},
		recipe = { 
			type = "recipe", 
			name = "candle-smart-inserter", 
			enabled = false, 
			ingredients = { { "smart-inserter", 1 } }, 
			result = "candle-smart-inserter"
		},
		type = "normal"
	},
	["candle-basic-long-inserter"] = {
		entity = { 
			type = "inserter", 
			name = "candle-basic-long-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-basic-long-inserter.png", 
			flags = { "placeable-neutral", "placeable-player", "player-creation" }, 
			minable = { hardness = 0.2, mining_time = 0.5, result = "candle-basic-long-inserter" }, 
			max_health = 40, 
			corpse = "small-remnants", 
			resistances = { { type = "fire", percent = 90 } }, 
			vehicle_impact_sound ={ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }, 
			working_sound = { match_progress_to_activity = true, 
				sound = { 
					{ filename = "__base__/sound/inserter-long-handed-1.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-long-handed-2.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-long-handed-3.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-long-handed-4.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-long-handed-5.ogg", volume = 0.75 }
				}
			},
			collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } }, 
			selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } }, 
			pickup_position = {0, 0}, 
			insert_position = {0, 0}, 
			energy_per_movement = 5000, 
			energy_per_rotation = 5000, 
			energy_source = { type = "electric", usage_priority = "secondary-input", drain = "0.4kW" }, 
			extension_speed = 0.0457, 
			rotation_speed = 0.02, 
			fast_replaceable_group = "long-handed-inserter", 
			hand_base_picture = { filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-base.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_picture = { filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-closed.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_picture = { filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-hand-open.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_base_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			platform_picture = { sheet = { filename = "__base__/graphics/entity/long-handed-inserter/long-handed-inserter-platform.png", priority = "extra-high", width = 46, height = 46 } }, 
			hand_size = 1.5
		},
		item = { 
			type = "item", 
			name = "candle-basic-long-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-basic-long-inserter.png", 
			flags = { "goes-to-quickbar" }, 
			subgroup = "inserter", 
			order = "x-c-b", 
			place_result = "candle-basic-long-inserter", 
			stack_size = 50
		},
		recipe = { 
			type = "recipe", 
			name = "candle-basic-long-inserter", 
			enabled = false, 
			ingredients = { { "long-handed-inserter", 1 } }, 
			result = "candle-basic-long-inserter"
		},
		type = "long"
	},
	["candle-fast-long-inserter"] = {
		entity = { 
			type = "inserter", 
			name = "candle-fast-long-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-fast-long-inserter.png", 
			flags = { "placeable-neutral", "placeable-player", "player-creation" }, 
			minable = { hardness = 0.2, mining_time = 0.5, result = "candle-fast-long-inserter" }, 
			max_health = 40, 
			corpse = "small-remnants", 
			resistances = { { type = "fire", percent = 90 } }, 
			vehicle_impact_sound ={ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }, 
			working_sound = { match_progress_to_activity = true, 
				sound = { 
					{ filename = "__base__/sound/inserter-fast-1.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-2.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-3.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-4.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-5.ogg", volume = 0.75 }
				}
			},
			collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } }, 
			selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } }, 
			pickup_position = {0, 0}, 
			insert_position = {0, 0}, 
			energy_per_movement = 6000, 
			energy_per_rotation = 6000, 
			energy_source = { type = "electric", usage_priority = "secondary-input", drain = "0.4kW" }, 
			extension_speed = 0.07, 
			rotation_speed = 0.04, 
			fast_replaceable_group = "long-handed-inserter", 
			hand_base_picture = { filename = "__K&L-Inserters__/graphics/entity/fast-long-inserter/fast-long-inserter-hand-base.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_picture = { filename = "__K&L-Inserters__/graphics/entity/fast-long-inserter/fast-long-inserter-hand-closed.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_picture = { filename = "__K&L-Inserters__/graphics/entity/fast-long-inserter/fast-long-inserter-hand-open.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_base_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			platform_picture = { sheet = { filename = "__K&L-Inserters__/graphics/entity/fast-long-inserter/fast-long-inserter-platform.png", priority = "extra-high", width = 46, height = 46 } }, 
			hand_size = 1.5
		},
		item = { 
			type = "item", 
			name = "candle-fast-long-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-fast-long-inserter.png", 
			flags = { "goes-to-quickbar" }, 
			subgroup = "inserter", 
			order = "x-c-d", 
			place_result = "candle-fast-long-inserter", 
			stack_size = 50
		},
		recipe = { 
			type = "recipe", 
			name = "candle-fast-long-inserter", 
			enabled = false, 
			ingredients = { { "fast-inserter", 1 }, { "long-handed-inserter", 1 } }, 
			result = "candle-fast-long-inserter"
		},
		type = "long"
	},
	["candle-smart-long-inserter"] = {
		entity = { 
			type = "inserter", 
			name = "candle-smart-long-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-smart-long-inserter.png", 
			flags = { "placeable-neutral", "placeable-player", "player-creation" }, 
			minable = { hardness = 0.2, mining_time = 0.5, result = "candle-smart-long-inserter" }, 
			max_health = 40, 
			corpse = "small-remnants", 
			resistances = { { type = "fire", percent = 90 } }, 
			vehicle_impact_sound ={ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }, 
			working_sound = { match_progress_to_activity = true, 
				sound = { 
					{ filename = "__base__/sound/inserter-fast-1.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-2.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-3.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-4.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-5.ogg", volume = 0.75 }
				}
			},
			collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } }, 
			selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } }, 
			pickup_position = {0, 0}, 
			insert_position = {0, 0}, 
			energy_per_movement = 8000, 
			energy_per_rotation = 8000, 
			energy_source = { type = "electric", usage_priority = "secondary-input", drain = "0.4kW" }, 
			extension_speed = 0.07, 
			rotation_speed = 0.04, 
			fast_replaceable_group = "long-handed-inserter", 
			hand_base_picture = { filename = "__K&L-Inserters__/graphics/entity/smart-long-inserter/smart-long-inserter-hand-base.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_picture = { filename = "__K&L-Inserters__/graphics/entity/smart-long-inserter/smart-long-inserter-hand-closed.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_picture = { filename = "__K&L-Inserters__/graphics/entity/smart-long-inserter/smart-long-inserter-hand-open.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_base_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			platform_picture = { sheet = { filename = "__K&L-Inserters__/graphics/entity/smart-long-inserter/smart-long-inserter-platform.png", priority = "extra-high", width = 46, height = 46 } }, 
			hand_size = 1.5, 
			filter_count = 5, 
			programmable = true, 
			circuit_wire_connection_point = {shadow = {red = {0, 0}, green = {0, 0}}, wire = {red = {0, 0}, green = {0, 0}}}, 
			circuit_wire_max_distance = 7.5
		},
		item = { 
			type = "item", 
			name = "candle-smart-long-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-smart-long-inserter.png", 
			flags = { "goes-to-quickbar" }, 
			subgroup = "inserter", 
			order = "x-c-f", 
			place_result = "candle-smart-long-inserter", 
			stack_size = 50
		},
		recipe = { 
			type = "recipe", 
			name = "candle-smart-long-inserter", 
			enabled = false, 
			ingredients = { { "smart-inserter", 1 }, { "long-handed-inserter", 1 } }, 
			result = "candle-smart-long-inserter"
		},
		type = "long"
	},
	["candle-advanced-inserter"] = {
		entity = { 
			type = "inserter", 
			name = "candle-advanced-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-advanced-inserter.png", 
			flags = { "placeable-neutral", "placeable-player", "player-creation" }, 
			minable = { hardness = 0.2, mining_time = 0.5, result = "candle-advanced-inserter" }, 
			max_health = 40, 
			corpse = "small-remnants", 
			resistances = { { type = "fire", percent = 90 } }, 
			vehicle_impact_sound ={ filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }, 
			working_sound = { match_progress_to_activity = true, 
				sound = { 
					{ filename = "__base__/sound/inserter-fast-1.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-2.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-3.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-4.ogg", volume = 0.75 }, 
					{ filename = "__base__/sound/inserter-fast-5.ogg", volume = 0.75 }
				}
			},
			collision_box = { { -0.15, -0.15 }, { 0.15, 0.15 } }, 
			selection_box = { { -0.4, -0.35 }, { 0.4, 0.45 } }, 
			pickup_position = {0, 0}, 
			insert_position = {0, 0}, 
			energy_per_movement = 9000, 
			energy_per_rotation = 9000, 
			energy_source = { type = "electric", usage_priority = "secondary-input", drain = "0.4kW" }, 
			extension_speed = 0.07, 
			rotation_speed = 0.04, 
			fast_replaceable_group = "long-handed-inserter", 
			hand_base_picture = { filename = "__K&L-Inserters__/graphics/entity/advanced-inserter/advanced-inserter-hand-base.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_picture = { filename = "__K&L-Inserters__/graphics/entity/advanced-inserter/advanced-inserter-hand-closed.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_picture = { filename = "__K&L-Inserters__/graphics/entity/advanced-inserter/advanced-inserter-hand-open.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_base_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-base-shadow.png", priority = "extra-high", width = 8, height = 34 }, 
			hand_closed_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-closed-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			hand_open_shadow = { filename = "__base__/graphics/entity/burner-inserter/burner-inserter-hand-open-shadow.png", priority = "extra-high", width = 18, height = 41 }, 
			platform_picture = { sheet = { filename = "__K&L-Inserters__/graphics/entity/advanced-inserter/advanced-inserter-platform.png", priority = "extra-high", width = 46, height = 46 } }, 
			hand_size = 1.5, 
			filter_count = 5, 
			programmable = true, 
			circuit_wire_connection_point = {shadow = {red = {0, 0}, green = {0, 0}}, wire = {red = {0, 0}, green = {0, 0}}}, 
			circuit_wire_max_distance = 7.5
		},
		item = { 
			type = "item", 
			name = "candle-advanced-inserter", 
			icon = "__K&L-Inserters__/graphics/icons/candle-advanced-inserter.png", 
			flags = { "goes-to-quickbar" }, 
			subgroup = "inserter", 
			order = "x-c-g", 
			place_result = "candle-advanced-inserter", 
			stack_size = 50
		},
		recipe = { 
			type = "recipe", 
			name = "candle-advanced-inserter", 
			enabled = false, 
			ingredients = { { "candle-smart-inserter", 1 }, { "candle-smart-long-inserter", 1 } }, 
			result = "candle-advanced-inserter"
		},
		type = "advanced"
	}
}

local function registerPrototypes(inserterPrototypes, prototypeName)
	local pickupTable, insertTables, gridTable = pickupTable, insertTables, gridTables[inserterPrototypes.type]
	local prototypeEntity, prototypeItem, prototypeRecipe = inserterPrototypes.entity, inserterPrototypes.item, inserterPrototypes.recipe
	
	data.raw.item[prototypeName] = util.table.deepcopy(prototypeItem); prototypeItem.flags = { "goes-to-quickbar", "hidden" }
	data.raw.inserter[prototypeName] = util.table.deepcopy(prototypeEntity)
	data.raw.recipe[prototypeName] = util.table.deepcopy(prototypeRecipe)
	
	for insertType, insertTable in next, insertTables do
		for insertGrid, insertValues in next, insertTable do
			for pickupGrid, pickupValues in next, pickupTable do
				if gridTable[insertGrid] and gridTable[pickupGrid] and pickupGrid ~= insertGrid then
					local inserterName = prototypeName.."_"..pickupGrid.."_"..insertGrid.."_"..insertType
					
					if not data.raw.item[inserterName] then
						prototypeItem.name = inserterName
						prototypeItem.place_result = inserterName
						data.raw.item[inserterName] = util.table.deepcopy(prototypeItem)
					end
					
					if not data.raw.inserter[inserterName] then
						prototypeEntity.name = inserterName
						prototypeEntity.pickup_position = pickupValues
						prototypeEntity.insert_position = insertValues
						data.raw.inserter[inserterName] = util.table.deepcopy(prototypeEntity)
					end
				end
			end
		end
	end
end

for prototypeName, inserterPrototypes in next, inserterTables do
	registerPrototypes(inserterPrototypes, prototypeName)
end