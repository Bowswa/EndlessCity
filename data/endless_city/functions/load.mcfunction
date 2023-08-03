scoreboard objectives add endless_city.data dummy
scoreboard players set #north endless_city.data 1
scoreboard players set #east endless_city.data 2
scoreboard players set #south endless_city.data 4
scoreboard players set #west endless_city.data 8
scoreboard players set #-1 endless_city.data -1

#math init
scoreboard objectives add math dummy
scoreboard objectives add constant dummy
scoreboard players set #lcg constant 1103515245
scoreboard players set #10 constant 10
function endless_city:rng/zprivate/init

scoreboard objectives add rd trigger
scoreboard objectives add render_distance dummy
scoreboard objectives add city_menu trigger

execute unless score setup endless_city.data matches 1 run function endless_city:init

function endless_city:gen_loop
