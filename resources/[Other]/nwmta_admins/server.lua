local modName = exports["nwmta_engine"]:isServerData("name") or "NewMTA"

-- Admin pozició lekérdezése /getpos --
function getAdminPos(player, cmd)
    local admin = exports["nwmta_admins"]:isPlayerAdmin(player)
    local devSerial = exports["nwmta_dev"]:isPlayerDev(player)
    --if (getElementData(player, "login") == true) then
	if (admin) or (devSerial) then
	    local x, y, z = getElementPosition(player)
	    local int = getElementInterior(player)
	    local dim = getElementDimension(player)
	    local rotX, rotY, rotZ = getElementRotation(player)
	    
	    outputChatBox("["..modName.." - Rendszer]: X koordináta: "..x, player, 255, 255, 255, true)
	    outputChatBox("["..modName.." - Rendszer]: Y koordináta: "..y, player, 255, 255, 255, true)
	    outputChatBox("["..modName.." - Rendszer]: Z koordináta: "..z, player, 255, 255, 255, true)
	    outputChatBox("["..modName.." - Rendszer]: X rotáció: "..rotX, player, 255, 255, 255, true)
	    outputChatBox("["..modName.." - Rendszer]: Y rotáció: "..rotY, player, 255, 255, 255, true)
	    outputChatBox("["..modName.." - Rendszer]: Z rotáció: "..rotY, player, 255, 255, 255, true)
	    outputChatBox("["..modName.." - Rendszer]: Interior: " ..int, player, 255, 255, 255, true)
	    outputChatBox("["..modName.." - Rendszer]: Dimenzió: "..dim, player, 255, 255, 255, true)
	else
	    outputChatBox("["..modName.." - Rendszer]: Nem vagy admin, ezért nem használhatod ezt a parancsot!", player, 255, 255, 255, true)
	end
    --end
end	
addCommandHandler("getpos", getAdminPos, false, false)

-- Admin felhívás /asay --
function adminSay(player, cmd, ...)
    local admin = exports["nwmta_admins"]:isPlayerAdmin(player)
    local devSerial = exports["nwmta_dev"]:isPlayerDev(player)
    --if (getElementData(player, "login") == true) then
	if (admin) or (devSerial) then
	    if not (...) then
		outputChatBox("#FFC000[Szintaxis]: /"..cmd.." [Üzenet]", player, 255, 255, 255, true)
	    else
		local message = table.concat({...}, " ")
		local adminNick = getElementData(player, "admin >> nick") or "Ismeretlen"
		outputChatBox("#ef564b[Admin felhívás]: "..adminNick..": "..message, root, 255, 255, 255, true)
	    end
	end
    --end
end
addCommandHandler("asay", adminSay, false, false)

-- Játékos kirúgása: --
function kickPlayer(player, cmd, target, ...)
    if (getElementData(player, "login") == true) then
        local admin = exports["nwmta_admins"]:isPlayerAdmin(player)
        local devSerial = exports["nwmta_dev"]:isPlayerDev(player)
        local reason = table.concat({...}, " ")
        if (admin) then
	    if (getElementData(player, "admin >> level") > 0) then
		if not (getElementData(player, "admin >> duty")) then
                     outputChatBox("#d9534f["..modName.."]: #FFFFFFCsak szolgálatban használhatod a /"..cmd.." parancsot!", player, 255, 0, 0, true)
		else
                     if not (target or (...)) then
			  outputChatBox("#FFC000[Szintaxis]: /"..cmd.." [Játékos] [Indok]", player, 255, 255, 255, true)
                     else
			  local targetPlayer = exports["nwmta_engine"]:findPlayer(player, target)
			  if (targetPlayer) then
			      local adminNick = getElementData(player, "admin >> nick") or "Ismeretlen"
			      outputChatBox("#f68c2b[Kick]: #ef564b"..adminNick.."#FFC000 kirúgta a szerverről, #ef564b"..getPlayerName(targetPlayer).."#FFC000 nevű játékost!", root, 255, 255, 255, true)
			      outputChatBox("#f68c2b[Kick]: Indok: #ef564b"..reason:gsub("_", " "), root, 255, 255, 255, true)
			      kickPlayer(targetPlayer, adminNick, reason:gsub("_", " "))
			  end
                     end
		end
	    end
        end
        if (devSerial) then
	    if not (target or (...)) then
		outputChatBox("#FFC000[Szintaxis]: /"..cmd.." [Játékos] [Indok]", player, 255, 255, 255, true)
	    else
		local targetPlayer = exports["nwmta_engine"]:findPlayer(player, target)
		if (targetPlayer) then
		    local adminNick = getElementData(player, "admin >> nick") or "Ismeretlen"
		    outputChatBox("#f68c2b[Kick]: #ef564b"..adminNick.."#FFC000 kirúgta a szerverről, #ef564b"..getPlayerName(targetPlayer).."#FFC000 nevű játékost!", root, 255, 255, 255, true)
		    outputChatBox("#f68c2b[Kick]: Indok: #ef564b"..reason:gsub("_", " "), root, 255, 255, 255, true)
		    kickPlayer(targetPlayer, adminNick, reason:gsub("_", " "))
		end
	    end
        end
    end
end
addCommandHandler("kick", kickPlayer, false, false)
