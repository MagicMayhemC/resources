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
function createRegisterGui( )
    local screenW, screenH = guiGetScreenSize(   )
    registerWindow = guiCreateWindow( ( screenW - 258 ) / 2, ( screenH - 162 ) / 2, 258, 162, "San Andreas Roleplaying Game", false )
    guiWindowSetSizable( registerWindow, false )
    guiWindowSetMovable( registerWindow, false )

    registerAccountText = guiCreateEdit( 94, 32, 154, 23, "", false, registerWindow )
    registerAccountLabel = guiCreateLabel( 15, 33, 79, 22, "Account: ", false, registerWindow )
    guiLabelSetHorizontalAlign( registerAccountLabel, "center", false )
    guiLabelSetVerticalAlign( registerAccountLabel, "center" )

    registerPasswordLabel = guiCreateLabel( 15, 65, 79, 22, "Password", false, registerWindow )
    guiLabelSetHorizontalAlign( registerPasswordLabel, "center", false )
    guiLabelSetVerticalAlign( registerPasswordLabel, "center" )
    registerPasswordText = guiCreateEdit( 94, 64, 154, 23, "", false, registerWindow )
    guiEditSetMasked( registerPasswordText, true )

    registerEmailLabel = guiCreateLabel( 15, 97, 79, 22, "Email", false, registerWindow )
    guiLabelSetHorizontalAlign( registerEmailLabel, "center", false )
    guiLabelSetVerticalAlign( registerEmailLabel, "center" )
    registerEmailText = guiCreateEdit( 94, 97, 154, 23, "", false, registerWindow )

    registerGoButton = guiCreateButton( 166, 130, 82, 20, "Register", false, registerWindow )
    addEventHandler( "onClientGUIClick", registerGoButton, registerUser, false ) 

    registerBackButton = guiCreateButton( 15, 130, 82, 20, "Back", false, registerWindow )
    addEventHandler( "onClientGUIClick", registerBackButton, showLoginGui, false )  

    guiSetVisible( registerWindow, false )
end
addEventHandler( "onClientResourceStart", resourceRoot, createRegisterGui )
