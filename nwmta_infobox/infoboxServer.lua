function createInfoBox(player, message, itype)
    if (isElement(player)) then
	triggerClientEvent(getRootElement(), "infobox", message, itype)
    end
end
