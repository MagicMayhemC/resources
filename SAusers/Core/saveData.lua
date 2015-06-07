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
function saveErrorLog( theUser, theReason )
	writeError( "Failed to save data for the user: " .. getPlayerName( theUser ) .. " | REASON: " .. theReason )
	outputDebugString( "Failed to save data for the user: " .. getPlayerName( theUser ) .. " | REASON: " .. theReason )
end

function successfullySaved( theUser )
	outputDebugString( "Successfully saved the data for the user: " .. getPlayerName( theUser ) )
end

function saveData( theUser, theAcc )
	-- Store it all nicely for ease of access
	local x, y, z = getElementPosition( theUser )
	local rx, ry, rz = getElementRotation( theUser )
	local int = getElementInterior( theUser )
	
	local userPos = toJSON( { x, y, z, rx, ry, rz, int } )
	local userSkin = getElementModel( theUser )

	local userHP = getElementHealth( theUser )
	local userArmor = getPedArmor( theUser )
	local userMoney = getPlayerMoney( theUser )
	local userTeam = getTeamName( getPlayerTeam( theUser ) )

	-- Now start saving
	setAccountData( theAcc, "pos", userPos )
	setAccountData( theAcc, "skin", userSkin )

	setAccountData( theAcc, "health", userHP )
	setAccountData( theAcc, "armor", userArmor )
	setAccountData( theAcc, "money", userMoney )
	setAccountData( theAcc, "team", userTeam )

	successfullySaved( theUser ) -- Let the server administrator know it went well
end