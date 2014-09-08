--[[

Przeniesione do RL_CHAT/chat_s.lua


addEventHandler("onPlayerChat",getRootElement(),function (message,messagetype)
    if messagetype==0 then
        if not isPedInVehicle(source) then
        local talktime = string.len(message)*200
            local player = source
            setPedAnimation(source,"ped","IDLE_chat",0,true,false,true,true)
            setTimer(function () setPedAnimation(player,"ped","IDLE_chat",100,true,true,true,false)end,talktime,1)
        end
    end
end)

]]--
