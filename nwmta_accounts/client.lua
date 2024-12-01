local screenX, screenY = guiGetScreenSize() -- Képfelbontás lekérdezése
local isAccountWindow = true -- Látható legyen az bejelentkező felület
local accountPanel = "login"

-- Bejelentkező felület --
local username = "" -- Felhasználónév
local password = "" -- Jelszó

-- Regisztrációs felület --
local regUsername = "" -- Felhasználónév
local regPassword = "" -- Jelszó
local regPasswordAgain = "" -- Jelszó újra

local buttonColors = {
    ["login"] = {
	[1] = tocolor(94, 255, 123, 180), -- Bejelentkezés gomb --
	[2] = tocolor(255, 79, 56, 180), -- Regisztráció gomb --
    },
    ["register"] = {
	[1] = tocolor(255, 79, 56, 180), -- Regisztráció gomb --
    },
}


-- Script elinduláskor fut le, amennyiben be van jelentkezve a játékos akkor ne jelenjen meg az bejelentkező felület. --
addEventHandler("onResourceStart", getRootElement(),
    function(resource)
	if (resource == "nwmta_accounts") then

	    if (getElementData(localPlayer, "account >> login") == true) then
		isAccountWindow = false
	    else
		isAccountWindow = true
	    end
	end
    end
)

-- Kirajzolja az bejelentkező felületet --
addEventHandler("onClientRender", getRootElement(),
    function()

	if not (getElementData(localPlayer, "account >> login")) then
	    if (isAccountWindow) then -- Látszik-e az bejelentkező panel

		-- Bejelentkező felület --
		if (accountPanel == "login") then
					
		    -- Bejelentkezés felület háttere --
		    dxDrawRectangle(screenX*0.37, screenY*0.26, screenX*0.25, screenY*0.34, tocolor(109, 218, 255, 220))
		    
		    -- Felhasználónév mező --
		    dxDrawRectangle(screenX*0.395, screenY*0.30, screenX*0.20, screenY*0.05, tocolor(255, 255, 255, 230))

		    -- Felhasználónév mező szövege --
		    dxDrawText("Felhasználónév", screenX*0.395, screenY*0.30, screenX*0.6, screenY*0.345, tocolor(0, 0, 0, 255), 2.5, "default-bold", "center", "center", false, false, false, false, false)

		    -- Jelszó mező --
		    dxDrawRectangle(screenX*0.395, screenY*0.38, screenX*0.20, screenY*0.05, tocolor(255, 255, 255, 230))
					
		    -- Jelszó mező szövege --
		    dxDrawText("Jelszó", screenX*0.395, screenY*0.38, screenX*0.6, screenY*0.425, tocolor(0, 0, 0, 255), 2.5, "default-bold", "center", "center", false, false, false, false, false)

		    -- Bejelentkezés gomb --
		    dxDrawRectangle(screenX*0.395, screenY*0.46, screenX*0.20, screenY*0.05, buttonColors[accountPanel][1])

		    -- Bejelentkezés gomb szövege --
		    dxDrawText("Bejelentkezés", screenX*0.395, screenY*0.30, screenX*0.6, screenY*0.665, tocolor(0, 0, 0, 255), 2.5, "default-bold", "center", "center", false, false, false, false, false)


		    -- Regisztráció gomb --
		    dxDrawRectangle(screenX*0.395, screenY*0.53, screenX*0.20, screenY*0.05, buttonColors[accountPanel][2])

		    -- Regisztráció gomb szövege --
		    dxDrawText("Regisztráció", screenX*0.395, screenY*0.53, screenX*0.6, screenY*0.58, tocolor(0, 0, 0, 255), 2.5, "default-bold", "center", "center", false, false, false, false, false)


		-- Regisztrációs felület --
		elseif (accountPanel == "register") then

		    -- Regisztrációs felület háttere --
		    dxDrawRectangle(screenX*0.37, screenY*0.26, screenX*0.25, screenY*0.40, tocolor(109, 218, 255, 220))
				
		    -- Felhasználónév mező --
		    dxDrawRectangle(screenX*0.395, screenY*0.30, screenX*0.20, screenY*0.05, tocolor(255, 255, 255, 230))

		    -- Felhasználónév mező szövege --
		    dxDrawText("Felhasználónév", screenX*0.395, screenY*0.30, screenX*0.6, screenY*0.345, tocolor(0, 0, 0, 255), 2.5, "default-bold", "center", "center", false, false, false, false, false)

		    -- Jelszó mező --
		    dxDrawRectangle(screenX*0.395, screenY*0.38, screenX*0.20, screenY*0.05, tocolor(255, 255, 255, 230))
					
		    -- Jelszó mező szövege --
		    dxDrawText("Jelszó", screenX*0.395, screenY*0.38, screenX*0.6, screenY*0.425, tocolor(0, 0, 0, 255), 2.5, "default-bold", "center", "center", false, false, false, false, false)

		    -- Jelszó újra mező --
		    dxDrawRectangle(screenX*0.395, screenY*0.46, screenX*0.20, screenY*0.05, tocolor(255, 255, 255, 230))

		    -- Jelszó mező szövege --
		    dxDrawText("Jelszó újra", screenX*0.395, screenY*0.46, screenX*0.6, screenY*0.505, tocolor(0, 0, 0, 255), 2.5, "default-bold", "center", "center", false, false, false, false, false)

		    -- Regisztráció gomb --
		    dxDrawRectangle(screenX*0.395, screenY*0.56, screenX*0.20, screenY*0.05, buttonColors[accountPanel][1])

		    -- Regisztráció gomb szövege --
		    dxDrawText("Regisztráció", screenX*0.395, screenY*0.56, screenX*0.6, screenY*0.61, tocolor(0, 0, 0, 255), 2.5, "default-bold", "center", "center", false, false, false, false, false)

		end
	    end

	end
    end
)

