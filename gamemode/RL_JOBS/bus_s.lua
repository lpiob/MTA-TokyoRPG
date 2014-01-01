
--[[
busjob = createElement("busmoney")

max = 50
min = 25

addEvent("onBusMoneyMinChange",true)
addEventHandler("onBusMoneyMinChange",getRootElement(),function (kwota)
min = tonumber(kwota)
end)

addEvent("onBusMoneyMaxChange",true)
addEventHandler("onBusMoneyMaxChange",getRootElement(),function (kwota)
max = tonumber(kwota)
end)

addCommandHandler("buspanel",function (ps)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(ps)),aclGetGroup("Admin")) then
triggerClientEvent("onBusPanelOpen",ps)
else
outputChatBox("*Nie masz wystarczających praw do używania tej funkcji.",ps)
end end)

function table.random ( theTable )
    return theTable[math.random ( #theTable )]
end

stations = {}

function stworzPrzystanek(ps)
    if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(ps)),aclGetGroup("Admin")) then
        local x, y, z = getElementPosition(ps)
        local marker = createMarker(x,y,z,"cylinder",3.5,255, 128, 0,150)
        local blip = createBlip(x,y,z,0,2,255, 128, 0,255,0,99999.0,marker)
        setElementVisibleTo(marker,getRootElement(),false)
        setElementVisibleTo(blip,getRootElement(),false)
        table.insert(stations,marker)
        setElementData(marker,"job:bus_blip",blip)
        outputChatBox("*Przystanek został pomyślnie stworzony.",ps)
        else outputChatBox("*Nie masz wystarczających praw do używania tej funkcji.",ps)
    end
end

function checkStation(element)
    for key, value in ipairs(stations) do
    if isElementWithinMarker(element,value)
        then return true
    end
end
end

addEvent("onBusJobEnd")
addEventHandler("onPlayerMarkerHit",getRootElement(),function(markerhit,dim)
    if ( dim ) then
        if checkStation(source) then
            if isPedInVehicle(source) then
                local vehicle = getPedOccupiedVehicle(source)
                if ( getElementModel(vehicle) == 431 or
                getElementModel(vehicle) == 437 ) then
                if isElementVisibleTo(markerhit,source) then
                    triggerEvent("onBusJobEnd",source,markerhit)
                end
            end
        end
        end
    end
end)

setTimer( function ()
    for key, value in ipairs(getElementsByType("player")) do
    if isPedInVehicle(value) then
    if getVehicleController(getPedOccupiedVehicle(value))==value then
        local vehicle = getPedOccupiedVehicle(value)
        if ( getElementModel(vehicle)==431
            or
            getElementModel(vehicle)==437 ) then
            if not getElementData(value,"player:job_bus") then
                local rstation = table.random(stations)
                setElementVisibleTo(rstation,value,true)
                setElementVisibleTo(getElementData(rstation,"job:bus_blip"),value,true)
                --setElementVisibleTo(getElementData(rstation,"job:bus_blip"),value,true)
                setElementData(value,"player:job_bus",rstation)
                elseif getElementModel(value,"player:job_bus") then end
                else if not ( getElementModel(vehicle)==431 or getElementModel(vehicle)== 437 ) then
                if getElementData(value,"player:job_bus") then
                for key, value1 in ipairs(stations) do
                setElementVisibleTo(value1,value,false)
                setElementVisibleTo(getElementData(value1,"job:bus_blip"),value,false)
               end
                setElementVisibleTo(rstation,value,false)
                --setElementVisibleTo(getElementData(rstation,"job:bus_blip"),value,false)
            setElementData(value,"player:job_bus",nil)
            end
            end
            end
            end
            else
            for key, value1 in ipairs(stations) do
            setElementVisibleTo(getElementData(value1,"job:bus_blip"),value,false)
            setElementVisibleTo(value1,value,false)
            end
            setElementData(value,"player:job_bus",nil)
            end end end,1000,0)

            addEventHandler("onBusJobEnd",getRootElement(),function (markerhit)
            if source==getVehicleController(getPedOccupiedVehicle(source)) then
            setElementVisibleTo(markerhit,source,false)
            setElementVisibleTo(getElementData(markerhit,"job:bus_blip"),source,false)
            setElementData(source,"player:job_bus",nil)
            local money = math.random(min,max)
    givePlayerMoney(source,money)
    outputChatBox("*Zarobiłeś "..money.."$ za ten przystanek.",source)
    end end)

addCommandHandler("stworzprzystanek",stworzPrzystanek)
]]--
