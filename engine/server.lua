-- Script elindítás --
addEventHandler("onResourceStart", getRootElement(),
	function(res)
		local modName = exports["engine"]:modDatas("name")
		local modVersion = exports["engine"]:modDatas("version")
		local modCity = exports["engine"]:modDatas("city")

		setGameType(modName.." "..modVersion)
		setMapName(modCity)
	end
)

addEventHandler("onPlayerJoin", getRootElement(),
	function()
		fadeCamera(source, true)
		setCameraTarget(source, source)
		spawnPlayer(source, 0, 0, 3, 0, 0, 0, 0)
		setPlayerNametagShowing(source, false)
	end
)
