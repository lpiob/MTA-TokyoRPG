function isPlayerInACL ( player, acl )
    local account = getPlayerAccount ( player )
    if ( isGuestAccount ( account ) ) then
        return false
    end
        return isObjectInACLGroup ( "user."..getAccountName ( account ), aclGetGroup ( acl ) )
end
    
policemarkers = {}
    
-- 18

function markerZatrudniania(ps)
if isPlayerInACL(ps,"Admin") then
    local x, y, z = getElementPosition(ps)
    local marker = createMarker(x,y,z,"cylinder")
    table.insert(policemarkers,marker)
    setElementData(marker,"marker:blip",createBlipAttachedTo(marker,30))
    outputChatBox("#63DBFF*Stworzyłeś marker zatrudniania.",ps,0,0,0,true)
    else outputChatBox("#63DBFF*Nie masz prawa do używania tej komendy.",ps,0,0,0,true)
end
end
    
function usunMarkerZatrudniania(ps)
if isPlayerInACL(ps,"Admin") then
    for key, value in ipairs(policemarkers) do
    if isElementWithinMarker(ps,value) then
        destroyElement(getElementData(value,"marker:blip"))
        destroyElement(value)
        outputChatBox("#63DBFF*Usunełeś marker zatrudniania.",ps,0,0,0,true)
    end
    outputChatBox("#63DBFF*Nie masz prawa do używania tej komendy.",ps,0,0,0,true)
end
end
end

addCommandHandler("createpolice",markerZatrudniania)
addCommandHandler("destroypolice",usunMarkerZatrudniania)

function zatrudnijSie(ps)
    for key, value in ipairs(policemarkers) do 
        if isElementWithinMarker(ps,value) then
           if isPlayerInACL(ps,"Police") then
               if not getElementData(ps,"player:job_police:duty") then
                  if getPlayerWantedLevel(ps)<1 then
                      setElementData(ps,"player:job","police")
                      outputChatBox("*Zatrudniłeś się jako Policjant.",ps,0,0,0,true)
                      else outputChatBox("#63DBFF*Nie możesz być poszukiwany jeżeli chcesz rozpocząć prace w #B9F46CPolicji#63DBFF.",ps,0,0,0,true)
                  end
                  else outputChatBox("#63DBFF*Aktualnie jesteś zatrudniony jako #B9F46CPolicjant#63DBFF.",ps,0,0,0,true)
              end
              else outputChatBox("#63DBFF*Złóż podanie na #B9F46CForum#63DBFF jeżeli chcesz sie zatrudnić jako #B9F46CPolicjant#63DBFF.",ps,0,0,0,true)
          end
      end
  end
end

addCommandHandler("zatrudnijsie",zatrudnijSie)
           