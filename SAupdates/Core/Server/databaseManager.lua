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
local updatesDB = dbConnect( "sqlite", "Core/Server/Data/updates.db" )

function cacheUpdates()
    local query = dbQuery( updatesDB, "SELECT * FROM updates ORDER BY `id` DESC" )
    local result = dbPoll( query, -1)

    for _, row in ipairs( result ) do
        updates[ row[ "id" ] ] = { tostring ( row[ "date" ] ), row[ "text" ], row[ "author" ], row[ "id" ] }

        if not ( dates[ row["date"] ] ) then -- if the date hasn't already been added to the table then add it
            dates[ row["date"] ] = { tostring ( row[ "date" ] ), row[ "id" ] }
        end
    end
end
addEventHandler( "onResourceStart", resourceRoot, cacheUpdates )

function insertUpdate( date, text, author )
    dbExec( updatesDB, "INSERT INTO updates ( date, text, author )  VALUES ( ?,?,? ) ", date, text, author ) 

    local tabID = #updates + 1
    updates[ tabID ] = { tostring( date ), text, author, tabID }

    if not ( dates[ date ] ) then -- if the date hasn't already been added to the table then add it
            dates[ date ] = { tostring( date ), tabID }
    end
end