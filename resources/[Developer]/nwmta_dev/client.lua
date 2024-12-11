-- koordináta lekérdezése --
function getPlayerPosition(cmd)
    local devSerial = exports["nwmta_dev"]:isPlayerDev(localPlayer)
    if (devSerial) then
        local px, py, pz = getElementPosition(localPlayer)
        local dim = getElementDimension(localPlayer)
        local int = getElementInterior(localPlayer)


        outputChatBox("X koordináta: "..px, 255, 255, 255, true)
        outputChatBox("Y koordináta: "..py, 255, 255, 255, true)
        outputChatBox("Z koordináta: "..pz, 255, 255, 255, true)
        outputChatBox("Interior: "..int, 255, 255, 255, true)
        outputChatBox("Dimenzió: "..dim, 255, 255, 255, true)
    end
end
addCommandHandler("getpos", getPlayerPosition)
