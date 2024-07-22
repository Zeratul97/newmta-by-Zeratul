local isPlayerNames = true

addEventHandler("onClientRender", root,
	function()
		local x, y, z = getElementPosition(localPlayer)
		local int = getElementInterior(localPlayer)
		local dim = getElementDimension(localPlayer)

		for i, p in pairs(getElementsByType("player")) do
			if (isElement(p)) then
				if (localPlayer ~= p) then
					local px, py, pz = getElementPosition(p)
					local pInt = getElementInterior(p)
					local pDim = getElementDimension(p)
					if (int == pInt) and (dim == pDim) then  
						local distance = getDistanceBetweenPoints3D(x, y, z, px, py, pz)

						if (distance <= 7) then
							local wx, wy = getScreenFromWorldPosition(px, py, pz+0.9)

							if (wx and wy) then
								dxDrawText(getPlayerName(p):gsub("_", " ").."("..getElementData(p, "player >> id")..")", wx, wy, wx, wy, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, false, false, false)
							end

						end
					end
				end
			end
		end
	end
)
