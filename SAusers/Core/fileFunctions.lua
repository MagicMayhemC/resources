--[[
	Resource name: San Andreas Users

	Resource Information
	------------------------------------
	This resource has multiple functions
	it saves the users data and retrieves
	it.
	------------------------------------
	YOU DO NOT HAVE THE RIGHT TO USE THIS
	WITHOUT PERMISSION! IF YOU HAVE BEEN
	GIVEN PERMISSION THEN YOU ARE FREE TO
	MAKE ANY EDITS.
	------------------------------------
	© 2015 - MagicMayhem
]]--
function writeError( text )
	local errorFile = fileOpen( "Logs/errors.txt" )

	if ( errorFile ) then -- If the file was found
		local lastLine = fileGetSize( errorFile ) -- Find the last line
		local currentLine = fileSetPos( errorFile, lastLine ) -- Go to the last line

		local time = getRealTime( ) -- Get the current server time

		local day, month, year = time.monthday, time.month, time.year
		local minute, hour = time.minute, time.hour
		local stringTime = "[" .. day .. "/" .. month .. "] " .. hour .. ":" .. minute

		local writeText = fileWrite( errorFile, "\r\n" .. stringTime .. " | " .. text ) -- Write to the file

		if ( writeText ) then -- If it was successful
			fileClose ( errorFile ) -- Close the file
		else -- Tell the server administrator that it failed and where
			fileClose ( errorFile )
			outputDebugString( "ERROR WRITING TO THE LOG FILE @ SAusers.Core.fileFunctions.lua @ LINE 24" )
		end
	else -- Tell the server administrator that it failed and where
		outputDebugString( "ERROR OPENING THE LOG FILE @ SAusers.Core.fileFunctions.lua @ LINE 20" )
	end
end