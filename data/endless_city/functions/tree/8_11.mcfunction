#dead end west
execute store success score $dead endless_city.data if score sides endless_city.data matches 8 run scoreboard players set $rot endless_city.data 4
#corner north-west
execute store success score $corner endless_city.data if score sides endless_city.data matches 9 run scoreboard players set $rot endless_city.data 4
#straight east-west
execute store success score $straight endless_city.data if score sides endless_city.data matches 10 run scoreboard players set $rot endless_city.data 2
#T north-east-west
execute store success score $t endless_city.data if score sides endless_city.data matches 11 run scoreboard players set $rot endless_city.data 4