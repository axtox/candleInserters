require "defines"

local showOnBuilt = true

local next = next
local inserterTypes = { 
	["candle-basic-inserter"] = { type = "normal" }, 
	["candle-fast-inserter"] = { type = "normal" }, 
	["candle-smart-inserter"] = { type = "normal" }, 
	["candle-basic-long-inserter"] = { type = "long" }, 
	["candle-fast-long-inserter"] = { type = "long" }, 
	["candle-smart-long-inserter"] = { type = "long" }, 
	["candle-advanced-inserter"] = { type = "advanced" }, 
}
local gridTables = { 
	advanced = { true, true, true, true, true, true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, true, true, true, true },
	long = { true, true, true, true, true, true, false, false, false, true, true, false, false, false, true, true, false, false, false, true, true, true, true, true, true },
	normal = { false, false, false, false, false, false, true, true, true, false, false, true, false, true, false, false, true, true, true, false, false, false, false, false, false }
}

local function createInserterGrid(parent, gridTableName, inserterType)
	local gridTable = gridTables[inserterType]
	local newInserterGrid = parent.add({ type = "table", name = gridTableName, colspan = 5, style = "lyr_gridTable" })
	
	for gridNumber, gridType in next, gridTable do
		if gridNumber == 13 then
			newInserterGrid.add({ type = "checkbox", name = "invalidGrid_"..gridNumber, state = false, style = "lyr_baseGrid" })
		elseif gridType then
			newInserterGrid.add({ type = "checkbox", name = "inserterGrid_"..gridNumber, state = false, style = "lyr_validGrid" })
		else
			newInserterGrid.add({ type = "checkbox", name = "invalidGrid_"..gridNumber, state = false, style = "lyr_invalidGrid" })
		end
	end
	
	return newInserterGrid
end

local function programmingInterface(player, inserterType, gridStates)
	if player.gui.center.mainFrame then player.gui.center.mainFrame.destroy() end
	
	local mainFrame = player.gui.center.add({ type = "frame", name = "mainFrame", direction = "vertical" })
	mainFrame.add({ type = "label", name = "caption", caption = "K&L Interface", style = "frame_caption_label_style" })
	local mainTable = mainFrame.add({ type = "table", name = "mainTable", colspan = 2, style = "lyr_table" })
		mainTable.add({ type = "label", name = "pickupGridHeader", caption = "Pickup Grid" })
		mainTable.add({ type = "label", name = "insertGridHeader", caption = "Insert Grid" })
			local pickupGridTable = createInserterGrid(mainTable, "pickupGridTable", inserterType)
			local insertGridTable = createInserterGrid(mainTable, "insertGridTable", inserterType)
		mainTable.add({ type = "label", name = "empty", caption = " " })
		local insertNearCheckbox = mainTable.add({ type = "checkbox", name = "candleNear", state = false, caption = "Insert Near", style = "checkbox_style" })
		mainTable.add({ type = "button", name = "candleAccept", caption = "Accept", style = "lyr_button" })
		mainTable.add({ type = "button", name = "candleCancel", caption = "Close", style = "lyr_button" })
	
	if gridStates and next(gridStates) then
		pickupGridTable["inserterGrid_"..gridStates[1]].state = true
		insertGridTable["inserterGrid_"..gridStates[2]].state = true
		insertNearCheckbox.state = gridStates[3] == "near" and true or false
	end
end

local function onInitialize()
	if not global.candle then global.candle = {} end
end

local function onBuiltEntity(event)	
	local inserterEntity = event.created_entity
	local inserterName = inserterEntity.name

	--if inserterTypes[event.created_entity.name] then programmingInterface(event, inserterTypes[event.created_entity.name][1]) end
	if inserterName:sub(1,6) == "candle" then
		local playerIndex = event.player_index
		local player = game.get_player(playerIndex)
		
		global.candle[playerIndex] = {inserterEntity = inserterEntity, inserterName = inserterName, inserterProperties = {}}
		programmingInterface(player, inserterTypes[inserterName].type) 
	end
end

