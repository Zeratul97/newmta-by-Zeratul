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
