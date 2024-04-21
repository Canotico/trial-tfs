local combat = Combat()
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local range = 3

function charge(creature, variant)
	local direction = creature:getDirection()
	local position = creature:getPosition()
	print(string.format("Initial X:%s | Y:%s", tostring(position.x), tostring(position.y)))
	--local path = creature:getPathTo(creature:getPosition(), direction, range, true, true, range)
	position.x = position.x + range
	local newPos = position
	print(string.format("Target X:%s | Y:%s", tostring(newPos.x), tostring(newPos.y)))
	--print(tostring(newPos))
	creature:teleportTo(newPos, false)
	newPos:sendMagicEffect(CONST_ME_GROUNDSHAKER)
	combat:execute(creature, variant)
end

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
	charge(creature, variant)
	return true
end

spell:name("Dash")
spell:words("dash")
spell:level(1)
spell:mana(0)
spell:group("support")
spell:isAggressive(true)
spell:cooldown(0)
spell:groupCooldown(0)
spell:needLearn(false)
spell:vocation("sorcerer", "master sorcerer")
spell:register()
