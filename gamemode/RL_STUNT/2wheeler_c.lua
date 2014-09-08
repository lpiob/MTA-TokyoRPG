

addEventHandler("onClientPlayerStuntFinish",
function (type, time, distance)
if type = "2wheeler" then
outputChatBox("Otrzymujesz "..wynagrodzenie.."$ za jazdę na dwóch kołach przez "..time.." na dystansie "..distance, source)
triggerServerEvent("2WheelerCash", source, distance, time)
end
end)
