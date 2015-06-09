--[[
    Resource name: San Andreas Login

    Resource Information
    ------------------------------------
    This resource logs a user into their
    account and also allows them to make
    a new account.
    ------------------------------------
    YOU DO NOT HAVE THE RIGHT TO USE THIS
    WITHOUT PERMISSION! IF YOU HAVE BEEN
    GIVEN PERMISSION THEN YOU ARE FREE TO
    MAKE ANY EDITS.
    ------------------------------------
    © 2015 - MagicMayhem
]]--
function attemptRegister( username, password, email )
    local checkAccount = getAccount( username )

    if not ( checkAccount ) then
        exports.SAusers:addUser( username, password, email, client )
    else
        triggerClientEvent( client, "SAlogin.errorHappened", client, "This account name is already taken!" )
    end
end
addEvent( "SAlogin.attemptRegister", true )
addEventHandler( "SAlogin.attemptRegister", root, attemptRegister )

function isAccountTaken( accountName )
    local userAccount = getAccount( accountName )

    if ( userAccount ) then
        triggerClientEvent( client, "SAlogin.isAccountNameTakenReply", client, true )
    else
        triggerClientEvent( client, "SAlogin.isAccountNameTakenReply", client, false )
    end
end
addEvent( "SAlogin.isAccountNameTaken", true )
addEventHandler( "SAlogin.isAccountNameTaken", root, isAccountTaken )