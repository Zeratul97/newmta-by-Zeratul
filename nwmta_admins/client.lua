-- Log üzenetek --
function logMessageClient(message)
    local devSerial = exports["nwmta_dev"]:getDevSerial(localPlayer)
    if ((getElementData(localPlayer, "admin") == true) or devSerial) then
        outputChatBox("[LOG]: "..message, 255, 255, 255, true)
    end
end

-- Szerver oldalon hívja meg a log üzeneteket --
addEvent("logMessageServer", true)
addEventHandler("logMessageServer", resourceRoot,
    function(message)
        logMessageClient(message)
    end
)

-- Admin napló üzenetek --
function adminDiaryClient(message)
    local devSerial = exports["nwmta_dev"]:getDevSerials(localPlayer)
    if ((getElementData(localPlayer, "admin") == true) or devSerial) then
        outputChatBox("[Admin napló]: "..message, 255, 255, 255, true)
    end
end

-- Szerver oldalon hívja meg az admin napló üzeneteket --
addEvent("adminDiaryServer", true)
addEventHandler("adminDiaryServer", resourceRoot,
    function(message)
        adminDiaryClient(message)
    end
)
