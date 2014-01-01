function convertNumber ( number )  
    local formatted = number  
    while true do      
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')    
        if ( k==0 ) then      
            break   
        end  
    end  
    return formatted
end

local sw, sh = guiGetScreenSize()

addEventHandler("onClientRender",getRootElement(),function ()
    if isPedInVehicle(localPlayer) then
        local vehicle = getPedOccupiedVehicle(localPlayer)
dxDrawRectangle(0.779*sw, 0.278*sh, 0.170*sw, 0.0351*sh, tocolor(0, 0, 0, 226), true)
dxDrawText("Panel Pojazdu", 0.821*sw, 0.2851*sh, 0.900*sw, 0.3046*sh, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, true, false, false)
dxDrawRectangle(0.779*sw, 0.313*sh, 0.170*sw, 0.2708*sh, tocolor(0, 0, 0, 160), true)
dxDrawRectangle(0.789*sw, 0.345*sh, 0.151*sw, 0.022*sh, tocolor(0, 0, 0, 172), false)
dxDrawText("Pojazd: "..getVehicleName(vehicle), 0.789*sw, 0.345*sh, 0.9150*sw, 0.3671*sh, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
dxDrawRectangle(0.779*sw, 0.4791*sh, 0.170*sw, 0.0078*sh, tocolor(0, 0, 0, 227), false)
dxDrawRectangle(0.789*sw, 0.3802*sh, 0.151*sw, 0.022*sh, tocolor(0, 0, 0, 172), false)
dxDrawRectangle(0.789*sw, 0.4153*sh, 0.151*sw, 0.022*sh, tocolor(0, 0, 0, 172), false)
dxDrawText("Stan: "..math.floor(health(vehicle)).."%", 0.789*sw, 0.380*sh, 0.9150*sw, 0.4024*sh, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
dxDrawText("Paliwo: "..getElementData(vehicle,"vehicle:fuel").."%", 0.789*sw, 0.415*sh, 0.915*sw, 0.4375*sh, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
dxDrawText("Informacje", 0.789*sw, 0.3216*sh, 0.9404*sw, 0.3398*sh, tocolor(255, 255, 255, 255), 1.00, "default", "center", "top", false, false, true, false, false)
dxDrawRectangle(0.789*sw, 0.519*sh, 0.151*sw, 0.022*sh, tocolor(0, 0, 0, 172), false)
dxDrawRectangle(0.789*sw, 0.5481*sh, 0.151*sw, 0.022*sh, tocolor(0, 0, 0, 172), false)
dxDrawText("Silnik: "..engine(vehicle), 0.789*sw, 0.5195*sh, 0.9150*sw, 0.40625*sh, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
dxDrawText("Światła: "..lights(vehicle), 0.789*sw, 0.5481*sh, 0.9150*sw, 0.5703*sh, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
dxDrawText("Funkcje", 0.789*sw, 0.492*sh, 0.9404*sw, 0.5104*sh, tocolor(255, 255, 255, 255), 1.00, "default", "center", "top", false, false, true, false, false)
dxDrawRectangle(0.789*sw, 0.450*sh, 0.151*sw, 0.022*sh, tocolor(0, 0, 0, 172), false)
dxDrawText("Przebieg: "..przebieg(vehicle), 0.789*sw, 0.4505*sh, 0.9150*sw, 0.4726*sh, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, true, false, false)
end
end)


function lights(vehicle)
if ( getVehicleOverrideLights(vehicle)==0 or getVehicleOverrideLights(vehicle)== 1 ) then
    return "zgaszone"
else if getVehicleOverrideLights(vehicle)==2 then
    return "zapalone"
end
end
end

function engine(vehicle)
if getVehicleEngineState(vehicle)== true then
    return "zapalony"
else
    return "zgaszony"
end
end

function health(vehicle)
local hp = getElementHealth(vehicle)
return hp / 10
end

function przebieg(vehicle)
local number = math.floor(getElementData(vehicle,"vehicle:travel"))
if number > 1000 then
return convertNumber(math.floor(number / 1000)).." Kilometry."
else
return math.floor(number).." Metry."
end
end



