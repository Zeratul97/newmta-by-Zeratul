local junkYardMarker = createMarker(-1911.5, -1671.7, 22, "cylinder", 3, 180, 0, 0, 200)
setElementData(junkYardMarker, "marker >> junkyard", true)
setElementDimension(junkYardMarker, 0)
setElementInterior(junkYardMarker, 0)

addEvent("vehicleDestroy", true)
addEventHandler("vehicleDestroy", resourceRoot,
    function(vehicle)
		    destroyElement(vehicle)
    end
)
