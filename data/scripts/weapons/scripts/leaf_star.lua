

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_GREENSTAR)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_YELLOWENERGY)
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
secondCombat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
secondCombat:addCondition(condition)
combat:setArea(area)

local leafStar = Weapon(WEAPON_DISTANCE)

function leafStar.onUseWeapon(player, variant)
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

leafStar:id(25735)
leafStar:attack(40)
leafStar:breakChance(9)
leafStar:shootType(CONST_ANI_GREENSTAR)
leafStar:maxHitChance(76)
leafStar:register()

