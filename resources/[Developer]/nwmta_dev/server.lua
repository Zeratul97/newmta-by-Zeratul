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
