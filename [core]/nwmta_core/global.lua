-- Szerver modjának adatai --
modTitle = {
    ["mod_name"] = "NWMTA",
    ["mod_version"] = "v0.0.1",
    ["mod_dev"] = "Zeratul",
    ["mod_city"] = "Los Santos",
}

-- Szerver modjának adatai ellenőrzése és átküldése --
function getModData(data)
    if (data) then
        if (modTitle[data]) then
            return modTitle[data]
        else
            return false
        end
    else
        return false
    end
end
