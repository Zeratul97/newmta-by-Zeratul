adminTitle = {"Admin[1]", "Admin[2]", "Admin[3]", "Admin[4]", "Admin[5]", "FőAdmin", "SuperAdmin", "Rendszergazda", "Tulajdonos", "Fejlesztő"}
adminTitleColor = {"#96f74f", "#96f74f", "#96f74f", "#96f74f", "#96f74f", "#fad975", "#f39d44", "#87c2f7", "#ee2626", "#40a0f7"}
adminHelperTitle = {"IDG Adminsegéd", "SGH Adminsegéd", "RP őr"}
adminHelperColor = {"#ecbfd3", "#c3b3ec", "#ffffff"}

-- Játékos admin-e avagy sem --
function isPlayerAdmin(player)
	  if (player) then
		    if (getElementData(player), "admin") then
			      return true
		    else
			      return false
		    end
	  else
		    return false
	  end
end
