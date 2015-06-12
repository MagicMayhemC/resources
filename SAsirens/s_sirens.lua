function vehicleBlown()
	setElementData(source, "lspd:siren", 0)
	setVehicleSirensOn ( source , false )
end
addEventHandler("onVehicleRespawn", getRootElement(), vehicleBlown)

function setSirenState(player)
	local installedStrobes = getPreInstalledStrobes()
	local veh_model = getVehicleName(source)
	if ((getTeamName(getPlayerTeam(player)) == "Law Enforcement") or (getTeamName(getPlayerTeam(player)) == "Emergency Services")) or (installedStrobes[veh_model]) then -- sirens
		local curState = getElementData(source, "lspd:siren")
		if curState == false then
			curState = 0
		end
		if (curState ~= 0) then
			setElementData(source, "lspd:siren", 0)
			setVehicleSirensOn ( source , false )
		else
		setElementData(source, "lspd:siren", 1)
		setVehicleSirensOn (source, true)
		end
	end
end
addEvent( "lspd:setSirenState", true )
addEventHandler( "lspd:setSirenState", getRootElement(), setSirenState )

function cycleSirenState(player)
	local installedStrobes = getPreInstalledStrobes()
	local veh_model = getVehicleName(source)
	if ((getTeamName(getPlayerTeam(player)) == "Law Enforcement") or (getTeamName(getPlayerTeam(player)) == "Emergency Services")) or (installedStrobes[veh_model]) then -- sirens
		local curState = getElementData(source, "lspd:siren")
		if curState == false then
			curState = 0
		end
		if (curState == 3) then
			setElementData(source, "lspd:siren", 1)
			setVehicleSirensOn ( source , true )
		else
		setElementData(source, "lspd:siren", curState + 1)
		setVehicleSirensOn (source, true)
		end
	end
end
addEvent( "lspd:cycleSirenState", true )
addEventHandler( "lspd:cycleSirenState", getRootElement(), cycleSirenState )

function addSirens (player, seat)
	local veh_model = getVehicleName(source)
	local installedStrobes = getPreInstalledStrobes()
    if player and (seat==0) then
		if (getElementData( source, "lightbar" ) == 1) then
			local lightBarStrobes = getLightBarStrobes()
			if (lightBarStrobes[veh_model] == nil) then
				--vehicle doesn't have strobes scripted
			else
				local total = lightBarStrobes[veh_model]["total"]
				addVehicleSirens(source,total,2, false, true, true, true)
				for id, desc in pairs(lightBarStrobes[veh_model]) do
					if (id~="total") then
						if (desc[4] == 11 and desc[5] == 12 and desc[6] == 13) then
							if (getTeamName(getPlayerTeam(player)) == "Emergency Services") then
								desc[4] = 0
								desc[5] = 255
								desc[6] = 0
							else
								desc[4] = 0
								desc[5] = 0
								desc[6] = 255
							end
						end
						setVehicleSirens(source, id, desc[1], desc[2], desc[3], desc[4], desc[5], desc[6], desc[7], desc[8])
					end
				end
			end
		elseif ((getTeamName(getPlayerTeam(player)) == "Law Enforcement") or (getTeamName(getPlayerTeam(player)) == "Emergency Services")) and (installedStrobes[veh_model] == nil) then -- Emergency siren lights
			local emergencyStrobes = getEmergencyStrobes()

			if (emergencyStrobes[veh_model] == nil) then
				--vehicle doesn't have strobes scripted
			else
				local total = emergencyStrobes[veh_model]["total"]
				addVehicleSirens(source,total,2, false, true, true, true)
				for id, desc in pairs(emergencyStrobes[veh_model]) do
					if (id~="total") then
						if (desc[4] == 11 and desc[5] == 12 and desc[6] == 13) then
							if (getTeamName(getPlayerTeam(player)) == "Emergency Services") then
								desc[4] = 0
								desc[5] = 255
								desc[6] = 0
							else
								desc[4] = 0
								desc[5] = 0
								desc[6] = 255
							end
						end
						setVehicleSirens(source, id, desc[1], desc[2], desc[3], desc[4], desc[5], desc[6], desc[7], desc[8])
					end
				end
			end
		elseif (installedStrobes[veh_model]) then -- PreInstalled sirens such as police cruisers, fire engines and ambulances.
				local total = installedStrobes[veh_model]["total"]
				addVehicleSirens(source,total,2, false, true, true, true)
				for id, desc in pairs(installedStrobes[veh_model]) do
					if (id~="total") then
						if (desc[4] == 11 and desc[5] == 12 and desc[6] == 13) then
						if (getTeamName(getPlayerTeam(player)) == "Emergency Services") then
							desc[4] = 0
							desc[5] = 255
							desc[6] = 0
						else
							desc[4] = 0
							desc[5] = 0
							desc[6] = 255
						end
						end
						setVehicleSirens(source, id, desc[1], desc[2], desc[3], desc[4], desc[5], desc[6], desc[7], desc[8])
					end
				end
		end
	end
end
addEventHandler("onVehicleEnter", getRootElement(), addSirens)
addEvent( "lspd:addSirens", true )
addEventHandler( "lspd:addSirens", getRootElement(), addSirens )