-- Kurzor megjelenítése --
function cursorShowing()
    if (isCursorShowing()) then
	showCursor(false)
    else
	showCursor(true)
    end
end
bindKey("m", "up", cursorShowing)
