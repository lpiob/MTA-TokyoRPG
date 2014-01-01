function fadeElement(element,fade,destroy)
if isElement(element) then
   if fade == true then -- Chowa element
   local timer = 50
   do if getElementAlpha(element)>1 then
   setTimer(function () setElementAlpha(element,getElementAlpha(element)-1)end,timer,1)
   timer = timer + 50
   if destroy == true then
   setTimer(function () destroyElement(element)end,timer+50,1)
   end
   end
   end
   else if fade == false then -- Odkrywa element
   do if getElementAlpha(element)<255 then
   setTimer(function () setElementAlpha(element,getElementAlpha(element)+1)end,timer,1)
   timer = timer + 50
   if destroy == true then
   setTimer(function () destroyElement(element)end,timer+50,1)
   else
   end
   end
   end
   end
   end
   end
end


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

function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="mph" or unit==1 or unit =='1') then
            return (x^2 + y^2 + z^2) ^ 0.5 * 100
        else
            return (x^2 + y^2 + z^2) ^ 0.5 * 1.8 * 100
        end
    else
        outputDebugString("Not an element. Can't get speed")
        return false
    end
end


local width, height = guiGetScreenSize()


window = guiCreateWindow(0.21, 0.20, 0.57, 0.61, "Panel Info", true)
guiWindowSetSizable(window, false)
label = guiCreateLabel(0.26, 0.05, 0.47, 0.03, "Witaj tutaj dowiesz się jak zacząć gre na serwerze.", true, window)
guiLabelSetHorizontalAlign(label, "center", false)
memo = guiCreateMemo(0.02, 0.09, 0.97, 0.89, "                                 Tutaj wytłumaczymy ci jak zacząć gre na serwerze.\n                                                                \n                                                       ==Początek==\n                                                      \n                                                      1. Wybór auta\n\n                            Przed spawnem stoją wozy kup jeden z nich nie ważne który.\n\n             ( Jeżeli potrzebujesz innych wozów to napisz do jednego z adminów lub mechaników ,                               admin zrobi nastepne auta, mechanik zamówi dane auto)\n                                                     \n                                                         2. Pieniądze\n              \n               Pieniądze, zarabiasz poprzez drift, lub jeżdzenie motorem na jednym kole lub prace\n                             Możesz je zużywać do kupywania domów aut tunningu itp.   \n\n                                               3. Przydatne komendy i bindy\n                                                              \n                           /dajkase <nick> <ilosc> - przelewanie pieniedzy na cudze konto.\n\n                                                 /zamknij - zamykanie domu.\n                                                 /otworz - otwieranie domu.\n\n                                        U - bind na czat globalny który wszyscy widzą.\n\n                                    K - bind na zapalenie lub zgaszenie silnika w pojazdach.\n                                    L - bind na zapalenie lub zgaszenie świateł w pojazdach.\n                                    O - bind na zaciągniecie hamulca ręcznego w pojazdach. \n                                   ( nikt nie przepcha waszego pojazdu ani go nie zepsuje)\n\n                                                            4. Pomoc\n \n                                Jeżeli nadal czegoś nierozumiecie napiszcie do graczy lub                                                             adminów na czacie globalnym ( U ) a ktoś wam odpisze.\n\n\n\n                                       Miłej gry życzy Administracja, Tokyo Roleplay.\n                                                  ", true, window)  
guiMemoSetReadOnly(memo,true)

function infoTab()
if getKeyState("F1")== true then
guiSetVisible(window,true)
showCursor(true)
else
guiSetVisible(window,false)
showCursor(false)
end
end



addEventHandler("onClientRender",getRootElement(),infoTab)
addEventHandler("onClientRender",getRootElement(),function ()
dxDrawRectangle(659/800*width, 32/600*height, 106/800*width, 16/600*height, tocolor(0, 0, 0, 216), true)
dxDrawRectangle(662/800*width, 35/600*height, 100/800*width, 10/600*height, tocolor(2, 107, 0, 162), true)
dxDrawRectangle(662/800*width, 35/600*height, getElementHealth(localPlayer)/800*width, 10/600*height, tocolor(4, 205, 0, 216), true)
dxDrawText("¥  "..convertNumber(string.format("%09d", getPlayerMoney(localPlayer))), 660/800*width, 49/600*height, 766/800*width, 65/600*height, tocolor(0, 0, 0, 255), 0.70/800*width, 0.70/600*height, "pricedown", "left", "top", false, false, true, false, false)
dxDrawText("¥  "..convertNumber(string.format("%09d", getPlayerMoney(localPlayer))), 659/800*width, 48/600*height, 765/800*width, 64/600*height, tocolor(245, 219, 0, 255), 0.70/800*width, 0.70/600*height, "pricedown", "left", "top", false, false, true, false, false)
end)

addEvent("onNewsMessage",true)
addEvent("onNewsMessageEnd",true)



function showMessageNews(nick,message)
function showIt()
lol1 = dxDrawRectangle(192/1024*width, 736/768*height, 638/1024*width, 32/768*height, tocolor(0, 0, 0, 184), true)
lol2 = dxDrawText(" Tokyo News: "..message.."  ".."( "..nick.." )", 202/1024*width, 743/768*height, 824/1024*width, 758/768*height, tocolor(255, 255, 255, 255), 1.00/1024*width, 1.00/768*height, "default", "left", "top", false, false, true, false, false)
end
addEventHandler("onClientRender",getRootElement(),showIt)
end

function sendNews(nick,message)
setTimer(function () triggerEvent("onNewsMessageEnd",localPlayer)end,5000,1)
showMessageNews(nick,message)
end

addEventHandler("onNewsMessageEnd",getRootElement(),function ()
setTimer(function () removeEventHandler("onClientRender",getRootElement(),showIt)end,5000,1)
end)

addEventHandler("onNewsMessage",getRootElement(),sendNews)




