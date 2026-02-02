-- Játékos és admin védelem --
addEventHandler("onClientPlayerDamage", getRootElement(),
	function(attacker, damage_causing, bodypart, loss)
		if (getElementData(source, "admin >> duty") == true) or (getElementData(source, "player >> login") == false) then
			cancelEvent()
		end
	end
)
