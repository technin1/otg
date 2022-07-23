local internalNpcName = "Knuph"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 146,
	lookHead = 114,
	lookBody = 86,
	lookLegs = 0,
	lookFeet = 86,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{text = 'Vendo Exercise weapons, só me diga quantos precisa!'}
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcHandler:setMessage(MESSAGE_GREET, "Welcome to the finest weaponshop in the land, |PLAYERNAME|! Tell me if you're looking for a good {trade}.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye. Come back soon.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye. Come back soon.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares.")
npcHandler:addModule(FocusModule:new())

npcConfig.shop = {

	{ itemName = "durable exercise axe", clientId = 35280, buy = 245000, count = 1800 },
	{ itemName = "durable exercise bow", clientId = 35282, buy = 245000, count = 1800 },
	{ itemName = "durable exercise club", clientId = 35281, buy = 245000, count = 1800 },
	{ itemName = "durable exercise sword", clientId = 35279, buy = 245000, count = 1800 },
	{ itemName = "durable exercise wand", clientId = 35284, buy = 245000, count = 1800 },
	{ itemName = "durable exercise rod", clientId = 35283, buy = 245000, count = 1800 },
	{ itemName = "exercise axe", clientId = 28553, buy = 62500, count = 500 },
	{ itemName = "exercise bow", clientId = 28555, buy = 62500, count = 500 },
	{ itemName = "exercise club", clientId = 28554, buy = 62500, count = 500 },
	{ itemName = "exercise sword", clientId = 28552, buy = 62500, count = 500 },
	{ itemName = "exercise wand", clientId = 28557, buy = 62500, count = 500 },
	{ itemName = "exercise rod", clientId = 28556, buy = 62500, count = 500 },
	{ itemName = "lasting exercise axe", clientId = 35286, buy = 660000, count = 14400 },
	{ itemName = "lasting exercise bow", clientId = 35288, buy = 660000, count = 14400 },
	{ itemName = "lasting exercise club", clientId = 35287, buy = 660000, count = 14400 },
	{ itemName = "lasting exercise sword", clientId = 35285, buy = 660000, count = 14400 },
	{ itemName = "lasting exercise wand", clientId = 35290, buy = 660000, count = 14400 },
	{ itemName = "lasting exercise rod", clientId = 35289, buy = 660000, count = 14400 },

}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, inBackpacks, name, totalCost)
	npc:sellItem(player, itemId, amount, subType, true, inBackpacks, 2854)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Bought %ix %s for %i %s.", amount, name, totalCost, ItemType(npc:getCurrency()):getPluralName():lower()))
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, clientId, subtype, amount, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)
