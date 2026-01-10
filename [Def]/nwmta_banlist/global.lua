-- Véglegesen kitiltott játékosok serial-nak listája --
banSerials = {
	  --["játékos serial-ja"] = {"Indok", "Kitiltotta"},
}

-- Ez a funkció ellenőrzi hogy a játékos ki lett-e tiltva a szerverről --
function getPlayerBaned(player)
	if (player) then
		if (banSerials[getPlayerSerial(player)]) then
			return true
		else
			return false
		end
	else
		return false
	end
end

-- Ellenőrzi a játékos kitiltásának okát és vissza küldi --
function getPlayerBanedReason(player)
	if (player) then
		if (isPlayerBaned(player)) then
			return banSerials[getPlayerSerial(player)][1]
		else
			return false
		end
	else
		return false
	end
end

--Admin aki kitiltotta a játékost--
function getPlayerBanedAdmin(player)
	if (player) then
		if (isPlayerBaned(player)) then
			return banSerials[getPlayerSerial(player)][2]
		else
			return false
		end
	else
		return false
	end
end
