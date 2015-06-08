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

function parseUpdates( updates, dates )
	local memoText = "Updates\r\n"

	table.sort(updates, function(a, b) return a[4] > b[4] end) -- sort by id, last id = latest update
    table.sort(dates, function(a, b) return a[2] > b[2] end) -- sort by id, last id = latest date

	for key, date in pairs( dates ) do
		memoText = memoText .. "\r\n" .. FormatDate( "[d/m/Y]", " ", date[1] )

		for id, update in ipairs( updates ) do
			local dateOfUpdate, updateInfo, author = unpack( update )

			if ( dateOfUpdate == date[1] ) then
				memoText = memoText .. "\r\n- " .. updateInfo .. " (" .. author .. ")"
			end
		end
	end

	return memoText
end

function receiveUpdates( sUpdates, sDates )
	local memoText = parseUpdates( sUpdates, sDates )
    guiSetText( updatesMemo,  memoText )
end
addEvent( "SAupdates.receiveUpdates", true )
addEventHandler( "SAupdates.receiveUpdates", root, receiveUpdates )

function showUpdateGui( )
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