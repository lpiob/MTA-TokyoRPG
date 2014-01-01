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

function onStart()
for key, value in ipairs(getElementsByType("vehicle")) do
if getVehicleOverrideLights(value)==0 then
setVehicleOverrideLights(value,1)
end
end
end

onStart()

setTimer(onStart,1000,0)


function switchEngine(player,key,state)
if isPedInVehicle(player) then
    local vehicle = getPedOccupiedVehicle(player)
    if getVehicleController(vehicle)==player then
    if getElementData(vehicle,"vehicle:owner")==getPlayerAccount(player) then
        if getVehicleEngineState(vehicle)==true then
            setVehicleEngineState(vehicle,false)
            outputChatBox("#63DBFF*Zgaśiłeś silnik w swoim pojeżdzie",player,0,0,0,true)
            else
            setVehicleEngineState(vehicle,true)
            outputChatBox("#63DBFF*Zapaliłeś silnik w swoim pojeżdzie.",player,0,0,0,true)
        end
        else outputChatBox("#63DBFF*Ten pojazd nie należy do ciebie.",player,0,0,0,true)
        end
    else outputChatBox("#63DBFF*Żeby tego dokonać musisz być na miejscu kierowcy.",player,0,0,0,true)
end
else outputChatBox("#63DBFF*Musisz być w pojeżdzie.",player,0,0,0,true)
end
end


function switchLights(player,key,state)
if isPedInVehicle(player) then
    local vehicle = getPedOccupiedVehicle(player)
    if getVehicleController(vehicle)==player then
    if getElementData(vehicle,"vehicle:owner")==getPlayerAccount(player) then
        if getVehicleOverrideLights(vehicle)==2 then
            setVehicleOverrideLights(vehicle,1)
            outputChatBox("#63DBFF*Zgaśiłeś światła w swoim pojeżdzie.",player,0,0,0,true)
            else
            setVehicleOverrideLights(vehicle,2)
            outputChatBox("#63DBFF*Zapaliłeś światła w swoim pojeżdzie.",player,0,0,0,true)
        end
        else outputChatBox("#63DBFF*Ten pojazd nie należy do ciebie.",player,0,0,0,true)
        end
    else outputChatBox("#63DBFF*Żeby tego dokonać musisz być na miejscu kierowcy.",player,0,0,0,true)
end
else outputChatBox("#63DBFF*Musisz być w pojeżdzie.",player,0,0,0,true)
end
end

function switchBrake(player,key,state)
if isPedInVehicle(player) then
    local vehicle = getPedOccupiedVehicle(player)
    if getVehicleController(vehicle)==player then
    if getElementData(vehicle,"vehicle:owner")==getPlayerAccount(player) then
    if getElementSpeed(vehicle,2)<5 then
    if isElementFrozen(vehicle)==true then
    setElementFrozen(vehicle,false)
    setVehicleDamageProof(vehicle,false)
            outputChatBox("#63DBFF*Odciągnałeś hamulec ręczny w swoim pojeździe.",player,0,0,0,true)
            else
            setElementFrozen(vehicle,true)
            setVehicleDamageProof(vehicle,true)
            outputChatBox("#63DBFF*Zaciągnąłeś hamulec ręczny w swoim pojeździe.",player,0,0,0,true)
        end
        else outputChatBox("#63DBFF*Żeby zaciągnąć hamulec ręczny pojazd nie może się poruszać.",player,0,0,0,true)
        end
        else outputChatBox("#63DBFF*Ten pojazd nie należy do ciebie.",player,0,0,0,true)
        end
    else outputChatBox("#63DBFF*Żeby tego dokonać musisz być na miejscu kierowcy.",player,0,0,0,true)
end
else outputChatBox("#63DBFF*Musisz być w pojeżdzie.",player,0,0,0,true)
end
end


addEventHandler("onPlayerLogin",getRootElement(),function ()
bindKey(source,"k","down",switchEngine)
bindKey(source,"l","down",switchLights)
bindKey(source,"o","down",switchBrake)
end)
