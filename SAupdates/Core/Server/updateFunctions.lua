--[[
    Resource name: San Andreas Updates

    Resource Information
    ------------------------------------
    This resource has informs users of
    the current latest updates.
    ------------------------------------
    YOU DO NOT HAVE THE RIGHT TO USE THIS
    WITHOUT PERMISSION! IF YOU HAVE BEEN
    GIVEN PERMISSION THEN YOU ARE FREE TO
    MAKE ANY EDITS.
    ------------------------------------
    © 2015 - MagicMayhem
]]--
function getUpdates( )
    return updates, dates
end

function sendUpdates( )
    triggerClientEvent( client, "SAupdates.receiveUpdates", client, updates, dates )
end
addEvent( "SAupdates.sendUpdates", true )
addEventHandler( "SAupdates.sendUpdates", root, sendUpdates )

function loginSendUpdates( )
    triggerClientEvent( client, "SAlogin.receiveUpdates", client, updates, dates )
end
addEvent( "SAlogin.sendUpdates", true )
addEventHandler( "SAlogin.sendUpdates", root, loginSendUpdates )