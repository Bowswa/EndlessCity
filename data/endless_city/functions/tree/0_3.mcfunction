#empty
execute store success score $empty endless_city.data if score sides endless_city.data matches 0 run scoreboard players set $rot endless_city.data 1
#north dead end
execute store success score $dead endless_city.data if score sides endless_city.data matches 1 run scoreboard players set $rot endless_city.data 1
#east dead end
execute store success score $dead endless_city.data if score sides endless_city.data matches 2 run scoreboard players set $rot endless_city.data 2
#north east corner
execute store success score $corner endless_city.data if score sides endless_city.data matches 3 run scoreboard players set $rot endless_city.data 1