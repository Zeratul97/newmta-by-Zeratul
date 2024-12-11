serverDatas = {
    ["name"] = "NewMTA",
    ["version"] = "v0.0.1",
    ["city"] = "Los Santos",
}

jobList = {
    [0] = "Munkanélküli",
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
