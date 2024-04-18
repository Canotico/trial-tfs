local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 3) + 32
	local max = (level / 5) + (magicLevel * 9) + 40
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell(SPELL_INSTANT)

function spell.onCastSpell(creature, variant)
	print("this is a test")
	return combat:execute(creature, variant)
end

spell:name("Trial Frost Spell")
spell:words("frigo")
spell:id(221)
spell:level(1)
spell:mana(0)
spell:group("attack")
spell:isAggressive(true)
spell:cooldown(0)
spell:groupCooldown(0)
spell:needLearn(false)
spell:vocation("sorcerer", "master sorcerer")
spell:register()
