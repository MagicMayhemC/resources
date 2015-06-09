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
local allowedToCheck = true

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

    local password = guiGetText( registerPasswordText )
    local confirmedPass = guiGetText( passwordConfirmEdit )

    local email = string.lower( guiGetText( registerEmailText ) )

    if not ( username == "" ) and not ( password == "" ) and not ( email == "" ) then
         if ( confirmedPass == password ) then
            triggerServerEvent( "SAlogin.attemptRegister", localPlayer, username, password, email )
        else
            errorHappened( "The passwords you entered do not match!" )
        end
    else
        errorHappened( "You left a field blank!" )
    end
end

function isAccountNameTaken( state )
    if ( state ) or ( guiGetText( registerAccountText ) == "" ) then
         guiLabelSetColor( registerAccountLabel, 255, 0, 0 )
    else
        guiLabelSetColor( registerAccountLabel, 24, 241, 13 )
    end
end
addEvent( "SAlogin.isAccountNameTakenReply", true )
addEventHandler( "SAlogin.isAccountNameTakenReply", root, isAccountNameTaken )

function textChanged( )
    if ( source == registerAccountText ) then
        allowedToCheck = false
        setTimer(function() 
                        allowedToCheck = true
                        local accountName = string.lower( guiGetText( registerAccountText ) )
                        triggerServerEvent( "SAlogin.isAccountNameTaken", localPlayer, accountName )
                end, 1000, 1)
    end

    if ( source == registerPasswordText ) then
        if not ( guiGetText( registerAccountText ) == "" ) then
            guiLabelSetColor( registerPasswordLabel, 24, 241, 13 )
        else
            guiLabelSetColor( registerPasswordLabel, 255, 0, 0 )
        end
    end

    if ( source == registerEmailText ) then
        if ( string.find( guiGetText( registerEmailText ), "@" ) ) then
            guiLabelSetColor( registerEmailLabel, 24, 241, 13 )
        else
            guiLabelSetColor( registerEmailLabel, 255, 0, 0 )
        end
    end

    if ( source == passwordConfirmEdit ) then
        if ( guiGetText( passwordConfirmEdit ) == guiGetText( registerPasswordText ) ) then
            guiLabelSetColor( labelPassC, 24, 241, 13 )
        else
            guiLabelSetColor( labelPassC, 255, 0, 0 )
        end
    end
end
addEventHandler( "onClientGUIChanged", root, textChanged )