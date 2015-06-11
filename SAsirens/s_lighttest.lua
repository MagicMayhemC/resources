l_bar = {}
vehOffsets = {[560]= {0, 0.13, 0.82}, [459]= {0, 0.5, 1.12}, [554]= {0, 0.13, 1.05}, [490]= {0, 0.5, 1.1}}

function attachDetachLightbarOnCommand(player, cmd)

		if isPedInVehicle(player) then

		local vehicle = getPedOccupiedVehicle(player)
		local id = getElementModel(vehicle)

		if vehOffsets[id] ~= nil then
		if getTeamName(getPlayerTeam(player)) == 'Law Enforcement' or getTeamName(getPlayerTeam(player)) == 'Emergency Services' then
		if getVehicleController(vehicle) == player then

		if l_bar[vehicle] == nil then
			local x, y, z =  getElementPosition(vehicle)
			local light = createObject (3895, x, y, z)
			attachElements(light, vehicle, unpack(vehOffsets[id]))
			l_bar[vehicle] = light
			setElementData ( vehicle, "lightbar", 1 )
			triggerEvent("lspd:addSirens", vehicle, player, 0)
			if not (getElementData( vehicle, "ELS" ) == 1) then
				triggerEvent("turnOnELS", vehicle, player)
			end

	elseif l_bar[vehicle] ~= nil then
			setElementData ( vehicle, "lightbar", 0 )
			triggerEvent("lspd:addSirens", vehicle, player, 0)
			if not (getElementData( vehicle, "ELS" ) == 0) then
				triggerEvent("turnOnELS", vehicle, player)
			end
			destroyElement(l_bar[vehicle])
			l_bar[vehicle] = nil
					end
				end
			end
		end
	end
end
addCommandHandler('addlight', attachDetachLightbarOnCommand)

function destroyLightOnVehicleRespawn()
        if l_bar[source] ~= nil then
				setElementData ( source, "lightbar", 0 )
                destroyElement(l_bar[source])
                l_bar[source] = nil
        end
end
addEventHandler("onVehicleRespawn", getRootElement(), destroyLightOnVehicleRespawn)

function destroyLightOnVehicleDestroy()
        if (getElementType(source) == "vehicle") then
                if l_bar[source] ~= nil then
                        destroyElement(l_bar[source])
                        l_bar[source] = nil
                end
        end
end
addEventHandler("onElementDestroy", getRootElement(), destroyLightOnVehicleDestroy)

function destroyLightOnVehicleExplode()
        if l_bar[source] ~= nil then
				setElementData ( source, "lightbar", 0 )
                destroyElement(l_bar[source])
                l_bar[source] = nil
        end
end
addEventHandler("onVehicleExplode", getRootElement(), destroyLightOnVehicleExplode)
