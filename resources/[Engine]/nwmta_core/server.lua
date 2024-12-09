addEventHandler("onResourceStart", getRootElement(),
     function(resource)
	 local serverName = exports["nwmta_core"]:isServerDatas("name")
	 local serverVersion = exports["nwmta_core"]:isServerDatas("version")
	 local serverCity = exports["nwmta_core"]:isServerDatas("city")

	 setGameType(serverName.." "..serverVersion)
	 setMapName(serverCity)
     end
)
-- Játékos csatlakozik a szerverre --
addEventHandler("onPlayerJoin", getRootElement(),
    function()
        local playerName = getPlayerName(source):gsub("_", " ")
        local banSerial = exports["nwmta_banlist"]:isSerialBan(source)
        local reason = exports["nwmta_banlist"]:isBanReason(source)
        -- Ellenőrizzük a játékos serial-ja banolva van-e--
	if (banSerial) then

	else

	end
		
    end
)
