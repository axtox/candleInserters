require "defines"

local next = next
local nilCandleTable = {inserterEntity = false, inserterName = "", inserterProperties = {}, inserterType = "", inserterGrid = {}, player = false}
local candleTable = nilCandleTable
local inserterTypes = { 
	["candle-basic-inserter"] = "normal",
	["basic-inserter"] = "normal",
	["candle-fast-inserter"] = "normal",
	["fast-inserter"] = "normal",
	["candle-smart-inserter"] = "normal",
	["smart-inserter"] = "normal",
	["candle-basic-long-inserter"] = "long",
	["long-handed-inserter"] = "long",
	["candle-fast-long-inserter"] = "long",
	["candle-smart-long-inserter"] = "long",
	["candle-advanced-inserter"] = "advanced"
}
local gridTables = { 
	advanced = { true, true, true, true, true, true, true, true, true, true, true, true, false, true, true, true, true, true, true, true, true, true, true, true, true },
	long = { true, true, true, true, true, true, false, false, false, true, true, false, false, false, true, true, false, false, false, true, true, true, true, true, true },
	normal = { false, false, false, false, false, false, true, true, true, false, false, true, false, true, false, false, true, true, true, false, false, false, false, false, false }
}
local vanillaTable = {
	normal = {[0] = {8,18}, [2] = {14,12}, [4] = {18,8}, [6] = {12,14}},
	long = {[0] = {3,23}, [2] = {15,11}, [4] = {23,3}, [6] = {11,15}},
	advanced = {[0] = {3,23}, [2] = {15,11}, [4] = {23,3}, [6] = {11,15}}
}
local rotationTable = {
	[0] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25, far = "far", near = "near"},
	[2] = {5,10,15,20,25,4,9,14,19,24,3,8,13,18,23,2,7,12,17,22,1,6,11,16,21, far = "far", near = "near"},
	[4] = {25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1, far = "far", near = "near"},
	[6] = {21,16,11,6,1,22,17,12,7,2,23,18,13,8,3,24,19,14,9,4,25,20,15,10,5, far = "far", near = "near"},
}

--[[ HELPER FUNCTIONS ]]--
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

local function programmingInterface()
	local player, inserterType, inserterGrid = candleTable.player, candleTable.inserterType, candleTable.inserterGrid
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
	
	if inserterGrid and next(inserterGrid) then
		pickupGridTable["inserterGrid_"..inserterGrid[1]].state = true
		insertGridTable["inserterGrid_"..inserterGrid[2]].state = true
		insertNearCheckbox.state = inserterGrid[3] == "near" and true or false
	end
end

