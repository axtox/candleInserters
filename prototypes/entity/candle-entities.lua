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
local inserterTypes = { ["basic"] = "normal", ["fast"] = "normal", ["smart"] = "normal", ["basic-long"] = "long", ["fast-long"] = "long", ["smart-long"] = "long", ["advanced"] = "advanced" }
local inserterEntities = { 
	["basic"] = { 
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
	["fast"] = { 
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
	["smart"] = { 
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
	["basic-long"] = { 
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
	["fast-long"] = { 
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
	["smart-long"] = { 
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
	["advanced"] = { 
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
	}
}

local function generateItem(inserterName, quantifiedName)
	local itemTemplate = { 
		type = "item", 
		name = quantifiedName, 
		icon = "__K&L-Inserters__/graphics/icons/"..inserterName..".png", 
		flags = { "goes-to-quickbar" }, 
		subgroup = "inserter", 
		order = "x", 
		place_result = quantifiedName, 
		stack_size = 50
	}
	
	data.raw.item[quantifiedName] = itemTemplate
end

local function generateRecipe(inserterName, quantifiedName)
	local recipeTemplate = { 
		type = "recipe", 
		name = quantifiedName, 
		enabled = false, 
		ingredients = { { inserterName, 1 } }, 
		result = quantifiedName
	}
	
	data.raw.recipe[quantifiedName] = recipeTemplate
end

local function quantifyInserter(inserterName, inserterType, inserterEntity)
	local pickupTable, insertTables, gridTable = pickupTable, insertTables, gridTables[inserterType]
	
	data.raw[inserterEntity.type][inserterEntity.name] = inserterEntity
	
	for insertType, insertTable in next, insertTables do
		for insertGrid, insertValues in next, insertTable do
			for pickupGrid, pickupValues in next, pickupTable do
				if gridTable[insertGrid] and gridTable[pickupGrid] and pickupGrid ~= insertGrid then
					inserterEntity = util.table.deepcopy(data.raw["inserter"]["candle-"..inserterName.."-inserter"])
					inserterEntity.name = "candle-"..inserterName.."-inserter_"..pickupGrid.."_"..insertGrid.."_"..insertType
					generateItem("candle-"..inserterName.."-inserter", inserterEntity.name)
					--generateRecipe("candle-"..inserterName.."-inserter", inserterEntity.name)
					
					if not data.raw[inserterEntity.type][inserterEntity.name] then
						inserterEntity.order = "x"	-- ???
						inserterEntity.pickup_position = pickupValues
						inserterEntity.insert_position = insertValues
						data.raw.inserter[inserterEntity.name] = inserterEntity
					end
				end
			end
		end
	end
end

for inserterName, inserterEntity in next, inserterEntities do
	quantifyInserter(inserterName, inserterTypes[inserterName], inserterEntity)
end

--remote.add_interface("candleInserters", {quantifyInserter = quantifyInserter})