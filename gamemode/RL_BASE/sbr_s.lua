function isPlayerInACL ( player, acl )
    local account = getPlayerAccount ( player )
    if ( isGuestAccount ( account ) ) then
        return false
    end
        return isObjectInACLGroup ( "user."..getAccountName ( account ), aclGetGroup ( acl ) )
end



--[[

Ile tych timerów ;--; Nie zdziwiłbym się, gdyby to przy większej ilości graczy padło.

Przeniesione do RL_LOGIN/login_s.lua

setTimer( function ()
for key, value in ipairs(getElementsByType("player")) do
if isPlayerInACL(value,"Console") then
    setElementData(value,"Rank","RCON")
    elseif
    isPlayerInACL(value,"Admin") then
    setElementData(value,"Rank","ADMIN")
    elseif
    isPlayerInACL(value,"SuperModerator") then
    setElementData(value,"Rank","SMOD")
    elseif
    isPlayerInACL(value,"Moderator") then
    setElementData(value,"Rank","MOD")
    else if not isPlayerInACL(value,"Console" or "Admin" or "SuperModerator" or "Moderator") then
    setElementData(value,"Rank","Gracz")
    end
end
end
end,3000,0)
]]--








function addToScoreboard()
    exports.scoreboard:scoreboardAddColumn( "Rank" )
end

addToScoreboard()
