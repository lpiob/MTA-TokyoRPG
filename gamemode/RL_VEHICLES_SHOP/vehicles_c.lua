addEventHandler("onClientRender",getRootElement(),function ()
    for key, value in ipairs(getElementsByType("vehicle")) do
    if getElementData(value,"vehicle:owner")==0 then
        if getElementData(value,"vehicle:travel") then
        local x, y, z = getElementPosition(value)
        local xs, ys, ds = getScreenFromWorldPosition(x,y,z)
        if ds~= nil then
        if ds<=15 then
        if not getElementData(value,"vehicle:used") then
        dxDrawText("  Pojazd \n  Nazwa: "..getVehicleName(value).." \n  Stan: Nowy \n  Przebieg: "..math.floor(getElementData(value,"vehicle:travel")/1000).." Kilometrów \n  Cena: "..getElementData(value,"vehicle:cost").."$",xs,ys+4,xs,ys,tocolor(255,255,255),1.2,"default","center")
            else
            dxDrawText("  Pojazd \n  Nazwa: "..getVehicleName(value).." \n  Stan: Używany \n  Przebieg: "..math.floor(getElementData(value,"vehicle:travel")/1000).." Kilometrów \n  Cena: "..getElementData(value,"vehicle:cost").."$",xs,ys+4,xs,ys,tocolor(255,255,255),1.2,"default","center")
    end
end
end
end
end
end
end)
    


addEventHandler("onClientRender",getRootElement(),function ()
for key, value in ipairs(getElementsByType("blip")) do
if getElementData(value,"blip:vehicle") then
if getElementType(getElementData(value,"blip:vehicle"))=="vehicle" then
local x, y, z = getElementPosition(getElementData(value,"blip:vehicle"))
setElementPosition(value,x,y,z)
end
end
end
end)