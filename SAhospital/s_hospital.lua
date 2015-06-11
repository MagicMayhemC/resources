local respawnTime = 6000


addEvent ( "respawnDeadPlayer", true )
addEventHandler ( "respawnDeadPlayer", root,
	function ( hx, hy, hz, rotation, mx, my, mz, lx, ly, lz, hospitalName )
			fadeCamera( source, false, 1.0, 0, 0, 0 )
			setTimer( setCameraMatrix, 1000, 1, source, mx, my, mz, lx, ly, lz )
			setTimer( fadeCamera, 2000, 1, source, true, 1.0, 0, 0, 0 )
			setTimer( respawnPlayer, respawnTime, 1, source, hx, hy, hz, rotation )
			exports.SAdxDisplay:createNewDxMessage( source, "You respawned at the "..hospitalName, 225, 225, 225 )
	end
)

-- Function that respawns the player
function respawnPlayer ( thePlayer, hx, hy, hz, rotation )
	if ( isElement( thePlayer ) ) then
		fadeCamera( thePlayer, true)
		setCameraTarget( thePlayer, thePlayer )
		spawnPlayer( thePlayer, hx + math.random ( 0.1, 2 ), hy + math.random ( 0.1, 2 ), hz, rotation, getElementModel( thePlayer ), 0, 0 )
	end
end


-- Some tables
local spawnAFK = {}
local allowedAFK = {}

-- Reset the playing being AFK
function onSpawnMoveAFK ( thePlayer )
	spawnAFK[thePlayer] = false
	setElementFrozen( thePlayer, false )
	setElementDimension( thePlayer, 0 )
	unbindKey( thePlayer, "w", "down", onSpawnMoveAFK )
	unbindKey( thePlayer, "a", "down", onSpawnMoveAFK )
	unbindKey( thePlayer, "d", "down", onSpawnMoveAFK )
	unbindKey( thePlayer, "s", "down", onSpawnMoveAFK )	
	unbindKey( thePlayer, "arrow_l", "down", onSpawnMoveAFK)
	unbindKey( thePlayer, "arrow_u", "down", onSpawnMoveAFK)
	unbindKey( thePlayer, "arrow_r", "down", onSpawnMoveAFK)
	unbindKey( thePlayer, "arrow_d", "down", onSpawnMoveAFK)
	triggerClientEvent( thePlayer, "onClientShowAFK", thePlayer, false )
end

-- Set the player AFK
function onSetPlayerAFK( thePlayer )
	if ( isElement ( thePlayer ) ) and ( spawnAFK[thePlayer] )  then
		setElementDimension( thePlayer, math.random(100, 20000) )
		setElementFrozen( thePlayer, true )
		triggerClientEvent( thePlayer, "onClientShowAFK", thePlayer, true )
	end
end

-- When the player spawns toggle the controls
addEventHandler( "onPlayerSpawn", root,
	function ()
		if allowedAFK[source] then
			spawnAFK[source] = true
			allowedAFK[source] = false
			setTimer( onSetPlayerAFK, 1000, 1, source )
			bindKey( source, "w", "down", onSpawnMoveAFK )
			bindKey( source, "a", "down", onSpawnMoveAFK )
			bindKey( source, "d", "down", onSpawnMoveAFK )
			bindKey( source, "s", "down", onSpawnMoveAFK )
			bindKey( source, "arrow_l", "down", onSpawnMoveAFK)
			bindKey( source, "arrow_u", "down", onSpawnMoveAFK)
			bindKey( source, "arrow_r", "down", onSpawnMoveAFK)
			bindKey( source, "arrow_d", "down", onSpawnMoveAFK)
		end
	end
)

addEventHandler("onPlayerSpawn",root,
function()	
		if not (spawnAFK[source] == true) then --make sure hes not AFK
			if not (getElementDimension(source) == 0) and (getElementInterior(source) == 0) and not (getElementDimension(source) == 2) then
				setElementDimension(source,0) --set him back to normal.
			end
		end
end)
-- When a player dies allow the spawn protections
addEventHandler( "onPlayerWasted", root,
	function ()
		allowedAFK[source] = true
	end
)