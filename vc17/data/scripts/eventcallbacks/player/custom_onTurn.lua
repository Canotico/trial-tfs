local range = 5

local function doDash(player, dir)
	local direction = dir
	local position = player:getPosition()

	print(string.format("Initial X:%s | Y:%s", tostring(position.x), tostring(position.y)))
	--local path = creature:getPathTo(creature:getPosition(), direction, range, true, true, range)
	position.x = position.x + range

	local newPos = position
	print(string.format("Target X:%s | Y:%s", tostring(newPos.x), tostring(newPos.y)))
	--print(tostring(newPos))
	player:teleportTo(newPos, false)
	newPos:sendMagicEffect(CONST_ME_GROUNDSHAKER)
end


local callback = EventCallback

callback.onTurn = function(self, direction)
	doDash(self, direction)
end

callback:register()
