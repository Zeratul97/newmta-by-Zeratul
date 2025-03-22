local modName = exports["nwmta_engine"]:isServerData("name") or "NewMTA"

function logMessage(msg)
	local admin = exports["nwmta_admins"]:isPlayerAdmin(localPlayer)
	if (admin) then
		outputChatBox("["..modName.." - Log]:"..msg, 255, 255, 255, true)
	end
end

addEvent("logMessageServer", true)
addEventHandler("logMessageServer", getRootElement(),
	function(msg)
		logMessage(msg)
	end
)
