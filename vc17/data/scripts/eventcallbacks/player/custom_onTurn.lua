local range = 5

local function doDash(player, dir)
	player:setDirection(dir)

	local position = player:getPosition()
	local nextPos = Position(position)
	print(string.format("Initial X:%s | Y:%s", tostring(position.x), tostring(position.y)))

	for i = 1, range, 1 do
		nextPos:getNextPosition(dir)
		print(string.format("Next X:%s | Y:%s", tostring(nextPos.x), tostring(nextPos.y)))
		local tile = Tile(nextPos)
		if tile then
			print(string.format("Count(%s) | Solid(%s) | Path(%s)",
				tile:getCreatureCount(), tile:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID), player:getPathTo(position)))
		end
		if not tile or
			tile:hasProperty(CONST_PROP_BLOCKSOLID) or
			tile:hasProperty(CONST_PROP_IMMOVABLEBLOCKSOLID) then
			--not player:getPathTo(position) then
			break
		end
		print("2")
		position = Position(nextPos)
	end

	print(string.format("Final X:%s | Y:%s", tostring(position.x), tostring(position.y)))

	player:teleportTo(position, false)
	position:sendMagicEffect(CONST_ME_GROUNDSHAKER)
end


local callback = EventCallback

callback.onTurn = function(self, direction)
	doDash(self, direction)
end

callback:register()
