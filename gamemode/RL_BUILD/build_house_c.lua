--

addEventHandler("onClientRender",getRootElement(),function ()
    if getElementData(localPlayer,"marker") then
      if not isPedInVehicle(localPlayer) then
      local marker = getElementData(localPlayer,"marker")
      if getElementData(marker,"building") then
          if getElementData(marker,"tpin") then
        if ( getElementData(marker,"enterable")==1 ) or getElementData(marker,"house:owner_player")==localPlayer or getElementData(marker,"house:owner")==0 then
        local width, height = guiGetScreenSize()
        dxDrawRectangle(788/1024*width, 326/768*height, 189/1024*width, 91/768*height, tocolor(0, 0, 0, 203), true)
        dxDrawRectangle(788/1024*width, 326/768*height, 189/1024*width, 21/768*height, tocolor(0, 0, 0, 255), true)
        dxDrawText("Wiadomość", 787/1024*width, 326/768*height, 977/1024*width, 347/768*height, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, true, false, false)
        dxDrawText("Jeżeli chcesz wejść\ndo tego budynku\nwpisz /wejdz.", 787/1024*width, 347/768*height, 977/1024*width, 417/768*height, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, true, false, false)
    end
end
    end
end
end
end) 

addEventHandler("onClientRender",getRootElement(),function ()
    if getElementData(localPlayer,"marker") then
      if not isPedInVehicle(localPlayer) then
      local marker = getElementData(localPlayer,"marker")
          if getElementData(marker,"tpout") then
              local width, height = guiGetScreenSize()
        dxDrawRectangle(788/1024*width, 326/768*height, 189/1024*width, 91/768*height, tocolor(0, 0, 0, 203), true)
        dxDrawRectangle(788/1024*width, 326/768*height, 189/1024*width, 21/768*height, tocolor(0, 0, 0, 255), true)
        dxDrawText("Wiadomość", 787/1024*width, 326/768*height, 977/1024*width, 347/768*height, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, true, false, false)
        dxDrawText("Jeżeli chcesz wyjść\nz tego budynku\nwpisz /wyjdz.", 787/1024*width, 347/768*height, 977/1024*width, 417/768*height, tocolor(255, 255, 255, 255), 1.00, "default", "center", "center", false, false, true, false, false)
    end
end
end
end)
              
           
