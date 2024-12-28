serverDatas = {
    ["name"] = "NewMTA",
    ["version"] = "v0.0.1",
    ["city"] = "Los Santos",
}

jobList = {
    [0] = "Munkanélküli",
}

serverColorHEX = {
    ["log"] = {
	["blue"] = "#6bbfff",
	["red"] = "#f94d40",
    },
}
-- Szerver adatok átküldése --
function isServerDatas(data)
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

-- Visszaküldi a játékos munkájának nevét --
function isPlayerJobName(player)
    if (player) then
	if (jobList[getElementData(player, "player >>job")]) then
	    return jobList[getElementData(player, "player >>job")]
	else
	    return "Munkanélküli"
	end
    else
	return false
    end
end

-- Játékos nevét küldi vissza --
function isPlayerName(player)
    if (player) then
	return getPlayerName(player):gsub("_", " ")
    else
	return false
    end
end

-- Chat szín vissza küldése(normál chat)--
function getChatColor(distance)
    if (distance) then
	if (distance < 4) then
            return "#EEEEEE"
	elseif (distance < 8) then
            return "#DDDDDD"
	elseif (distance < 12) then
            return "#CCCCCC"
	elseif (distance < 16) then
            return "#BBBBBB"
	else
            return "#AAAAAA"
	end
    else
	return false
    end
end

-- Szerver színek átküldése(HEXADECIMÁLIS érték) --
function isServerColorHEX(type, colorName)
    if type and colorName then
	if (serverColorHEX[type][colorName]) then
            return serverColorHEX[type][colorName]
	else
            return "#ffffff"
	end
    else
	return false
    end
end
