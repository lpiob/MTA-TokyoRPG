
--[[
window = guiCreateWindow(0.40, 0.35, 0.21, 0.22, "Ustawienia", true)
guiWindowSetSizable(window, false)
buttonmax = guiCreateButton(0.05, 0.17, 0.43, 0.41, "Max.\nZarobek", true, window)
buttonmin = guiCreateButton(0.52, 0.17, 0.43, 0.41, "Min.\nZarobek", true, window)
kwota = guiCreateEdit(0.04, 0.63, 0.91, 0.13, "100", true, window)
exit = guiCreateButton(0.82, 0.79, 0.13, 0.15, "X", true, window)  
guiSetVisible(window,false)
    
addEvent("onBusPanelOpen",true)
addEventHandler("onBusPanelOpen",getRootElement(),function ()
if source == localPlayer then
    showCursor(true)
    guiSetVisible(window,true)
    guiSetInputEnabled(true)
    end end)

addEventHandler("onClientGUIClick",getRootElement(),function (button)
    if source == buttonmax then
    if button == "left" then
        triggerServerEvent("onBusMoneyMaxChange",localPlayer,guiGetText(kwota))
        outputChatBox("*Ustawiłeś maksymalną stawke pracy busa na "..guiGetText(kwota).."$.")
    end
end
end)

addEventHandler("onClientGUIClick",getRootElement(),function (button)
    if source == buttonmin then
    if button == "left" then
        triggerServerEvent("onBusMoneyMinChange",localPlayer,guiGetText(kwota))
        outputChatBox("*Ustawiłeś minimalną stawke pracy busa na "..guiGetText(kwota).."$.")
    end
end
end)

addEventHandler("onClientGUIClick",getRootElement(),function (button)
    if source == exit then
        showCursor(false)
        guiSetInputEnabled(false)
        guiSetVisible(window,false)
end
end)
]]--