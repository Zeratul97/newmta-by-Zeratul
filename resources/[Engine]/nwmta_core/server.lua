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
			kickPlayer(source, "Véglegesen ki lettél tiltva a szerverről! Indok:"..reason)
		else
			 local resourceTable = getResources() 
    		 for resourceKey, resourceValue in ipairs(resourceTable) do
          
          		local resourName = getResourceName(resourceValue)

          		if (resourName == "nwmta_whitelist") then
          			if (getResourceState(resourceValue) == "running") then
          				local whiteSerial = exports["nwmta_whitelist"]:isWhiteSerial(source)

          				if not (whiteSerial) then
          					kickPlayer(source, "A szerveren karbantartás/fejlesztés folyik!")
          				else
          					spawnPlayer(source, 0, 0, 4, 0, 0)
          					fadeCamera(source, true)
          					setCameraTarget(source, source)
          				end

          			else
          				spawnPlayer(source,  0, 0, 4, 0, 0)
          				fadeCamera(source, true)
          				setCameraTarget(source, source)
          			end
          		end
          	end

		end

		triggerClientEvent(root, "serverLogMessage", root, "#f94d40"..playerName.."#6bbfff felcsatlakozott a szerverre!")
	end
)

-- Játékos kilép a szerverről --
addEventHandler("onPlayerQuit", getRootElement(),
	function(quitType, reason, responsibleElement)

		local playerName = getPlayerName(source):gsub("_", " ")

		local quitTypeText = ""

			
		if (quitType == "Quit") then
			quitTypeText = "Kilépés"
		elseif (quitType == "Kicked") then
			quitTypeText = "Kirúgás"
		elseif (quitType == "Banned") then
			quitTypeText = "Ban"
		elseif (quitType == "Bad Connection") then
			quitTypeText = "Internet hiba"
		elseif (quitType == "Bad Connection") then
			quitTypeText = "Időtúllépés"
		else
			quitTypeText = "Ismeretlen"
		end

		if (quitType == "Kicked") or (quitType == "Banned") then
			triggerClientEvent(root, "serverLogMessage", root, "#f94d40"..playerName.."#6bbfff kilépett a szerverről! Oka: #f94d40"..quitTypeText.."#6bbfff Indok: #f94d40"..reason.."#6bbfff Felelős: #f94d40"..responsibleElement.."#6bbfff !")
		else
			triggerClientEvent(root, "serverLogMessage", root, "#f94d40"..playerName.."#6bbfff kilépett a szerverről! Oka: #f94d40"..quitTypeText.."#6bbfff!")
		end
		

	end

)
