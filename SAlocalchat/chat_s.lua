addEventHandler("onPlayerChat", root,
    function(msg, type)
        if type == 1 then
            cancelEvent()
            rpChat(source, msg, "me")
        end
    end
)

function rpChat(source, message, mType)
    if (not isPlayerLoggedIn(source)) then return end
	muted = false
	if (muted) then
		outputChatBox("* ERROR: You are globally muted.", source, 255, 25, 25)
		return
	end
		
    if (not message) then return end
    repeat message = message:gsub("#%x%x%x%x%x%x", "") until not message:find("#%x%x%x%x%x%x")
    if (message == "") then return end

    local r, g, b = getPlayerNametagColor(source)
    local hex = getHexFromRGB(r, g, b)
    local posX, posY, posZ = getElementPosition(source)
    local recipients = {}
    for index, player2 in pairs(getElementsByType("player")) do
        local posX2, posY2, posZ2 = getElementPosition(player2)
        if (getDistanceBetweenPoints3D(posX, posY, posZ, posX2, posY2, posZ2)) <= 30 then
            table.insert(recipients, player2)
        end
    end
    for index, player2 in pairs(recipients) do
            if mType == "me" then
                outputChatBox("["..(#recipients-1).."] * "..getPlayerName(source).." "..message, player2, 255, 0, 255, false)

            elseif mType == "do" then
                outputChatBox("["..(#recipients-1).."] * "..message.." ("..getPlayerName(source)..")", player2, 175, 215, 255, false)

            end
    end
end

addCommandHandler("do", function(player, cmd, ...)
    rpChat(player, table.concat({...}, " "), "do")
end)

antiLocalTick = {}

function isPlayerLoggedIn(player)
	if (not isElement(player) or getElementType(player) ~= "player") then return false end
	local account = getPlayerAccount(player)
	if (isGuestAccount(account)) then return false end
	return true
end

function localChat(player, _, ...)
    if (not isPlayerLoggedIn(player)) then return end
    muted = false
	if (muted) then
		outputChatBox("* ERROR: You are globally muted.", player, 255, 25, 25)
		return
	end
	
    if (not antiLocalTick[player]) then
        antiLocalTick[player] = {}
    end
    antiLocalTick[player][1] = getTickCount()
    local message = table.concat({...}, " ")
    if (not message) then return end
    repeat message = message:gsub("#%x%x%x%x%x%x", "") until not message:find("#%x%x%x%x%x%x")
    if (message == "") then return end
    local posX, posY, posZ = getElementPosition(player)
    local dim = getElementDimension(player)
    local recipients = {}
    for index, player2 in pairs(getElementsByType("player")) do
        local posX2, posY2, posZ2 = getElementPosition(player2)
        local dim2 = getElementDimension(player2)
        if (getDistanceBetweenPoints3D(posX, posY, posZ, posX2, posY2, posZ2)) <= 100 then
            if dim == dim2 then
                table.insert(recipients, player2)
            end
        end
    end

    if string.find(message, "/me", 1, true) then
        local message1 = string.gsub(message, "/me ", "")
        if message1 ~= "" then
            rpChat(player, message1, "me")
            return
        end
    elseif string.find(message, "/do", 1, true) then
        local message1 = string.gsub(message, "/do ", "")
        if message1 ~= "" then
            rpChat(player, message1, "do")
            return
        end
    end
    for index, player2 in pairs(recipients) do
        local r, g, b = getPlayerNametagColor(player)
        local name = getPlayerName(player2)
            outputChatBox("(Local)["..(#recipients-1).."] "..getPlayerName(player)..": #FFFFFF"..message, player2, r or 255, g or 255, b or 255, true)
    end
    triggerEvent("onPlayerLocalChat", player, message, recipients)
end
addCommandHandler("local", localChat)

function getHexFromRGB(r, g, b)
    return ("#%02X%02X%02X"):format(r, g, b)
end

function bindLocalChat()
    bindKey(source, "u", "down", "chatbox", "local")
end
addEventHandler("onPlayerJoin", root, bindLocalChat)

function bindLocalChatForAll()
    for index, player in pairs(getElementsByType("player")) do
        bindKey(player, "u", "down", "chatbox", "local")
    end
end
addEventHandler("onResourceStart", resourceRoot, bindLocalChatForAll)

function addBubble(message, recipients, show)
    if show then
        if show ~= false then
            for index, player in pairs(recipients) do
                    triggerClientEvent(player, "SAlocalchat.addBubble", source, message)
            end
        end
    else
        for index, player in pairs(recipients) do
                triggerClientEvent(player, "SAlocalchat.addBubble", source, message)
        end
    end
end
addEvent("onPlayerLocalChat")
addEventHandler("onPlayerLocalChat", root, addBubble)

function noteChat(source, command, ...)
    if (not isPlayerLoggedIn(source)) then return end
	staff = true
	if (not staff) then return end
	local acc = getPlayerAccount(source)
	local accName = getAccountName(acc)

    local message = table.concat({...}, " ")
    if (message == "") then return end
    noteNick = getPlayerName(source)
	for index, player2 in pairs(getElementsByType("player")) do
		outputChatBox("#FF0000(NOTE) "..noteNick..": #FFFFFF"..message, player2, 255, 255, 255, true)
		triggerClientEvent(player2, "SAlocalchat.playSound", player2)
	end
end
addCommandHandler("note", noteChat)

local ccSpam = {}
function carChat(player, cmd, ...)
    if (not isPlayerLoggedIn(player)) then return end
    if (not isPedInVehicle(player)) then return end
	
    if (ccSpam[player]) then
        outputChatBox("You need to wait 1 second between each message", player, 255, 0, 0)
        return
    end
    ccSpam[player] = true
    setTimer(function(player) ccSpam[player] = nil end, 1000, 1, player)

    local message = table.concat({...}, " ")
    repeat message = message:gsub("#%x%x%x%x%x%x", "") until not message:find("#%x%x%x%x%x%x")
    if (message == "") then return end

    local vehicle = getPedOccupiedVehicle(player)
    for i,plr in pairs(getVehicleOccupants(vehicle)) do
        outputChatBox("(Car) "..getPlayerName(player)..": #FFFFFF"..message, plr, 255, 25, 125, true)
    end
end
addCommandHandler("cc", carChat)

function RGBToHex(red, green, blue, alpha)
    if ((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
        return nil
    end
    if (alpha) then
        return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
    else
        return string.format("#%.2X%.2X%.2X", red,green,blue)
    end
end

function disableShowChat(command)
    if (command ~= "showchat") then return end
    if (isPlayerLoggedIn(source)) then return end
    cancelEvent()
end
addEventHandler("onPlayerCommand", root, disableShowChat)
