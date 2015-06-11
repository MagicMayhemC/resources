--[[
    Resource name: San Andreas Updates

    Resource Information
    ------------------------------------
    This resource informs the users of
    the current latest updates.
    ------------------------------------
    YOU DO NOT HAVE THE RIGHT TO USE THIS
    WITHOUT PERMISSION! IF YOU HAVE BEEN
    GIVEN PERMISSION THEN YOU ARE FREE TO
    MAKE ANY EDITS.
    ------------------------------------
    © 2015 - MagicMayhem
]]--
local version = 1.01
local screenX, screenY = guiGetScreenSize()
local label = guiCreateLabel( 0, 0, screenX, 15, "SA:RPG "..version, false )
guiSetSize( label, guiLabelGetTextExtent( label ) + 5, 14, false )
guiSetPosition( label, screenX - guiLabelGetTextExtent( label ) - 5, screenY - 27, false )
guiSetAlpha( label, 0.5 )

function parseUpdates( updates, dates )
	local memoText = "Updates"

	table.sort( updates, function(a, b) return a[4] > b[4] end ) -- sort by id, last id = latest update
    table.sort( dates, function(a, b) return a[2] > b[2] end ) -- sort by id, last id = latest date

	for key, date in pairs( dates ) do
		memoText = memoText .. "\r\n" .. FormatDate( "\r\n[d/m/Y]", " ", date[1] )

		for id, update in ipairs( updates ) do
			local dateOfUpdate, updateInfo, author = unpack( update )

			if ( dateOfUpdate == date[1] ) then -- if the date of the update is the same as the one being processed then add it to the memo
				memoText = memoText .. "\r\n- " .. updateInfo .. " (" .. author .. ")"
			end
		end
	end

	return memoText
end

function showUpdateGui( )
	guiSetText( updatesMemo,  "" )

	guiSetVisible( updatesWin, true )
	guiSetInputEnabled( true )
	showCursor( true )

	triggerServerEvent( "SAupdates.sendUpdates", localPlayer )
end
addCommandHandler( "updates", showUpdateGui )

function closeUpdateGui( )
	guiSetVisible( updatesWin, false )
	guiSetInputEnabled( false )
	showCursor( false )
end

function receiveUpdates( sUpdates, sDates )
    local memoText = exports.SAupdates:parseUpdates( sUpdates, sDates )
    guiSetText( updatesMemo,  memoText )
end
addEvent( "SAupdates.receiveUpdates", true )
addEventHandler( "SAupdates.receiveUpdates", root, receiveUpdates )

function addUpdate( _, ... )
	local text = table.concat( {...}, " " )

	if not ( string.len( text ) > 65 ) then
		local time = getTimestamp( )
		local playerName = getPlayerName( localPlayer )

		triggerServerEvent( "SAupdates.addUpdate", localPlayer, time, text, playerName )
	else
		outputChatBox( "This message is greater than 65 characters." )
	end
end
addCommandHandler( "addupdate", addUpdate )