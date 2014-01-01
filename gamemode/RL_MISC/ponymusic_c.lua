addEvent("onPonySoundStart",true)
addEvent("onPonySoundStop",true)

addEventHandler("onPonySoundStart",getRootElement(),function (url)
local x, y, z = getElementPosition(source)
local sound = playSound3D(url,x,y,z,true)
setSoundMinDistance(sound,0)
setSoundMaxDistance(sound,30)
attachElements(sound,source)
end)

addEventHandler("onPonySoundStop",getRootElement(),function ()
for key, value in ipairs(getAttachedElements(source)) do
if getElementType(value)=="sound" then
stopSound(value)
end
end
end)

