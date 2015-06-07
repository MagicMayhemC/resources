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
function initUserSave( )
	local userAccount = getPlayerAccount( source ) -- Get the users account

	if not ( isGuestAccount( userAccount ) ) then -- If the account was found
		saveData( source, userAccount )
	end
end
addEventHandler( "onPlayerQuit", root, initUserSave )

function initUserLoad( _, userAccount )
	loadData( source, userAccount )
end
addEventHandler( "onPlayerLogin", root, initUserLoad )

function saveAllData( )
	local players = getElementsByType( "player" )

	for id, theUser in ipairs( players ) do
		local userAccount = getPlayerAccount( theUser )

		if not ( isGuestAccount( userAccount ) ) then
			saveData( theUser, userAccount )
		end
	end
end
addEventHandler( "onResourceStop", resourceRoot, saveAllData )