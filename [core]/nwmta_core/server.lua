-- Mod elindulásakor lefutó esemény --
addEventHandler("onResourceStart", getRootElement(),
    function(resource)
        local name = exports["nwmta_core"]:getModData("mod_name")
        local version = exports["nwmta_core"]:getModData("mod_version")
        local city = exports["nwmta_core"]:getModData("mod_city")

        setGameType(name.." "..version) --Beállítja a szerver nevét
        setMapName(city) -- beállítja a szerver map-ját

        local realtime = getRealTime() --Lekérdezi az időt
        setTime(realtime.hour, realtime.minute) --Beállítja a szerver időt
        setMinuteDuration(60000) -- Beállítja a játékban lévő idő telését, ugyan olyan lassan fog telni mint a valódi időben
    end
)

-- Játékos felcsatlakozik a szerverre akkor fut le ez az esemény --
addEventHandler("onPlayerJoin", getRootElement(),
    function()
        local player = source
        local playerBaned = exports["nwmta_banlist"]:getPlayerBaned(player)
        
        if (playerBaned) then --Ha a játékos ki lett tiltva akkor
            local banReason = exports["nwmta_banlist"]:getPlayerBanedReason(player)
			      local banAdmin = exports["nwmta_banlist"]:getPlayerBanedAdmin(player)
			      kickPlayer(player, banAdmin, banReason:gsub("_", " "))
        else
            local resourceTable = getResources()
            for resourceKey, resourceValue in ipairs(resourceTable) do
                local name = getResourceName(resourceValue)
                if (name == "nwmta_whitelist") then -- ha a script neve 'nwmta_whitelist' akkor
                    if (getResourceState(resourceValue) == "running") then -- Ha fut a script(nwmta_whitelist)
                        local whitePlayerSerial = exports["nwmta_whitelist"]:getWhiteSerial(player)
                        if not (whitePlayerSerial) then --Ha a játékos serialja nincs benne a scriptben
                            kickPlayer(player, "A szerveren fejlesztés/karbantartás folyik!")
                        else
                            spawnPlayer(player, 1642.30, -2330.39, 13.54, 0, 0)
							              fadeCamera(player, true)
							              setCameraTarget(player, player)
                        end
                    else
                        spawnPlayer(player, 1642.30, -2330.39, 13.54, 0, 0)
							          fadeCamera(player, true)
							          setCameraTarget(player, player)
                    end
                end
            end
        end
        setPlayerNametagShowing(source, false) -- Tiltja az alap nevek láthatóságát
		    triggerClientEvent(root, "logMessageServer", root, "#ef564b"..getPlayerName(player).."#6bbfff felcsatlakozott a szerverre.") --Log rész, amit minden admin megkap
    end
)

-- Játékos kilép a szerverről --
addEventHandler("onPlayerQuit", getRootElement(),
    function(quitT, reason, responsibleElement)
        local quitTypeN = ""
        local resElement = ""
        local player = source
        if (quitType == "Quit") then
            quitTypeName = "Kilépés"
        elseif (quitType == "Kicked") then
            quitTypeName = "Kirúgás"
        elseif (quitType == "Banned") then
            quitTypeName = "Kitiltás"
        elseif (quitType == "Bad Connection") then
            quitTypeName = "Rossz internet kapcsolat"  
        elseif (quitType == "Timed out") then
            quitTypeName = "Időtúllépés"
        else
            quitTypeName = "Ismeretlen"
        end
        if (responsibleElement) then
            if (getElementType(responsibleElement) == "player") then
                resElement = getElementData(responsibleElement, "admin -> nick")
            else
                resElement = "Konzol"
            end
        end
        if (quitType == "Kicked") or (quitType == "Banned") then
            triggerClientEvent(root, "logServer", root, "#ef564b"..getPlayerName(player).."#6bbfff kilépett a szerverről [#ef564b"..quitTypeName.."#6bbfff]. Indok: #ef564b"..reason.."#6bbfff ! Felelős: #ef564b"..resElement.."#6bbfff !")
        else
            triggerClientEvent(root, "logServer", root, "#ef564b"..getPlayerName(player).."#6bbfff kilépett a szerverről [#ef564b"..quitTypeName.."#6bbfff] !")
        end
    end
)
