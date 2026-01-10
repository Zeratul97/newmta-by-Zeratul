-- Fejlesztői serial-ok listája --
devSerials = {
	["fejlesztő serial-ja"] = true, --Fejlesztők serialja kerül ide
}

-- Fejlesztő-e a játékos avagy sem --
function getDevSerial(player)
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
