local sx, sy = guiGetScreenSize()
local width, height = 512, 512
local isAccountPanelShowing = true
local isAccountType = "register"
local accountImages = {
    ["login"] = "files/images/main.png",
    ["register"] = "files/images/regmain.png",
}

-- Account render --
function accountRender()
    if (isAccountPanelShowing) then
        -- Bejelentkező felület --
        if (isAccountType == "login") then

            -- Bejelentkezés kép --
            dxDrawImage(sx/2-width/2, sy/2-height/2-45, width, height, accountImages[isAccountType])
      
        -- Regisztrációs felület --
        elseif (isAccountType == "register") then

            -- Regisztrációs kép --
            dxDrawImage(sx/2-width/2, sy/2-height/2-45, width, height, accountImages[isAccountType])
      
        end
    end
end
addEventHandler("onClientRender", root, accountRender)
