whiteSerials = {
    --["serial"] = true,
    ["3EEE639776EC134366D2D005508912F3"] = true,
    ["41639FBFEC977F0DD244C7CFDA2BC391"] = true,
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
