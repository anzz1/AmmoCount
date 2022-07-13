
local function updateCount(self)
	local slot = self.action
	local actionType, id, subType = GetActionInfo(slot)

	if (actionType ~= 'item' and (id == 2480 or id == 7918 or id == 7919 or id == 3018)) then
		local count = GetInventoryItemCount('player', 0)
		self.Count:SetText((count == 1 and (not GetInventoryItemTexture("player", 0)) and '0') or count)
	end
end

local function init ()
	-- hook ActionButton_UpdateCount
	hooksecurefunc("ActionButton_UpdateCount", function(self) updateCount(self) end)

	-- hook ActionButton_OnEvent
	hooksecurefunc("ActionButton_OnEvent", function(self) updateCount(self) end)	
end

init()
