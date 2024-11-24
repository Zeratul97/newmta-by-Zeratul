-- Játékos parancsait ellenőrző esemény --
addEventHandler("onPlayerCommand", getRootElement(),
    function(command)
	local disabledCommands = exports["devsystem"]:getCMDDisabled(command)
	local devSerial = exports["devsystem"]:getDevSerials(source)
	local devCommands = exports["devsystem"]:getDeveloperCMD(command)

	if (disabledCommands) then
	    cancelEvent()
	end
	if (devCommands) then
	    if not (devSerial) then
		cancelEvent()
		outputChatBox("Nem vagy fejlesztő!", source, 255, 255, 255, true)
	     end
	else
		cancelEvent()
	end
   end
)

-- Pozíció lekérdezés --
function getPos(player, cmd)
	local devSerial = exports["devsystem"]:getDevSerials(player)
	if (devSerial) or (getElementData(player, "admin >> level") >= 10 ) then
		local x, y, z = getElementPosition(player)
		local dim = getElementDimension(player)
		local int = getElementInterior(player)

		outputChatBox("X koordináta: "..x, player, 255, 255, 255, true)
		outputChatBox("Y koordináta: "..y, player, 255, 255, 255, true)
		outputChatBox("Z koordináta: "..z, player, 255, 255, 255, true)
		outputChatBox("Dimenzió: "..dim, player, 255, 255, 255, true)
		outputChatBox("Interior: "..int, player, 255, 255, 255, true)
	end
end
addCommandHandler("getpos", getPos)
