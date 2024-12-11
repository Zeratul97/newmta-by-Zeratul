-- Játékos és admin védelem --
addEventHandler("onClientPlayerDamage", getRootElement(),
     function(attacker, damage_causing, bodypart, loss)
          if not (getElementData(source, "login")) then
              cancelEvent()
          else
              local adminStatus = exports["nwmta_admins"]isPlayerAdmin(source)

              if (adminStatus) then
                  if (getElementData(source, "admin >> duty")) then
                      cancelEvent()
                  end
              else

              end
          end
     end
)
