teamSerials = {
	["serial"] = true,
}

-- Játékos serial-ja szerepel-e az adminok serial-ja között --
function isPlayerAdminSerial(player)
	if (isElement(player)) then
		if (teamSerials[getPlayerSerial(player)]) then
			return true
		else
			return false
		end
	else
		return false
	end
end

-- Játékos admin -e vagy sem --
function isPlayerAdmin(player)
	if (isElement(player)) then
		if (getElementData(player, "admin >> level") > 0) then
			return true
		else
			return false
		end
	else
		return false
	end
end
