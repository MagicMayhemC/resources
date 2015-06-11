--\--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--
-- What: s_els.lua
-- For: Grand Theft International, Law Enforcement.
-- By: Diego, with some help from Gunslinger.
-- Description: Emergency Lights system for Police Cruisers. It switches the vehicle's headlights, and backlights, upon pressing num_1.
-- Date: Monday, 21st April 2014
--/--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--*--

-- Script:
---------->>
local lights_1 = {}
local timer = {}
local timer2 = {}
local ar = {}
local cr = {}

function turnOnELS(thePlayer)
	local veh = getPedOccupiedVehicle(thePlayer)
	if not veh then return end
	local id = getElementModel(veh)
	if getTeamName(getPlayerTeam(thePlayer)) == "Law Enforcement" or getTeamName(getPlayerTeam(thePlayer)) == "Emergency Services"  then
			local theController = getVehicleController(veh)
			if  theController ~= thePlayer then return end
			if(lights_1[veh] == 0) or (lights_1[veh] == nil) then
				playSoundFrontEnd (thePlayer, 42)
				setVehicleSirensOn ( veh , true )
				setPedAnimation(thePlayer, "ped", "car_tune_radio", 200, false, false, true, true)
				lights_1[veh] = 1
				setElementData(veh, "ELS", 1)
				setVehicleOverrideLights ( veh, 2 )
				timer[veh] = setTimer(
				function()
					if(ar[veh] == 0) or (ar[veh] == nil) then
						ar[veh] = 1
						setVehicleLightState ( veh, 1, 0)
						setVehicleLightState ( veh, 2, 0)
						setVehicleLightState ( veh, 0, 1)
						setVehicleLightState ( veh, 3, 1)
					else
						setVehicleLightState ( veh, 3, 0)
						setVehicleLightState ( veh, 0, 0)
						setVehicleLightState ( veh, 1, 1)
						setVehicleLightState ( veh, 2, 1)

						ar[veh] = 0
					end
				end, 75, 0)
				timer2[veh] = setTimer(
				function()
					if(cr[veh] == 0) or (cr[veh] == nil) then
						cr[veh] = 1
						if (getTeamName(getPlayerTeam(thePlayer)) == "Emergency Services") then
							setVehicleHeadLightColor(veh, 0, 255, 0)
						else
							setVehicleHeadLightColor(veh, 0, 0, 255)
						end
					elseif cr[veh] == 1 then
						cr[veh] = 2
						setVehicleHeadLightColor(veh, 255, 0, 0)
					else
						setVehicleHeadLightColor(veh, 255, 255, 255)
						cr[veh] = 0
					end
				end, 50, 0)
			else
				playSoundFrontEnd (thePlayer, 42)
				setPedAnimation( thePlayer, "ped", "car_tune_radio", 50, false, false, true, true)
				lights_1[veh] = 0
				killTimer(timer[veh])
				killTimer(timer2[veh])
				setVehicleLightState ( veh, 0, 0)
				setVehicleLightState ( veh, 1, 0)
				setVehicleLightState ( veh, 2, 0)
				setVehicleLightState ( veh, 3, 0)
				setVehicleOverrideLights ( veh, 1 )
				setVehicleSirensOn ( veh , false )
				setElementData(veh, "ELS", 0)
			end
	end
end
addEvent("turnOnELS", true)
addEventHandler ( "turnOnELS", getRootElement(), turnOnELS)

-- Bug fixes:
---------->>
function killTimerOnVehicleRespawn()
	if(lights_1[source] == 1) then
		killTimer(timer[source])
		killTimer(timer2[source])
	end
end
addEventHandler ( "onVehicleRespawn", getRootElement(), killTimerOnVehicleRespawn)

function killTimerOnElementDestroy()
	if getElementType(source) == "vehicle" then
		if(lights_1[source] == 1) then
			killTimer(timer[source])
			killTimer(timer2[source])
		end
	end
end
addEventHandler("onElementDestroy", getRootElement(), killTimerOnElementDestroy)

function killTimerOnVehicleExplode()
	if(lights_1[source] == 1) then
		killTimer(timer[source])
		killTimer(timer2[source])
	end
end
addEventHandler ( "onVehicleExplode", getRootElement(), killTimerOnVehicleExplode)

function bindOnVehicleEnter(thePlayer, seat, jacked)
	if getTeamName(getPlayerTeam(thePlayer)) == "Law Enforcement" or getTeamName(getPlayerTeam(thePlayer)) == "Emergency Services"  then
		bindKey( thePlayer, "p", "down", turnOnELS)
	end
end
addEventHandler("onVehicleEnter", root, bindOnVehicleEnter)

--------------------------------------------------------------------------------------------------
-- Copyright: (C) 	GTI:RPG
--------------------------------------------------------------------------------------------------
