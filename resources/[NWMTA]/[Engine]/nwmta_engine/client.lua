-- Játékos és admin védelem --
addEventHandler("onClientPlayerDamage", getRootElement(),
	function(attacker, damage_causing, bodypart, loss)
		if (getElementData(source, "admin >> duty") == true) or (getElementData(source, "player >> login") == false) then -- Admin szolgálatban nem semsződik/Játékos, ha nincs bejelentkezve nem sebződik --
			cancelEvent()
		end
	end
)

-- M gomb megnyomására megjelenik a kurzor --
function showingCursor()
	showCursor(not isCursorShowing())
end
bindKey("m", "down", showingCursor)
