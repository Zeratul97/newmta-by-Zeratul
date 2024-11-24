modData = {
    ["name"] = "NewMTA",
    ["version"] = "v.0.0.1",
    ["city"] = "Los Santos",
}

jobNames = {
    [0] = "Munkanélküli",
}

vehicleNames = {
    [596] = "Opel Corsa",
}

-- Járművek nevének átküldése --
function vehicleNamesService(vehicle)
    if (vehicle) then
	if (vehicleNames[getElementModel(vehicle)]) then
	    return vehicleNames[getElementModel(vehicle)]
	else
	    return "ISMERETLEN"
	end
    else
	return false
    end
end

-- Munkák nevének átküldése --
function jobNamesService(player)
    if (player) then
	if (jobNames[getElementData(player, "job >> id")]) then
	    return jobNames[getElementData(player, "job >> id")]
	else
	    return false
	end
    else
	return false
    end
end

-- Mod Adatok elküldése --
function modDatas(data)
    if (data) then
	if (modData[data]) then
	    return modData[data]
	else
	    return false
	end
    else
	return false
    end
end

