banSerials = {
    --["serial"] = "Indok",
}

-- Ellenőrzi hogy a játékos serial-ja banolva van-e, ha igen akkor true(igaz) értéket küld vissza --
function isSerialBan(player)
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

-- Vissza küldi a banolás okát --
function isBanReason(player)
    if (player) then
	if (banSerials[getPlayerSerial(player)]) then
	     return banSerials[getPlayerSerial(player)]
	else
	     return false
	end
    else
	return false
    end
end
