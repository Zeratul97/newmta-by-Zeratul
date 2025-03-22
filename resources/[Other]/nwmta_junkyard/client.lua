local modName = exports["nwmta_engine"]:isServerData("name") or "NewMTA"
local screenX, screenY = guiGetScreenSize()
local isJunkYardPanel = false

local buttonColor = {
    [1] = tocolor(0, 255, 0, 200),
    [2] = tocolor(255, 0, 0, 200),
}


function junkYardRender()
    --if (getElementData(localPlayer, "login") == true) then
	if (isJunkYardPanel) then

	    -- Panel fejléc --
	    dxDrawRectangle(screenX/2-180, screenY/2-120, 400, 40, tocolor(0, 0, 0, 180))
	    dxDrawText(modName.." - Autó bontó", screenX/2+20, screenY/2-100, screenX/2+20, screenY/2-100, tocolor(255, 255, 255, 255), 1.2, "default-bold", "center", "center", false, false, false, false, false)
			
	    -- Panel háttér --
	    dxDrawRectangle(screenX/2-180, screenY/2-80, 400, 100, tocolor(0, 0, 0, 210))
	    dxDrawText("Le akarod adni a járművet a bontóba?", screenX/2+20, screenY/2-60, screenX/2+20, screenY/2-60, tocolor(255, 255, 255, 255), 1.2, "default-bold", "center", "center", false, false, false, false, false)
		
	    dxDrawRectangle(screenX/2-130, screenY/2-35, 120, 30, buttonColor[1])
	    dxDrawText("Igen", screenX/2-125, screenY/2-20, screenX/2-10, screenY/2-20, tocolor(255, 255, 255, 255), 1.2, "default-bold", "center", "center", false, false, false, false, false)

	    dxDrawRectangle(screenX/2+55, screenY/2-35, 120, 30, buttonColor[2])
	    dxDrawText("Mégse", screenX/2+60, screenY/2-20, screenX/2+170, screenY/2-20, tocolor(255, 255, 255, 255), 1.2, "default-bold", "center", "center", false, false, false, false, false)
			
	    if (isInSlot(screenX/2-130, screenY/2-35, 120, 30)) then
		buttonColor[1] = tocolor(0, 255, 0, 200)
	    else
		buttonColor[1] = tocolor(0, 150, 0, 200)
	    end
	    if (isInSlot(screenX/2+55, screenY/2-35, 120, 30)) then
		buttonColor[2] = tocolor(255, 0, 0, 200)
	    else
		buttonColor[2] = tocolor(150, 0, 0, 200)
	    end
	end
    --end
end


addEventHandler("onClientMarkerHit", getRootElement(),
    function(element, mDim)
         --if (getElementData(localPlayer, "login")) then
            if (getElementData(source, "marker >> junkyard") == true) then
		local vehicle = getPedOccupiedVehicle(localPlayer)
		local seat = getPedOccupiedVehicleSeat(localPlayer)
		if (vehicle) then
		    if (seat == 0) then
			--if not ( (getElementData(vehicle, "vehicle >> rent")) and (getElementData(vehicle, "vehicle >> job"))) then
			      exports["nwmta_infobox"]:createInfoBox("Munka járművet / Bérelt járművet nem adhatsz le!", "error")
			--else
			      isJunkYardPanel = true
			      removeEventHandler("onClientRender", getRootElement(), junkYardRender)
			      addEventHandler("onClientRender", getRootElement(), junkYardRender)
			--end
		    end
		end
            end
         --end
    end
)


addEventHandler("onClientMarkerLeave", getRootElement(),
    function(element, mDim)
         --if (getElementData(localPlayer, "login")) then
            if (getElementData(source, "marker >> junkyard") == true) then
		local vehicle = getPedOccupiedVehicle(localPlayer)
		local seat = getPedOccupiedVehicleSeat(localPlayer)
		if (vehicle) then
		    if (seat == 0) then
			isJunkYardPanel = false
			removeEventHandler("onClientRender", getRootElement(), junkYardRender)
		    end
		end
            end
         --end
    end
)

addEventHandler("onClientClick", getRootElement(),
    function(button, state, _, _, _, _, _, _)
         if (button == "left") and (state == "up") then
            if (isInSlot(screenX/2-130, screenY/2-35, 120, 30)) then
		isJunkYardPanel = false
		removeEventHandler("onClientRender", getRootElement(), junkYardRender)
		local vehicle = getPedOccupiedVehicle(localPlayer)
				
		triggerServerEvent("vehicleDestroy", resourceRoot, vehicle)
            elseif (isInSlot(screenX/2+55, screenY/2-35, 120, 30)) then
		isJunkYardPanel = false
		removeEventHandler("onClientRender", getRootElement(), junkYardRender)
            end
         end
    end
)

-- Egér ellenőrzés --
function isInSlot(xS, yS, wS, hS)
    if (isCursorShowing()) then
        XY = {guiGetScreenSize()}
        local cX, cY = getCursorPosition()
        cX, cY = cX*XY[1], cY*XY[2]
        if (dobozbaVan(xS, yS, wS, hS, cX, cY)) then
            return true;
        else
            return false;
        end
    end
end

function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
    if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
        return true
    else
        return false
    end
end
