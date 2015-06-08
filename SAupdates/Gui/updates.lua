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
function createUpdateGui( )
	local screenW, screenH = guiGetScreenSize(  )
    updatesWin = guiCreateWindow( ( screenW - 461 ) / 2, ( screenH - 263 ) / 2, 461, 263, "San Andreas Roleplaying Game", false )
    guiWindowSetSizable( updatesWin, false )

    updatesMemo = guiCreateMemo( 9, 27, 442, 198, "Updates\n______________________________________________\n$LIST", false, updatesWin )
    guiMemoSetReadOnly( updatesMemo, true )

    closeButton = guiCreateButton( 363, 235, 88, 18, "CLOSE", false, updatesWin )
    addEventHandler( "onClientGUIClick", closeButton, closeUpdateGui, false )    

    guiSetVisible( updatesWin, false )
end
addEventHandler( "onClientResourceStart", resourceRoot, createUpdateGui )