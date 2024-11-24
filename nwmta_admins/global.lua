local adminTitle = {"Admin(1)", "Admin(2)", "Admin(3)", "Admin(4)", "Admin(5)", "Főadmin", "SuperAdmin", "Rendszergazda", "Tulajdonos", "Fejlesztő"} -- Admin rangok

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

-- Ellenőrizzük a játékos szintjét és vissza küldjük a rangot --
function isPlayerAdminTitle(player)
    if (player) then
		    if (isPlayerAdmin(player)) then
			      if (adminTitle[getElementData(player, "admin >> level")]) then
				        return adminTitle[getElementData(player, "admin >> level")]
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
