#corner south-west
execute store success score $corner endless_city.data if score sides endless_city.data matches 12 run scoreboard players set $rot endless_city.data 3
#T north-south-west
execute store success score $t endless_city.data if score sides endless_city.data matches 13 run scoreboard players set $rot endless_city.data 3
#T east-south-west
execute store success score $t endless_city.data if score sides endless_city.data matches 14 run scoreboard players set $rot endless_city.data 2
#cross north-east-south-west
execute store success score $cross endless_city.data if score sides endless_city.data matches 15 run scoreboard players set $rot endless_city.data 1