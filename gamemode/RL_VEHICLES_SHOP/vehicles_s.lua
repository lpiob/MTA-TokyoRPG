function isPlayerInACL ( player, acl )
    local account = getPlayerAccount ( player )
    if ( isGuestAccount ( account ) ) then
        return false
    end
        return isObjectInACLGroup ( "user."..getAccountName ( account ), aclGetGroup ( acl ) )
end


function give(playerSource,pcar,car,cost,km)
    if isPlayerInACL(playerSource,"Admin") then 
        if ( car ) then 
             if not tonumber(car) then
                car = string.lower(car)
                car = getVehicleModelFromName(car)
             end -- w innym przypadku zmienna car nadal będzie przechowywała ID pojazdu, więc nic nie robimy w przypadku gd y podano ID.
                x, y, z = getElementPosition(playerSource)
            local theCar = createVehicle(car,x,y,z+0.15)
            setElementPosition(playerSource,x,y,z+1.5)
            local xr,yr,zr = getElementRotation(playerSource)
            setElementRotation(theCar,xr,yr,zr)
            setElementData(theCar,"vehicle:cost",tonumber(cost))
            setElementData(theCar,"vehicle:owner", false)
            setElementFrozen(theCar,true)
        o   utputChatBox("#63DBFF*Stworzyłeś pojazd #B9F46C"..getVehicleNameFromModel(car).." #63DBFFktóry kosztuje #B9F46C"..cost.."$#63DBFF.",playerSource,0,0,0,true)
            if km then
                setElementData(theCar,"vehicle:travel",tonumber(km))
            end
        else
            outputChatBox("#63DBFF*Wpisałeś złą nazwę auta.",playerSource,0,0,0,true)
        end 
end
end

addCommandHandler("pcar",give)

function onBuyCar(sPlayer)
  if not isGuestAccount(getPlayerAccount(sPlayer)) then
    if isPedInVehicle(sPlayer) then
        if getElementData(getPedOccupiedVehicle(sPlayer),"vehicle:owner") == false then
             if getPlayerMoney(sPlayer)>=tonumber(getElementData(getPedOccupiedVehicle(sPlayer),"vehicle:cost")) then
                setElementData(getPedOccupiedVehicle(sPlayer),"vehicle:owner",getPlayerAccount(sPlayer))
                setElementData(getPedOccupiedVehicle(sPlayer),"ownername",getPlayerName(sPlayer))
                takePlayerMoney(sPlayer,getElementData(getPedOccupiedVehicle(sPlayer),"vehicle:cost"))
                setVehicleEngineState(getPedOccupiedVehicle(sPlayer),true)
                setElementFrozen(getPedOccupiedVehicle(sPlayer),false)
                setElementData(getPedOccupiedVehicle(sPlayer),"ownername",getPlayerName(sPlayer))
                outputChatBox("#63DBFF*Kupiłeś/aś pojazd #B9F46C"..getVehicleName(getPedOccupiedVehicle(sPlayer)).."#63DBFF za #B9F46C"..getElementData(getPedOccupiedVehicle(sPlayer),"vehicle:cost").."$#63DBFF.",sPlayer,0,0,0,true)
                local x, y, z = getElementPosition(getPedOccupiedVehicle(sPlayer))
                local blip = createBlip(x,y,z,0,1,0,0,255,255,0,65535,sPlayer) setElementData(blip,"blip:vehicle",getPedOccupiedVehicle(sPlayer))
            else 
                outputChatBox("#63DBFF*Nie masz wystarczająco dużo pieniędzy żeby kupić ten pojazd.",sPlayer,0,0,0,true)
            end
        end
    else 
        outputChatBox("#63DBFF*Musisz być zalogowany.",sPlayer,0,0,0,true)
    end
  end
 end

addCommandHandler("kuppojazd",onBuyCar)
                

