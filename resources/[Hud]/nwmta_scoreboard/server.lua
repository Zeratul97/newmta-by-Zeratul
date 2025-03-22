local players = {}

function playerConnection()
    local slot = nil

    for i=1, 400 do
		    if (players[i] == nil) then
			      slot = i
			      break
		    end
    end
	players[slot] = source
	setElementData(source, "player >> id", slot)
end
addEventHandler("onPlayerJoin", getRootElement(), playerConnection)

function resourceStart()
	for key, value in ipairs(getElementsByType("player")) do
		players[key] = value
		setElementData(value, "player >> id", key)
	end
end
addEventHandler("onResourceStart", getRootElement(), resourceStart)

function playerQuit()
	local slot = getElementData(source, "player >> id")
	if (slot) then
		players[slot] = nil
	end
end
addEventHandler("onPlayerQuit", getRootElement(), playerQuit)
