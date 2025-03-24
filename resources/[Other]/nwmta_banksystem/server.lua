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

	end
	if (devSerial) then
	end
    --end
end