-- Egér mozgatást felügyeli --
addEventHandler("onClientCursorMove", root,
    function(cX, cY, _, _, _, _, _)
	if (isAccountWindow) then -- látszódik a bejelentkező felület --
	    if (isCursorShowing()) then -- Látszódik a kurzor avagy sem --
		if (accountPanel == "login") then
		    if ((cX >= 0.394) and (cY >= 0.456) and (cX <= 0.595) and (cY <= 0.511)) then
			buttonColors[accountPanel][1] = tocolor(94, 255, 123, 255)
		    else
			buttonColors[accountPanel][1] = tocolor(94, 255, 123, 180)
		    end

		    if ((cX >= 0.394) and (cY >= 0.528) and (cX <= 0.595) and (cY <= 0.58)) then
			buttonColors[accountPanel][2] = tocolor(255, 79, 56, 255)
		    else
			buttonColors[accountPanel][2] = tocolor(255, 79, 56, 180)
		    end


			-- Bővíteni a beviteli mezőkkel --


		end
		if (accountPanel == "register") then
		    if ((cX >= 0.394) and (cY >= 0.56) and (cX <= 0.595) and (cY <= 0.610)) then
			buttonColors[accountPanel][1] = tocolor(255, 79, 56, 255)
		    else
			buttonColors[accountPanel][1] = tocolor(255, 79, 56, 180)
		    end

			-- Bővíteni a beviteli mezőkkel --


		end
	    end
	end
    end
)

-- Kattintást kezelő esemény --
addEventHandler("onClientClick", root,
    function(button, state, _, _, _, _, _, clickedElement)
	if (isAccountWindow) then
	    if (isCursorShowing()) then
		local cX, cY = getCursorPosition()
				
		if (button == "left") and (state == "down") then
		    if (accountPanel == "login") then
			-- Bejelentkezés gomb --
			if ((cX >= 0.394) and (cY >= 0.456) and (cX <= 0.595) and (cY <= 0.511)) then
			    loginFunction()
			end

			-- Regisztráció gomb --
			if ((cX >= 0.394) and (cY >= 0.528) and (cX <= 0.595) and (cY <= 0.58)) then
			    accountPanel = "register"
			end
		    elseif (accountPanel == "register") then
			if ((cX >= 0.394) and (cY >= 0.56) and (cX <= 0.595) and (cY <= 0.610)) then
			    registracionFunction()
			end
		    end

		end
	    end
	end

    end
)
-- Regisztrációt intéző függvény --
function registracionFunction()
    --exports["nwmta_infobox"]:createInfoBox("Működik", "error")
end

-- Bejelentkezést intéző függvény --
function loginFunction()
    --exports["nwmta_infobox"]:createInfoBox("Működik", "success")
end
