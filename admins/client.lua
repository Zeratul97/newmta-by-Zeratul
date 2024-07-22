-- Admin napló --
function adminDiaryMessages(msg)
	if (getElementData(localPlayer, "admin >> level") > 0) then
		local modName = exports["engine"]:modDatas("name")
		outputChatBox("["..modName.." - Admin napló]: "..msg, 255, 255, 255, true)
	end
end

-- Admin napló meghívás szerver oldalról --
addEvent("adminDiaryServer", true)
addEventHandler("adminDiaryServer", getRootElement(),
	function(msg)
		adminDiaryMessages(msg)
	end
)

-- Log rendszer --
function logMessages(msg)
	if (getElementData(localPlayer, "admin >> level") > 0) then
		local modName = exports["engine"]:modDatas("name")
		outputChatBox("["..modName.." - Log]: "..msg, 255, 255, 255, true)
	end
end

-- Log meghívás szerver oldalról --
addEvent("adminLogServer", true)
addEventHandler("adminLogServer", getRootElement(),
	function(msg)
		logMessages(msg)
	end
)
