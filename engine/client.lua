-- Kurzor megjelenítés eltűntetés --
function setPlayerCursor()
	showCursor(not isCursorShowing())
end
bindKey("m", "up", setPlayerCursor)
