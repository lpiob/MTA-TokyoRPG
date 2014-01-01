function stopTheMusic(vehicle)
triggerClientEvent("onPonySoundStop",vehicle)
end

function startTheMusic(ps,cmd,url)
if isPedInVehicle(ps) then
  local vehicle = getPedOccupiedVehicle(ps)
  if ( getElementModel(vehicle) == 413 ) then
    if ( url ) then
      if getVehicleController(getPedOccupiedVehicle(ps))==ps then
        if not getElementData(vehicle,"pony:sound") then
        triggerClientEvent("onPonySoundStart",vehicle,url)
        setElementData(vehicle,"pony:sound",true)
        outputChatBox("*Puściłeś muzykę w Pony.",ps)
        else
        triggerClientEvent("onPonySoundStop",vehicle)
        triggerClientEvent("onPonySoundStart",vehicle)
        setElementData(vehicle,"pony:sound",true)
        outputChatBox("*Puściłeś muzykę w Pony.",ps)
        end
      else
      outputChatBox("*Musisz być kierowcą w tym pojeździe.",ps)
      end
    else
    if getElementData(vehicle,"pony:sound") then
    stopTheMusic(vehicle)
    setElementData(vehicle,"pony:sound",false)
    outputChatBox("*Wyłączyłeś muzykę w Pony.",ps)
    end
    end
  else
  outputChatBox("*Musisz być w Pony.",ps)
  end
else
outputChatBox("*Musisz być w pojeździe.",ps)
end
end

addCommandHandler("wlaczmuzyke",startTheMusic)