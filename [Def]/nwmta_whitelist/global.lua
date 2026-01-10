-- Karbantartáskor/Fejlesztéskor felcsatlakozásának engedélyezése bizonyos serial-nak --
whitePlayerSerials = {
	  ["serial"] = true, --Fejlesztők/Barátok/Teszterek serial-ja
}

-- Fejlesztők és engedélyezett játékosok serial-jának ellenőrzése és eredmény vissza küldése --
function getWhiteSerial(player)
	  if (player) then
		    if (whitePlayerSerials[getPlayerSerial(player)]) then
			      return true
		    else
			      return false
		    end
	  else
		    return false
	  end
end
