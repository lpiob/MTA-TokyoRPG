        
function lol()
    local screenWidth, screenHeight = guiGetScreenSize()
    local x, y = guiGetScreenSize()
    text = dxDrawText("            Ładowanie proszę czekać!\n\n              _= Tokyo Drift Life =_\n\n              * Gangi i Strzelaniny! *\n           * Prywatne Domy i Auta! *\n          *  Prawdziwa Mapa Tokyo! *\n      * Organizowane turnieje i wyścig!i *\n   * Wyścigi które możesz tworzyć też ty! *\n      _-  I  co  najważniejsze Zabawa! -_", x/2, y/2, x/2, y/2, tocolor(255, 255, 255, 255), 1.30, "default-bold", "center", "top", false, false, true, false, false)
    end


addEvent("loadingOnLogin",true)

function loading()
if source == localPlayer then
addEventHandler("onClientRender",getRootElement(),lol)
setTimer(function () fadeCamera(true) removeEventHandler("onClientRender",getRootElement(),lol) setElementPosition(localPlayer,-2100.265625,1881.0595703125,82.2734375) end, 10000, 1)
end end
    
addEventHandler("loadingOnLogin",getRootElement(),loading)