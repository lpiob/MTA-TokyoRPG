addEventHandler("onClientResourceStart", resourceRoot,
    function()
        window = guiCreateWindow(0.32, 0.21, 0.40, 0.50, "Panel Logowania", true)
        guiWindowSetSizable(window, false)
        editlogin = guiCreateEdit(0.21, 0.27, 0.60, 0.08, "", true, window)
        label1 = guiCreateLabel(0.29, 0.19, 0.42, 0.08, "Nazwa Użytkownika", true, window)
        guiLabelSetHorizontalAlign(label1, "center", false)
        guiLabelSetVerticalAlign(label1, "center")
        label2 = guiCreateLabel(0.29, 0.46, 0.42, 0.08, "Hasło", true, window)
        guiLabelSetHorizontalAlign(label2, "center", false)
        guiLabelSetVerticalAlign(label2, "center")
        edithaslo = guiCreateEdit(0.21, 0.54, 0.60, 0.08, "", true, window)
        guiEditSetMasked(edithaslo, true)
        buttonzarejestruj = guiCreateButton(0.54, 0.76, 0.30, 0.14, "Zarejestruj", true, window)
        buttonzaloguj = guiCreateButton(0.18, 0.76, 0.30, 0.14, "Zaloguj", true, window)   
        showCursor(true)
        guiSetInputEnabled(true)
    end
)

addEventHandler("onClientGUIClick",getRootElement(), function () 
    if source == buttonzaloguj then
    triggerServerEvent("onTryLogin",localPlayer,guiGetText(editlogin),guiGetText(edithaslo))
end
end)

addEventHandler("onClientGUIClick",getRootElement(), function () 
   if source == buttonzarejestruj then
    triggerServerEvent("onTryRegister",localPlayer,guiGetText(editlogin),guiGetText(edithaslo))
end
end)

addEvent("hideGui",true)
addEventHandler("hideGui",getRootElement(),function ()
if source == localPlayer then
    showCursor(false)
    guiSetVisible(window,false)
    end
    end)
    
    
    
