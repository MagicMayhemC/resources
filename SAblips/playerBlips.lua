--[[
    Resource name: San Andreas Blips

    Resource Information
    ------------------------------------
    This resource organises blips.
    ------------------------------------
    YOU DO NOT HAVE THE RIGHT TO USE THIS
    WITHOUT PERMISSION! IF YOU HAVE BEEN
    GIVEN PERMISSION THEN YOU ARE FREE TO
    MAKE ANY EDITS.
    ------------------------------------
    © 2015 - MagicMayhem
]]--

local BLIP_VISIBLE_DISTANCE = 750
local blips = {}

function setPlayerNameColor(player, r, g, b, noBlip)
	setPlayerNametagColor(player, r, g, b)
	
	if (noBlip) then
		destroyBlip(player)
		return true 
	end
	
	if (not blips[player] or not isElement(blips[player])) then
		blips[player] = createBlipAttachedTo(player, 0, 2, r, g, b, 255, 0, BLIP_VISIBLE_DISTANCE)
	else
		setBlipColor(blips[player], r, g, b, 255)
	end
	return true
end

addCommandHandler("showhud", function(player)
	triggerClientEvent(player, "SAblips.showhud", resourceRoot)
end)


function destroyBlip(player)
	if (source) then player = source end
	if (blips[player] and isElement(blips[player])) then
		destroyElement(blips[player])
		blips[player] = nil
	end	
end
addEventHandler("onPlayerQuit", root, destroyBlip)

for i,player in ipairs(getElementsByType("player")) do
	local acc = getPlayerAccount ( player )
	if  not isGuestAccount(acc) then
		local r,g,b = getPlayerNametagColor(player)
		setPlayerNameColor(player, r, g, b)
	end
end