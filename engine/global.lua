modData = {
	["name"] = "NewMTA",
	["version"] = "v.0.0.1",
	["city"] = "Los Santos",
}

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

