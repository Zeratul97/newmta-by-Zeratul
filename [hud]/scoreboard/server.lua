players = {}
local slot = nil

addEventHandler("onResourceStart", getRootElement(),
	function(resource)
		for i, p in pairs(getElementsByType("player")) do
			slot = p
			setElementData(p, "player >> id", i)
		end
	end
)

-- Játékos csatlakozása --
addEventHandler("onPlayerJoin", getRootElement(),
	function()
		for i=1, 20 do
			if (players[i] == nil) then
				slot = i
				break
			end
		end
		players[slot] = source
		setElementData(source, "player >> id", tonumber(slot))
	end
)

-- Játékos lecsatlakozik --
addEventHandler("onPlayerQuit", getRootElement(),
	function()
		local slot = getElementData(source, "player >> id")
		players[slot] = nil
		setElementData(source, "player >> id", false)

	end
)

function getPlayerId(player, cmd)
	outputChatBox("ID-d: "..getElementData(player, "player >> id"), player, 255, 255, 255, true)
end
addCommandHandler("getmyid", getPlayerId)
