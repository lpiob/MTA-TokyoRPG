

function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="mph" or unit==1 or unit =='1') then
            return (x^2 + y^2 + z^2) ^ 0.5 * 100
        else
            return (x^2 + y^2 + z^2) ^ 0.5 * 1.8 * 100
        end
    else
        outputDebugString("Not an element. Can't get speed")
        return false
    end
end

function wheelieBike()
for key, value in ipairs(getElementsByType("vehicle")) do
local id = getElementModel(value)
if ( id== 581 or id==509 or id==481 or id==462 or id==521 or id==463 or id==510 or id==522 or id==461 or id==448 or id==468 or id==586 ) then
    if getVehicleController(value) then
    local xr, yr, zr = getElementRotation(value)
      if xr >= 15 and xr < 56 then
      if getElementSpeed(value,2)>15 then
        givePlayerMoney(value,25)
        outputChatBox("Otrzymujesz 25$ za zrobienie Wheelie", getVehicleController(value))
        elseif getElementSpeed(value,2)>40 then
        givePlayerMoney(getVehicleController(value),40)
        outputChatBox("Otrzymujesz 40$ za zrobienie Wheelie", getVehicleController(value))
        elseif getElementSpeed(value,2)>90 then
        givePlayerMoney(getVehicleController(value),75)
        outputChatBox("Otrzymujesz 75$ za zrobienie Wheelie", getVehicleController(value))
    end
end
end
end
end
end

setTimer(wheelieBike,1000,0)


