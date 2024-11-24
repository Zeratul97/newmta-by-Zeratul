-- Kurzor megjelenítés --
function toggleCursor()
    showCursor(not isCursorShowing())
end
bindKey("m", "up", toggleCursor)

addEventHandler("onClientPlayerDamage", root,
    function(attacker, weapon, bodypart, loss)
       if (getElementData(source, "account >> login") == true) then
            if (getElementData(source, "admin >> duty") == true) then
                cancelEvent()
            else
                local text = ""
                if (getElementType(attacker) == "vehicle") then
                    local plateText = getVehiclePlateText(attacker)
                    text = plateText

                elseif (getElementType(attacker) == "player") then
                    local attackerName = getPlayerName(attacker)
                    local name = getPlayerName(source)
                    local weaponName = getWeaponNameFromID(weapon)
                    local weaponNewName = ""
                    
                    if (getWeaponNameFromID(weapon) == "Fist") then
                        weaponNewName = "Kéz"
                    elseif (getWeaponNameFromID(weapon) == "Golfclub") then
                        weaponNewName = "Golfütő"
                    end



                    text = "Elkövető: "..attackerName..", Sértett: "..name..", Fegyver: "..weaponNewName
                end
                exports["nwmta_admins"]:logMessageClient(text)
            end
        else
            cancelEvent()
        end
        
    end
)