local function onRotatedEntity(event)
	local inserterEntity = event.entity
	local inserterName = inserterEntity.name
	
	if inserterName:sub(1,6) == "candle" then
		local playerIndex = event.player_index
		local player, gridStates = game.get_player(playerIndex), {}
		
		inserterEntity.direction = 0
		global.candle[playerIndex] = {inserterEntity = false, inserterName = "", inserterProperties = {}}
		
		if inserterName:find("_") then 
			for state in inserterName:gmatch("_(%w+)") do gridStates[#gridStates+1] = state end
			inserterName = inserterName:sub(1, inserterName:find("_")-1)
		end
		
		if inserterName:find("smart") or inserterName:find("advanced") then
			global.candle[playerIndex].inserterProperties.isSmart = true
		end
		
		if inserterEntity.held_stack.valid_for_read then
			global.candle[playerIndex].inserterProperties.hasSomething = true
		end
		
		global.candle[playerIndex].inserterEntity = inserterEntity
		global.candle[playerIndex].inserterName = inserterName
		programmingInterface(player, inserterTypes[inserterName].type, gridStates)
	end
end

local function onGUIClick(event)
	local element = event.element
	local parent = element.parent
	local window = parent.parent
	local elementName, parentName = element.name, parent.name
	
	if elementName:sub(1, 12) == "inserterGrid" then
		local active = tonumber(elementName:sub(14))
		
		for gridNumber = 1, 25 do
			if gridNumber ~= active and parent["inserterGrid_"..gridNumber] then
				parent["inserterGrid_"..gridNumber].state = false
			end
		end
	elseif elementName == "candleAccept" then
		local pickupGrid, insertGrid 
		
		for gridNumber = 1, 25 do
			if parent.pickupGridTable["inserterGrid_"..gridNumber] and parent.insertGridTable["inserterGrid_"..gridNumber] then
				if parent.pickupGridTable["inserterGrid_"..gridNumber].state then
					pickupGrid = gridNumber
				end
				if parent.insertGridTable["inserterGrid_"..gridNumber].state then
					insertGrid = gridNumber
				end
			end
		end
		
		if pickupGrid ~= nil and insertGrid ~= nil and pickupGrid ~= insertGrid then
			local playerIndex = event.player_index
			local inserterTable = global.candle[playerIndex]
			local inserterEntity, inserterName, inserterProperties = inserterTable.inserterEntity, inserterTable.inserterName, inserterTable.inserterProperties
			local insertType = parent.candleNear.state and "near" or "far"
			local lyr = false
			
			if inserterProperties.isSmart then
				local inserterFilters, inserterConditions = {}, { circuit = inserterEntity.get_circuit_condition(defines.circuitconditionindex.inserter_circuit).condition, logistics = inserterEntity.get_circuit_condition(defines.circuitconditionindex.inserter_logistic).condition }
			
				for filterSlot = 1, 5 do 
					local filterItemName = inserterEntity.get_filter(filterSlot) 
					
					if filterItemName then inserterFilters[#inserterFilters+1] = { index = filterSlot, name = filterItemName } end 
				end
				
				lyr = inserterEntity.surface.create_entity{ name = inserterName.."_"..pickupGrid.."_"..insertGrid.."_"..insertType, position = inserterEntity.position, force = inserterEntity.force, filters = inserterFilters, conditions = inserterConditions }
			else
				lyr = inserterEntity.surface.create_entity{ name = inserterName.."_"..pickupGrid.."_"..insertGrid.."_"..insertType, position = inserterEntity.position, force = inserterEntity.force }
			end
			
			if inserterProperties.hasSomething then 
				lyr.held_stack.set_stack(inserterEntity.held_stack)
			end
			
			inserterEntity.destroy()
			global.candle[playerIndex] = {inserterEntity = false, inserterName = "", inserterProperties = {}}
			window.destroy()
		end
	elseif elementName == "candleCancel" then
		global.candle[event.player_index] = {inserterEntity = false, inserterName = "", inserterProperties = {}}
		window.destroy()
	end
end

script.on_init(onInitialize)
if showOnBuilt then script.on_event(defines.events.on_built_entity, onBuiltEntity) end
script.on_event(defines.events.on_player_rotated_entity, onRotatedEntity)
script.on_event(defines.events.on_gui_click, onGUIClick)