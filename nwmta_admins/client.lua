-- Log rész --
function logAdmin(msg)
	  local devPlayer = exports["nwmta_development"]:isDevSerial(localPlayer)
	  local playerAdmin = exports["nwmta_admins"]:isPlayerAdmin(localPlayer)
	  if (getElementData(localPlayer, "login") then
		    if (playerAdmin) or (devPlayer) then
			      outputChatBox("[Log]: "..msg, 255, 255, 255, true)
		    end
	  end
end

addEvent("logServer", true)
addEventHandler("logServer", root,
	  function(msg)
		    logAdmin(msg)
	  end
)

--Admin napló --
function adminDiary(msg)
	  local devPlayer = exports["nwmta_development"]:isDevSerial(localPlayer)
	  local playerAdmin = exports["nwmta_admins"]:isPlayerAdmin(localPlayer)
	  --if (getElementData(localPlayer, "login")) then
		    if (playerAdmin) or (devPlayer) then
			      outputChatBox("[Admin napló]: "..msg, 255, 255, 255, true)
		    end
	  --end
end

addEvent("adminDiaryMessageServer", true)
addEventHandler("adminDiaryMessageServer", root,
	  function(msg)
		    adminDiary(msg)
	  end
)
