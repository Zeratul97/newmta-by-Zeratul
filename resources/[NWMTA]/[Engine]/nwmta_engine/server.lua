-- Script elinduláskor fut le --
addEventHandler("onResourceStart", getRootElement(),
	function(resource)
		local serverName = exports.nwmta_engine:getServerData("server_name")
		local serverVersion = exports.nwmta_engine:getServerData("server_version")
		local serverCity = exports.nwmta_engine:getServerData("server_city")
		
		setGameType(serverName.." v"..serverVersion)
		setMapName(serverCity)

		local realtime = getRealTime()

		setTime(realtime.hour, realtime.minute)
		setMinuteDuration(60000)
	end
)
