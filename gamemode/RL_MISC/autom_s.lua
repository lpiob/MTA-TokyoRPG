

local messages = {

{"[INFO] Witaj na gamemodzie TokyoRPG, życzymy Ci miłej gry."},
{"[INFO] Jeżeli nie przepadasz za tradycyjnym zarabianiem, możesz porobić sztuczki BMX - za to także jest profit."},
{"[INFO] Wiadomości te możesz zmienić w RL_MISC/autom_s.lua"},

-- w ramach udzielonej licencji zostawienie ponizszej linii jest wymagane
{"[INFO] Serwer korzysta z gamemode TokyoRPG (https://github.com/lpiob/MTA-TokyoRPG)"},

}





setTimer(
function ( )
local msg = unpack(messages[math.random(#messages)])
outputChatBox(msg)
end, 500000, 0)

-- 500000 to czas po ktorym zostanie wyswietlona nastepna wiadomosc w ms.
-- mozna przeliczyc sekundy na ms na przyklad tutaj: http://www.unitconversion.org/time/seconds-to-milliseconds-conversion.html
-- w tym przypadku wiadomosc bedzie sie wyswietlala co 8 minut, chociaz jak jest malo graczy to polecam zwiekszyc
-- bo bedzie pewnie caly czat zaspamiony.







