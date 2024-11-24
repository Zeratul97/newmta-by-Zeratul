-- Tiltott parancsok --
disableCMD = {
     ["register"] = true,
     ["login"] = true,
     ["refreshall"] = true,
     ["stopall"] = true,
}

-- Fejlesztők serial-ja 
devSerail = {
     --["serial"] = true, -- Fejlesztő serial-ja kerüljön a "serial" helyére, amennyiben több fejlesztő van akkor ugyan így adj hozzá több sort.
}

-- Fejlesztői parancsok listálya --
devCMD = {
     -- Alap fejlesztői parancsok --
     ["start"] = true,
     ["stop"] = true,
     ["refresh"] = true,
     ["restart"] = true,
     ["debugscript"] = true,
     ["reloadacl"] = true,

     -- Új fejlesztői parancsok --
     ["getpos"] = true,
     ["enableddevmode"] = true,
     ["enabledcollisions"] = true,
}

-- Fejlesztői serial ellenőrző funkció --
function getDevSerials(player)
    if (player) then
	if (devSerail[getPlayerSerial(player)]) then
	    return true
	else
	    return false
	end
    else
	return false 
    end
end

-- Tiltott parancsokat ellenőrző funkció --
function getCMDDisabled(cmd)
    if (cmd) then
	if (disableCMD[cmd]) then
	    return true
	else
	    return false
	end
    else
	return false
    end
end

-- Fejlesztői parancsokat ellenőrző funkció --
function getDeveloperCMD(cmd)
    if (cmd) then
	if (devCMD[cmd]) then
	    return true
	else
	    return false
	end
    else
	return false
    end
end
