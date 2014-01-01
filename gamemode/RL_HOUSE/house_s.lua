-- MODE 1 HOUSE -- 2333.1044921875,-1073.7373046875,1049.0234375 + 1 !!!




function isPlayerInACL ( player, acl )
    local account = getPlayerAccount ( player )
    if ( isGuestAccount ( account ) ) then
        return false
    end
        return isObjectInACLGroup ( "user."..getAccountName ( account ), aclGetGroup ( acl ) )
end
    


dimension = 1

function createHouse(playerSource,createhouse,mode,money)
if isPlayerInACL(playerSource,"Admin") then
    if mode=="1" then
        local x, y, z = getElementPosition(playerSource)
        local marker = createMarker(x,y,z,"cylinder",1,0,255,0,125)
        setElementData(marker,"house",true)
        setElementData(marker,"owner","none")
        setElementData(marker,"ownern","Nikt")
        setElementData(marker,"blip",createBlipAttachedTo(marker,31))
        setElementData(marker,"mode",1)
        setElementData(marker,"dimension",dimension)
        dimension = dimension + 1
        setElementData(marker,"interior",6)
        setElementData(marker,"cost",money)
        setElementData(marker,"enterable",1)
        setElementDimension(marker,getElementDimension(playerSource))
        setElementInterior(marker,getElementInterior(playerSource))
        local markerin = createMarker(2333.06567,-1076.35986,1049.02344,"cylinder",1,225,225,0,125)
        setElementDimension(markerin,getElementData(marker,"dimension"))
        setElementInterior(markerin,6)
        setElementData(markerin,"exit",marker)
        setElementData(marker,"enter",markerin)
        outputChatBox("#FFFFFF[DOM]#63DBFF*Utworzyłeś dom typu 1 który kosztuje #B9F46C"..money.."$#63DBFF.",playerSource,0,0,0,true)
        setElementData(marker,"building",true)
        setElementData(markerin,"building",true)
        setElementData(marker,"tpin",true)
        setElementData(markerin,"tpout",true)
    elseif mode=="2" then
        local x, y, z = getElementPosition(playerSource)
        local marker = createMarker(x,y,z,"cylinder",1,0,255,0,125)
        setElementData(marker,"house",true)
        setElementData(marker,"owner","none")
        setElementData(marker,"ownern","nikt")
        setElementData(marker,"blip",createBlipAttachedTo(marker,31))
        setElementData(marker,"mode",2)
        setElementData(marker,"dimension",dimension)
        dimension = dimension + 1
        setElementData(marker,"interior",4)
        setElementData(marker,"cost",money)
        setElementData(marker,"enterable",1)
        setElementDimension(marker,getElementDimension(playerSource))
        setElementInterior(marker,getElementInterior(playerSource))
        local markerin = createMarker(260.99808,1284.88782,1080.25781,"cylinder",1,225,225,0,125)
        setElementDimension(markerin,getElementData(marker,"dimension"))
        setElementInterior(markerin,4)
        setElementData(markerin,"exit",marker)
        setElementData(marker,"enter",markerin)
        outputChatBox("#FFFFFF[DOM]#63DBFF*Utworzyłeś dom typu 2 który kosztuje #B9F46C"..money.."$#63DBFF.",playerSource,0,0,0,true)
        setElementData(marker,"building",true)
        setElementData(markerin,"building",true)
        setElementData(marker,"tpin",true)
        setElementData(markerin,"tpout",true)
     elseif
        mode=="3" then
        local x, y, z = getElementPosition(playerSource)
        local marker = createMarker(x,y,z,"cylinder",1,0,255,0,125)
        setElementData(marker,"house",true)
        setElementData(marker,"owner","none")
        setElementData(marker,"ownern","nikt")
        setElementData(marker,"blip",createBlipAttachedTo(marker,31))
        setElementData(marker,"mode",3)
        setElementData(marker,"dimension",dimension)
        dimension = dimension + 1
        setElementData(marker,"interior",8)
        setElementData(marker,"cost",money)
        setElementData(marker,"enterable",1)
        setElementDimension(marker,getElementDimension(playerSource))
        setElementInterior(marker,getElementInterior(playerSource))
        local markerin = createMarker(2365.21704,-1135.59399,1050.88257,"cylinder",1,225,225,0,125)
        setElementDimension(markerin,getElementData(marker,"dimension"))
        setElementInterior(markerin,8)
        setElementData(markerin,"exit",marker)
        setElementData(marker,"enter",markerin)
        outputChatBox("#FFFFFF[DOM]#63DBFF*Utworzyłeś dom typu 3 który kosztuje #B9F46C"..money.."$#63DBFF.",playerSource,0,0,0,true)
        setElementData(marker,"building",true)
        setElementData(markerin,"building",true)
        setElementData(marker,"tpin",true)
        setElementData(markerin,"tpout",true)
     elseif 
        mode=="4" then
        local x, y, z = getElementPosition(playerSource)
        local marker = createMarker(x,y,z,"cylinder",1,0,255,0,125)
        setElementData(marker,"house",true)
        setElementData(marker,"owner","none")
        setElementData(marker,"ownern","nikt")
        setElementData(marker,"blip",createBlipAttachedTo(marker,31))
        setElementData(marker,"mode",4)
        setElementData(marker,"dimension",dimension)
        dimension = dimension + 1
        setElementData(marker,"interior",2)
        setElementData(marker,"cost",money)
        setElementData(marker,"enterable",1)
        setElementDimension(marker,getElementDimension(playerSource))
        setElementInterior(marker,getElementInterior(playerSource))
        local markerin = createMarker(2237.36206,-1081.34595,1049.02344,"cylinder",1,225,225,0,125)
        setElementDimension(markerin,getElementData(marker,"dimension"))
        setElementInterior(markerin,2)
        setElementData(markerin,"exit",marker)
        setElementData(marker,"enter",markerin)
        outputChatBox("#FFFFFF[DOM]#63DBFF*Utworzyłeś dom typu 4 który kosztuje #B9F46C"..money.."$#63DBFF.",playerSource,0,0,0,true)
        setElementData(marker,"building",true)
        setElementData(markerin,"building",true)
        setElementData(marker,"tpin",true)
        setElementData(markerin,"tpout",true)
     else if mode=="5" then
        local x, y, z = getElementPosition(playerSource)
        local marker = createMarker(x,y,z,"cylinder",1,0,255,0,125)
        setElementData(marker,"house",true)
        setElementData(marker,"owner","none")
        setElementData(marker,"ownern","nikt")
        setElementData(marker,"blip",createBlipAttachedTo(marker,31))
        setElementData(marker,"mode",5)
        setElementData(marker,"dimension",dimension)
        dimension = dimension + 1
        setElementData(marker,"interior",5)
        setElementData(marker,"cost",money)
        setElementData(marker,"enterable",1)
        setElementDimension(marker,getElementDimension(playerSource))
        setElementInterior(marker,getElementInterior(playerSource))
        local markerin = createMarker(140.26419,1366.50134,1084,"cylinder",1,225,225,0,125)
        setElementDimension(markerin,getElementData(marker,"dimension"))
        setElementInterior(markerin,5)
        setElementData(markerin,"exit",marker)
        setElementData(marker,"enter",markerin)
        outputChatBox("#FFFFFF[DOM]#63DBFF*Utworzyłeś dom typu 5 który kosztuje #B9F46C"..money.."$#63DBFF.",playerSource,0,0,0,true)
        setElementData(marker,"building",true)
        setElementData(markerin,"building",true)
        setElementData(marker,"tpin",true)
        setElementData(markerin,"tpout",true)
    end
    end
    else outputChatBox("#FFFFFF[DOM]#FF0000*Nie jesteś upoważniony do używana tej komendy",playerSource,0,0,0,true)
