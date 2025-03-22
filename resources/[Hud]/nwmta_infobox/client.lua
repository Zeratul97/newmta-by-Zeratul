local screen = {}
screen.x, screen.y = guiGetScreenSize();

local anims, builtins = {}, {"Linear", "InQuad", "OutQuad", "InOutQuad", "OutInQuad", "InElastic", "OutElastic", "InOutElastic", "OutInElastic", "InBack", "OutBack", "InOutBack", "OutInBack", "InBounce", "OutBounce", "InOutBounce", "OutInBounce", "SineCurve", "CosineCurve"}

--------------------- // Hiba iconok és a meghívási név // ---------------------
local itypes = {
    error = "files/images/error.png",
    info = "files/images/info.png",
    success = "files/images/success.png",
    warning = "files/images/warning.png",
}

local font = dxCreateFont("files/fonts/roboto.ttf", 9)

local messages = {};
addEvent("infobox", true)
addEventHandler("infobox", localPlayer,
    function(message, itype) 
	--createInfoBox(message, itype, playSound("infobox/files/sounds/"..itype..".mp3"))
	createInfoBox(message, itype)
	return
    end
)

--------------------------------------------------------------------------------
------------------------------ Koordináták és szélesség és magasság ---------------
local infobox = {}
infobox.w = 200	--Mező szélesség
infobox.h = 33	--Mező magassága
infobox.y = 50 -- Magasság
infobox.x = screen.x/2 - infobox.w/2 --Oldalra pozícionálás
-----------------------------------------------------------------------------------

function createInfoBox(message, itype)
    local id = #messages+1
    table.insert(messages,{
        id = id,
        message = message, 
        itype = itype,
        x = infobox.x,
        y = infobox.y,
        w = infobox.h,
        h = infobox.h,
        dWidth = infobox.h + dxGetTextWidth(message, 1, font) + 10,
        opacity = 0, --0-1 közötti érték
        animState = false,
        }) -- Message táblázatba visz egy üzenetet

    playSound("files/sounds/"..itype..".mp3", false)
    createAnimation(0, 1, 4, 300, function(animation) messages[id].opacity = animation end, function()
	createAnimation(infobox.h, messages[id].dWidth, 4, 300, function(animation) messages[id].w = animation end, function()
	    setTimer(function()
                createAnimation(messages[id].dWidth, infobox.h, 4, 300, function(animation) messages[id].w = animation end, function()
		     createAnimation(1, 0, 4, 300, function(animation) messages[id].opacity = animation end, function()
			  messages[id] = nil
		     end)
                end)
	    end, 2000, 1)
	end)
    end)
end
