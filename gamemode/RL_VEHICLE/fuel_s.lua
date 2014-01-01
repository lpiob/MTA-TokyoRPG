stations = {}

function isPlayerInACL ( player, acl )
    local account = getPlayerAccount ( player )
    if ( isGuestAccount ( account ) ) then
        return false
    end
        return isObjectInACLGroup ( "user."..getAccountName ( account ), aclGetGroup ( acl ) )
end

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

addEvent("onFuelCheck",true)

function checkFuel()
local vehiclesWithFuel = getElementsByType("vehicle")
  for key, value in ipairs(vehiclesWithFuel) do
    if getElementData(value,"vehicle:fuel") then
      if getVehicleEngineState(value)==true then
          if getElementData(value,"vehicle:fuel")>0 then
          triggerEvent("onFuelCheck",value)
         else
          setVehicleEngineState(value,false)
        end
      end
     else return end
  end
end
        
setTimer(checkFuel,40000,0)


               
function dropFuel()
local fuelInVehicle = getElementData(source,"vehicle:fuel")
  if getElementSpeed(source,2)<25 then
      setElementData(source,"vehicle:fuel",fuelInVehicle-1)
      elseif getElementSpeed(source,2)<50 then
      setElementData(source,"vehicle:fuel",fuelInVehicle-2)
      elseif getElementSpeed(source,2)<100 then
      setElementData(source,"vehicle:fuel",fuelInVehicle-3)
    else
      setElementData(source,"vehicle:fuel",fuelInVehicle-4)
  end
end

addEventHandler("onFuelCheck",getRootElement(),dropFuel)
setTimer( function () for key, value in ipairs(getElementsByType("vehicle")) do if getElementData(value,"vehicle:fuel") then if getVehicleEngineState(value)==true then if getElementData(value,"vehicle:fuel")<1 then setVehicleEngineState(value,false)end end end end end,1000,0)


function onStart()
    for key, value in ipairs(getElementsByType("vehicle")) do
    if not getElementData(value,"vehicle:fuel") then
        setElementData(value,"vehicle:fuel",100)
    end
end
end

function createFuelStation(playerSource,createfuelstation,marker)
if getPlayerAccount(playerSource) then
if isPlayerInACL(playerSource,"Admin") then
if marker == "1" then
local x, y, z = getElementPosition(playerSource)
local marker = createMarker(x-0.5,y,z,"cylinder",4,255,127,42,255)
createBlipAttachedTo(marker,56)
setElementData(marker,"fuelstation",true)
table.insert(stations,marker)
else
local x, y, z = getElementPosition(playerSource)
local marker = createMarker(x-0.5,y,z,"cylinder",4,255,127,42,255)
setElementData(marker,"fuelstation",true)
table.insert(stations,marker)
end
else outputChatBox("#63DBFF*Nie masz wystarczających praw do używania tej komendy.",playerSource,0,0,0,true)
end
end
end


addCommandHandler("createstation",createFuelStation)

function checkStation(vehicle)
for key, value in ipairs(stations) do
if isElementWithinMarker(vehicle,value)
then
return true
end
end
end

addCommandHandler("zatankuj",function (ps) 
if isPedInVehicle(ps) then
if getVehicleController(getPedOccupiedVehicle(ps))==ps then
if checkStation(getPedOccupiedVehicle(ps)) then
local vehicle = getPedOccupiedVehicle(ps)
local money = (100-getElementData(vehicle,"vehicle:fuel"))*2
if getPlayerMoney(ps)>money then
setElementData(vehicle,"vehicle:fuel",100)
takePlayerMoney(ps,money)
outputChatBox("#63DBFF*Zatankowałeś auto do pełna za #B9F46C"..money.."$#63DBFF.",ps,0,0,0,true)
else outputChatBox("#63DBFF*Nie masz wystarczająco dużo pieniędzy żeby zatankować wóz. Koszt zatankowania: #B9F46C"..money.."$#63DBFF.",ps,0,0,0,true)
end
else outputChatBox("#63DBFF*Nie jesteś na stacji paliw.",ps,0,0,0,true)
end
else outputChatBox("#63DBFF*Musisz być na miejscu kierowcy żeby to zrobić.",ps,0,0,0,true)
end
else outputChatBox("#63DBFF*Musisz być w pojeżdzie żeby to zrobić.",ps,0,0,0,true)
end
end)


onStart()

setTimer(onStart,1000,0)
    
addEventHandler("onPlayerMarkerHit",getRootElement(),function (marker,dim)
if dim then
if checkStation(getPedOccupiedVehicle(source)) then
outputChatBox("#63DBFF*Jeżeli chcesz zatankować wpisz #B9F46C/zatankuj#63DBFF.",source,0,0,0,true)
end end end)

    