end
end

addCommandHandler("createhouse",createHouse)


addCommandHandler("kupdom", function (playerSourcex)
if getElementData(getElementData(playerSourcex,"marker"),"house") then
if getElementData(getElementData(playerSourcex,"marker"),"owner")=="none" then
if getPlayerMoney(playerSourcex)>=tonumber(getElementData(getElementData(playerSourcex,"marker"),"cost")) then
setElementData(getElementData(playerSourcex,"marker"),"owner",tostring(getAccountName(getPlayerAccount(playerSourcex))))
destroyElement(getElementData(getElementData(playerSourcex,"marker"),"blip"))
setElementData(getElementData(playerSourcex,"marker"),"blip",createBlipAttachedTo(getElementData(playerSourcex,"marker"),32))
setMarkerColor(getElementData(playerSourcex,"marker"),255,0,0,125)
setElementData(getElementData(playerSourcex,"marker"),"ownern",tostring(getPlayerName(playerSourcex)))
takePlayerMoney(playerSourcex,getElementData(getElementData(playerSourcex,"marker"),"cost"))
outputChatBox("#FFFFFF[DOM]#63DBFF*Kupiłeś ten dom za #B9F46C"..getElementData(getElementData(playerSourcex,"marker"),"cost").."$",playerSourcex,0,0,0,true)
outputChatBox("#FFFFFF[DOM]#63DBFF*Od teraz możesz używać komend #B9F46C/otworz#63DBFF i #B9F46C/zamknij#63DBFF żeby zamykać dom.",playerSourcex,0,0,0,true)
else outputChatBox("#FFFFFF[DOM]#63DBFF*Nie masz tyle pieniędzy żeby kupić ten dom.",playerSourcex,0,0,0,true)
end
end
end
end
)

