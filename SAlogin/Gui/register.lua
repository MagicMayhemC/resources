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
    local screenW, screenH = guiGetScreenSize( )
    registerWindow = guiCreateWindow( ( screenW - 258 ) / 2, ( screenH - 271 ) / 2, 258, 271, "San Andreas Roleplaying Game", false )
    guiWindowSetMovable( registerWindow, false )
    guiWindowSetSizable( registerWindow, false )

    registerAccountText = guiCreateEdit( 94, 32, 154, 23, "", false, registerWindow )
    registerAccountLabel = guiCreateLabel( 15, 33, 79, 22, "Account: ", false, registerWindow )
    guiLabelSetColor( registerAccountLabel, 255, 0, 0 )
    guiLabelSetHorizontalAlign( registerAccountLabel, "center", false )
    guiLabelSetVerticalAlign( registerAccountLabel, "center" )

    registerPasswordLabel = guiCreateLabel( 15, 65, 79, 22, "Password", false, registerWindow )
    guiLabelSetColor( registerPasswordLabel, 255, 0, 0 )
    guiLabelSetHorizontalAlign( registerPasswordLabel, "center", false )
    guiLabelSetVerticalAlign( registerPasswordLabel, "center" )

    registerPasswordText = guiCreateEdit( 94, 64, 154, 23, "", false, registerWindow )
    guiEditSetMasked( registerPasswordText, true )

    passwordConfirmEdit = guiCreateEdit( 94, 97, 154, 23, "", false, registerWindow )
    guiEditSetMasked( passwordConfirmEdit, true )

    registerEmailLabel = guiCreateLabel( 15, 127, 79, 22, "Email", false, registerWindow )
    guiLabelSetColor( registerEmailLabel, 255, 0, 0 )
    guiLabelSetHorizontalAlign( registerEmailLabel, "center", false )
    guiLabelSetVerticalAlign( registerEmailLabel, "center" )

    registerEmailText = guiCreateEdit( 94, 127, 154, 23, "", false, registerWindow )

    registerGoButton = guiCreateButton( 166, 241, 82, 20, "Register", false, registerWindow )
    addEventHandler( "onClientGUIClick", registerGoButton, registerUser, false ) 

    registerBackButton = guiCreateButton( 16, 241, 82, 20, "Back", false, registerWindow )
    addEventHandler( "onClientGUIClick", registerBackButton, showLoginGui, false )  

    labelPassC = guiCreateLabel( 15, 97, 79, 22, "Confirm Pass:", false, registerWindow )
    guiLabelSetColor( labelPassC, 255, 0, 0 )
    guiLabelSetHorizontalAlign( labelPassC, "center", false )
    guiLabelSetVerticalAlign( labelPassC, "center" )

    label2 = guiCreateLabel( 15, 160, 142, 18, "Choose a spawn location: ", false, registerWindow )    
    LSAP = guiCreateRadioButton( 16, 186, 123, 15, "Los Santos Airport", false, registerWindow )
    LVAP = guiCreateRadioButton( 16, 211, 133, 15, "Las Venturas Airport", false, registerWindow )
    guiRadioButtonSetSelected( LVAP, true )

    guiSetVisible( registerWindow, false )
end
addEventHandler( "onClientResourceStart", resourceRoot, createRegisterGui )