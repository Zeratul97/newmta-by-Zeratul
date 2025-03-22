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
