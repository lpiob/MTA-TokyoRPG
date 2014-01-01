function isPlayerInACL ( player, acl )
    local account = getPlayerAccount ( player )
    if ( isGuestAccount ( account ) ) then
        return false
    end
        return isObjectInACLGroup ( "user."..getAccountName ( account ), aclGetGroup ( acl ) )
end
    
dimension = 0

function cb(playerSource,command,mode)
    if isPlayerInACL(playerSource,"Admin") then
        local x, y, z = getElementPosition(playerSource)
        if mode == "bar" then
            local menter = createMarker(x,y,z,"cylinder",1)
            local mexit = createMarker(501.97073,-68.12468,998.75781,"cylinder",1)
            setElementInterior(mexit,11)
            setElementDimension(mexit,dimension+1)
            setElementData(menter,"building",true)
            setElementData(mexit,"teleportin",menter)
            setElementData(menter,"teleportexit",mexit)
            setElementData(menter,"blip",createBlipAttachedTo(menter,49))
            local x1, y1, z1 = getElementPosition(menter)
            setElementData(mexit,"x",x1)
            setElementData(mexit,"y",y1)
            setElementData(mexit,"z",z1+0.25)
            outputChatBox("#63DBFF*Utworzyłeś budynek #B9F46CBar#63DBFF.",playerSource,0,0,0,true)
            dimension = dimension + 1
            setElementData(menter,"enterable",1)
            setElementData(mexit,"enterable",1)
            setElementData(menter,"tpin",true)
            setElementData(mexit,"tpout",true)
            elseif mode == "restaurant" then
            local menter = createMarker(x,y,z,"cylinder",1)
            local mexit = createMarker(459.78812,-88.59406,999.55469,"cylinder",1) 
            setElementInterior(mexit,4)
            setElementDimension(mexit,dimension+1)
            setElementData(menter,"building",true)
            setElementData(mexit,"teleportin",menter)
            setElementData(menter,"teleportexit",mexit)
            setElementData(menter,"blip",createBlipAttachedTo(menter,50))
            outputChatBox("#63DBFF*Utworzyłeś budynek #B9F46CRestauracja#63DBFF.",playerSource,0,0,0,true)
            local x1, y1, z1 = getElementPosition(menter)
            setElementData(mexit,"x",x1)
            setElementData(mexit,"y",y1)
            setElementData(mexit,"z",z1+0.25)
            dimension = dimension + 1
            setElementData(menter,"enterable",1)
            setElementData(mexit,"enterable",1)
            setElementData(menter,"tpin",true)
            setElementData(mexit,"tpout",true)
            elseif mode == "shop" then
            local menter = createMarker(x,y,z,"cylinder",1)
            local mexit = createMarker(-31.02380,-91.40031,1003.54688,"cylinder",1) 
            setElementInterior(mexit,18)
            setElementDimension(mexit,dimension+1)
            setElementData(menter,"building",true)
            setElementData(mexit,"teleportin",menter)
            setElementData(menter,"teleportexit",mexit)
            setElementData(menter,"blip",createBlipAttachedTo(menter,38))
            outputChatBox("#63DBFF*Utworzyłeś budynek #B9F46CSklep Spożywczy#63DBFF.",playerSource,0,0,0,true)
            local x1, y1, z1 = getElementPosition(menter)
            setElementData(mexit,"x",x1)
            setElementData(mexit,"y",y1)
            setElementData(mexit,"z",z1+0.25)
            dimension = dimension + 1
            setElementData(menter,"enterable",1)
            setElementData(mexit,"enterable",1)
            setElementData(menter,"tpin",true)
            setElementData(mexit,"tpout",true)
            elseif mode == "disco" then
            local menter = createMarker(x,y,z,"cylinder",1)
            local mexit = createMarker(493.36295,-24.19986,1000.67969,"cylinder",1) 
            setElementInterior(mexit,17)
            setElementDimension(mexit,dimension+1)
            setElementData(menter,"building",true)
            setElementData(mexit,"teleportin",menter)
            setElementData(menter,"teleportexit",mexit)
            setElementData(menter,"blip",createBlipAttachedTo(menter,48))
            outputChatBox("#63DBFF*Utworzyłeś budynek #B9F46CDyskoteka#63DBFF.",playerSource,0,0,0,true)
            local x1, y1, z1 = getElementPosition(menter)
            setElementData(mexit,"x",x1)
            setElementData(mexit,"y",y1)
            setElementData(mexit,"z",z1+0.25)
            dimension = dimension + 1
            setElementData(menter,"enterable",1)
            setElementData(mexit,"enterable",1)
            setElementData(menter,"tpin",true)
            setElementData(mexit,"tpout",true)
            elseif mode == "clothes" then
            local menter = createMarker(x,y,z,"cylinder",1)
            local mexit = createMarker(204.32373,-168.36957,1000.52344,"cylinder",1) 
            setElementInterior(mexit,14)
            setElementDimension(mexit,dimension+1)
            setElementData(menter,"building",true)
            setElementData(mexit,"teleportin",menter)
            setElementData(menter,"teleportexit",mexit)
            setElementData(menter,"blip",createBlipAttachedTo(menter,45))
            outputChatBox("#63DBFF*Utworzyłeś budynek #B9F46CSklep odżieżowy#63DBFF.",playerSource,0,0,0,true)
            local x1, y1, z1 = getElementPosition(menter)
            setElementData(mexit,"x",x1)
            setElementData(mexit,"y",y1)
            setElementData(mexit,"z",z1+0.25)
            dimension = dimension + 1
            setElementData(menter,"enterable",1)
            setElementData(mexit,"enterable",1)
            setElementData(menter,"tpin",true)
            setElementData(mexit,"tpout",true)
            elseif mode == "casino" then
            local menter = createMarker(x,y,z,"cylinder",1)
            local mexit = createMarker(2018.66370,1017.83002,996.87500,"cylinder",1) 
            setElementInterior(mexit,10)
            setElementDimension(mexit,dimension+1)
            setElementData(menter,"building",true)
            setElementData(mexit,"teleportin",menter)
            setElementData(menter,"teleportexit",mexit)
            setElementData(menter,"blip",createBlipAttachedTo(menter,44))
            outputChatBox("#63DBFF*Utworzyłeś budynek #B9F46CKasyno#63DBFF.",playerSource,0,0,0,true)
            local x1, y1, z1 = getElementPosition(menter)
            setElementData(mexit,"x",x1)
            setElementData(mexit,"y",y1)
            setElementData(mexit,"z",z1+0.25)
            dimension = dimension + 1
            setElementData(menter,"enterable",1)
            setElementData(mexit,"enterable",1)
            setElementData(menter,"tpin",true)
            setElementData(mexit,"tpout",true)
            else if mode == "hotel" then
            local menter = createMarker(x,y,z,"cylinder",1)
            local mexit = createMarker(934.58191 ,8.39929 ,1000.98718,"cylinder",1) 
            setElementInterior(mexit,3)
            setElementDimension(mexit,dimension+1)
            setElementData(menter,"building",true)
            setElementData(mexit,"teleportin",menter)
            setElementData(menter,"teleportexit",mexit)
            setElementData(menter,"blip",createBlipAttachedTo(menter,40))
            outputChatBox("#63DBFF*Utworzyłeś budynek #B9F46CHotel#63DBFF.",playerSource,0,0,0,true)
            local x1, y1, z1 = getElementPosition(menter)
            setElementData(mexit,"x",x1)
            setElementData(mexit,"y",y1)
            setElementData(mexit,"z",z1+0.25)
            dimension = dimension + 1
            setElementData(menter,"enterable",1)
            setElementData(mexit,"enterable",1)
            setElementData(menter,"tpin",true)
            setElementData(mexit,"tpout",true)
            end
            end
            else outputChatBox("#63DBFF*Nie masz wystarczających praw do używania tej komendy.",playerSource,0,0,0,true)
            end
        end
        


