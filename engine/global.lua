-- Mod adatok --
modData = {
    ["name"] = "NewMTA",
    ["version"] = "v0.0.1",
    ["city"] = "Los Santos",
}

-- Mod adatokat átküldő funkció --
function modData(data)
    if (data) then  -- Ha kap adatot akkor 
        if (modData[data]) then  -- Ha a táblázatban van ilyen adat akkor vissza küldi azt az értéket ami tartozik az adathoz
            return modData[data]
        else
            return false
        end
    else  -- Egyébként hamis értéket küld vissza
        return false
    end
end
