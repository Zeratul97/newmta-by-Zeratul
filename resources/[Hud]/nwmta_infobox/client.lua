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

--------------------------------------------------------------------------------
function renderInfoBox()	--Végig megyünk az üzeneteken
    local i = 0
    for _,v in pairs(messages) do
        v.x = screen.x/2 - v.w/2
        -- Szöveg háttere
        dxDrawRectangle(v.x, v.y + i*v.h + i*10, v.w, v.h, tocolor(31, 31, 31, 170*v.opacity));
        --Ikon háttere
        dxDrawRectangle(v.x, v.y + i*v.h + i*10, v.h, v.h, tocolor(0, 0, 80, 170*v.opacity));

        --Ikon
        dxDrawImage(v.x, v.y + i*v.h + i*10, v.h, v.h, itypes[v.itype], 0, 0, 0, tocolor(255, 255, 255, 255*v.opacity))

        --Szöveg
        dxDrawText(v.message, 
             v.x + v.h + 5, 
             v.y + i*v.h + i*10 + v.h/2 - dxGetFontHeight(1, font)/2, 
             v.x + v.w, 
             v.y + i*v.h + i*10 + v.h, 
             tocolor(255, 255, 255, 255*v.opacity), 1, font, "left", "top", true)

        i = i + 1
    end
end
addEventHandler("onClientRender", root, renderInfoBox) 

function table.find(t, v)
    for k, a in ipairs(t) do
        if a == v then
	   return k
        end
    end
    return false
end

function createAnimation(f, t, easing, duration, onChange, onEnd)
    assert(type(f) == "number", "Bad argument @ 'animate' [expected number at argument 1, got "..type(f).."]")
    assert(type(t) == "number", "Bad argument @ 'animate' [expected number at argument 2, got "..type(t).."]")
    assert(type(easing) == "string" or (type(easing) == "number" and (easing >= 1 or easing <= #builtins)), "Bad argument @ 'animate' [Invalid easing at argument 3]")
    assert(type(duration) == "number", "Bad argument @ 'animate' [expected function at argument 4, got "..type(duration).."]")
    assert(type(onChange) == "function", "Bad argument @ 'animate' [expected function at argument 5, got "..type(onChange).."]")
    table.insert(anims, {from = f, to = t, easing = table.find(builtins, easing) and easing or builtins[easing], duration = duration, start = getTickCount( ), onChange = onChange, onEnd = onEnd})
    return #anims
end

function destroyAnimation(a)
    if anims[a] then
        table.remove(anims, a)
    end
end

addEventHandler("onClientRender", root, function( )
    local now = getTickCount( )
    for k,v in ipairs(anims) do
        v.onChange(interpolateBetween(v.from, 0, 0, v.to, 0, 0, (now - v.start) / v.duration, v.easing))
        if now >= v.start+v.duration then
            if type(v.onEnd) == "function" then
                v.onEnd( )
            end
            table.remove(anims, k)
        end
    end
end)