local function getProperties(player, inserterEntity, itemName, isGhost)
	local inserterName, inserterDirection = isGhost and inserterEntity.ghost_name or inserterEntity.name, inserterEntity.direction
	local inserterGrid, inserterProperties, inserterType, itemType = {}, {}, inserterTypes[inserterName], inserterTypes[itemName]
	
	candleTable = nilCandleTable
	
	if inserterName:sub(1,6) == "candle" then
		if inserterName:find("_") then
			for state in inserterName:gmatch("_(%w+)") do if #inserterGrid < 2 then inserterGrid[#inserterGrid+1] = rotationTable[inserterDirection][tonumber(state)] else inserterGrid[#inserterGrid+1] = state end end
			inserterName = inserterName:sub(1, inserterName:find("_")-1)
			inserterType = inserterTypes[inserterName]
		end
	else
		inserterGrid = {vanillaTable[inserterType][inserterDirection][1], vanillaTable[inserterType][inserterDirection][2], "far"}
	end; if itemName and inserterGrid and next(inserterGrid) and not (gridTables[itemType][inserterGrid[1]] and gridTables[itemType][inserterGrid[2]]) then inserterGrid = {} end
	
	if inserterName:find("smart") or inserterName:find("advanced") then
		local inserterFilters, inserterConditions = {}, { circuit = inserterEntity.get_circuit_condition(defines.circuitconditionindex.inserter_circuit).condition, logistics = inserterEntity.get_circuit_condition(defines.circuitconditionindex.inserter_logistic).condition }
		
		for filterSlot = 1, 5 do 
			local filterItemName = inserterEntity.get_filter(filterSlot) 
			
			if filterItemName then inserterFilters[#inserterFilters+1] = { index = filterSlot, name = filterItemName } end 
		end
		
		inserterProperties.isSmart = {inserterFilters = inserterFilters, inserterConditions = inserterConditions}
	end
	
	if not isGhost and inserterEntity.held_stack.valid_for_read then
		inserterProperties.hasSomething = true
	end
	
	candleTable = {inserterEntity = inserterEntity, inserterName = inserterName, inserterProperties = inserterProperties, inserterType = inserterTypes[inserterName], inserterGrid = inserterGrid, player = player}
end

local function createInserter()
	local inserterTable = candleTable
	local player, inserterEntity, inserterName, inserterProperties, inserterGrid = inserterTable.player, inserterTable.inserterEntity, inserterTable.inserterName, inserterTable.inserterProperties, inserterTable.inserterGrid
		if not inserterEntity.valid then candleTable = nilCandleTable; return end
	local pickupGrid, insertGrid, insertType = inserterGrid[1], inserterGrid[2], inserterGrid[3]
	local newInserter, newInserterName, newInserterPosition = false, inserterName.."_"..pickupGrid.."_"..insertGrid.."_"..insertType, inserterEntity.position
	
	if inserterProperties.isSmart then
		local inserterFilters, inserterConditions = inserterProperties.isSmart.inserterFilters, inserterProperties.isSmart.inserterConditions
		
		newInserter = player.surface.create_entity{ name = newInserterName, position = newInserterPosition, force = player.force, filters = inserterFilters, conditions = inserterConditions }
	else
		newInserter = player.surface.create_entity{ name = newInserterName, position = newInserterPosition, force = player.force }
	end
	
	if inserterProperties.hasSomething then 
		newInserter.held_stack.set_stack(inserterEntity.held_stack)
	end
	
	newInserter.health = inserterEntity.health
	
	inserterEntity.destroy()
	candleTable = nilCandleTable
end

--[[ EVENT HANDLERS ]]--
local onBuiltEntityFilter = {candle = true}
local function onBuiltEntity(event)
	local inserterEntity = event.created_entity
	local inserterName = inserterEntity.name
		if not onBuiltEntityFilter[inserterName:sub(1,6)] then return end
	local player = game.get_player(event.player_index)
	
	inserterEntity.direction = 0
	candleTable = {inserterEntity = inserterEntity, inserterName = inserterName, inserterProperties = candleTable.inserterProperties, inserterType = inserterTypes[inserterName], inserterGrid = candleTable.inserterGrid, player = player}
	
	if candleTable.inserterGrid and next(candleTable.inserterGrid) then
		createInserter()
	else
		programmingInterface() 
	end
end

local onPutItemFilter = {candle = true}
local function onPutItem(event) 
	local player = game.get_player(event.player_index);
	local item = player.cursor_stack
		if not item.valid_for_read or not onPutItemFilter[item.name:sub(1,6)] then return end 
	local positionX, positionY, area = event.position.x, event.position.y; area = {{positionX-0.35, positionY-0.35}, {positionX+0.35, positionY+0.35}}
	local itemName, inserterEntity, entitySearch, isGhost = item.name
	if not inserterEntity then entitySearch = player.surface.find_entities_filtered({area = area, type = "entity-ghost"}); if entitySearch then for _, entity in next, entitySearch do if entity.ghost_type == "inserter" then inserterEntity = entity; isGhost = true end end end end
	if not inserterEntity then entitySearch = player.surface.find_entities_filtered({area = area, type = "inserter"}); if entitySearch then for _, entity in next, entitySearch do inserterEntity = entity end end end
	if not inserterEntity then candleTable = nilCandleTable; return end;
	
	getProperties(player, inserterEntity, itemName, isGhost)
end

local onRotatedEntityFilter = {candle = true}
local function onRotatedEntity(event) 
	local inserterEntity = event.entity
		if not onRotatedEntityFilter[inserterEntity.name:sub(1,6)] then return end
	local player = game.get_player(event.player_index)
	
	inserterEntity.direction = 0
	getProperties(player, inserterEntity)
	programmingInterface()
end

local onGUIClickFilter = {inserterGrid = true, candleAccept = true, candleCancel = true}
local function onGUIClick(event)
	local element = event.element
	local elementName = element.name
		if not onGUIClickFilter[elementName:sub(1, 12)] then return end
	local parent = element.parent
	local parentName = parent.name
	local window = parent.parent
	
	if elementName:sub(1, 12) == "inserterGrid" then
		local active = tonumber(elementName:sub(14))
		
		for gridNumber = 1, 25 do
			if gridNumber ~= active and parent["inserterGrid_"..gridNumber] then
				parent["inserterGrid_"..gridNumber].state = false
			end
		end
	elseif elementName == "candleAccept" then
		local pickupGrid, insertGrid, insertType
		
		for gridNumber = 1, 25 do
			if parent.pickupGridTable["inserterGrid_"..gridNumber] and parent.insertGridTable["inserterGrid_"..gridNumber] then
				if parent.pickupGridTable["inserterGrid_"..gridNumber].state then
					pickupGrid = gridNumber
				end
				if parent.insertGridTable["inserterGrid_"..gridNumber].state then
					insertGrid = gridNumber
				end
			end
		end; insertType = parent.candleNear.state and "near" or "far"
		
		if pickupGrid ~= nil and insertGrid ~= nil and pickupGrid ~= insertGrid then
			candleTable.inserterGrid = {pickupGrid, insertGrid, insertType}
			createInserter()
			window.destroy()
		end
	elseif elementName == "candleCancel" then
		candleTable = nilCandleTable
		window.destroy()
	end
end

--[[ EVENT REGISTRATION ]]--
script.on_event(defines.events.on_built_entity, onBuiltEntity)
script.on_event(defines.events.on_put_item, onPutItem)
script.on_event(defines.events.on_player_rotated_entity, onRotatedEntity)
script.on_event(defines.events.on_gui_click, onGUIClick)