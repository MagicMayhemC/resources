function createNewDxMessage(p,text,r,g,b)
	local e = false
	if (p) and (text) then if isElement(text) then e = text else e=p end end
	if not(isElement(e)) then return end
	if e == text then
		triggerClientEvent(e,"SAdx.createNewDxMessage",e,p,r,g,b)
	else
		triggerClientEvent(e,"SAdx.createNewDxMessage",e,text,r,g,b)
	end
end

function createNewDxMessageBot(p,text,r,g,b)
	local e = false
	if (p) and (text) then if isElement(text) then e = text else e=p end end
	if not(isElement(e)) then return end
	if e == text then
		triggerClientEvent(e,"SAdx.createNewDxMessageBot",e,p,r,g,b)
	else
		triggerClientEvent(e,"SAdx.createNewDxMessageBot",e,text,r,g,b)
	end
end
