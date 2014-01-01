function wbijanie(accb,accn,player)
if isObjectInACLGroup("user."..getAccountName(accn),aclGetGroup("Console")) then
setPlayerNametagColor(source,255,0,0)
elseif isObjectInACLGroup("user."..getAccountName(accn),aclGetGroup("Admin")) then
setPlayerNametagColor(source,180,0,0)
elseif isObjectInACLGroup("user."..getAccountName(accn),aclGetGroup("SuperModerator")) then
setPlayerNametagColor(source,0,255,0)
elseif isObjectInACLGroup("user."..getAccountName(accn),aclGetGroup("Moderator")) then
setPlayerNametagColor(source,0,180,0)
setPlayerNametagColor(source,255,255,0)
else if not isObjectInACLGroup("user."..getAccountName(accn),aclGetGroup("Console"))
or isObjectInACLGroup("user."..getAccountName(accn),aclGetGroup("Admin"))
or isObjectInACLGroup("user."..getAccountName(accn),aclGetGroup("SuperModerator"))
or isObjectInACLGroup("user."..getAccountName(accn),aclGetGroup("Moderator"))
then
setPlayerNametagColor(source,255,255,255)
end
end
end

function wbijanie2(onick,nnick)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin")) then
setPlayerNametagColor(source,255,0,0)
elseif isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin")) then
setPlayerNametagColor(source,180,0,0)
elseif isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("SuperModerator")) then
setPlayerNametagColor(source,0,255,0)
elseif isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Moderator")) then
setPlayerNametagColor(source,0,180,0)
else if not isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Console"))
or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Admin"))
or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("SuperModerator"))
or isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)),aclGetGroup("Moderator"))then
setPlayerNametagColor(source,255,255,255)
end
end
end

addEventHandler ( "onPlayerLogin", getRootElement(), wbijanie)
addEventHandler ( "onPlayerChangeNick", getRootElement(), wbijanie2)


----------------------
--REMOVE COLOR CODES-- 


function deletecc()
    for k, v in ipairs (getElementsByType("player")) do
        local name = getPlayerName(v)
            if (string.find(name,"#%x%x%x%x%x%x")) then
                local name = string.gsub(name,"#%x%x%x%x%x%x","")
                setPlayerName(v,name)
                cancelEvent()
            end
    end
end

addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),deletecc)

function removeCC(oldNick,newNickname)
    local name = getPlayerName(source)
    if newNickname then
        name = newNickname
    end
    if (string.find(name,"#%x%x%x%x%x%x")) then
        local name = string.gsub(name,"#%x%x%x%x%x%x","")
        setPlayerName(source,name)
            if (newNickname) then
                cancelEvent()
            end
    end 
end

addEventHandler("onPlayerJoin",getRootElement(),removeCC)

addEventHandler("onPlayerChangeNick",getRootElement(),removeCC)


--REMOVE COLOR CODES-- 
----------------------