addCommandHandler("createbuilding",cb)
        
         
function db(ps)
if isPlayerInACL(ps,"Admin") then
if getElementData(ps,"marker") then
if getElementData(getElementData(ps,"marker"),"building") then
    destroyElement(getElementData(getElementData(ps,"marker"),"teleportexit"))
    destroyElement(getElementData(getElementData(ps,"marker"),"blip"))
    setElementData(getElementData(ps,"marker"),"building",nil)
    destroyElement(getElementData(ps,"marker"))
end
end
else outputChatBox("#63DBFF*Nie masz wystarczających praw do używania tej komendy.",ps,0,0,0,true)
end
end

addCommandHandler("destroybuilding",db)
            
            

addEventHandler("onPlayerMarkerHit",getRootElement(),function (markerx,dim) if
    getElementData(markerx,"teleportin") then
    if dim == true then
    outputChatBox("#63DBFF*Jeżeli chcesz wyjść wpisz #B9F46C/wyjdz#63DBFF.",source,0,0,0,true)
    end end end)


addEventHandler("onPlayerMarkerHit",getRootElement(),function (markerx,dim) if
    getElementData(markerx,"teleportexit") then
    if dim == true then
    outputChatBox("#63DBFF*Jeżeli chcesz wejść wpisz#B9F46C /wejdz#63DBFF.",source,0,0,0,true)
    end end end)


addCommandHandler("wejdz",function (ps) if 
    getElementData(ps,"marker") then local markertp = getElementData(ps,"marker")
    if getElementData(markertp,"teleportexit") then
    local x, y, z = getElementPosition(getElementData(markertp,"teleportexit"))
    local building = getElementData(getElementData(ps,"marker"),"teleportexit")
    setElementInterior(ps,getElementInterior(building))
    setElementDimension(ps,getElementDimension(building))
    setElementPosition(ps,x,y,z+0.25)
    end
end
end)


addCommandHandler("wyjdz",function (ps) if 
    getElementData(ps,"marker") then local markertpx = getElementData(ps,"marker")
    if getElementData(markertpx,"teleportin") then
    local x = getElementData(markertpx,"x")
    local y = getElementData(markertpx,"y")
    local z = getElementData(markertpx,"z")
    setElementInterior(ps,0)
    setElementDimension(ps,0)
    setElementPosition(ps,x,y,z)
    end
end
end)

    addEventHandler("onPlayerMarkerHit",getRootElement(), function (markerhit,dim)
    if dim==true then
setElementData(source,"marker",markerhit)
end end)

addEventHandler("onPlayerMarkerLeave",getRootElement(), function (markerhit,dimx)
setElementData(source,"marker",nil)
end )
                