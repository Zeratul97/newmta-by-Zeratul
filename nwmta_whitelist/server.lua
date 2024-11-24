-- Játékos felcsatlakozik a szerverre akkor fut le --
addEventHandler("onPlayerJoin", getRootElement(),
    function()
	local banSerial = exports["nwmta_banlist"]:banSerialList(source)
	local whiteListSerial = exports["nwmta_whitelist"]:getWhiteListSerial(source)

	if not (banSerial) then -- Ha a játékos serial-ja nincs titlva akkor
	   if not (whiteListSerial) then -- Ha a játékos serialja nincs a whitelist tömbjében
	        kickPlayer(source, "nwmta_whitelist", "Szerveren fejlesztés/karbantartás folyik!")
	   end
	end
    end
)
