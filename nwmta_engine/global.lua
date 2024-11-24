-- Mod alap adatai --
modDatas = {
	["name"] = "NEWMTA",
	["version"] = "v0.0.0",
	["city"] = "Los Santos",
}

jobNames = {
	[0] = "Munkanélküli",
}

vehicleNames = {
	[596] = "Opel Corsa",
}

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

-- Mod alap adatainak átküldése --
function modDataService(data)
	if (data) then -- Ha kap adatot akkor
		if (modDatas[data]) then -- Ha az adat megtalálható az adat akkor
			return modDatas[data]
		else
			return false
		end
	else
		return false -- Ha nem kap adatot akkor hamis értéket küld át!
	end
end
