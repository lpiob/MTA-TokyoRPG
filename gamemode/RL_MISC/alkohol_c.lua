function useAlkohol()
if getElementData(localPlayer,"player:alkohol_beer") then
local x, y, z = getElementPosition(localPlayer)
explosion = createExplosion(x,y,z-15,2,false,2.5,false)
end
end

setTimer(useAlkohol,500,0)

function useAlkohol1()
if getElementData(localPlayer,"player:alkohol_wodka") then
local x, y, z = getElementPosition(localPlayer)
explosion = createExplosion(x,y,z-15,2,false,10,false)
end
end

setTimer(useAlkohol1,600,0)

addEventHandler("onClientRender",getRootElement(),function ()
if getElementData(localPlayer,"player:alkohol_wodka") or getElementData(localPlayer,"player:alkohol_beer") then
setSkyGradient(math.random(0,255),math.random(0,255),math.random(0,255),math.random(0,255),math.random(0,255),math.random(0,255))
setWaterColor(math.random(0,255),math.random(0,255),math.random(0,255),255)
end
end)