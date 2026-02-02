-- Mod adatok --
serverData = {
	["server_name"] = "NWMTA", -- Szerver név --
	["server_version"] = "0.0.1", -- Szerver verziója --
	["server_city"] = "Los Santos", -- Szerver városa --
	["server_developer"] = "Zeratul", -- Szerver fejleszője --
}

-- Szerver adatok átküldése --
function getServerData(data)
	if (data) then
		if (serverData[data]) then
			return serverData[data]
		else
			return false
		end
	else
		return false
	end
end
