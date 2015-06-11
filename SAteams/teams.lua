--[[
    Resource name: San Andreas Teams

    Resource Information
    ------------------------------------
    This resource organizes teams
    ------------------------------------
    YOU DO NOT HAVE THE RIGHT TO USE THIS
    WITHOUT PERMISSION! IF YOU HAVE BEEN
    GIVEN PERMISSION THEN YOU ARE FREE TO
    MAKE ANY EDITS.
    ------------------------------------
    © 2015 - MagicMayhem
]]--


local teams = {
	["Staff"] = createTeam("Staff", 255, 255, 255),
	["Emergency Services"] = createTeam("Emergency Services", 30, 255, 125),
	["Law Enforcement"] = createTeam("Law Enforcement", 30, 125, 255),
	["Criminals"] = createTeam("Criminals", 175, 25, 25),
	["Civilians"] = createTeam("Civilians", 255, 200, 0),
}

function assignTeam(player, teamName, noBlip)
	if (not isElement(player) or type(teamName) ~= "string") then return false end

	local team = getTeamFromName(teamName)
	if (not team) then return false end

	setPlayerTeam(player, team)
	local r,g,b = getTeamColor(team)
	return exports.SAblips:setPlayerNameColor(player, r, g, b, noBlip)
end

for i,player in ipairs(getElementsByType("player")) do
	assignTeam(player, "Emergency Services")
end

addEventHandler("onPlayerJoin", root, function()
	assignTeam(source, "Civilians", true)
end)
