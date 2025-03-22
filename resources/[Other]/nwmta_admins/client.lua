local modName = exports["nwmta_engine"]:isServerData("name") or "NewMTA"

-- Log üzenet --
function logMessage(message)
    local devSerial = exports["nwmta_dev"]:isPlayerDev(localPlayer)
    if (getElementData(localPlayer, "admin")) or (devSerial) then
	outputChatBox("["..modName.." - LOG]: "..message, 255, 255, 255, true)
    end
end

-- Szerver oldali Log --
addEvent("serverLogMessage", true)
addEventHandler("serverLogMessage", root,
    function(message)
	logMessage(message)
    end
)

-- Admin napló üzenet --
function adminDiaryMessage(message)
    local devSerial = exports["nwmta_dev"]:isPlayerDev(localPlayer)
    if (getElementData(localPlayer, "admin")) or (devSerial) then
	outputChatBox("["..modName.." - Admin napló]: "..message, 255, 255, 255, true)
    end
end

addEvent("serverAdminDiaryMessage", true)
addEventHandler("serverAdminDiaryMessage", root,
    function(message)
	adminDiaryMessage(message)
    end
)
