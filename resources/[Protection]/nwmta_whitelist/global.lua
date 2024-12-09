whiteSerials = {
    --["serial"] = true,
}

-- Ellenőrzi hogy a játékos serial-ja szerepel a listában, ha igen akkor true(igaz) értéket küld vissza --
function isWhiteSerial(player)
    if (player) then
	if (whiteSerials[getPlayerSerial(player)]) then
	    return true
	else
	    return false
	end
    else
	return false
    end
end
