--[[
    Resource name: San Andreas Login

    Resource Information
    ------------------------------------
    This resource logs a user into their
    account and also allows them to make
    a new account.
    ------------------------------------
    YOU DO NOT HAVE THE RIGHT TO USE THIS
    WITHOUT PERMISSION! IF YOU HAVE BEEN
    GIVEN PERMISSION THEN YOU ARE FREE TO
    MAKE ANY EDITS.
    ------------------------------------
    © 2015 - MagicMayhem
]]--
local loginData = xmlLoadFile( "data/loginData.xml" )
local key = "sPec45542asjash43L4a"

function XMLexists( )
	if ( loginData ) then
		return true
	else
		return false
	end
end

function decryptPass( password, username )
	return teaDecode( password, key .. username ) -- Decrypts the password with a special key
end

function encryptPass( password, username )
	return teaEncode( password, key .. username ) -- Encrypts the password with a special key
end

function destroyXML( )
	fileDelete( "data/loginData.xml" )
end

function loadXMLdata( )
	if ( XMLexists( ) ) then
		guiCheckBoxSetSelected( rememberCheckBox, true )

		local userNode = xmlFindChild( loginData, "username", 0 )
		local passNode = xmlFindChild( loginData, "password", 0 )

		if ( userNode ) and ( passNode ) then
			local username = xmlNodeGetValue( userNode )
			local password = decryptPass( xmlNodeGetValue( passNode ), username )

			guiSetText( usernameEdit, username )
			guiSetText( passwordEdit, password )

			xmlUnloadFile( loginData )
		else
			xmlUnloadFile( loginData )
		end
	end
end

function saveXMLdata( )
	if ( guiCheckBoxGetSelected( rememberCheckBox ) ) then
		local username = guiGetText( usernameEdit )
		local password = encryptPass( guiGetText( passwordEdit ), username )

		loginData = xmlCreateFile( "data/loginData.xml", "data" )

		local userNode = xmlCreateChild( loginData, "username" )
		local passNode = xmlCreateChild( loginData, "password" )

		xmlNodeSetValue( userNode, username )
		xmlNodeSetValue( passNode, password )

		xmlSaveFile( loginData )
		xmlUnloadFile( loginData )
	else
		destroyXML( )
	end
end