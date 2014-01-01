addEvent("onAlkoholStop")

addCommandHandler("marihuana",function (ps)
if not getElementData(ps,"player:alkohol_beer") then
setElementData(ps,"player:alkohol_beer",true)
setTimer(function () removeElementData(ps,"player:alkohol_beer") triggerEvent("onAlkoholStop",ps)end,60000,1)
else outputChatBox("*Aktualnie jesteś pijany.",ps,255,255,255,true)
end
end)

addCommandHandler("koka",function (ps)
if not getElementData(ps,"player:alkohol_wodka") then
setElementData(ps,"player:alkohol_wodka",true)
setTimer(function () removeElementData(ps,"player:alkohol_wodka") triggerEvent("onAlkoholStop",ps)end,60000,1)
else outputChatBox("*Aktualnie jesteś pijany.",ps,255,255,255,true)
end
end)

addEventHandler("onAlkoholStop",getRootElement(),function ()
resetSkyGradient()
resetWaterColor()
end)