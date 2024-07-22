-- Collision-ök megjelenítése --
function setCollisionsEnabled(cmd)
	if (isPlayerSerial(localPlayer)) then
		if (getDevelopmentMode() == true) then
			setDevelopmentMode(false)
			showCol(false)
			outputChatBox("Fejlesztői mód kikapcsolva!", 255, 255, 255, true)
			exports["admins"]:adminDiaryMessages(getPlayerName(localPlayer).." fejlesztői módot deaktiválta!")
		else
			setDevelopmentMode(true)
			showCol(true)
			outputChatBox("Fejlesztői mód bekapcsolva!", 255, 255, 255, true)
			exports["admins"]:adminDiaryMessages(getPlayerName(localPlayer).." fejlesztői módot aktiválta!")
		end
	end
end
addCommandHandler("showcollisions", setCollisionsEnabled)
