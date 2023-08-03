#dead end south
execute store success score $dead endless_city.data if score sides endless_city.data matches 4 run scoreboard players set $rot endless_city.data 3
#straight north-south
execute store success score $straight endless_city.data if score sides endless_city.data matches 5 run scoreboard players set $rot endless_city.data 1
#corner east-south
execute store success score $corner endless_city.data if score sides endless_city.data matches 6 run scoreboard players set $rot endless_city.data 2
#T north-east-south
execute store success score $t endless_city.data if score sides endless_city.data matches 7 run scoreboard players set $rot endless_city.data 1