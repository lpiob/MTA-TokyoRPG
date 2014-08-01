addEventHandler("onPlayerJoin",getRootElement(),function () setElementPosition(source,spawnPlayer(source,-2100.265625,1881.0595703125,82.2734375))
end)



addEvent("onTryLogin",true)
addEventHandler("onTryLogin",getRootElement(),function (login,haslo)
   if logIn(source, getPlayerAccount(source), haslo) then
          outputChatBox("#63DBFF*Zostałeś pomyślnie zalogowany.",source,0,0,0,true)
        triggerClientEvent("hideGui",source)
        --spawnPlayer(source,0,0,3)
        setCameraTarget(source)
    else 
        outputChatBox("#63DBFF*Podałeś złe hasło.",source,0,0,0,true)
 end
end)


addEvent("onTryRegister",true)
addEventHandler("onTryRegister",getRootElement(),function (login,haslo)
    if not getAccount(login) then 
    if addAccount(login,haslo) then
        logIn(source,getAccount(login),haslo)
        outputChatBox("#63DBFF*Zostałeś pomyślnie zarejestrowany i automatycznie zalogowany.",source,0,0,0,true)
        outputChatBox("#63DBFF*Stworzyłeś konto o nazwie: #B9F46C"..login.." #63DBFFi haśle: #B9F46C"..haslo.."#63DBFF.",source,0,0,0,true)
        triggerClientEvent("hideGui",source)
     --   spawnPlayer(source,0,0,3)
        setCameraTarget(source)
        else outputChatBox("#63DBFF*Już istnieje takie konto.",source,0,0,0,true)
        end else outputChatBox("#63DBFF*Wpisz poprawne dane.",source,0,0,0,true)
    end
end)
