-- Parancsok korlátozása --
addEventHandler("onPlayerCommand", getRootElement(),
    function(command)
	local disabledCMD = exports["nwmta_dev"]:isDisabledCMD(command)

	if (disabledCMD) then
	     cancelEvent()
	else
	     local devCMD = exports["nwmta_dev"]:isDevCMD(command)
	     if (devCMD) then
		local devSerial = exports["nwmta_dev"]:isPlayerDev(source)
		if not (devSerial) then
		    cancelEvent()
		end
	     end
	end
    end
)
-- Lekérdezi a futó scripteket --
function getRunningResources(player, cmd)
    --if (getElementData(localPlayer, "login")) then
	local devSerial = exports["nwmta_dev"]:isPlayerDev(player)
	if (devSerial) then
     		local resourceTable = getResources() -- Lekérdezi az összes szerveren található resource-t
     		for resourceKey, resourceValue in ipairs(resourceTable) do
		    local name = getResourceName(resourceValue)

		    if (getResourceState(resourceValue) == "running") then
                        outputChatBox("Resource név: "..name.." Státusz: Fut", player, 255, 255, 255, true)
		    end
     		end
	end

    --else
	--cancelEvent()
    --end
end
addCommandHandler("getrunningresource", getRunningResources)
