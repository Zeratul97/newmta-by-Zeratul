-- Játékos felcsatlakozik a szerverre akkor fut le --
addEventHandler("onPlayerJoin", getRootElement(),
	function()
		local banSerial = exports["nwmta_banlist"]:banSerialList(source)

		if (banSerial) then
			kickPlayer(source, "nwmta_banlist", "Véglegesen ki lettél tiltva a szerverről!")
		end
	end
)
