local con = exports["nwmta_mysql"]:connectionExecute()
local atmID = 2942
local atms = {}
local modName = exports["nwmta_engine"]:isServerData("name") or "NewMTA"

-- ATM-ek betöltése --
function atmLoads(data)
    atms[tonumber(data["id"])] = createObject(atmID, data["xPos"], data["yPos"], data["zPos"])
    setElementRotation(atms[tonumber(data["id"])], 0, 0, data["rotation"])
    setElementDimension(atms[tonumber(data["id"])], data["dimension"])
    setElementInterior(atms[tonumber(data["id"])], data["interior"])
    setElementData(atms[tonumber(data["id"])], "atm >> id", tonumber(data["id"]))
    setElementData(atms[tonumber(data["id"])], "object >> atm", true)
end

-- Adatbázis lekérdezése --
dbQuery(
    function(data)
	local results, lines = dbPoll(data, 500)
	for key, i in ipairs(results) do
	    atmLoads(i)
	end
    end, con, "SELECT * FROM atms"
)

-- ATM létrehozás --
function createAtmFunction(player, cmd)
    --if (getElementData(player, "login")) then
	local admin = exports["nwmta_admins"]:isPlayerAdmin(player)
	local devSerial = exports["nwmta_dev"]:isPlayerDev(player)
	if (admin) then
            if (getElementData(player, "admin >> duty")) then
		if (getElementData(player, "admin >> level") >= 4) then
		    local x,y,z = getElementPosition(player)
		    local interior = getElementInterior(player)
		    local dimenzio = getElementDimension(player)
		    local rotx, roty, rotz = getElementRotation(player)
		    dbExec(con, "INSERT INTO atms SET xPos=?, yPos=?, zPos=?, rotation=?, dimension=?, interior=?", x, y-1, z-0.35, rotz+1, dimenzio, interior)
		    dbQuery(
	                function(data)
                            local results, lines = dbPoll(data, 500)
                            if (lines > 0) then
                                atmLoads(results[1])
                                local adminNick = getElementData(player, "admin >> nick") or "Ismeretlen"
                                outputChatBox("#8dec62["..modName.."]:#ffffff Sikeresen létrehoztál egy ATM-et! ID: #5db1fd"..results[1].id.."", player, 255, 255, 255, true)
                                triggerClientEvent(root, "serverAdminDiaryMessage", root, "#ef564b"..adminNick.." #6bbffflétrehozott egy ATM-et, ATM ID-je: #ef564b"..results[1].id.." #6bbfff!")
                            else
                                outputChatBox("#ef564b["..modName.."]: ATM létrehozás sikertelen volt!", player, 255, 255, 255, true)
                            end
	                end, con, "SELECT * FROM atms WHERE id=LAST_INSERT_ID()"
		    )
		else
		    outputChatBox("#ef564b Nem vagy elég magas rangú admin!", player, 255, 255, 255, true)
		end
            else
		outputChatBox("#ef564b Nem vagy admin szolgálatban!", player, 255, 255, 255, true)
            end
	end
	if (devSerial) then
	    local x,y,z = getElementPosition(player)
	    local interior = getElementInterior(player)
	    local dimenzio = getElementDimension(player)
	    local rotx, roty, rotz = getElementRotation(player)
	    dbExec(con, "INSERT INTO atms SET xPos=?, yPos=?, zPos=?, rotation=?, dimension=?, interior=?", x, y-1, z-0.35, rotz+1, dimenzio, interior)
	    dbQuery(
		function(data)
		    local results, lines = dbPoll(data, 500)
		    if (lines > 0) then
			atmLoads(results[1])
			local adminNick = getElementData(player, "admin >> nick") or "Ismeretlen"
			outputChatBox("#8dec62["..modName.."]:#ffffff Sikeresen létrehoztál egy ATM-et! ID: #5db1fd"..results[1].id.."", player, 255, 255, 255, true)
			triggerClientEvent(root, "serverAdminDiaryMessage", root, "#ef564b"..adminNick.." #6bbffflétrehozott egy ATM-et, ATM ID-je: #ef564b"..results[1].id.." #6bbfff!")
		    else
			outputChatBox("#ef564b["..modName.."]: ATM létrehozás sikertelen volt!", player, 255, 255, 255, true)
		    end
		end, con, "SELECT * FROM atms WHERE id=LAST_INSERT_ID()"
	    )
	end
    --end
end
addCommandHandler("createatm", createAtmFunction, false, false)

-- Atm törlése --
function deleteAtmFunction(player, cmd, id)
    --if (getElementData(player, "login")) then
	local admin = exports["nwmta_admins"]:isPlayerAdmin(player)
	local devSerial = exports["nwmta_dev"]:isPlayerDev(player)
	if (admin) then
	    if (getElementData(player, "admin >> duty")) then
		if (getElementData(player, "admin >> level") >= 4) then
		    if (tonumber(id)) then
			local id = tonumber(id)
			if (atms[id]) then
			    dbExec(con, "DELETE FROM atms WHERE id=?", id)
			    destroyElement(atms[id])
			    local adminNick = getElementData(player, "admin >> nick") or "Ismeretlen"
			    outputChatBox("#8dec62["..modName.."]: Sikeresen töröltél egy ATM-et!", player, 255, 255, 255, true)
			    triggerClientEvent(root, "serverAdminDiaryMessage", root, "#ef564b"..adminNick.." #6bbffftörölt egy ATM-et, ATM ID-je: #ef564b"..id.." #6bbfff!")
			end
		    else
			outputChatBox("#ef564b["..modName.."]: Nincs ilyen ATM, ezzel az ID-vel!", player, 255, 255, 255, true)
		    end
		else
		    outputChatBox("#ef564b Nem vagy elég magas rangú admin!", player, 255, 255, 255, true)
		end
	    else
		outputChatBox("#ef564b Nem vagy admin szolgálatban!", player, 255, 255, 255, true)
	    end
	end
	if (devSerial) then
	end
    --end
end
