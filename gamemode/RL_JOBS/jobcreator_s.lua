jobmarkers = {}

addCommandHandler("jobcreator",function (ps)
    if getPlayerAccount(ps) then
        local account = getPlayerAccount(ps)
        if isObjectInACLGroup("user."..getAccountName(account),aclGetGroup("Admin")) then
            triggerClientEvent("callJobCreatorClient",ps)
            else outputChatBox("#63DBFF*Nie masz wystarczających praw do używania tej komendy.",ps,255,255,255,true)
        end
        else outputChatBox("#63DBFF*Nie jesteś zalogowany.",ps,255,255,255,true)
    end
end)

addEvent("callJobCreator",true)

addEventHandler("callJobCreator",getRootElement(),function (job,cash,size)
            if size and job and cash ~= "" or nil or false then
                local dim = getElementDimension(source)
                local int = getElementInterior(source)
                local x, y, z = getElementPosition(source)
                local marker = createMarker(x,y,z,"cylinder",size,255, 128, 0)
                setElementData(marker,"job:cash",tonumber(cash))
                setElementData(marker,"job:jobname",job)
                setElementData(marker,"job:marker",createBlipAttachedTo(marker,math.random(58,62),1.5))
                setElementInterior(marker,int)
                setElementDimension(marker,dim)
                table.insert(jobmarkers,marker)
                triggerClientEvent("callHideJobCreatorGUI",source)
                outputChatBox("#63DBFF*Utworzyłeś pracę o nazwie: #B9F46C"..job.."#63DBFF.",source,0,0,0,true)
            end
end)
        
addEventHandler("onPlayerMarkerHit",getRootElement(),function (marker,dim)
    if (dim) then
        if getElementData(marker,"job:cash") then
            outputChatBox("#63DBFFWitaj w pracy o nazwie:#B9F46C "..getElementData(marker,"job:jobname").."#63DBFF będziesz tutaj zarabiał: #B9F46C"..getElementData(marker,"job:cash").."$#63DBFF.",source,0,0,0,true)
            outputChatBox("#63DBFFStój tutaj żeby zarabiać pieniądze.",source,0,0,0,true)
        end
    end
end)

function getmarker(player)
    for key, value in ipairs(jobmarkers) do
    if isElementWithinMarker(player,value) then
    return value
        else 
    end
end
end

function jobtimer()
    for key, valuex in ipairs(getElementsByType("player")) do
    if not isPedInVehicle(valuex) then
    if isElement(getmarker(valuex)) then
    if getElementType(getmarker(valuex))=="marker" then
    if getElementDimension(valuex)==getElementDimension(getmarker(valuex)) then
    givePlayerMoney(valuex,getElementData(getmarker(valuex),"job:cash"))
        end
        end
    end
end
end
end

addCommandHandler("destroyjob",function (ps) 
local account = getPlayerAccount(ps)
if isObjectInACLGroup("user."..getAccountName(account),aclGetGroup("Admin")) then
if destroyElement(getElementData(getmarker(ps),"job:marker")) then
destroyElement(getmarker(ps))
outputChatBox("#63DBFF*Usunełes tą pracę.",ps,0,0,0,true)
else outputChatBox("#63DBFF*Musisz być w markerze pracy.",ps,0,0,0,true)
end
else outputChatBox("#63DBFF*Nie posiadasz wystarczających praw to używania tej funkcji.",ps,0,0,0,true)
end
end)

setTimer(jobtimer,5000,0)