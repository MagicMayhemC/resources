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
function initNewUserData( theAcc )
	local userPos = toJSON( { 1173.2734375, -1323.041015625, 15.394026756287, 0, 0, 271, 0 } )
	setAccountData( theAcc, "pos", userPos )
	setAccountData( theAcc, "skin", 21 )

	setAccountData( theAcc, "health", 100 )
	setAccountData( theAcc, "armor", 0 )
	setAccountData( theAcc, "money", 0 )
	setAccountData( theAcc, "team", nil )
end

function addUser( account, password, email, thePlayer )
	local theAccount = addAccount( account, password )

	if ( theAccount ) then
		setAccountData( theAccount, "email", email )
		initNewUserData( theAccount )

		triggerEvent( "SAlogin.attemptLogin", thePlayer, account, password, thePlayer )
	end
end