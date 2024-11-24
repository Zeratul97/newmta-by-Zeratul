-- Véglegesen kitiltott játékosok serial-ja, ebbe a listába kerül akkor kirúgja a rendszer --
banSerials = {
	  ["serial"] = true,
}

-- Lekérdezi hogy a játékos serial-ja megtalálható -e a listában --
function banSerialList(player)
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
