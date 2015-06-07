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
function loadErrorLog( theUser, theReason )
	writeError( "Failed to load the data for the user: " .. getPlayerName( theUser ) .. " | REASON: " .. theReason )
	outputDebugString( "Failed to load the data for the user: " .. getPlayerName( theUser ) .. " | REASON: " .. theReason )
end

function successfullyLoaded( theUser )
	outputDebugString( "Successfully loaded the data for the user: " .. getPlayerName( theUser ) )
end

function loadData( theUser, theAccount )
	-- Get the data
	local userPos = fromJSON( getAccountData( theAccount, "pos" ) )
	local x, y, z, rx, ry, rz, int = unpack( userPos )

	local userSkin = getAccountData( theAccount, "skin" )

	local userHP = getAccountData( theAccount, "health" )
	local userArmor = getAccountData( theAccount, "armor" )
	local userMoney = getAccountData( theAccount, "money" )
	local userTeam = getTeamFromName( getAccountData( theAccount, "team" ) )

	-- Set the data
	spawnPlayer( theUser, x, y, z, rz, userSkin, int, 0, userTeam )

	setElementHealth( theUser, userHP )
	setPedArmor( theUser, userArmor )
	setPlayerMoney( theUser, userMoney, true )
	setPlayerTeam( userTeam, userTeam )

	successfullyLoaded( theUser ) -- Let the server administrator know it went well
end