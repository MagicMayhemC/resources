--[[
    Resource name: San Andreas Speaker

    Resource Information
    ------------------------------------
    This resource allows staff to create
	music speakers.
    ------------------------------------
    YOU DO NOT HAVE THE RIGHT TO USE THIS
    WITHOUT PERMISSION! IF YOU HAVE BEEN
    GIVEN PERMISSION THEN YOU ARE FREE TO
    MAKE ANY EDITS.
    ------------------------------------
    © 2015 - MagicMayhem
]]--

clientIsReady = false

function startScript ()
	addEvent ("onSpeakerCreate", true)
	addEventHandler ("onSpeakerCreate", getRootElement(), onSpeakerCreate)
	
	addEvent ("onSpeakerDestroy", true)
	addEventHandler ("onSpeakerDestroy", getRootElement(), onSpeakerDestroy)
	
	addEvent ("clientIsReady", true)
	addEventHandler ("clientIsReady", getRootElement(), enableClientIsReady)

end
addEventHandler ("onResourceStart", getResourceRootElement(), startScript)


function onSpeakerCreate (player, url, distance)
	if getPedOccupiedVehicle (player) then
		outputChatBox ("You can't create a speaker while in a vehicle.", player, 255, 0, 0)
		return false
	end
	local x, y, z = getElementPosition (player)
	local z = z - 1
	local rx, ry, rz = getElementRotation (player)
	
	local rz = rz + 90
	local rz = 0.0174532925 * rz
	local x = (math.cos(rz) * 1.5) + x
	local y = (math.sin(rz) * 1.5) + y
	
	local ox, oy, oz = getElementPosition (player)
	local rotation = findRotation(x, y, ox, oy)
	local rotation = rotation + 180
	
	
	triggerClientEvent ("speakerStuffFromServer", getRootElement(), player, url, distance, x, y, z, rotation)
end


function onSpeakerDestroy (player)
	triggerClientEvent ("destroySpeaker", getRootElement(), player)
end


function onPlayerQuit ()
	local player = source
	triggerClientEvent ("onPQuit", getRootElement(), player)
end
addEventHandler ("onPlayerQuit", getRootElement(), onPlayerQuit)


function findRotation(x1,y1,x2,y2)
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end;
	return t;
end


function enableClientIsReady ()
	clientIsReady = true
end