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
function createLoginGui( )
    local screenW, screenH = guiGetScreenSize( )
    loginWindow = guiCreateWindow( ( screenW - 514 ) / 2, ( screenH - 296 ) / 2, 514, 296, "San Andreas Roleplaying Game", false )
    guiWindowSetSizable( loginWindow, false )
    guiWindowSetMovable( loginWindow, false )

    usernameEdit = guiCreateEdit( 72, 35, 173, 23, "", false, loginWindow )
    usernameLabel = guiCreateLabel( 10, 40, 57, 18, "Account:", false, loginWindow )

    passwordLabel = guiCreateLabel( 10, 68, 57, 18, "Password:", false, loginWindow )
    passwordEdit = guiCreateEdit( 72, 63, 173, 23, "", false, loginWindow )
    guiEditSetMasked( passwordEdit, true )

    loginButton = guiCreateButton( 194, 100, 51, 20, "Login", false, loginWindow )
    addEventHandler( "onClientGUIClick", loginButton, parseLogin, false )

    registerButton = guiCreateButton( 133, 100, 51, 20, "Register", false, loginWindow )
    addEventHandler( "onClientGUIClick", registerButton, showRegisterGui, false )

    rememberCheckBox = guiCreateCheckBox( 10, 102, 105, 18, "Remember me", false, false, loginWindow )

    updatesMemo = guiCreateMemo( 12, 130, 492, 156, "ERROR LOADING THE UPDATES", false, loginWindow )
    guiMemoSetReadOnly( updatesMemo, true )

    border1 = guiCreateStaticImage(0.00, -0.00, 1.00, 0.11, "Gui/images/bg.png", true)  
    border2 = guiCreateStaticImage( 0.00, 0.89, 1.00, 0.11, "Gui/images/bg.png", true )

    logo = guiCreateStaticImage(0.67, 0.89, 0.33, 0.18, ":SAlogin/Gui/images/logo.png", true)    
    minilogo = guiCreateStaticImage( 263, 53, 237, 79, ":SAlogin/Gui/images/logo.png", false, loginWindow )   

    guiSetVisible( loginWindow, false )
    showLoginGui( )
end
addEventHandler( "onClientResourceStart", resourceRoot, createLoginGui )