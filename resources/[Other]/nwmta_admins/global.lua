-- Admin rangok
local adminsTitle = {"Admin[1]", "Admin[2]", "Admin[3]", "Admin[4]", "Admin[5]", "FőAdmin", "SzuperAdmin", "Rendszergazda", "Tulajdonos", "Fejlesztő"}

-- Játékos admin-e avagy sem --
function isPlayerAdmin(player)
    if (player) then
        if (getElementData(player, "admin")) then
            return true
        else
            return false
        end
    else
        return false
    end
end

-- Játékos admin rangjának nevének visszaküldése --
function isPlayerAdminTitle(player)
    if (player) then
        if (adminsTitle[getElementData(player, "admin >> level")]) then
            return adminsTitle[getElementData(player, "admin >> level")]
        else
            return "Játékos"
        end
    else
        return false
    end
end
