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

local screenW, screenH = guiGetScreenSize( )

function showDXmsg( ) 
  	dxDrawText( "New update! Type /updates to see what it is.", ( screenW * 0.0788 ) - 1, ( screenH * 0.3283 ) - 1, ( screenW * 0.9213 ) - 1, ( screenH * 0.3900 ) - 1, tocolor( 0, 0, 0, 255 ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
    dxDrawText( "New update! Type /updates to see what it is.", ( screenW * 0.0788 ) + 1, ( screenH * 0.3283 ) - 1, ( screenW * 0.9213 ) + 1, ( screenH * 0.3900 ) - 1, tocolor( 0, 0, 0, 255 ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
    dxDrawText( "New update! Type /updates to see what it is.", ( screenW * 0.0788 ) - 1, ( screenH * 0.3283 ) + 1, ( screenW * 0.9213 ) - 1, ( screenH * 0.3900 ) + 1, tocolor( 0, 0, 0, 255 ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
    dxDrawText( "New update! Type /updates to see what it is.", ( screenW * 0.0788 ) + 1, ( screenH * 0.3283 ) + 1, ( screenW * 0.9213 ) + 1, ( screenH * 0.3900 ) + 1, tocolor( 0, 0, 0, 255 ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
    dxDrawText( "New update! Type /updates to see what it is.", screenW * 0.0788, screenH * 0.3283, screenW * 0.9213, screenH * 0.3900, tocolor( 231, 121, 23, 255 ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
end

 function playUpdateSound( )
    local sound = playSound( "Gui/sounds/newupdate.mp3" )
	setSoundVolume( sound, 0.2 )
end

function newUpdate( )
	addEventHandler( "onClientRender", root, showDXmsg )

	playUpdateSound( )

	setTimer( function( ) removeEventHandler( "onClientRender", root, showDXmsg ) end, 7000, 1 )
end
addEvent( "SAupdates.newUpdate", true )
addEventHandler( "SAupdates.newUpdate", root, newUpdate )
