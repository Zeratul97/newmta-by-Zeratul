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
-- Fejelsztői mód bekapcsolása --
function devMode(cmd)
    --if (getElementData(localPlayer, "login")) then
        local devSerial = exports["nwmta_dev"]:isPlayerDev(localPlayer)
        if (devSerial) then
            if (getDevelopmentMode() == true) then
                setDevelopmentMode(false)
                outputChatBox("Fejlesztői mód kikapcsolva!", 255, 255, 255, true)
            else	
                setDevelopmentMode(true)
                outputChatBox("Fejlesztői mód bekapcsolva!", 255, 255, 255, true)
            end
        end
    --else	
	--	cancelEvent()
    --end
end
addCommandHandler("devmode", devMode)