addEventHandler("onPlayerMarkerHit",getRootElement(),function (mhit,dimx) if
dimx==true then if
getElementData(mhit,"exit") then
outputChatBox("#63DBFF*Jeżeli chcesz wyjść wpisz #B9F46C/wyjdz#63DBFF.",source,0,0,0,true)
end end end)

addEventHandler("onPlayerMarkerHit",getRootElement(),function (markerhitted)
    if getElementData(markerhitted,"house") then
        if getElementData(markerhitted,"owner") == "none" then
            outputChatBox("#FFFFFF[DOM]#63DBFF*Jeżeli chcesz zobaczyć ten dom wpisz #B9F46C/wejdz#63DBFF.",source,0,0,0,true)
            outputChatBox("#FFFFFF[DOM]#63DBFF*Jeżeli chcesz kupić ten dom za #B9F46C"..getElementData(markerhitted,"cost").."$#63DBFF wpisz #B9F46C/kupdom#63DBFF.",source,0,0,0,true)
            elseif getElementData(markerhitted,"owner")~=getAccountName(getPlayerAccount(source)) then
                if getElementData(markerhitted,"enterable")==1 then
                    outputChatBox("#FFFFFF[DOM]#63DBFF*Jeżeli chcesz wejśc do tego domu to wpisz #B9F46C/wejdz#63DBFF.",source,0,0,0,true)
                    setElementData(source,"player:house_canenter",true)
                    elseif getElementData(markerhitted,"enterable")==0 then
                    outputChatBox("#FFFFFF[DOM]#63DBFF*Nie możesz wejść do tego domu.",source,0,0,0,true)
                    setElementData(source,"player:house_canenter",nil)
                    else 
                    end
                    elseif getElementData(markerhitted,"owner")==getAccountName(getPlayerAccount(source)) then
                        outputChatBox("#FFFFFF[DOM]#63DBFF*Jeżeli chcesz wejść do swojego domu wpisz #B9F46C/wejdz#63DBFF.",source,0,0,0,true)
                        setElementData(source,"player:house_canenter",true)
                    end
                end
            end
            )
    
    
    addEventHandler("onPlayerMarkerHit",getRootElement(), function (markerhit,dim)
    if dim==true then
setElementData(source,"marker",markerhit)
end end)

addEventHandler("onPlayerMarkerLeave",getRootElement(), function (markerhit,dimx)
setElementData(source,"marker",nil)
end )
    
