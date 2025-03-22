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
