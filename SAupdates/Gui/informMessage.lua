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
local alpha = 0
local height = 0.3283

local fadeIn = true
local fadeOut = false

function showDXmsg( ) 
    if ( fadeOut ) then
        if not ( alpha == 0 ) then 
            alpha = alpha - 10
        else
            fadeOut = false
        end

        if not ( height <= 0.1283 ) then 
            height = height - 0.0100
        else
            fadeOut = false
        end
    end

    if ( fadeIn ) then
        if not ( alpha == 250 ) then 
            alpha = alpha + 10
        else
            fadeIn = false
        end
    end

  	dxDrawText( "New update! Type /updates to see what it is.", ( screenW * 0.0820 ) - 1, ( screenH * height ) - 1, ( screenW * 0.9213 ) - 1, ( screenH * 0.3900 ) - 1, tocolor( 0, 0, 0, alpha ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
    dxDrawText( "New update! Type /updates to see what it is.", ( screenW * 0.0788 ) + 1, ( screenH * height ) - 1, ( screenW * 0.9213 ) + 1, ( screenH * 0.3900 ) - 1, tocolor( 0, 0, 0, alpha ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
    dxDrawText( "New update! Type /updates to see what it is.", ( screenW * 0.0788 ) - 1, ( screenH * height ) + 1, ( screenW * 0.9213 ) - 1, ( screenH * 0.3900 ) + 1, tocolor( 0, 0, 0, alpha ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
    dxDrawText( "New update! Type /updates to see what it is.", ( screenW * 0.0788 ) + 1, ( screenH * height ) + 1, ( screenW * 0.9213 ) + 1, ( screenH * 0.3900 ) + 1, tocolor( 0, 0, 0, alpha ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
    dxDrawText( "New update! Type /updates to see what it is.", screenW * 0.0788, screenH * height, screenW * 0.9213, screenH * 0.3900, tocolor( 231, 121, 23, alpha ), 1.30, "pricedown", "center", "top", false, true, false, false, false )
end

 function playUpdateSound( )
    local sound = playSound( "Gui/sounds/newupdate.mp3" )
	setSoundVolume( sound, 0.2 )
end


function newUpdate( )
    alpha = 0
    height = 0.3283
	addEventHandler( "onClientRender", root, showDXmsg )

    fadeIn = true
	playUpdateSound( )

    setTimer( function( ) fadeOut = true end, 6500, 1)
	setTimer( function( ) removeEventHandler( "onClientRender", root, showDXmsg ) end, 7000, 1 )
end
addEvent( "SAupdates.newUpdate", true )
addEventHandler( "SAupdates.newUpdate", root, newUpdate )
addCommandHandler( "sound", newUpdate )
