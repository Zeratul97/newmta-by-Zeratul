-- Szerver adatok --
serverDatas = {
    ["name"] = "NewMTA",
    ["version"] = "v0.0.1",
    ["devVersion"] = "v0.0.0",
    ["city"] = "Los Santos",
    ["developer"] = "Zeratul & Fejlesztő neve",
}

-- Szerver adatok átküldése
function isServerData(data)
    if (data) then
	if (serverDatas[data]) then
	     return serverDatas[data]
	else
	     return false
	end
    else
	return false
    end
end

function findPlayer(sourcePlayer, id)
    if id == "*" or utfSub(id, 1, 1) == "*" then
	return sourcePlayer
    end
    local table = {}
    for key, value in pairs(getElementsByType("player")) do
	local name = getPlayerName(value)
	logged = false

	if (utfSub(name, 1, #id) == string.lower(id)) and not logged then
	    table[#table+1] = {value, name}
	    logged = true
	end

	local adminName = getElementData(value, "admin >> nick") or "ISMERETLEN"

	if (utfSub(adminName, 1, #id) == string.lower(id)) and not logged then
	    table[#table+1] = {value, adminName}
	    logged = true
	end

	local number = tonumber(getElementData(value, "player >> id"))
	local number2 = tonumber(id)

	if (number == number2) and not logged then
	    table[#table+1] = {value, adminName}
	    logged = true
	end

	if #table == 0 then

	elseif #table == 1 then
	    return table[1][1]
	end

    end
end
