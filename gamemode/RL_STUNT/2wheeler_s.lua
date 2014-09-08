

addEvent("2WheelerCash", true)
addEventHandler("2WheelerCash", root,
function (time, distance )
  
  local wynagrodzenie = math.floor(distance)*math.floor(time) -- robione na oko, pewnie bedzie trzeba potem zmienic
givePlayerMoney(source, wynagrodzenie)

end)
