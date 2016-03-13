
data.raw["gui-style"]["default"]["lyr_invalidGrid"] = { 
	type = "checkbox_style", 
	font = "default", 
	font_color = { r = 1, g = 1, b = 1 }, 
	width = 18, 
	height = 18, 
	default_background = { 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 77, 
		y = 17
	},
	hovered_background = { 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 77, 
		y = 17
	},
	clicked_background = { 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 77, 
		y = 17
	},
	checked = { 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 0, 
		y = 26
	}
}

data.raw["gui-style"]["default"]["lyr_baseGrid"] = { 
	type = "checkbox_style", 
	font = "default", 
	font_color = { r = 1, g = 1, b = 1 }, 
	width = 18, 
	height = 18, 
	default_background = { 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 60, 
		y = 17
	},
	hovered_background = { 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 60, 
		y = 17
	},
	clicked_background = { 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 60, 
		y = 17
	},
	checked = { 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 0, 
		y = 26
	}
}

data.raw["gui-style"]["default"]["lyr_validGrid"] = { 
	type = "checkbox_style", 
	font = "default", 
	font_color = { r = 1, g = 1, b = 1 }, 
	width = 18, 
	height = 18, 
	default_background = {
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 43, 
		y = 17
	},
	hovered_background = {
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 60, 
		y = 17
	},
	clicked_background = {
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 77, 
		y = 17
	},
	checked = {
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		width = 16, 
		height = 16, 
		x = 94, 
		y = 17
	}
}

data.raw["gui-style"]["default"]["lyr_button"] = { 
	type = "button_style", 
	font = "default-button", 
	default_font_color = { r = 1, g = 1, b = 1 }, 
	align = "center", 
	top_padding = 3, 
	right_padding = 3, 
	bottom_padding = 3, 
	left_padding = 3, 
	default_graphical_set = {
		type = "composition", 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		corner_size = { 3, 3 }, 
		position = { 0, 0 }
	},
	hovered_font_color = { r = 1, g = 1, b = 1 }, 
	hovered_graphical_set = {
		type = "composition", 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		corner_size = { 3, 3 }, 
		position = { 0, 8 }
	},
	clicked_font_color = { r = 1, g = 1, b = 1 }, 
	clicked_graphical_set = {
		type = "composition", 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		corner_size = { 3, 3 }, 
		position = { 0, 16 }
	},
	disabled_font_color = { r = 0.5, g = 0.5, b = 0.5 }, 
	disabled_graphical_set = {
		type = "composition", 
		filename = "__core__/graphics/gui.png", 
		priority = "extra-high-no-scale", 
		corner_size = { 3, 3 }, 
		position = { 0, 0 }
	},
	left_click_sound = {
		{
			filename = "__core__/sound/gui-click.ogg",
			volume = 1
		}
	},
	minimal_width = 85,
	pie_progress_color = { r = 1, g = 1, b = 1 }
}

data.raw["gui-style"]["default"]["lyr_table"] = { 
	type = "table_style", 
	horizontal_spacing = 15, 
	vertical_spacing = 3, 
	cell_padding = 0, 
	-- column_graphical_set = { 
		-- type = "composition", 
		-- filename = "__core__/graphics/gui.png", 
		-- priority = "extra-high-no-scale", 
		-- corner_size = { 3, 3 }, 
		-- position = { 8, 0 }
	-- }
}

data.raw["gui-style"]["default"]["lyr_gridTable"] = { 
	type = "table_style", 
	horizontal_spacing = 0, 
	vertical_spacing = 0, 
	cell_padding = 0, 
}