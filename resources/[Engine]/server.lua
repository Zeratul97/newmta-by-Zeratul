-- Script elindulásakor beállítja az időt, az idő múlasát, a mod nevét, verzióját és a város nevét --
addEventHandler("onResourceStart", getRootElement(),
    function(resource)
        local serverDataName = exports["nwmta_engine"]:isServerData("name") or "NewMTA"
        local serverDataVersion = exports["nwmta_engine"]:isServerData("version") or "v0.0.1"
        local serverDataCity = exports["nwmta_engine"]:isServerData("city") or "Los Santos"

        setGameType(serverDataName.." "..serverDataVersion)
        setMapName(serverDataCity)

        local realtime = getRealTime()

        setTime(realtime.hour, realtime.minute)
        setMinuteDuration(60000)
    end
)
