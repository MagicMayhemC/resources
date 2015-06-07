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
function createErrorGui( )
    local screenW, screenH = guiGetScreenSize( )
    errorWin = guiCreateWindow( ( screenW - 290 ) / 2, ( screenH - 130 ) / 2, 290, 130, "ERROR!", false )

    guiWindowSetSizable( errorWin, false )
    guiWindowSetMovable( errorWin, false )
    guiSetAlpha( errorWin, 0.96 )

    info = guiCreateStaticImage( 23, 41, 48, 48, ":SAlogin/Gui/images/info.png", false, errorWin )

    reasonLabel = guiCreateLabel( 81, 41, 184, 48, "", false, errorWin )
    guiLabelSetHorizontalAlign( reasonLabel, "left", true )
    guiLabelSetVerticalAlign( reasonLabel, "center" )

    okButton = guiCreateButton( 158, 100, 122, 20, "OK", false, errorWin )
    addEventHandler( "onClientGUIClick", okButton, errorOk, false )

    guiSetVisible( errorWin, false )
end
addEventHandler( "onClientResourceStart", resourceRoot, createErrorGui )

function errorOk( )
    guiSetVisible( errorWin, false )
end 

function sendAllGuisBack( )
    guiMoveToBack( loginWindow )
    guiMoveToBack( registerWindow )
end

function errorHappened( reason )
    guiSetText( reasonLabel, reason )
    guiSetVisible( errorWin, true )

    sendAllGuisBack( )
end
addEvent( "SAlogin.errorHappened", true )
addEventHandler( "SAlogin.errorHappened", root, errorHappened )