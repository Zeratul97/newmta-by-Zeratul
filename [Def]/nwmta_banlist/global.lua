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