addCommandHandler("wejdz",function (playerSource) if getElementData(playerSource,"marker")then if getElementData(getElementData(playerSource,"marker"),"house") then
    if getElementData(getElementData(playerSource,"marker"),"owner")=="none" or getElementData(getElementData(playerSource,"marker"),"owner")==getAccountName(getPlayerAccount(playerSource)) or getElementData(getElementData(playerSource,"marker"),"enterable")==1 then
    if getElementData(getElementData(playerSource,"marker"),"mode")==1 then
        setElementInterior(playerSource,getElementData(getElementData(playerSource,"marker"),"interior"))
        setElementDimension(playerSource,getElementData(getElementData(playerSource,"marker"),"dimension"))
        setElementPosition(playerSource,2333.06567,-1076.35986,1049.02344)
        elseif
        getElementData(getElementData(playerSource,"marker"),"mode")==2 then
        setElementInterior(playerSource,getElementData(getElementData(playerSource,"marker"),"interior"))
        setElementDimension(playerSource,getElementData(getElementData(playerSource,"marker"),"dimension"))
        setElementPosition(playerSource,261.01611,1284.72998,1080.25781)
        elseif
        getElementData(getElementData(playerSource,"marker"),"mode")==3 then
        setElementInterior(playerSource,8)
        setElementDimension(playerSource,getElementData(getElementData(playerSource,"marker"),"dimension"))
        setElementPosition(playerSource,2365.27393,-1134.19116,1050.87500)
        elseif
        getElementData(getElementData(playerSource,"marker"),"mode")==4 then
        setElementInterior(playerSource,getElementData(getElementData(playerSource,"marker"),"interior"))
        setElementDimension(playerSource,getElementData(getElementData(playerSource,"marker"),"dimension"))
        setElementPosition(playerSource,2237.36206,-1081.34595,1049.02344)
        else
        setElementInterior(playerSource,getElementData(getElementData(playerSource,"marker"),"interior"))
        setElementDimension(playerSource,getElementData(getElementData(playerSource,"marker"),"dimension"))
        setElementPosition(playerSource,140.26419,1366.50134,1084)
        end
        --end
        -- else if not getElementData(getElementData(playerSource,"marker"),"building") then outputChatBox("#FFFFFF[DOM]#63DBFF*Ten dom jest zamknięty.",playerSource,0,0,0,true)
end
end
end
end
)


addCommandHandler("otworz",function (ps) if getElementData(ps,"marker") then
house = getElementData(ps,"marker")
if getElementData(getElementData(ps,"marker"),"house") then
if getElementData(getElementData(ps,"marker"),"owner")==getAccountName(getPlayerAccount(ps))
then setElementData(getElementData(ps,"marker"),"enterable",1) outputChatBox("#FFFFFF[DOM]#63DBFF*Otworzyłeś ten dom.",ps,0,0,0,true)
else outputChatBox("#FFFFFF[DOM]#63DBFF*To nie twój dom.",ps,0,0,0,true)
end
else if getElementData(getElementData(ps,"marker"),"exit")
then setElementData(getElementData(house,"exit"),"enterable",1) outputChatBox("#FFFFFF[DOM]#63DBFF*Otworzyłeś ten dom.",ps,0,0,0,true)
end
end
end
end)


addCommandHandler("zamknij",function (ps) if getElementData(ps,"marker") then
house = getElementData(ps,"marker")
if getElementData(getElementData(ps,"marker"),"house") then
if getElementData(getElementData(ps,"marker"),"owner")==getAccountName(getPlayerAccount(ps))
then house = getElementData(ps,"marker") setElementData(getElementData(ps,"marker"),"enterable",0) outputChatBox("#FFFFFF[DOM]#63DBFF*Zamknełeś ten dom.",ps,0,0,0,true)
else outputChatBox("#FFFFFF[DOM]#63DBFF*To nie twój dom.",ps,0,0,0,true)
end
else if getElementData(getElementData(ps,"marker"),"exit")
then setElementData(getElementData(house,"exit"),"enterable",0) outputChatBox("#FFFFFF[DOM]#63DBFF*Zamknełeś ten dom.",ps,0,0,0,true)
end
end
end
end)


addCommandHandler("wyjdz",function (playerSource) if getElementData(playerSource,"marker") then
if getElementData(getElementData(playerSource,"marker"),"exit") then
local house = getElementData(getElementData(playerSource,"marker"),"exit")
local x,y,z = getElementPosition(house)
setElementPosition(playerSource,x,y,z)
setElementInterior(playerSource,getElementInterior(house))
setElementDimension(playerSource,getElementDimension(house))
end
end
end)


addCommandHandler("destroyhouse",function (pps) if isPlayerInACL(pps,"Admin") then
if getElementData(pps,"marker") then if getElementData(getElementData(pps,"marker"),"house") then
local house = getElementData(pps,"marker")
destroyElement(getElementData(house,"enter"))
destroyElement(getElementData(house,"blip"))
setElementData(house,"ownername",nil)
setElementData(house,"owner",nil)
setElementData(house,"enter",nil)
setElementData(house,"enterable",nil)
setElementData(house,"interior",nil)
setElementData(house,"cost",nil)
setElementData(house,"dimension",nil)
destroyElement(getElementData(pps,"marker"))
outputChatBox("#FFFFFF[DOM]#63DBFF*Właśnie usunełeś dom.",pps,0,0,0,true)
end
end
else outputChatBox("#63DBFF*Nie masz wystarczających praw żeby używać tej komendy.",pps,0,0,0,true)
end
end
)