function onEnterCar(thePlayer,seat,jacked)
    if seat == 0 then
        if getElementData(source,"vehicle:owner") == false then 
            setVehicleEngineState(source,false)
             outputChatBox("#63DBFF*Ten pojazd #B9F46C("..getVehicleName(source)..") #63DBFFkosztuje#B9F46C "..getElementData(source,"vehicle:cost").."$#63DBFF.",thePlayer,0,0,0,true)
            outputChatBox("#63DBFF*Jeżeli chcesz kupić ten pojazd wpisz#B9F46C /kuppojazd".."#63DBFF.",thePlayer,0,0,0,true)
        elseif seat == 0 then 
            if getElementData(source,"vehicle:owner") then 
                if getElementData(source,"vehicle:owner") ~= getPlayerAccount(thePlayer)then
                    removePedFromVehicle(thePlayer) 
                    outputChatBox("#63DBFF*Ten pojazd #B9F46C("..getVehicleName(source)..") #63DBFFnie należy do ciebie.",thePlayer,0,0,0,true)
                end
            end
        end
    end
end


addEventHandler("onVehicleStartEnter",getRootElement(),
    function (thePlayer,seat,jacked)
        if seat == 0 then
            if getElementData(source,"vehicle:owner") =~ getPlayerAccount(source) or getElementData(source, "vehicle:owner") == false then
                    outputChatBox("#63DBFF*Ten pojazd #B9F46C("..getVehicleName(source)..") #63DBFFnie należy do ciebie.",thePlayer,0,0,0,true)
                end
            end
    end
)

addEventHandler("onVehicleEnter",getRootElement(),onEnterCar)



-- Tutaj bylo odswiezanie blipow ale wywalilem to i same blipy bo bylo to nieoptymalne


function sellCar(pps,command,koszt)
if isPedInVehicle(pps) then
if getElementData(getPedOccupiedVehicle(pps),"vehicle:owner") == getPlayerAccount(pps) then
if koszt then
if getElementData(getPedOccupiedVehicle(pps),"vehicle:cost")>=tonumber(koszt) then
setElementData(getPedOccupiedVehicle(pps),"vehicle:cost",tonumber(koszt))
carx = getPedOccupiedVehicle(pps)
setElementFrozen(carx,true)
setVehicleEngineState(carx,false)
setVehicleDamageProof(carx,true)
setElementData(carx,"vehicle:owner", false)
setElementData(carx,"vehicle:used",true)
setElementData(carx,"vehicle:cost",tonumber(koszt))
givePlayerMoney(pps,tonumber(koszt))
outputChatBox("#63DBFF*Wystawiłeś/aś pojazd #B9F46C"..getVehicleName(carx).." #63DBFFza #B9F46C"..tostring(koszt).."$#63DBFF.",pps,0,0,0,true)
removePedFromVehicle(pps)
else 
carx = getPedOccupiedVehicle(pps) 
outputChatBox("#63DBFF*Nie możesz wystawić tego pojazdu za #B9F46C"..tostring(koszt).."$ #63DBFFponieważ jest to więcej niż jego poprzednia cena #B9F46C("..tostring(getElementData(carx,"vehicle:cost")).."$)#63DBFF.",pps,0,0,0,true)
end
else 
outputChatBox("#63DBFF*Żle wpisana komenda powinno być #B9F46C/sprzedajpojazd <cena>#63DBFF.",pps,0,0,0,true)
end
else
    outputChatBox("#63DBFF*Ten pojazd nie należy do ciebie.",pps,0,0,0,true)
end
end
end

addCommandHandler("sprzedajpojazd",sellCar)

addEventHandler("onElementDestroy",getRootElement(),function ()
if getElementType(source) = ="vehicle" then
setElementData(source,"vehicle:owner",nil)
setElementData(source,"vehicle:cost",nil)
setElementData(source,"vehicle:used",nil)
setElementData(source,"vehicle:travel",nil)
if getElementData(source,"vehicle:blip") ~= nil or getElementData(source,"vehicle:blip") =~ false then
destroyElement(getElementData(source,"vehicle:blip"))
end
end
end)



setTimer(function () 
for k, v in ipairs(getElementsByType("player")) do
for key, value in ipairs(getElementsByType("blip")) do
if getElementData(value,"blip:vehicle") then
if isElement(getElementData(value,"blip:vehicle")) then
if getElementType(getElementData(value,"blip:vehicle"))=="vehicle" then
local vehicle = getElementData(value,"blip:vehicle")
if getElementData(vehicle,"vehicle:owner")~=0 then
if getElementData(vehicle,"vehicle:owner") == getPlayerAccount(v) then
setElementVisibleTo(value,v,true)
else
setElementVisibleTo(value,v,false)
end
end
end
end
end
end
end
end,1000,0)
     
