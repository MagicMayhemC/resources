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
function showRegisterGui( )
    guiSetVisible( loginWindow, false )
    guiSetVisible( registerWindow, true )
    guiSetInputEnabled( true )
    showCursor( true )
end
addEvent( "SAlogin.showRegister", true )
addEventHandler( "SAlogin.showRegister", root, showRegisterGui )

function registerUser( )
    local username = string.lower( guiGetText( registerAccountText ) )
    local password = string.lower( guiGetText( registerPasswordText ) )
    local email = string.lower( guiGetText( registerEmailText ) )

    if not ( username == "" ) and not ( password == "" ) and not ( email == "" ) then
        triggerServerEvent( "SAlogin.attemptRegister", localPlayer, username, password, email )
    else
        errorHappened( "You left a field blank!" )
    end
end
