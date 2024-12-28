local sRed = exports["nwmta_core"]:isServerColorHEX("log", "red")
local sBlue = exports["nwmta_core"]:isServerColorHEX("log", "blue")

addEventHandler("onPlayerChangeNick", getRootElement(),
    function(oldNick, newNick, changedByUser)
        if (changedByUser) then
            triggerClientEvent(root, "serverAdminDiaryMessage", root, sRed..""..oldNick.." "..sBlue.." játékos nevét megváltoztatták: "..sRed..""..newNick..""..sBlue.."-ra/-re. | Felelős:"..sRed..""..getElementData(changedByUser, "admin >> nick")..""..sBlue.."!")
        else
            triggerClientEvent(root, "serverLogMessage", root, sRed..""..oldNick..""..sBlue.." játékosnak megváltozott a neve: "..sRed..""..newNick..""..sBlue.."-re/ra!")
        end
    end
)
