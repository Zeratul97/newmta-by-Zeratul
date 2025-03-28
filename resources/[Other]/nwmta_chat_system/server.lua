addEventHandler("onPlayerChat", getRootElement(),
    function(message, messageType)
        cancelEvent()
        if (messageType == 0) then
	    --if (getElementData(source, "login")) then
                if not (isPedDead(source)) then
                   local x, y, z = getElementPosition(source)
                   local int = getElementInterior(source)
                   local dim = getElementDimension(source)
                   for i, players in ipairs(getElementsByType("player")) do
			--if (getElementData(players, "login")) then
			    local pX, pY, pZ = getElementPosition(players)
			    local pInt = getElementInterior(players)
			    local pDim = getElementDimension(players)

			    if (int == pInt) then
				if (dim == pDim) then
				    local distance = getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ)
				    if (distance < 30) then
					local chatColor = exports["nwmta_core"]:getChatColor(distance)
					local playerName = exports["nwmta_core"]:isPlayerName(source)

					outputChatBox(chatColor..""..playerName.." mondja: "..message, players, 255, 255, 255, true)
				    end
				end
			    end
			--end
                   end
                end
	    --end
        end
    end
)

addEvent("sendMeMessageServer", true)
addEventHandler("sendMeMessageServer", getRootElement(),
    function(player, message)
        local x, y, z = getElementPosition(player)
        local int = getElementInterior(player)
        local dim = getElementDimension(player)

        for i, players in ipairs(getElementsByType("player")) do
	    --if (getElementData(players, "login")) then
                   local pX, pY, pZ = getElementPosition(players)
                   local pInt = getElementInterior(players)
                   local pDim = getElementDimension(players)
                   if (int == pInt) then
			if (dim == pDim) then
			    local distance = getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ)
			    if (distance < 30) then
				local playerName = exports["nwmta_core"]:isPlayerName(player)
				outputChatBox("*** "..playerName.." "..message, players, 194, 162, 218, true)
			    end
			end
                   end
	    --end
        end
    end
)

addEvent("sendDoMessageServer", true)
addEventHandler("sendDoMessageServer", getRootElement(),
    function(player, message)
        local x, y, z = getElementPosition(player)
        local int = getElementInterior(player)
        local dim = getElementDimension(player)

        for i, players in ipairs(getElementsByType("player")) do
	    --if (getElementData(players, "login")) then
                   local pX, pY, pZ = getElementPosition(players)
                   local pInt = getElementInterior(players)
                   local pDim = getElementDimension(players)
                   if (int == pInt) then
			if (dim == pDim) then
			    local distance = getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ)
			    if (distance < 30) then
				local playerName = exports["nwmta_core"]:isPlayerName(player)
				outputChatBox("* "..message.." ["..playerName.."]", players, 255, 51, 102, true)
			    end
			end
                   end
	    --end
        end
    end
)

function shoutMessage(player, cmd, ...)
    --if (getElementData(player, "login")) then
        if not (...) then
			outputChatBox("Szintaxis: /"..cmd.." [Üzenet]", player, 255, 194, 14)
        else
	    if not (isPedDead(player)) then
                   local x, y, z = getElementPosition(player)
                   local int = getElementInterior(player)
                   local dim = getElementDimension(player)
                   for i, players in ipairs(getElementsByType("player")) do
			--if (getElementData(players, "login")) then
			    local pX, pY, pZ = getElementPosition(players)
			    local pInt = getElementInterior(players)
			    local pDim = getElementDimension(players)
			    if (int == pInt) then
				if (dim == pDim) then
				    local distance = getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ)
				    if (distance < 30) then
					local playerName = exports["nwmta_core"]:isPlayerName(player)
					local message = table.concat({...}, " ")
					outputChatBox(playerName.." kiáltja: "..message, players, 255, 255, 255)
				    end
				end
			    end
			--end
                   end
	    end
        end
    --end
end
addCommandHandler("s", shoutMessage)

function whisperMessage(player, cmd, ...)
    --if (getElementData(player, "login")) then
        if not (...) then
	    outputChatBox("Szintaxis: /"..cmd.." [Üzenet]", player, 255, 194, 14)
        else
	    if not (isPedDead(player)) then
		local x, y, z = getElementPosition(player)
		local int = getElementInterior(player)
		local dim = getElementDimension(player)
		for i, players in ipairs(getElementsByType("player")) do
		     --if (getElementData(players, "login")) then
			 local pX, pY, pZ = getElementPosition(players)
			 local pInt = getElementInterior(players)
			 local pDim = getElementDimension(players)
			 if (int == pInt) then
			     if (dim == pDim) then
				 local distance = getDistanceBetweenPoints3D(x, y, z, pX, pY, pZ)
				 if (distance < 8) then
				     local playerName = exports["nwmta_core"]:isPlayerName(player)
				     local message = table.concat({...}, " ")
				     outputChatBox(playerName.." suttogja: "..message, players, 255, 255, 255)
				 end
			     end
			 end
		     --end
		end
	    end
        end
    --end
end
addCommandHandler("w", whisperMessage)
