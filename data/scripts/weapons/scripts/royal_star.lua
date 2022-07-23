

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_REDSTAR)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setFormula(COMBAT_FORMULA_SKILL, 0, 0, 1, 0)

local area = createCombatArea({
 	{0, 0, 1, 0, 0},
 	{0, 1, 1, 1, 0},
 	{1, 1, 3, 1, 1},
	{0, 1, 1, 1, 0},
	{0, 0, 1, 0, 0}
 })

local secondCombat = Combat()
secondCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)
secondCombat:addCondition(condition)
combat:setArea(area)

local royalStar = Weapon(WEAPON_DISTANCE)

function royalStar.onUseWeapon(player, variant)
	local boolean = combat:execute(player, variant)
	if not boolean then
		return false
	end

	local target = variant:getNumber()
	if target ~= 0 then
		boolean = secondCombat:execute(player, variant)
	end
	return boolean
end

royalStar:id(25759)
royalStar:attack(40)
royalStar:breakChance(9)
royalStar:shootType(CONST_ANI_GREENSTAR)
royalStar:maxHitChance(100)
royalStar:register()

