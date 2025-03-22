-- /me parancs --
function sendMeMessage(cmd, ...)
	--if (getElementData(localPlayer, "login")) then
		if not (...) then
			outputChatBox("Szintaxis: /"..cmd.." [Cselekvés]", 255, 194, 14)
		else
			if not (isPedDead(localPlayer)) then
				local message = table.concat({...}, " ")
				triggerServerEvent("sendMeMessageServer", resourceRoot, localPlayer, message)
			end
		end
	--end
end
addCommandHandler("me", sendMeMessage)

function sendDoMessage(cmd, ...)
	--if (getElementData(localPlayer, "login")) then
		if not (...) then
			outputChatBox("Szintaxis: /"..cmd.." [Történés]", 255, 194, 14)
		else
			if not (isPedDead(localPlayer)) then
				local message = table.concat({...}, " ")
				triggerServerEvent("sendDoMessageServer", resourceRoot, localPlayer, message)
			end
		end
	--end
end
addCommandHandler("do", sendDoMessage)
