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
