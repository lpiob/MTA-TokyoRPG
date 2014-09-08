

addEventHandler("onClientPlayerStuntFinish",
function (type, time, distance)
if type = "2wheeler" then
local wynagrodzenie = math.floor(distance)*math.floor(time) -- robione na oko, pewnie bedzie trzeba potem zmienic
outputChatBox("Otrzymujesz "..wynagrodzenie.."$ za jazdę na dwóch kołach przez "..time.." na dystansie "..distance, source)
triggerServerEvent("2WheelerCash", source)
end
end)
