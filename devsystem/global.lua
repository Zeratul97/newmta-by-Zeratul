-- Fejlesztői serial-ok --
devSerials = {
	["serial"] = true,
}

-- Fejlesztői parancsok --
devCommands = {
	["start"] = true,
	["stop"] = true,
	["restart"] = true,
	["refresh"] = true,
	["refreshall"] = true,
	["debugscript"] = true,
	["reloadacl"] = true,
}

-- Tiltott parancsok --
disabledCommands = {
	["register"] = true,
	["login"] = true,
}

-- Játékos serial-ja benne van-e a fejlesztői serial-ban --
function isPlayerSerial(player)
	if (player) then
		if (devSerials[getPlayerSerial(player)]) then
			return true
		else
			return false
		end
	else
		return false
	end
end
