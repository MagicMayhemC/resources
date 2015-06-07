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
function attemptLogin( username, password, player )
    local userAccount = getAccount( username, password )

    if ( player ) then client = player end

    if ( userAccount ) then
        logIn( client, userAccount, password )
        triggerClientEvent( client, "SAlogin.loggedIn", client, getAccountName( userAccount ) )
    else
        triggerClientEvent( client, "SAlogin.errorHappened", client, "You entered the wrong username/password!" )
    end
end
addEvent( "SAlogin.attemptLogin", true )
addEventHandler( "SAlogin.attemptLogin", root, attemptLogin )