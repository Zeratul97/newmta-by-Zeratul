serverDatas = {
    ["name"] = "NewMTA",
    ["version"] = "v0.0.1",
    ["city"] = "Los Santos",
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
