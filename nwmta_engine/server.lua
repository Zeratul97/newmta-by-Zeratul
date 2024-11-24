-- Szerver adatok --
local modName
local modVersion
local modCity

-- Script elindulásakor --
addEventHandler("onResourceStart", getRootElement(),
    function(resource)
	local modName = exports["nwmta_engine"]:modDataService("name")
	local modVersion = exports["nwmta_engine"]:modDataService("version")
	local modCity = exports["nwmta_engine"]:modDataService("city")

	setGameType(modName.." "..modVersion)	-- Mod nevének beállítása
	setMapName(modCity)	-- Pálya neve
    end
)

-- Játékos Csatlakozás a szerverre --
addEventHandler("onPlayerJoin", getRootElement(),
    function()
	spawnPlayer(source, 0, 0, 4, 0, 1) -- Játékos spawnolása a pályán
	fadeCamera(source, true) -- Képernyő ne legyen fekete, amennyiben false akkor be kell állítanunk a képernyő színét
	setCameraTarget(source, source)	-- Játékos kamera a játékos karakterét figyelje
    end
)
