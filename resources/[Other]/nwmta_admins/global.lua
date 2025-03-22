local adminTitle = {"Admin(1)", "Admin(2)", "Admin(3)", "Admin(4)", "Admin(5)", "FőAdmin", "SuperAdmin", "Rendszergazda", "Tulajdonos", "Fejlesztő"}
local adminColor = {"#96f74f", "#96f74f", "#96f74f", "#96f74f", "#96f74f", "#fad975", "#f39d44", "#87c2f7", "#ee2626", "#40a0f7"}
local adminHelperTitle = {"IDG Adminsegéd", "SGH Adminsegéd", "RP őr"}
local adminHelperColor = {"#ecbfd3", "#c3b3ec", "#ffffff"}

-- Ellenőrzi hogy a játékos admin-e avagy sem --
function isPlayerAdmin(player)
    if (player) then
	if (getElementData(player, "admin") == true) then
	     return true
	else
	     return false
	end
    else
	return false
    end
end

function isPlayerAdminTitle(player)
	if (player) then
		if (getElementData(player, "admin >> Level") > 0) then
			if (adminTitle[getElementData(player, "admin >> Level")]) then
				return adminTitle[getElementData(player, "admin >> Level")]
			else
				return false
			end
		else
			return false
		end
	else
		return false
	end
end
