-- Titlott parancsok --
disabledCMD = {
	   ["login"] = true,
	   ["register"] = true,
	   ["refreshall"] = true,
}

-- Fejlesztői parancsok --
devCMD = {
	["start"] = true,
	["stop"] = true,
	["restart"] = true,
	["refresh"] = true,
	["debugscript"] = true,
	["reloadacl"] = true,

	-- Új parancsok --
	["getpos"] = true,
	["devmode"] = true,
	["collisionshowing"] = true,
}

devSerials = {
	["3EEE639776EC134366D2D005508912F3"] = true,
}

-- Ellenőrzi hogy a parancs tiltva van-e --
function isDisabledCMD(cmd)
	if (cmd) then
		if (disabledCMD[cmd]) then
			return true
		else
			return false
		end
	else
		return false
	end
end

-- Ellenőrzi hogy a parancs fejlesztői parancs-e --
function isDevCMD(cmd)
	if (cmd) then
		if (devCMD[cmd]) then
			return true
		else
			return false
		end
	else
		return false
	end
end

-- Ellenőrzi hogy a játékos fejlesztő-e vagy sem --
function isPlayerDev(player)
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
