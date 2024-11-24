-- Fejlesztői mód ki/be kaplcsolása --
function devMode(cmd)
    local devSerial = exports["nwmta_dev"]:getDevSerials(localPlayer)
    if (devSerial) or (getElementData(player, "admin >> level") >= 10 ) then
	if (getDevelopmentMode() == true) then
	    setDevelopmentMode(false)
	else
	    setDevelopmentMode(true)
	end
    end
end
addCommandHandler("enableddevmode", devMode)

-- Collision-ök megjelenítése/eltűntetése --
function showCollisions(cmd)
    local devSerial = exports["nwmta_dev"]:getDevSerials(localPlayer)
    if (devSerial) or (getElementData(player, "admin >> level") >= 10 ) then
	showCol (not isShowCollisionsEnabled())
    end
end
addCommandHandler("enabledcollisions", showCollisions)
