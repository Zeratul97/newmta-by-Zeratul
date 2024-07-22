-- Parancsok korlátozása --
addEventHandler("onPlayerCommand", getRootElement(),
	function(cmd)
		if (devCommands[cmd]) then
			if not (devSerials[getPlayerSerial(source)]) then
				cancelEvent()
			end
		end
		if (disabledCommands[cmd]) then
			cancelEvent()
		end
	end
)
