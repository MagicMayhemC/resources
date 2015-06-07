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
local cameraPoints = {
    { 2038.470703125, 1586.3486328125, 24.457378387451, 1976.6357421875, 1508.40625, 14.390879631042 },
}

function stopTime( )
    setTime( 22, 0 )
end

function startLoginBG( )
    local x, y, z, x2, y2, z2 = unpack ( cameraPoints[ math.random( #cameraPoints ) ] )
    fadeCamera( true, 7 )
    setCameraMatrix( x, y, z, x2, y2, z2 )

    setPlayerHudComponentVisible( "all", false )
    showChat( false )

   addEventHandler( "onClientRender", root, stopTime )
end

function showLoginGui( )
    guiSetVisible( registerWindow, false )
    guiSetVisible( loginWindow, true )

    guiSetInputEnabled( true )
    showCursor( true )

    startLoginBG( )
end
addEvent( "SAlogin.showLogin", true )
addEventHandler( "SAlogin.showLogin", root, showLoginGui )

function hideExtras( )
    guiSetVisible( border1, false )
    guiSetVisible( border2, false )
    guiSetVisible( logo, false )
end

function parseLogin( )
    local username = string.lower( guiGetText( usernameEdit ) )
    local password = string.lower( guiGetText( passwordEdit ) )

    if not ( username == "" ) and not ( password == "" ) then
        triggerServerEvent( "SAlogin.attemptLogin", localPlayer, username, password )
    else
        errorHappened( "You left a field blank!" )
    end
end

function loggedIn( accountName )
    fadeCamera( false, 3 )

    guiSetVisible( loginWindow, false )
    guiSetVisible( registerWindow, false )

    guiSetInputEnabled( false )
    showCursor( false )
    hideExtras( )

    fadeCamera( true, 3 )

    setPlayerHudComponentVisible( "all", true )
    showChat( true )

    setCameraTarget( localPlayer )
end
addEvent( "SAlogin.loggedIn", true )
addEventHandler( "SAlogin.loggedIn", root, loggedIn )