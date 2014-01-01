window = guiCreateWindow(0.28, 0.23, 0.47, 0.46, "Job Creator", true)
guiWindowSetSizable(window, false)
nazwapracy = guiCreateEdit(0.29, 0.19, 0.45, 0.08, "", true, window)
label1 = guiCreateLabel(0.41, 0.10, 0.25, 0.05, "Nazwa Pracy", true, window)
platnosc = guiCreateEdit(0.29, 0.39, 0.45, 0.08, "", true, window)
label2 = guiCreateLabel(0.45, 0.30, 0.13, 0.05, "Płatność", true, window)
wielkosc = guiCreateEdit(0.29, 0.59, 0.45, 0.08, "", true, window)
label3 = guiCreateLabel(0.39, 0.51, 0.25, 0.05, "Wielkość Markera", true, window)
label4 = guiCreateLabel(0.81, 0.92, 0.21, 0.06, "By: xScatta", true, window)
guiSetFont(label4, "default-bold-small")
exitbutton = guiCreateButton(0.03, 0.88, 0.06, 0.08, "X", true, window)
stworzprace = guiCreateButton(0.31, 0.77, 0.39, 0.10, "Stwórz Prace", true, window)    
guiSetVisible(window,false)


addEvent("callJobCreatorClient",true)
addEventHandler("callJobCreatorClient",getRootElement(),function ()
    if source == localPlayer then
        guiSetVisible(window,true)
        guiSetInputEnabled(true)
        showCursor(true)
    end
end)

addEventHandler("onClientGUIClick",getRootElement(),function ()
    if source == stworzprace then
                    triggerServerEvent("callJobCreator",localPlayer,guiGetText(nazwapracy),tonumber(guiGetText(platnosc)),tonumber(guiGetText(wielkosc)))
    else if source == exitbutton then
        guiSetVisible(window,false)
        guiSetInputEnabled(false)
        showCursor(false)
    end
end
end)

addEvent("callHideJobCreatorGUI",true)
addEventHandler("callHideJobCreatorGUI",getRootElement(),function ()
    if localPlayer == source then
    guiSetVisible(window,false)
    guiSetInputEnabled(false)
    showCursor(false)
end
end)

addEventHandler("onClientRender",getRootElement(), function()
    for key, value in ipairs(getElementsByType("marker")) do
    if getElementData(value,"job:cash") then
        local x, y, z = getElementPosition(value)
        local xs, ys, ds = getScreenFromWorldPosition(x,y,z)
        if ds ~= nil or false then
            if ds <= 15 then 
        if xs and ys ~= nil or false then
        if getElementDimension(localPlayer)==getElementDimension(value) then
            dxDrawText("Praca: "..getElementData(value,"job:jobname").." \nZarobki: "..getElementData(value,"job:cash").."$",xs,ys,xs,ys,tocolor(255,255,255,255),1.25,"default","center")
            end
        else
        end
    else
    end
end
else
end
end
end)
        