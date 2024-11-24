-- Fejlesztés idején kik léphetnek fel a szerverre --
whiteSerailList = {
    --["serial"] = true,
    --["serial"] = true,
}

-- Ellenőrzi a játékos serial-ja megtalálható a listában --
function getWhiteListSerial(player)
    if (player) then
	if (whiteSerailList[getPlayerSerial(player)]) then
	    return true
	else
	    return false
	end
    else
	return false
    end	
end
